require 'csv'

class Employee < ApplicationRecord
	belongs_to :company_profile
	has_one_attached :image
	validates :name, presence: true, length: { minimum: 5}
	validates :age, presence: true
	validate :correct_image_type

	def self.export_csv
		CSV.generate do |csv|
				csv << ['id','name','age','company_profile_id','created_at','date']
			Employee.all.each do |employee|
				csv << [employee.id,employee.name,employee.age,employee.company_profile.company_name,employee.created_at,employee.updated_at]
			end
		end
	end

	def self.download_csv(employee)
		CSV.generate do |download|
				download << ['id','name','age','company_profile_id','created_at','date']
				download << [employee.id,employee.name,employee.age,employee.company_profile.company_name,employee.created_at,employee.updated_at]
		end
	end


	private

	def correct_image_type
		if image.attached? == false
			errors.add(:image, 'required')
		elsif image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
			errors.add(:image, 'must be a JPEG or PNG')
		end
	end
end
