class CreateFamilies < ActiveRecord::Migration[7.0]
  def change
    create_table :families do |t|
      t.references :father,null: true,foreign_key: {to_table:'people'},index:{unique:true}
      t.references :mother,null: true,foreign_key: {to_table:'people'},index:{unique:true}
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
