require 'pry'
class CashRegister
  #macro to build reader and setter functions
  attr_accessor :total, :discount, :price, :items

  def initialize(discount  = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    @price = price
    @total += price * quantity
    @quantity = quantity
    if quantity > 1
      counter = 0
      while counter < quantity
        @items << item
        counter += 1
      end
    else
      @items << item
    end
  end

  def total
    @total
  end

  def apply_discount
    @amount_off = @total * @discount/100
    @newtotal = @total - @amount_off
    @total = @newtotal
    if @discount > 0
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @price
  end

end
