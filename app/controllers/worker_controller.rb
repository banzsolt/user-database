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

	def create_store

		@store = Store.new(params.require(:store).permit(:name))
		@store.save
		redirect_to(:action => 'raspbery')

	end

	def create_music

		@music = Music.new(params.require(:music).permit(:Name))
		@music.save
		redirect_to(:action => 'raspbery')

	end

	def create_attribute

		attribute = Attribute.new(params.require(:attribute).permit(:parent_id, :attribute_name, :attribute_level, :description))
		attribute.save
		redirect_to(:action => 'raspbery')

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


	def raspbery

		@stores = Store.first(100)
		@musics = Music.first(100)
		@attributes = Attribute.first(100)
		@music_attributes = AttributeMusic.first(100)
		@store_attributes = AttributeStore.first(100)

	end

	def create_music_attribute

		music_attribute = AttributeMusic.new(params.require(:music_attribute).permit(:music_id, :attribute_id))
		music_attribute.save
		redirect_to(:action => 'raspbery')

	end


	def create_store_attribute

		store_attribute = AttributeStore.new(params.require(:store_attribute).permit(:store_id, :attribute_id))
		store_attribute.save
		redirect_to(:action => 'raspbery')

	end


	def generate_playlist

		attributes = AttributeStore.where("store_id = ?", params[:playlist_params][:store_id]).pluck(:attribute_id)
		helper = AttributeMusic.where("attribute_id IN (?)", attributes).pluck(:music_id)
		@musics = Music.where("id IN (?)", helper)




	end


	def generate_playlist_2

		@musics = Music.where("id IN (?)", AttributeMusic.where("attribute_id = ?", params[:attribute_params][:attribute_id]).pluck(:music_id))

	end

	private

    def worker_params
      params.require(:worker).permit(:email, :facebook, :google, :twitter, :vine)
    end

end
