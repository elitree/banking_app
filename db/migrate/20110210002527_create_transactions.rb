class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.decimal :amount
      t.integer :acct_id

      t.timestamps
    end
    add_index :transactions, :acct_id
  end

  def self.down
    drop_table :transactions
  end
end
