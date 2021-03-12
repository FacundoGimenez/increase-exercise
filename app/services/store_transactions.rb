# frozen_string_literal: true

class StoreTransactions < ApplicationService
  def initialize(payment_id, params)
    @payment_id = payment_id
    @params = params
  end

  def call
    @params.each do |transaction|
      next if Transaction.find_by(transaction_id: transaction[:transaction_id])

      Transaction.create(
        transaction_id: transaction[:transaction_id],
        amount: transaction[:amount],
        status: transaction[:type],
        payment_id: @payment_id
      )
    end
  end
end
