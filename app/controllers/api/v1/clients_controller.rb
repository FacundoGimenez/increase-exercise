module Api
  module V1
    class ClientsController < ApplicationController
      include FindClient

      def show
        render json: @client
      end

      def received_payments
        render json: {
          ars: @client.past_payments_in_ars.pluck(:total_with_discounts).sum(&:to_i),
          usd: @client.past_payments_in_usd.pluck(:total_with_discounts).sum(&:to_i)
        }
      end

      def pending_payments
        render json: {
          ars: @client.future_payments_in_ars.pluck(:total_with_discounts).sum(&:to_i),
          usd: @client.future_payments_in_usd.pluck(:total_with_discounts).sum(&:to_i)
        }
      end
    end
  end
end
