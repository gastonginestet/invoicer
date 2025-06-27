# app/controllers/api/v1/invoices_controller.rb
module Api
  module V1
    class InvoicesController < BaseController
      def index
        invoices = current_user.invoices.order(created_at: :desc)
        render json: invoices
      end

      def create
        invoice = current_user.invoices.build(invoice_params)
        if invoice.save
          render json: invoice, status: :created
        else
          render json: { errors: invoice.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def invoice_params
        params.require(:invoice).permit(:number, :amount, :description)
      end
    end
  end
end
