# == Schema Information
# Schema version: 20110210002527
#
# Table name: accounts
#
#  id         :integer         not null, primary key
#  last_name  :string(255)
#  first_name :string(255)
#  address    :string(255)
#  phone      :string(255)
#  soc_sec    :string(255)
#  amount     :decimal(, )
#  created_at :datetime
#  updated_at :datetime
#

class Account < ActiveRecord::Base
  ssn_regex = /^[0-9]{3}-[0-9]{2}-[0-9]{4}$/
  phone_regex = /^[0-9]{3}-[0-9]{3}-[0-9]{4}$/

  validates :last_name, :presence => true,
            			:length => { :maximum => 30 }
  validates :first_name, :presence => true,
  						:length => { :maximum => 30 }
  validates :address, :presence => true
  validates :phone, :presence => true,
  					:format => { :with => phone_regex 	}
  validates :soc_sec, :presence => true,
  					  :format => { :with => ssn_regex,
  					               :message => "SSN must be in 999-99-9999 format."},
  					  :uniqueness => true
  validates :amount, :presence => true,
                     :numericality => { :greater_than_or_equal_to => 0 }

end
