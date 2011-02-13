class AddSsnUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :accounts, :soc_sec, :unique => true
  end

  def self.down
    remove_index :accounds, :soc_sec
  end
end
