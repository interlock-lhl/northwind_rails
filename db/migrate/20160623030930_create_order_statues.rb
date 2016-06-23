class CreateOrderStatues < ActiveRecord::Migration
  def change
    create_table :order_statuses do |t|
      t.string :code, null: false
    end
  end
end
