class CreateBotComments < ActiveRecord::Migration[5.2]
  def change
    create_table :bot_comments do |t|
      t.references :user, foreign_key: true
      t.references :bot, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
