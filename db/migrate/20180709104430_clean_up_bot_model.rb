class CleanUpBotModel < ActiveRecord::Migration[5.2]
  def up
    remove_column :bots, :watched
    remove_column :bots, :suspended
    remove_column :bots, :success
    add_column :bots, :twitter_username, :text
  end

  def down
    add_column :bots, :watched, :boolean
    add_column :bots, :suspended, :boolean
    add_column :bots, :success, :boolean
    remove_column :bots, :twitter_username
  end
end
