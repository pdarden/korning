class CreateCustomers < ActiveRecord::Migration
  def up
    create_table :customers do |t|
      t.string :name, null: false
      t.string :account_no, null: false
      t.string :website

      t.timestamps
    end
    import_data
  end

  def down
    drop_table :customers
  end

  def import_data
    Sale.pluck(:customer_and_account_no).each do |c|
      Customer.find_or_create_by(name: c.split(' (').first) do |customer|
        customer.name = c.split(' (').first
        customer.account_no = c.split(' (').last.tr(')', '')
      end
    end
  end
end
