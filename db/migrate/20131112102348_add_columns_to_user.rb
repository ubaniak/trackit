class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :department_id, :integer
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :manager, :boolean, :default => false
  end
end
