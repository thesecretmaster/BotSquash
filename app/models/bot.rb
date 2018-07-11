class Bot < ApplicationRecord
  has_many :bot_hashtags
  has_many :hashtags, through: :bot_hashtags
  # has_many :statuses
  has_many :actions
  belongs_to :type, foreign_type: :bot_type
  has_many :network_memberships
  has_many :networks, through: :network_memberships
  belongs_to :created_by, class_name: 'User'

  before_save :log_status_change, if: :will_save_change_to_type_id?
  after_create :log_initial_status

  def status_color(prefix: 'text')
    type.status_color(prefix: prefix)
  end

  # TODO: I call all of this status when I need to call it type
  # TODO: Do we want to track username changes the same way? Could we do that without another model?

  def change_status(new_type, user:, update_params: {})
    raise ArgumentError unless user.is_a? User
    unsafe_change_status(new_type, user: user, update_params: update_params) unless new_type.id == type_id
  end

  def initial_type
    istatus = actions.where(actionable_type: StatusChange).order(:created_at).first.actionable
    throw "Something is very wrong" unless istatus.old_type.nil?
    istatus.new_type
  end

  private

  def unsafe_change_status(new_type, user: nil, update_params: {})
    update_params = Hash(update_params) unless update_params.is_a? Hash
    new_type = Bot::Type.find(new_type.to_i) unless new_type.is_a? Bot::Type
    if new_type.id != type_id
      self.transaction do
        status_change = StatusChange.create(old_type: Bot::Type.find(type_id), new_type: new_type)
        action = Action.create(user:user, bot:self, actionable: status_change)
        update_params.delete(:type_id) # Removing for the good of the transaction
        update_params = update_params.merge(type: new_type).symbolize_keys
        Rails.logger.info(update_params)
        update(**update_params)
      end
    end
  end

  def log_initial_status
    self.transaction do
      status_change = StatusChange.create(old_type: nil, new_type: type)
      action = Action.create(user:self.created_by, bot: self, actionable: status_change)
    end
  end

  def log_status_change
    unsafe_change_status(type) unless type_id_was == type_id
  end
end
