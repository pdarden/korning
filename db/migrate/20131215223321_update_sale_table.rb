class UpdateSaleTable < ActiveRecord::Migration
  def up
    add_column :sales, :employee_id, :integer
    add_column :sales, :customer_id, :integer
    add_column :sales, :product_id, :integer
    import_data
  end

  def down
    remove_column :sales, :employee_id, :integer
    remove_column :sales, :customer_id, :integer
    remove_column :sales, :product_id, :integer
  end

  def import_data
    Sale.all.each do |sale|
      employee_name = sale.employee.split(' (').first
      sale.employee_id = Employee.where(name: employee_name).pluck(:id).to_s.tr('[', '').tr(']', '').to_i
      sale.save
      customer_name = sale.customer_and_account_no.split(' (').first
      sale.customer_id = Customer.where(name: customer_name).pluck(:id).to_s.tr('[', '').tr(']', '').to_i
      sale.save
      product = sale.product_name
      sale.product_id = Product.where(name: product).pluck(:id).to_s.tr('[', '').tr(']', '').to_i
      sale.save
    end
  end
end
