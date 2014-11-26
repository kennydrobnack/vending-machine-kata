

#Testing why in the world I'm getting a wacky mistake in math with Ruby. It is giving me 
#
# 0.75 - 0.65 = 0.09999999999999998
#
require_relative "vending_machine"
require 'minitest/autorun'
require 'bigdecimal'

describe VendingMachine, "The right way to do currency math in Ruby" do
  
  #Test cases showing the error...
  describe "when doing floating point math, some things don't work as expected" do
    it "Using floating point for money has rounding errors in subtraction" do
      inserted_money = 0.75
      price = 0.65
      puts "Inserted money: #{inserted_money} Price: #{price}"
      inserted_money -= price
      puts "Inserted money is now #{inserted_money}"
      inserted_money.must_equal 0.09999999999999998
    end
  end
  
  #Test case showing the fix recommended works
  #http://spin.atomicobject.com/2014/08/14/currency-rounding-errors/
  describe "Big Decimal for money should fix rounding errors" do
    it "Inserted money minus price should come out right" do
      inserted_money = BigDecimal("0.75")
      price = BigDecimal("0.65")
      inserted_money -= price
      assert_equal inserted_money, 0.10
    end
  end
  
end