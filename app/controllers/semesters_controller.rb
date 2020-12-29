class SemestersController < ApplicationController
	
	def new
		@semester = Semester.new
		respond_to do |format|
	    format.html  # new.html.erb
	    format.json  { render :json => @semester }
  	end
	end

	def index
		@semesters = Semester.all
 
	  respond_to do |format|
	    format.html  # index.html.erb
	    format.json  { render :json => @semesters }
	  end
	end

	def create
		# semester = params[:semester]
		@semester = Semester.new(semester_params)
		respond_to do |format|
			if @semester.save
				format.html { redirect_to(@semester, notice: 'Semester Created Sucessfully')}
				format.json { render json: @semester, status: :created, location: @semester }
			else
				format.html  { render :action => "new" }
      	format.json  { render :json => @semester.errors,:status => :unprocessable_entity }
      end
		end
	end

	private

	def semester_params
		params.require(:semester).permit(:sem_id,:name)
	end

end
