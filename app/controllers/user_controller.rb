
get '/users' do
  @users = User.all

  erb :'/users/index'
end

get '/users/:id/feed' do

end






