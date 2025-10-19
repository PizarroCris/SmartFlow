class CreateFocusSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :focus_sessions do |t|
      t.string :title, null: false
      t.integer :duration_minutes, null: false
      t.integer :status, null: false
      t.datetime :start_time
      t.datetime :end_time
      t.references :user, null: false, foreign_key: true
      t.references :task, foreign_key: true
      t.timestamps
    end
  end
end
