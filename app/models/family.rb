class Family < ApplicationRecord
  belongs_to :father,class_name:"Person"
  belongs_to :mother,class_name:"Person"
  belongs_to :address
  has_many :members, class_name:"Person",foreign_key:'family_id'
  validates :address,presence:true
end
