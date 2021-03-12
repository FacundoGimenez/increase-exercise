# frozen_string_literal: true

class Client < ApplicationRecord
  has_many :payments, dependent: :destroy
  has_many :transactions, through: :payments, dependent: :destroy

  has_many :past_payments_in_ars, -> { ars_past }, class_name: 'Payment'
  has_many :future_payments_in_ars, -> { ars_future }, class_name: 'Payment'
  has_many :past_payments_in_usd, -> { usd_past }, class_name: 'Payment'
  has_many :future_payments_in_usd, -> { usd_future }, class_name: 'Payment'

  validates :client_id, :email, :first_name, :last_name, :job,
            :country, :address, :zip_code, :phone, presence: true

  validates :client_id, uniqueness: true
end
