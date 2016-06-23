class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :email, null: false
      t.string :job_title, null: false
      t.string :business_phone, null: false
      t.string :address, null: false
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :webpage
      t.string :notes
    end
  end
end
