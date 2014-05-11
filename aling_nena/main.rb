require 'sinatra'
require './boot.rb'
require './money_calculator.rb'

items=[]
# ROUTES FOR ADMIN SECTION
get '/admin' do
  @products = Item.all
  erb :admin_index
end

get '/new_product' do
  @product = Item.new
  erb :product_form
end

get '/about' do
	erb :about
end

get '/' do
	@products = Item.all
		if @products.length <=10
			@items= @products
		else
			@items= @products.sample(10)
    end
	erb :home
end

get '/products' do
  @products = Item.all
  erb :products
end

get '/purchase/:id' do
   @product = Item.find(params[:id])
   erb :purchase
end

get '/success' do
    erb :success
end

get '/insufficient_funds' do
    erb :insufficient_funds
end

get '/change' do
    erb :change
end

post '/purchase/:id' do
    @products = Item.all
  @product = Item.find(params[:id])
  x=params[:price].to_i
  y=params[:quantity].to_i
  totalprice=x*y
  total=params[:ones].to_i*1+params[:fives].to_i*5+params[:tens].to_i*10+params[:twenties].to_i*20+params[:fifties].to_i*50+params[:hundreds].to_i*100+params[:five_hundreds].to_i*500+params[:thousands].to_i*1000
  if total>totalprice
    @product.update_attributes!(
    quantity: @product.quantity.to_i-y,
    sold: @product.sold.to_i+y,
     )
    @changer=MoneyCalculator.new(params[:ones].to_i, params[:fives].to_i, params[:tens].to_i, params[:twenties].to_i, params[:fifties].to_i, params[:hundreds].to_i, params[:five_hundreds].to_i, params[:thousands].to_i)
    @changemoney=@changer.change(totalprice)
    erb :change
  elsif total==totalprice
      @product.update_attributes!(
    quantity: @product.quantity.to_i-y,
    sold: @product.sold.to_i+y,
     )
    erb :success
  else
    erb :insufficient
  end
end

post '/create_product' do
  Item.create!(
    name: params[:name],
    price: params[:price],
    quantity: params[:quantity],
    sold: 0
  )
  redirect to '/admin'
end

get '/edit_product/:id' do
  @product = Item.find(params[:id])
  erb :product_form
end

post '/update_product/:id' do
  @product = Item.find(params[:id])
  @product.update_attributes!(
    name: params[:name],
    price: params[:price],
    quantity: params[:quantity],
  )
  redirect to '/admin'
end

get '/delete_product/:id' do
  @product = Item.find(params[:id])
  @product.destroy!
  redirect to '/admin'
end

# ROUTES FOR ADMIN SECTION
