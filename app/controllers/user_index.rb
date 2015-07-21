get '/' do
  @projects = Project.all
  erb :home
  # if current_user
  #   erb :home
  # else
  #   # erb :home
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
  @user = User.find_by(id: params[:id])
  @collaborations = Project.joins(:project_users).where('project_users.user_id' => @user.id)

  erb :'user/user_show'
end

############ edit ############
get "/users/:id/edit" do
end

############ update ############
put "/users/:id" do
  skill_array = params[:skills_paragraph]
  p skill_array

end

############ destroy ############
delete "/users/:id" do
end

