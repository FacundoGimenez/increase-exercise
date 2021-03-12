# frozen_string_literal: true

require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @client = clients(:one)
  end

  test 'should get index' do
    get api_v1_client_transactions_path(client_id: @client.client_id), as: :json

    assert_response :success
    assert_equal 'application/json', @response.media_type
    valid = '[{"transaction_id":"dad7bb30af865477375de292044841fb","amount":"0000004579862","status":"1","payment_id":1},{"transaction_id":"17163e245f5a91f4b61ad5b9b7bb87f0","amount":"0000001453289","status":"2","payment_id":1},{"transaction_id":"cc2b9fc9734f6f597d23532302f14dd1","amount":"0000007854123","status":"1","payment_id":1},{"transaction_id":"8c99ef808444e2f830adba69dfe14a1f","amount":"0000009865412","status":"1","payment_id":2}]'

    assert_equal valid, @response.body
  end
end
