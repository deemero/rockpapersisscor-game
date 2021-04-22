require 'sinatra'

class HiSinatra < Sinatra::Base
enable :session
  get '/' do
    erb :homepage
  end

post '/' do
  session['player_name'] = params[:player_name]
  @player_name = session['player_name']
  erb :rounds
 end



get '/menu' do
  erb :menu
end

 post '/rounds' do
    @rounds = params['rounds']
    session['rounds'] = params[:rounds].to_i
    erb :menu
  end



get '/game' do
   session['count'] = 0
   erb :game
 end



 get '/game/throw/:player_choice' do

   options = ['rock', 'paper', 'scissors']
   computer_choice = rand(options.length)
   player_choice = params[:player_choice]
   computer_answer = options[computer_choice]


   session['count'] += 1

   @count = session['count']
   @rounds = session['rounds'].to_i



  if player_choice == 'rock' && computer_choice == 'scissors'
     @result = 'YOU WIN!'
  elsif player_choice == 'paper' && computer_choice == 'rock'
     @result = 'YOU WIN!'
  elsif player_choice == 'scissors' && computer_choice == 'paper'
     @result = 'YOU WIN!'
  elsif computer_choice == 'rock' && player_choice == 'scissors'
     @result = 'YOU LOSE!'
  elsif computer_choice == 'paper' && player_choice == 'rock'
     @result = 'YOU LOSE!'
  elsif computer_choice == 'scissors' && player_choice == 'paper'
     @result = 'YOU LOSE!'
  else
     @result = 'TIED!'
   end
   erb :game
 end
end
