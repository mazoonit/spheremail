class Family < ApplicationRecord
  belongs_to :father,class_name:"Person",optional:true
  belongs_to :mother,class_name:"Person",optional:true
  belongs_to :address
  has_many :members, class_name:"Person",foreign_key:'family_id'
  validates :address,presence:true

  after_create do |family|
    add_family_to_father_and_mother(family)
  end
  after_save do |family|
    add_family_to_father_and_mother(family)
  end

  private
  
    def add_family_to_father_and_mother(family)
      if family.father
        family.father.family=family
      end
      if family.mother
        family.mother.family=family
      end
    end
end
