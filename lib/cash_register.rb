class CashRegister
    attr_accessor :total, :discount, :items, :last_item

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        self.total += price * quantity
        self.last_item = price * quantity
        quantity.times do 
            self.items << title
        end 
          
    end

    def apply_discount
        if discount != 0
            self.total = (total * ((100 - discount.to_f)/100)).to_i
            "After the discount, the total comes to $#{self.total}."
        else 
            "There is no discount to apply."
        end
    end

    # def items
    #     @items = []
    # end


    def void_last_transaction
        @items.shift()
        self.total -= self.last_item
    end

end