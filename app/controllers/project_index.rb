############ index ############
get "/projects" do
end

############ new ############
get "/projects/new" do
  @user = current_user
  erb :"project/_project_new"
end

############ create ############
post "/projects" do
  @project = Project.new(creator_id: current_user.id, name: params[:name],
    timeframe: params[:timeframe],
    finances: params[:finances],
    description: params[:description],
    needs: params[:needs],
  )
  if @project.save
    redirect '/'
  else
    p '%' * 50
    p "did not save"
    p '%' * 50
  end
end

############ show ############
get "/projects/:id" do
  @project = Project.find_by(id: params[:id])
  @creator = User.find_by(id: "#{@project.creator_id}")
  erb :"project/_project_show"
end

############ edit ############
get "/projects/:id/edit" do
end

############ update ############
put "/projects/:id" do
end

############ destroy ############
delete "/projects/:id" do
end

