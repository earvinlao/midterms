class MoneyCalculator

  def initialize(ones, fives, tens, twenties, fifties, hundreds, five_hundreds, thousands)
    # each parameter represents the quantity per denomination of money
    # these parameters can be assigned to instance variables and used for computation

    # add a method called 'change' that takes in a parameter of how much an item costs
    # and returns a hash of how much change is to be given
    # the hash will use the denominations as keys and the amount per denomination as values
    # i.e. {:fives => 1, fifties => 1, :hundreds => 3}
    @ones = ones.to_i*1
    @fives = fives.to_i*5
    @tens = tens.to_i*10
    @twenties = twenties.to_i*20
    @fifties = fifties.to_i*50
    @hundreds = hundreds.to_i*100
    @five_hundreds = five_hundreds.to_i*500
    @thousands = thousands.to_i*1000
    @total_money= @ones+@fives+@tens+@twenties+@fifties+@hundreds+@five_hundreds+@thousands
	end

  def change(cost)
  	@change = @total_money.to_i - cost.to_i
    remainder=@change
    if @change>=1000
    	number_thousands = @change/1000
    	remainder = @change%1000
    end
    	
    if remainder>=500
    	number_five_hundreds = remainder/500
    	remainder= remainder%500
    end
    if remainder>=100
    	number_hundreds=remainder/100
    	remainder=remainder%100
	end
    if remainder>=50
    	number_fifties=remainder/50
    	remainder=remainder%50
    end
    if remainder>=20
    	number_twenties=remainder/20
    	remainder=remainder%20
    end
    if remainder>=10
    	number_tens=remainder/10
    	remainder=remainder%10
    end
    if remainder>=5
    	number_fives=remainder/5
    	remainder=remainder%5
    end
    if remainder>=1
    	number_ones=remainder/5
    	remainder=remainder%1
    end
    else
        change =0
        remainder=0

    @money = {
        :ones=>number_ones.to_i,
        :fives=>number_fives.to_i,
        :tens=>number_tens.to_i,
        :twenties=>number_twenties.to_i,
        :fifties=>number_fifties.to_i,
        :hundreds=>number_hundreds.to_i,
        :five_hundreds=>number_five_hundreds.to_i,
        :thousands=>number_thousands.to_i,
    }
    return @money
    end
   
   
end