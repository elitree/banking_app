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
