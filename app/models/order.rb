class Order < ActiveRecord::Base
  has_many :order_details
  belongs_to :order_status
  belongs_to :customer
  belongs_to :employee
  belongs_to :shipper

end
