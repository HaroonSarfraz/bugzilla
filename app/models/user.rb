class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save {self.email = self.email.downcase}
  validates :name , presence: true , length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email , presence: true , length: {maximum: 255} , format: { with: VALID_EMAIL_REGEX},
      uniqueness: {case_sensitive: false} ;


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :user_projects
  has_many :projects, through:  :user_projects

  has_many :created_bugs , class_name: "Bug", foreign_key: "created_by"
  has_many :asigned_bugs , class_name: "Bug", foreign_key: "asigned_to"


end
