require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'deposit'" do
    it "should be successful" do
      get 'deposit'
      response.should be_success
    end
  end

  describe "GET 'withdrawal'" do
    it "should be successful" do
      get 'withdrawal'
      response.should be_success
    end
  end

  describe "GET 'transfer'" do
    it "should be successful" do
      get 'transfer'
      response.should be_success
    end
  end

  describe "GET 'exit'" do
    it "should be successful" do
      get 'exit'
      response.should be_success
    end
  end

end
