# frozen_string_literal: true

require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @client = clients(:one)
    @payment = payments(:one)
  end

  test 'must get show action' do
    get api_v1_client_path(id: @client.client_id), as: :json

    assert_response :success
    assert_equal 'application/json', @response.media_type
  end

  test 'must get received_payments action' do
    get received_payments_api_v1_client_path(id: @client.client_id), as: :json

    assert_response :success
    assert_equal 'application/json', @response.media_type
    assert_equal '{"ars":0,"usd":0}', @response.body
  end

  test 'must get pending_payments action' do
    @payment.update(payment_date: Time.zone.today + 10.days)

    get pending_payments_api_v1_client_path(id: @client.client_id), as: :json

    assert_response :success
    assert_equal 'application/json', @response.media_type
    assert_equal '{"ars":0,"usd":25249232}', @response.body
  end

  test 'must get received_payments with result' do
    @payment.update(payment_date: Time.zone.today - 2.year)

    get received_payments_api_v1_client_path(id: @client.client_id), as: :json

    assert_response :success
    assert_equal 'application/json', @response.media_type
    assert_equal '{"ars":0,"usd":12874596}', @response.body
  end
end
