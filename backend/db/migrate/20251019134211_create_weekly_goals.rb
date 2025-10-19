class CreateWeeklyGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :weekly_goals do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.text :self_evaluation
      t.datetime :target_date, null: false
      
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
