class AlbumsController < ApplicationController
	before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

	def index
		@albums = Album.all
	end

	def new
		@album = Album.new
		@portfolios = Portfolio.all.map { |p| [p.name, p.id] }
	end

	def create
		@album = current_admin.albums.new(valid_params)
		@album.portfolio_id = params[:portfolio_id]
		if @album.save
			redirect_to album_path(@album)
			flash[:notice] = "Album is created successfully!"
		else
			render :new
		end
	end

	def show
		@album = Album.find(params[:id])
	end

	def edit
		@album = Album.find(params[:id])
	end

	def update
		@album = Album.find(params[:id])
		if @album.update_attributes(valid_params)
			redirect_to album_path(@album)
			flash[:notice] = "Album updated successfully"
		else
			flash[:alert] = "Error updating album. Try again"
			render :edit
		end
	end

	def destroy
		@album = Album.find(params[:id])
		@album.destroy
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js { render "destroy", locals: {id: @album.id} }
		end 
	end

	def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_back(fallback_location: @album_path)
  end

	private
	def valid_params
		params.require(:album).permit(:title, :body, :portfolio_id, images: [])
	end

	def require_login
		if !admin_signed_in?
			redirect_to root_path
			flash[:alert] = "You are not allowed to perform this action"
		end
	end


end