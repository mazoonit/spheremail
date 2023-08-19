require 'rails_helper'
RSpec.describe Person, type: :model do
    subject {Person.new(name:"mazen",age:55,sex:"male",person_type:"father")}
    
    before {subject.save}

    it 'child sex value must be provided' do
      subject.person_type="child"
      subject.sex=nil
      expect(subject).to_not be_valid
    end
    
    it 'father must be male' do
      subject.sex="female"
      expect(subject).to_not be_valid
    end

    it 'mother must be female' do
      subject.person_type="mother"
      expect(subject).to_not be_valid
    end
  end