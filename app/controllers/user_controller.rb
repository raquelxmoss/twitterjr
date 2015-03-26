enable :sessions
get '/users' do
  @users = User.all

  erb :'/users/index'
end

get '/users/:id/feed' do
  id = params[:id]
  @me = User.find(id)
  if session[:user].id == id
    erb :'users/my_feed'
  else
    redirect '/'
  end
end






