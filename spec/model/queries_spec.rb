require 'rails_helper'
RSpec.describe 'Counting Queries' do
    before {
        # Creating DUMP DATA to Test
        # Results should be 4 Males, 3 Females And there's ONLY 1 family with one child.
        fathers=[
            Person.create({name:"Mazen",person_type:"father",age:25,sex:"male"}),
            Person.create({name:"Denis",person_type:"father",age:30,sex:"male"}),
        ]
        mothers=[
            Person.create({name:"Sarah",person_type:"mother",age:23,sex:"female"}),
            Person.create({name:"Eve",person_type:"mother",age:32,sex:"female"}),
        ]
        addresses=[
            Address.create({street:"bayrony",city:"Alexandria",country:"Egypt"}),
            Address.create({street:"eau",city:"Paris",country:"France"})
        ]
        families=[
            Family.create({father:fathers[0],mother:mothers[0],address:addresses[0]}),
            Family.create({father:fathers[1],mother:mothers[1],address:addresses[1]})
        ]
        children=[
            Person.create({name:"muller",person_type:"child",age:5,sex:"male",family:families[0]}),
            Person.create({name:"peter",person_type:"child",age:7,sex:"male",family:families[0]}),
            Person.create({name:"hala",person_type:"child",age:8,sex:"female",family:families[1]})
        ]  
        
    }

    it 'Count Males' do
      person_count=Person.where(sex:"male").count
      expect(person_count).to eq(4)
    end
    it 'Count Females' do
      person_count=Person.where(sex:"female").count
      expect(person_count).to eq(3)
    end
    it 'How Many Families have one child?' do
        #Group by family_id then filter with child and count==1.
        familiesWithOneChild=Person.group('family_id').having(person_type:"child").having('count(*)==1').count
        expect(familiesWithOneChild.count).to eq(1)
    end
  end