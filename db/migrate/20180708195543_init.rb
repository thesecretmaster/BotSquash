class Init < ActiveRecord::Migration[5.2]
  def change
    create_table :bots do |i|
      i.boolean :suspended
      i.boolean :watched
      i.boolean :success
      i.text :username
      i.text :notes
      i.references :type, references: :bot_types
    end

    create_table :network_memberships do |i|
      i.references :bot
      i.references :network
      i.text :notes
    end

    create_table :networks do |i|
      i.text :name
      i.text :notes
    end

    create_table :bot_types do |i|
      i.integer :severity
      i.text :name
    end

    # create_table :statuses do |i|
    #   i.references :bot
    #   i.text :content
    # end

    create_table :bot_hashtags do |i|
      i.references :bot
      i.references :hashtag
      i.text :notes
    end

    # create_table :status_hashtags do |i|
    #   i.references :status
    #   i.references :hashtag
    # end

    create_table :hashtags do |i|
      i.text :name
      i.text :notes
    end

    create_table :actions do |i|
      i.references :bot
      i.references :actionable, polymorphic: true
    end

    create_table :reports do |i|
    end

    create_table :status_checks do |i|
    end

    create_table :investigations do |i|
    end
  end
end
