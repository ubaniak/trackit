class CreateUserHiarchies < ActiveRecord::Migration
  def change
    create_table :user_hiarchies do |t|
      t.integer :employee
      t.integer :reports_to
      t.integer :creator

      t.timestamps
    end
  end
end
