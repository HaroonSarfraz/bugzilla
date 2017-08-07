class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :creater,class_name: 'User', :foreign_key => 'created_by'
  belongs_to :asigned,class_name: 'User', :foreign_key => 'asigned_to' , optional: true


  validates :title , presence: true , length: {maximum: 50}

  self.per_page = 5

  has_attached_file :screenshot, style: {medium: "300*300>",thumb: "100*100>" },
  default_url: "/images/:style/missing.png"
    validates_attachment_content_type :screenshot,
    content_type: /\Aimage\/.*\z/

end
