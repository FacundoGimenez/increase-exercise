# frozen_string_literal: true

class TransactionSerializer < ActiveModel::Serializer
  attributes :transaction_id, :amount, :status, :payment_id
end
