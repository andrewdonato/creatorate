class Project < ActiveRecord::Base

  belongs_to :creator

  has_many :project_users
  has_many :collaborators, through: :project_users

  has_many :project_skills
  has_many :skills, through: :project_skills


end


