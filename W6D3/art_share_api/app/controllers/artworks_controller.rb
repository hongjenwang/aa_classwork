class ArtworksController < ApplicationController

    # def all
    #     artwork = Artwork.all
    #     render json: artwork
    # end

    def index
        if params[:user_id]
            artwork = Artwork.where(artist_id: params[:user_id])
        else
            artwork = Artwork.all
        end
        render json: artwork
    end

    def show    
        artwork = Artwork.find(params[:id])
        render json: artwork  
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else
            # render plain "not successful"
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            redirect_to "/artworks/#{artwork.id}"
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])
        if artwork.destroy
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

end
