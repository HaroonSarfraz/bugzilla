class UserProject < ApplicationRecord
  belongs_to :user
  belongs_to :project
  accepts_nested_attributes_for :user, :reject_if =>:all_blank
  #attr_accessor :user_id, :project_id
end
