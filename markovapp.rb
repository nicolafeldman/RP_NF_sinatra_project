require 'sinatra'
require './markov'
require 'pry'
require 'engtagger'

enable :sessions



get '/' do
	
	session[:proverbs]||=[]
	erb :index
end 

post '/' do
	input = params[:input]

	new_proverb = generate

	#if input == '' || input=='optional text'
	#	new_proverb=generate
	#else
#		new_proverb=generate_with_input(input)
#	end

	session[:proverbs].push(new_proverb)
	if session[:proverbs].length > 10
		session[:proverbs].delete_at(0)
	end
	erb :index
end