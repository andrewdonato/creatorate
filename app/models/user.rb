require 'bcrypt'

class User < ActiveRecord::Base

  has_many :project_users
  has_many :projects, through: :project_users

  has_many :user_skills
  has_many :skills, through: :user_skills


  include BCrypt


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
