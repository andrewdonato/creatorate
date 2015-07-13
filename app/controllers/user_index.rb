get '/' do
  erb :home
  # if current_user
  #   erb :home
  # else
  #   p '@' * 90
  #   p "not happy"
  # end
end

post '/sessions' do
  login
  redirect '/'
end


get '/signout' do
  logout
  redirect '/'
end
############ index ############
get "/users" do
end

############ new ############
get "/users/new" do

end

############ create ############
post "/users" do
  sign_up
  login
  redirect '/'
end

############ show ############
get "/users/:id" do
end

############ edit ############
get "/users/:id/edit" do
end

############ update ############
put "/users/:id" do
end

############ destroy ############
delete "/users/:id" do
end

