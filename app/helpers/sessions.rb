helpers do

  def sign_up
    # @user = User.new(params[:user])
    # the above might work but here is the verbose way too
    @user = User.new(name: params[:name], email: params[:email])
    @user.password = params[:password]
    @user.save!
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
    else
      p '@' * 90
      p 'login failed'
      p '@' * 90
    end
  end

  def logout
    session[:user_id] = nil
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.where(id: session[:user_id]).first
    end
  end

end
