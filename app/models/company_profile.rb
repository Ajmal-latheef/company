class CompanyProfile < ApplicationRecord
	has_many :employees
	validates :company_name, presence: true, uniqueness: true
	enum status: {active: 0, inactive: 1}
end
