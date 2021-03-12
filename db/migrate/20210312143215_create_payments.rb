class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :payment_id
      t.date :payment_date
      t.string :total_amount
      t.string :total_discounts
      t.string :total_with_discounts
      t.string :currency
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
