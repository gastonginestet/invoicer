# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  def index
    @invoices_count = Invoice.count
    @users_count = User.count
    @recent_invoices = Invoice.order(created_at: :desc).limit(5)
  end
end
