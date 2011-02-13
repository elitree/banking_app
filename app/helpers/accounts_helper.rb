module AccountsHelper
  def AmountUpdate (account, amount) 
     account.update_attributes(:amount => (account.amount + amount))
  end
end
