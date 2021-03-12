module Api
  module V1
    class TransactionsController < ApplicationController
      include FindClient

      def index
        render json: @client.transactions
      end
    end
  end
end
