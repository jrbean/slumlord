class Repair < ActiveRecord::Base
  belongs_to :tenant, class_name: "User"
  belongs_to :manager, class_name: "User"

end
