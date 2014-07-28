require 'sinatra/base'
require './lib/player'
require './lib/game'

class RockPaperScissors < Sinatra::Base
  
  # set :public_dir, Proc.new { File.join (root, "..", 'public') }

  get '/' do
    erb :index
  end

  get '/new-game' do
  	erb :new_player
  end

  post '/register' do 
  	@player = params[:name]
  	erb :play	
  end

  post "/play" do
  	player = Player.new(params[:name])
  	player.picks = params[:pick]
  	computer = generate_computer
  	@game = Game.new(player, computer)
  	erb :outcome
  end

  get "/restart_game" do
    redirect to ('/play')
  end

  def generate_computer
  	choice = ["Rock","Paper","Scissors"].sample

  	comp = Player.new("computer")
  	comp.picks = choice
  	comp
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
