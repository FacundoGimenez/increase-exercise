# frozen_string_literal: true

class StoreClient < ApplicationService
  def initialize(client_id)
    @client_id = client_id
  end

  def call
    @client = Client.find_by(client_id: @client_id)

    return @client if @client

    params = Transactions::Client.new('1234567890qwertyuiopasdfghjklzxcvbnm').transaction_client(@client_id)

    @client = Client.create(
      client_id: params['id'],
      email: params['email'],
      first_name: params['first_name'],
      last_name: params['last_name'],
      job: params['job'],
      country: params['country'],
      address: params['address'],
      zip_code: params['zip_code'],
      phone: params['phone']
    )
  end
end
