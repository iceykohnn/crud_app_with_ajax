before '/' do
	unless authenticated?
		redirect '/sessions/new'
	end
end

get '/' do
  @events = Event.all
  erb :index
end

get '/event/new' do
  @events = Event.all
  @users = User.where(id: session[:user_id])
 erb :index
end

get '/event/:id' do
  @event = Event.find(params[:id])

 erb :show_event
end


post '/events' do
  @events = Event.all
  @new_event = Event.create!(params[:event]) do |event|
    event.user_id = session[:user_id]
  end
    erb :index
end

get '/event/:id/edit' do
  @event = Event.find(params[:id])
 erb :edit_event
end

post '/event/:id' do
  @event = Event.find(params[:id])
  @event.update_attributes(params[:event])
  redirect "/event/#{@event.id}"
end

post '/event/:id/delete' do
    @event = Event.find(params[:id])
    @event.destroy!
    redirect "/"
end 

