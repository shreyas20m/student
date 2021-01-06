class StudentDetailsController < ApplicationController
	def new
		@student_detail = StudentDetail.new
		respond_to do |format|
	    format.html  # new.html.erb
	    format.json  { render :json => @student_detail }
  	end
	end

	def index
		@student_details = StudentDetail.all.order(created_at: :desc)
	end

	def create
		# student_detail = params[:student_detail]
		@student_detail = StudentDetail.new(student_detail_params)
		respond_to do |format|
			if @student_detail.save
				format.html { redirect_to(@student_detail, notice: 'student Created Sucessfully')}
				format.json { render json: @student_detail, status: :created, location: @student_detail }
			else
				format.html  { render :action => "new" }
      	format.json  { render :json => @student_detail.errors,:status => :unprocessable_entity }
      end
		end
	end

	def show
		@student_detail = StudentDetail.find(params[:id])
		@results = @student_detail.results
		@res = []
		@results.each do |res|
			obj = {}
			obj[:usn] = @student_detail.usn
			obj[:sem] = Semester.find(res.sem_id).sem_id rescue ''
			obj[:subject_code] = res.sub_id
			obj[:mark] = res.mark
			@res << obj
		end
		Rails.logger.debug "#{@res}"
		respond_to do |format|
			format.html #show.html.erb
			format.json {render json: @student_detail}
		end
	end

	def edit
		@student_detail = StudentDetail.find(params[:id])
	end

	def update
	  @student_detail = StudentDetail.find(params[:id])
	  respond_to do |format|
	    if @student_detail.update_attributes(student_detail_params)
	      format.html  { redirect_to(@student_detail,:notice => 'student_detail was successfully updated.') }
	      format.json  { head :no_content }
	    else
	      format.html  { render :action => "edit" }
	      format.json  { render :json => @student_detail.errors,:status => :unprocessable_entity }
	    end
	  end
	end

	def destroy
	  @student_detail = StudentDetail.find(params[:id])
	  @student_detail.destroy
	 
	  respond_to do |format|
	    format.html { redirect_to student_details_url }
	    format.json { head :no_content }
	  end
	end

	def view_result
		render json: {}, status: :ok
	end
	private

	def student_detail_params
		params.require(:student_detail).permit(:name, :usn, :gender, :address)
	end
end
