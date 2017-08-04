class UserProject < ApplicationRecord
  belongs_to :user
  belongs_to :project

  attr_accessor :user_id, :project_id
end
