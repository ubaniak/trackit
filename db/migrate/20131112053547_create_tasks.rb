class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

      t.string :title
      t.string :description
      t.datetime :due_date
      
      t.integer :assigned_to
      t.integer :approved_by
      t.integer :reviewed_by
      t.integer :created_by
      t.datetime :reviewed_date
      t.datetime :approved_date
      t.integer :status_id
      t.integer :department_id

      t.timestamps
    end
  end
end
