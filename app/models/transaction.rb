# == Schema Information
# Schema version: 20110210002527
#
# Table name: transactions
#
#  id         :integer         not null, primary key
#  amount     :decimal(, )
#  acct_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Transaction < ActiveRecord::Base
end
