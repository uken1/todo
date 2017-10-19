class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :status
      t.date :deadline

      t.timestamps null: false
    end
  end
end
