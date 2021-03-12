# frozen_string_literal: true

class StorePayment < ApplicationService
  def initialize(client_id, params)
    @client_id = client_id
    @params = params
  end

  def call
    @payment = Payment.create(
      payment_id: @params[:payment_id],
      payment_date: @params[:payment_date],
      total_amount: @params[:total_amount],
      total_discounts: @params[:total_discounts],
      total_with_discounts: @params[:total_with_discounts],
      currency: @params[:currency],
      client_id: @client_id
    )
  end
end
