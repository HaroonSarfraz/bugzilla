class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through:  :user_projects
  has_many :bugs, dependent:  :destroy

  accepts_nested_attributes_for :user_projects, :reject_if => :all_blank, :allow_destroy =>true

# validation
  validates :title , presence: true , length: {maximum: 50}
  self.per_page = 5


end
