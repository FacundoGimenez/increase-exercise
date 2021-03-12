# frozen_string_literal: true

class StoreInformation < ApplicationService
  def initialize(information_block:)
    @information_block = information_block
  end

  def call
    StoreClient.call
    StorePayments.call
    StoreTransactions.call
  end
end
