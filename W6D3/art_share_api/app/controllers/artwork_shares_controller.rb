class ArtworkSharesController < ApplicationController
    # def index
    #     artwork_share = ArtworkShare.all
    #     render json: artwork_share
    # end

    # def show    
    #     artwork_share = ArtworkShare.find(params[:id])
    #     render json: artwork_share  
    # end

    def create
        artwork_share = ArtworkShare.new(artwork_shares_params)
        if artwork_share.save
            render json: artwork_share
        else
            # render plain "not successful"
            render json: artwork_share.errors.full_messages, status: :unprocessable_entity
        end
    end

    # def update
    #     artwork_share = ArtworkShare.find(params[:id])
    #     if artwork_share.update(artwork_shares_params)
    #         redirect_to "/artwork_shares/#{artwork_share.id}"
    #     else
    #         render json: artwork_share.errors.full_messages, status: :unprocessable_entity
    #     end
    # end

    def destroy
        artwork_share = ArtworkShare.find(params[:id])
        if artwork_share.destroy
            render json: artwork_share
        else
            render json: artwork_share.errors.full_messages, status: :unprocessable_entity
        end
    end

    private

    def artwork_shares_params
        params.require(:artwork_share).permit(:viewer_id, :artwork_id)
    end

end
