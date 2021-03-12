# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :client
  scope :ars_past,   -> { where(currency: '000').where('payment_date <= ?', Time.zone.today) }
  scope :ars_future, -> { where(currency: '000').where('payment_date > ?', Time.zone.today) }
  scope :usd_past,   -> { where(currency: '001').where('payment_date <= ?', Time.zone.today) }
  scope :usd_future, -> { where(currency: '001').where('payment_date > ?', Time.zone.today) }

  has_many :transactions, dependent: :destroy

  validates :payment_id, :payment_date, :total_amount, :total_discounts,
            :total_with_discounts, :currency, presence: true

  validates :payment_id, uniqueness: true
end
