# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :client

  has_many :transactions, dependent: :destroy

  validates :payment_id, :payment_date, :total_amount, :total_discounts,
            :total_with_discounts, :currency, presence: true
end
