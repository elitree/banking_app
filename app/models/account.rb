class Account < ActiveRecord::Base
	belongs_to :customer
end
