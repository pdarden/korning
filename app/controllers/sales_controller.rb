class SalesController < ApplicationController
  def index
    @sales = Sale.all
    @employees = Employee.all
    @customers = Customer.all
  end
end
