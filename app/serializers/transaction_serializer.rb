class TransactionSerializer < ActiveModel::Serializer
  attributes :transaction_id, :amount, :status, :payment_id
end
