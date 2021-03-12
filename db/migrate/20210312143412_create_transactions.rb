class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :transaction_id
      t.string :amount
      t.string :status
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
