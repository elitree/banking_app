class AccountsController < ApplicationController
  # GET /accounts
  # GET /accounts.xml
  def index
    # Set per_page to 3 to demonstrate pagination functionality with few accounts
    @accounts = Account.paginate(:page => params[:page], :per_page => 3, :order => 'created_at')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.xml
  def show
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.xml
  def new
    @account = Account.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.xml
  def create
    @account = Account.new(params[:account])

    respond_to do |format|
      if @account.save
        format.html { redirect_to(@account, :notice => "Account #{@account.id} was successfully created.") }
        format.xml  { render :xml => @account, :status => :created, :location => @account }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to(@account, :notice => "Account #{@account.id} was successfully updated.") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml
  def deposit
    @account = Account.find(params[:id])

    respond_to do |format|
      if (amount = params[:dep_amount])
        amount = amount.to_f
        @account.deposit(amount)
        format.html { redirect_to(@account, :notice => "Account #{@account.id} was successfully updated.") }
        format.xml  { head :ok }
      else
        format.html { render :action => "deposit" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /accounts/1
  # PUT /accounts/1.xml
  def withdrawal
    @account = Account.find(params[:id])

    respond_to do |format|
      if (amount = params[:withd_amount])
        amount = amount.to_f
        @account.withdraw(amount)
        format.html { redirect_to(@account, :notice => "Account #{@account.id} was successfully updated.") }
        format.xml  { head :ok }
      else
        format.html { render :action => "withdrawal" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml
  def transfer
    @account1 = Account.find(params[:id])

    respond_to do |format|
      if (amount = params[:transfer_amount])
        @account2 = Account.find(params[:account_id])
        amount = amount.to_f
        @account1.withdraw(amount)
        @account2.deposit(amount)
        format.html { redirect_to(@account2, :notice => "Account #{@account1.id} was successfully updated.") }
        format.xml  { head :ok }
      else
        format.html { render :action => "transfer" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /accounts/1
  # DELETE /accounts/1.xml
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to(accounts_url) }
      format.xml  { head :ok }
    end
  end
end
