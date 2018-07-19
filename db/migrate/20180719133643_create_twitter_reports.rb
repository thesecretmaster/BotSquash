class CreateTwitterReports < ActiveRecord::Migration[5.2]
  def change
    create_table :twitter_reports do |t|
      t.references :user, foreign_key: true
      t.references :bot, foreign_key: true
      t.text :notes
      t.boolean :reported, default: true, null: false

      t.timestamps
    end

    add_column :bots, :twitter_report_count, :integer, default: 0, null: false
  end
end
