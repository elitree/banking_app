class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :type
      t.decimal :amount
      t.datetime :datetime_opened
      t.integer :customer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
