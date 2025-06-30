# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @invoices_count = Invoice.for_user(current_user).count
    @recent_invoices = Invoice.for_user(current_user).recent
  end
end
