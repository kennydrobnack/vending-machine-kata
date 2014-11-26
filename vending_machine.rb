
class VendingMachine
  
  def initialize
    @inserted_money = 0.00
    @available_change = {
      "nickel" => 10,
      "dime" => 10,
      "quarter" => 10
    } 
    @inventory = {
      "cola" => 10,
      "chips" => 10,
      "candy" => 10
    }
    @coin_values = {
      "nickel" => 5,
      "dime" => 10,
      "quarter" => 25
    }
    @product_prices = {
      "cola" => 1.00,
      "chips" => 0.50,
      "candy" => 0.65,
    }
    @status_message = "INSERT COINS"
  end
  
  def select_item (item)
    
  end
  
  def inserted_money
    msg = "You have inserted $#{@inserted_money}"
    puts msg
    return msg
  end
  
  def show_status_message
    puts @status_message
    return @status_message
  end
  
  def return_change
    @inserted_money = 0
    @status_message = "INSERT COINS"
  end
  
  def add_change (coin_type, coin_count)
    if (available_change[coin_type])
      available_change[coin_type] += coin_count
    else 
      return nil
    end
  end
  
  def add_items (item_name, item_count)
    if (@inventory[item_name])
      @inventory[item_name] += item_count
    else 
      return nil
    end
  end
  
  def valid_coin (coin)
    return @coin_values[coin]
  end
  
  def insert (coin)
    cents = valid_coin(coin)
    if (cents.nil?)
      return "You have inserted an unknown coin. This machine only takes nickels, dimes, and quarters"
    else
      return "You have inserted " + cents.to_s + " cents"
    end
  end
  

  
end