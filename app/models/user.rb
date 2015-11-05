class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tenant_repairs, class_name: "Repair", foreign_key: "tenant_id"
  has_many :manager_repairs, class_name: "Repair", foreign_key: "manager_id"
end
