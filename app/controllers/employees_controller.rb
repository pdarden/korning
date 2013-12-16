class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
    @sales = Sale.all
    @customers = Customer.all
    @products = Product.all
  end
end
