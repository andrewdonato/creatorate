############ index ############
get "/projects" do
  @projects = Project.all
  erb :"project/_project_index"
end

############ new ############
get "/projects/new" do
  @user = current_user
  erb :"project/_project_new"
end

############ create ############
post "/projects" do
  @projects = Project.all
  @project = Project.new(creator_id: current_user.id, name: params[:name],
    timeframe: params[:timeframe],
    finances: params[:finances],
    description: params[:description],
    needs: params[:needs]
  )
  p "*" * 100
  p params
  p "*" * 100
  if @project.save
    (erb :"project/_project_index", layout: false).to_json
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

