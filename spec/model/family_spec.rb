require 'rails_helper'
RSpec.describe Person, type: :model do
    
    let!(:father) {Person.create(name:"Mazen",person_type:"father",age:25,sex:"male")}
    let!(:mother) {Person.create(name:"Sarah",person_type:"mother",age:23,sex:"female")}
    let!(:address) {Address.create(street:"Bayrony",city:"Alexandria",country:"Egypt")}
    
    subject {Family.new(father: father,mother: mother,address: address)}
    
    before {subject.save}

    it 'Address must be provided' do
      subject.address=nil
      expect(subject).to_not be_valid
    end
  end