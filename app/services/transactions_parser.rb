# frozen_string_literal: true

class TransactionsParser < ApplicationService
  def initialize(transaction_response = '')
    @transaction_response = transaction_response
  end

  def call
    transactions_manager = { header: nil, transactions: [], footer: nil }

    @transaction_response.each_line do |line|
      cleaned_line = line.chomp

      case cleaned_line[0].to_i
      when 1
        transactions_manager[:header] = {
          payment_id: cleaned_line[1..32],
          currency: cleaned_line[36..38],
          total_amount: cleaned_line[39..51],
          total_discounts: cleaned_line[52..64],
          total_with_discounts: cleaned_line[65..77]
        }
      when 2
        transactions_manager[:transactions] ||= []
        transactions_manager[:transactions] << {
          transaction_id: cleaned_line[1..32],
          amount: cleaned_line[33..45],
          type: cleaned_line[51..52]
        }
      when 4
        client_id = cleaned_line[24..55]
        transactions_manager[:footer] = {
          payment_date: cleaned_line[16..23],
          client_id: client_id
        }

        StoreInformation.call(information_block: transactions_manager)

        transactions_manager.delete_values!
      end
    end
  end
end
