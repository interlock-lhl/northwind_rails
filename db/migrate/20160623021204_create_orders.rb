class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :employee
      t.references :customer
      t.date :order_date
      t.date :shipped_date
      t.references :shipper
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.decimal :shipping_fee
      t.decimal :taxes
      t.string :payment_type
      t.date :paid_date
      t.string :notes
      t.decimal :tax_rate
      t.references :order_status
    end
  end
end
