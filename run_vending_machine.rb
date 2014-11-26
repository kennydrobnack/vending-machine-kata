require_relative 'vending_machine'
vending_machine = VendingMachine.new()

puts vending_machine.insert("nickel")
puts vending_machine.insert("dime")
puts vending_machine.insert("quarter")
puts vending_machine.insert("penny")
puts vending_machine.insert("junk")