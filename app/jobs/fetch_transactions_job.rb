# frozen_string_literal: true

class FetchTransactionsJob < ApplicationJob
  def perform
    transactions = Transactions::Client.new('1234567890qwertyuiopasdfghjklzxcvbnm').transaction_file

    TransactionsParser.call(transactions)
  end
end
