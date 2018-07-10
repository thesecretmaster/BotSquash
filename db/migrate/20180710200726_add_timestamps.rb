class AddTimestamps < ActiveRecord::Migration[5.2]
  def change
    change_table(:actions) { |t| t.timestamps }
    change_table(:bots) { |t| t.timestamps }
    change_table(:hashtags) { |t| t.timestamps }
    change_table(:networks) { |t| t.timestamps }
    change_table(:network_memberships) { |t| t.timestamps }
    change_table(:bot_hashtags) { |t| t.timestamps }
    change_table(:investigations) { |t| t.timestamps }
    change_table(:reports) { |t| t.timestamps }
    change_table(:status_checks) { |t| t.timestamps }
    change_table(:users_roles) { |t| t.timestamps }
  end
end
