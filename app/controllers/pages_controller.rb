class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def list
    @title = "List Accounts"
  end

  def open
    @title = "Open Account"
  end

  def deposit
    @title = "Deposit"
    @accounts = Account.all
  end
  
  def deposit2
    @title = "Deposit"
    @account = Account.find(params[:account_id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @account }
    end
  end

  def withdrawal
    @title = "Withdrawal"
  end

  def transfer
    @title = "Transfer"
  end
  
  def hw1
    @title = "Homework 1"
  end

  def exit
    @title = "Exit"
  end

end
