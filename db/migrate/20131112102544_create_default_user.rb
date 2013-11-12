class CreateDefaultUser < ActiveRecord::Migration
  def change
    create_table :default_users do |t|
        User.create(:name => "admin", :email => "admin@admin.com", :password => "asdf1234", :admin => true)
    end
  end
end
