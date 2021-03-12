# frozen_string_literal: true

class Client < ApplicationRecord
  has_many :payments, dependent: :destroy
  has_many :transactions, through: :payments, dependent: :destroy

  validates :client_id, :email, :first_name, :last_name, :job,
            :country, :address, :zip_code, :phone, presence: true

  validates :client_id, uniqueness: true
end
