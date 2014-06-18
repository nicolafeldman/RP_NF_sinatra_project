require 'sinatra'
require './markov'
require 'pry'

enable :sessions



get '/' do
	
	session[:proverbs]||=[]
	erb :index
end 

post '/' do

	new_proverb=generate
	session[:proverbs].push(new_proverb)
	if session[:proverbs].length > 10
		session[:proverbs].delete_at(0)
	end
	erb :index
end