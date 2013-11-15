class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :notifications

  def self.managers
      User.where("manager = ? AND department_id = ?", true, self.department_id)
  end

  def self.subbordinates
      User.where("manager = ? AND department_id = ?", false, self.department_id)
  end

  def is_admin?
      self.admin
  end
end
