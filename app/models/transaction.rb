# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :payment

  validates :transaction_id, :amount, :status, presence: true
end
