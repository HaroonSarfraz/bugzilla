class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through:  :user_projects
  has_many :bugs, dependent:  :destroy



# validation
  validates :title , presence: true , length: {maximum: 50}
  self.per_page = 5


end
