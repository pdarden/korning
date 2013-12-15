class AddEmployeesToEmployeesTable < ActiveRecord::Migration

  def up
    Sale.pluck(:employee).each do |c|
      Employee.find_or_create_by(name: c.split(' (').first) do |employee|
        employee.name = c.split(' (').first
        employee.email = c.split(' (').last.tr(')', '')
      end
    end
  end

  def down
    Employee.destroy_all
  end
end
