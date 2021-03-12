# frozen_string_literal: true

class StoreInformation < ApplicationService
  def initialize(information_block:)
    @information_block = information_block
    @payment_params = { payment_id: @information_block[:header][:payment_id],
                        payment_date: @information_block[:footer][:payment_date],
                        total_amount: @information_block[:header][:total_amount],
                        total_discounts: @information_block[:header][:total_discounts],
                        total_with_discounts: @information_block[:header][:total_with_discounts],
                        currency: @information_block[:header][:currency],
                        client_id: @information_block[:footer][:client_id] }
  end

  def call
    client      = StoreClient.call(@information_block[:footer][:client_id])
    payment     = StorePayment.call(client.id, @payment_params)
    StoreTransactions.call(payment.id, @information_block[:transactions])
  end
end
