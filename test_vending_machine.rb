
  require_relative "vending_machine"
  require "minitest/autorun"
  require "stringio"

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
        @vending_machine.return_change()
        @vending_machine.inserted_money().must_equal "You have inserted $0"
        @vending_machine.show_status_message().must_equal "INSERT COINS" 
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