class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.managers
      User.where("manager = ? AND department_id = ?", true, self.department_id)
  end

  def self.subbordinates
      User.where("manager = ? AND department_id = ?", false, self.department_id)
  end
end
