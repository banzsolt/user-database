class WorkerController < ApplicationController

	def index
		@workers = Worker.all
	end

	def new
		@worker = Worker.new
	end

	def create
	
		@worker = Worker.new(worker_params)
    	# Save the object
    	if @worker.save
      		# If save succeeds, redirect to the index action
      		flash[:notice] = "Worker created successfully."
      		redirect_to(:action => 'new')
    	else
      		# If save fails, redisplay the form so user can fix problems
      		flash[:notice] = "Worker error."
      		render('new')
    	end

	end

	def edit
		
		@worker = Worker.find(params[:id])

	end

	def update

		@worker = Worker.find(params[:id])

		if @worker.update_attributes(worker_params)
	      	# If save succeeds, redirect to the index action
	      	flash[:notice] = "Worker updated successfully."
	      	redirect_to(:action => 'index')
   	 	else
      		# If save fails, redisplay the form so user can fix problems
      		render('edit', id: worker.id)
    	end

	end
	
	private

    def worker_params
      params.require(:worker).permit(:email, :facebook, :google, :twitter, :vine)
    end

end
