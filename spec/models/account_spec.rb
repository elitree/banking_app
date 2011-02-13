require 'spec_helper'

describe Account do

  before(:each) do
    @attr = { :last_name => "Name", :first_name => "First", :address => "143 S Main St",
              :phone => "617-111-1111", :soc_sec => "010-10-1010", :amount => "100.00"}
  end

  it "should create a new instance given valid attributes" do
    Account.create!(@attr)
  end

  it "should require a last name" do
  	no_last_name_acct = Account.new(@attr.merge(:last_name => ""))
  	no_last_name_acct.should_not be_valid
  end
  
  it "should reject last names that are too long" do
    long_last_name = "a" * 31
    long_last_name_user = Account.new(@attr.merge(:last_name => long_last_name))
    long_last_name_user.should_not be_valid
  end

  it "should reject first names that are too long" do
    long_first_name = "a" * 31
    long_first_name_user = Account.new(@attr.merge(:first_name => long_first_name))
    long_first_name_user.should_not be_valid
  end


  it "should require a first name" do
  	no_first_name_acct = Account.new(@attr.merge(:first_name => ""))
  	no_first_name_acct.should_not be_valid
  end

  it "should require an address" do
  	no_address_acct = Account.new(@attr.merge(:address => ""))
  	no_address_acct.should_not be_valid
  end

  it "should require a phone" do
  	no_phone_acct = Account.new(@attr.merge(:phone => ""))
  	no_phone_acct.should_not be_valid
  end

  it "should accept valid phone numbers" do
  	nums = %w[617-943-4955]
  	nums.each do |num|
  	  valid_num_acct = Account.new(@attr.merge(:phone => num))
  	  valid_num_acct.should be_valid
  	end
  end

  it "should reject invalid phone numbers" do
  	nums = %w[617-943-955 61179434955]
  	nums.each do |num|
  	  invalid_num_acct = Account.new(@attr.merge(:phone => num))
  	  invalid_num_acct.should_not be_valid
  	end
  end

  it "should require a soc sec number" do
  	no_soc_sec_acct = Account.new(@attr.merge(:soc_sec => ""))
  	no_soc_sec_acct.should_not be_valid
  end

  it "should accept valid SSNs" do
    ssns = %w[030-58-2209 000-00-0000 343-82-8838]
    ssns.each do |ssn|
      valid_ssn_acct = Account.new(@attr.merge(:soc_sec => ssn))
      valid_ssn_acct.should be_valid
    end
  end

  it "should reject invalid SSNs" do
    ssns = %w[030-58-209 00-00-0000 3828003838]
    ssns.each do |ssn|
      invalid_ssn_acct = Account.new(@attr.merge(:soc_sec => ssn))
      invalid_ssn_acct.should_not be_valid
    end
  end

  it "should reject duplicate SSNs" do
    ssns = %w[010-10-1010]
    ssns.each do |ssn|
      Account.create!(@attr.merge(:soc_sec => ssn))
      invalid_ssn_acct = Account.new(@attr)
      invalid_ssn_acct.should_not be_valid
    end
  end

  it "should require an amount" do
  	no_amount_acct = Account.new(@attr.merge(:amount => ""))
  	no_amount_acct.should_not be_valid
  end

end