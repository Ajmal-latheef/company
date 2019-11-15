class EmployeesController < ApplicationController

	def index
		@employees = Employee.all
		respond_to do |format|
			format.html
			format.csv { send_data  Employee.export_csv }
		end
	end

	def show
		@employee = Employee.find(params[:id])
	end

	def new
		@employee = Employee.new
	end

	def edit
		@employee = Employee.find(params[:id])
	end

	def create
	@employee = Employee.new(employee_params)

		if @employee.save
			redirect_to @employee, notice: 'Employee was successfully created.'
		else
			render 'new'
		end
	end

	def destroy
	@employee = Employee.find(params[:id])
	@employee.destroy

	redirect_to employees_path
	end

	def recieve_csv
  	employee = Employee.find(params[:id])
		respond_to do |format|
			format.html
			format.csv {send_data Employee.download_csv(employee) }
		end
	end

	def update
		@employee = Employee.find(params[:id])
		respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

	private

	def employee_params
		params.require(:employee).permit(:name, :age, :company_profile_id, :email, :phone, :designation, :image)
	end
end