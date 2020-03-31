require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get "/" do
    erb :welcome
  end
  
  get "/artist" do
    @artists = Artist.all    
    erb :index
  end
  
  get "/artist/new" do
    erb :new
  end

  post "/artist" do
    @artist = Artist.create(params)
    redirect("/artist/#{@artist.id}")
  end

  get "/artist/:id" do
    @artist = Artist.find(params[:id])    
    erb :show
  end

  get "/artist/:id/edit" do
    @artist = Artist.find(params[:id])
    erb :edit
  end

  patch "/artist/:id" do
    @artist = Artist.find(params[:id])
    @artist.update(params[:artistInfo])
    redirect("/artist/#{@artist.id}")
  end

  delete '/artist/:id' do
    Artist.find(params[:id]).destroy
    redirect("/artist")
  end
  
end
