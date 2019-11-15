class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :age
      t.integer :company_profile_id

      t.timestamps
    end
  end
end
