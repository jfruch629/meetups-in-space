require 'sinatra'
require_relative 'config/application'
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces
set :views, File.join(File.dirname(__FILE__), "app/views")

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/meetups' do
  @meetups = Meetup.all.order(:name)
  erb :'meetups/index'
end

get '/meetups/new' do
  @meetup = Meetup.new
  erb :'meetups/new'
end

get '/meetups/:id' do
  @meetup = Meetup.find(params[:id])
  erb :'meetups/show'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"
  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

post '/meetups/new' do
  @meetup = Meetup.new(params[:meetup])
  @meetup.creator = current_user.username

  if @meetup.save
    @meetup.users << current_user
    flash.now[:notice] = "Your meetup has successfully been created!"
    erb :'/meetups/show'
  else
    @error_messages = []
    @meetup.errors.messages.values.each do |array|
      array.each do |message|
        @error_messages << message
      end
    end
    flash[:notice] = @error_messages.join("<br/>")
    redirect '/meetups/new'
  end
end

post '/meetups/:id' do
  @meetup = Meetup.find(params[:id].to_i)
  if !current_user
    flash.now[:notice] = "You must be signed in to join this Meetup"
  else
    if !(@meetup.users.include?(current_user))
      @meetup.users << current_user
      flash.now[:notice] = "You have been successfully added to this Meetup!"
    elsif @meetup.creator == current_user.username
      flash.now[:notice] = "You're the creator! You don't need to be added to the join list."
    else
      flash.now[:notice] = "You're already added to the list!"
    end
  end
  erb :'/meetups/show'
end
