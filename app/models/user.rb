class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tenant_repairs, class_name: "Repair", foreign_key: "tenant_id"
  has_many :manager_repairs, class_name: "Repair", foreign_key: "manager_id"

  def management_mail
    mgmt = User.where(is_manager: true)
    mgmt.map do |m|
      m.email
    end
  end

  def all_tenant_mail
    tnt = User.where(is_manager: false)
    tnt.map do |t|
      t.email
    end
  end

end
