class CreateStatusChanges < ActiveRecord::Migration[5.2]
  def change
    create_table :status_changes do |t|
      t.references :old_type, foreign_key: {to_table: :bot_types}
      t.references :new_type, foreign_key: {to_table: :bot_types}

      t.timestamps
    end

    add_reference :actions, :user, foreign_key: true
    add_reference :bots, :created_by, foreign_key: {to_table: :users}
  end
end
