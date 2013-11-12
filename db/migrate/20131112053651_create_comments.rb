class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :task_id
      t.string :comment
      t.integer :created_by

      t.timestamps
    end
  end
end
