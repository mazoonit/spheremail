class SexValidator < ActiveModel::Validator
  def validate(record)
    if record.person_type == "mother" and record.sex !="female"
      record.errors.add :base, "Mother must be female."
    end
    if record.person_type=="father" and record.sex !="male"
      record.errors.add :base, "Father must be male."
    end
    if record.person_type=="child" and record.sex==nil
      record.errors.add :base, "child's sex is required."
    end
  end
end

class Person < ApplicationRecord
  belongs_to :family,foreign_key:'family_id',optional:true
  enum :sex, {male:0,female:1}
  enum :person_type, {father:0,mother:1,child:2}
  validates :name, presence:true
  validates :sex, presence:true
  validates_with SexValidator
end
