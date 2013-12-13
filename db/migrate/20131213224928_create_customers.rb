class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :account_id
      t.string :invoice_frequency
      t.string :website

      t.timestamps
    end
  end
end
