# frozen_string_literal: true

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  def setup
    @payment_one = payments(:one)
    @payment_two = payments(:two)
  end

  test 'payment is not valid without payment_id' do
    @payment_one.payment_id = nil
    assert_not @payment_one.valid?
  end

  test 'payment is not valid without payment_date' do
    @payment_one.payment_date = nil
    assert_not @payment_one.valid?
  end

  test 'payment is not valid without total_amount' do
    @payment_one.total_amount = nil
    assert_not @payment_one.valid?
  end

  test 'payment is not valid without total_discounts' do
    @payment_one.total_discounts = nil
    assert_not @payment_one.valid?
  end

  test 'payment is not valid without total_with_discounts' do
    @payment_one.total_with_discounts = nil
    assert_not @payment_one.valid?
  end

  test 'payment is not valid without currency' do
    @payment_one.currency = nil
    assert_not @payment_one.valid?
  end

  test 'payment is not valid without client_id' do
    @payment_one.client_id = nil
    assert_not @payment_one.valid?
  end

  test 'payment must have three transactions' do
    assert_equal 3, @payment_one.transactions.count
  end

  test 'payment two must have one transaction' do
    assert_equal 1, @payment_two.transactions.count
  end

  test 'payment must be valid' do
    assert @payment_one.valid?
  end
end
