class AddTypeToPeople < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :person_type, :integer
  end
end
