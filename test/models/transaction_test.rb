# frozen_string_literal: true

require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  def setup
    @transaction = transactions(:one)
  end

  test 'transaction is invalid without amount' do
    @transaction.amount = nil
    assert_not @transaction.valid?
  end

  test 'transaction is invalid without status' do
    @transaction.status = nil
    assert_not @transaction.valid?
  end

  test 'transaction is invalid without payment_id' do
    @transaction.payment_id = nil
    assert_not @transaction.valid?
  end

  test 'transaction is invalid without transaction_id' do
    @transaction.transaction_id = nil
    assert_not @transaction.valid?
  end

  test 'transaction must be valid' do
    assert @transaction.valid?
  end
end
