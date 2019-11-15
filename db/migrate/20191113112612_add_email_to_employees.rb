class AddEmailToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :email, :string
    add_column :employees, :phone, :string
    add_column :employees, :designation, :string
    add_column :company_profiles, :email, :string
    add_column :company_profiles, :location, :string
    add_column :company_profiles, :status, :integer
  end
end
