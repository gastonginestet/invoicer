class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /invoices or /invoices.json
  def index
    @invoices = Invoice.for_user(current_user)
  end

  # GET /invoices/1 or /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    render partial: "form_modal", locals: { invoice: @invoice }
  end

  # GET /invoices/1/edit
  def edit
    render partial: "form_modal", locals: { invoice: @invoice }
  end

  # POST /invoices or /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.user = current_user

    if @invoice.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.append("invoices", partial: "invoices/invoice", locals: { invoice: @invoice }),
            turbo_stream.update("modal", "")
          ]
        end
        format.html { redirect_to invoices_path, notice: "Invoice created" }
      end
    else
      respond_to do |format|
        format.turbo_stream { render "form_modal", status: :unprocessable_entity }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1 or /invoices/1.json
  def update
    if @invoice.update(invoice_params)
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace(@invoice), # actualiza la fila en la tabla
            turbo_stream.update("modal", "") # cierra el modal
          ]
        end
        format.html { redirect_to invoices_path, notice: "Invoice updated." }
      end
    else
      respond_to do |format|
        format.turbo_stream { render partial: "form_modal", locals: { invoice: @invoice }, status: :unprocessable_entity }
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1 or /invoices/1.json
  def destroy
    @invoice.destroy!

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@invoice) }
      format.html { redirect_to invoices_path, status: :see_other, notice: "Invoice was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def invoice_params
      params.require(:invoice).permit(:number, :amount, :description)
    end
end
