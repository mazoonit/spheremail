require 'rails_helper'
RSpec.describe Person, type: :model do
    let!(:address) {Address.create(street:"Bayrony",city:"Alexandria",country:"Egypt")}
    let!(:family){Family.create(address: address)}
    subject {Person.new(name:"mazen",age:55,sex:"male",person_type:"father",family:family)}
    
    before {subject.save}

    it 'is not valid without child sex' do
      subject.person_type="child"
      subject.sex=nil
      expect(subject).to_not be_valid
    end
    
    it 'is not valid if father is female' do
      subject.sex="female"
      expect(subject).to_not be_valid
    end

    it 'is not valid if mother is male' do
      subject.person_type="mother"
      expect(subject).to_not be_valid
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    
  end