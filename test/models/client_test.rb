# frozen_string_literal: true

require 'test_helper'
require 'byebug'

class ClientTest < ActiveSupport::TestCase
  def setup
    @client = clients(:one)
  end

  test 'client without first name is not valid.' do
    @client.first_name = nil
    assert_not @client.valid?
  end

  test 'client without last name is not valid' do
    @client.last_name = nil
    assert_not @client.valid?
  end

  test 'client without email is not valid.' do
    @client.email = nil
    assert_not @client.valid?
  end

  test 'client without client_id is not valid.' do
    @client.client_id = nil
    assert_not @client.valid?
  end

  test 'client without job is not valid' do
    @client.job = nil
    assert_not @client.valid?
  end

  test 'client without country is not valid' do
    @client.country = nil
    assert_not @client.valid?
  end

  test 'client without address is not valid' do
    @client.address = nil
    assert_not @client.valid?
  end

  test 'client without zip code is not valid' do
    @client.zip_code = nil
    assert_not @client.valid?
  end

  test 'client without phone is not valid' do
    @client.phone = nil
    assert_not @client.valid?
  end

  test 'client must has 2 payments.' do
    assert_equal 2, @client.payments.count
  end

  test 'clients must be valid.' do
    assert @client.valid?
  end

  test 'client must has 4 transactions' do
    assert_equal 4, @client.transactions.count
  end
end
