class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :last_name
      t.string :first_name
      t.string :address
      t.string :phone
      t.string :soc_sec
      t.decimal :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
