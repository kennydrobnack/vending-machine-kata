
require_relative "vending_machine"
require "minitest/autorun"

describe VendingMachine, "Testing out Vending Machine" do


  before do
    @vending_machine = VendingMachine.new()
  end


  describe "when vending machine starts, status message should display INSERT COINS" do
    it "must display INSERT COINS" do
        @vending_machine.show_status_message().must_equal "INSERT COINS"
    end
  end


  describe "when customer hits return change" do
    it "must return all change" do
      @before_return = @vending_machine.coin_return_amount()
      @inserted_money = @vending_machine.inserted_money_amount() 
      @vending_machine.return_change()
      @vending_machine.coin_return_amount().must_equal @inserted_money
      @vending_machine.inserted_money_message().must_equal "You have inserted $0.00"
      @vending_machine.show_status_message().must_equal "INSERT COINS" 
    end
  end
 
  
  describe "coin return should start with $0.00" do
    it "Should start with $0.00" do
      @vending_machine.coin_return_amount().must_equal 0.00
    end
  end
 
 
  describe "customer selects an item" do
    it "must despense item and display THANK YOU" do
      4.times do 
        @vending_machine.insert("quarter")
      end
      @vending_machine.inserted_money_message().must_equal("You have inserted $1.00")
      @vending_machine.select_item("cola")
      @vending_machine.show_status_message().must_equal "THANK YOU"
      @vending_machine.inserted_money_message().must_equal "You have inserted $0.00"
    end
  end
      
 
  describe "when inserting valid coins" do
    it "must respond with coin inserted" do
      @vending_machine.insert("nickel").must_equal "You have inserted 5 cents"
      @vending_machine.insert("dime").must_equal "You have inserted 10 cents"
      @vending_machine.insert("quarter").must_equal "You have inserted 25 cents"
    end
  end

    
  describe "when inserting invalid coins" do
    it "must respond with an error" do
      @vending_machine.insert("penny").must_equal "You have inserted an unknown coin. This machine only takes nickels, dimes, and quarters"
      @vending_machine.insert("junk").must_equal "You have inserted an unknown coin. This machine only takes nickels, dimes, and quarters"
    end
  end 

end