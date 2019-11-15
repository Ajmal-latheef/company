class CompanyProfilesController < ApplicationController

	def index
		@company_profiles = CompanyProfile.all
	end

	def new
		@company_profile = CompanyProfile.new
	end

	def create
			@company_profile = CompanyProfile.new(company_params)
		if @company_profile.save
			redirect_to company_profiles_path, notice: 'Company Profile was successfully created.'
		else 
			render 'new'
		end
	end

	def show
		@company_profile = CompanyProfile.find(params[:id])
	end

	def edit
	@company_profile = CompanyProfile.find(params[:id])
	end

	def update
		@company_profile = CompanyProfile.find(params[:id])
		if @company_profile.update(company_params)
			redirect_to company_profile_path, notice: 'Company Profile was successfully updated.'
		else 
			render 'new'
		end
	end

	def destroy
		@company_profile = CompanyProfile.find(params[:id])
		@company_profile.destroy
		redirect_to company_profiles_path
	end

	private

	def company_params
		params.require(:company_profile).permit(:company_name, :email, :location, :status)
	end
end
