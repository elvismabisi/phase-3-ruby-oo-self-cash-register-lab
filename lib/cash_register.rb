class CashRegister
    attr_reader :discount, :total
    

    def initialize(discount = 0) 
        @discount = discount
        @total = 0
        @items = []
    end


    def total=(value)
        @total  = value
    end

    def add_item(title, price, quantity=1)
        
        @last_transaction = [title, price, quantity]
        quantity.times{@items << title}
        
        @total = @total + price * quantity 

       
    end

    def apply_discount
        if @discount < 1
            "There is no discount to apply."
        
        else
        thediscount = @discount/100.0 * self.total
        @total = @total - thediscount
        "After the discount, the total comes to $#{@total.round}."
        end
    end

    def items()
        @items
    end

    def void_last_transaction 
        @total = @total - (@last_transaction[1] * @last_transaction[2])
    end
end

