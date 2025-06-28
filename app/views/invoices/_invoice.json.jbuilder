json.extract! invoice, :id, :number, :amount, :description, :user_id, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
