enable :sessions
get '/users' do
  @users = User.all

  erb :'/users/index'
end

get '/users/:id/my_feed' do
  id = params[:id]
  @me = User.find(id)
  unless session[:user].nil?
    erb :'users/my_feed' if session[:user].id == id
  end
  redirect '/'
end






