class CommentsController < ApplicationController
    def index
        comments = Comment
        if params[:user_id] || params[:artwork_id]
            if params[:user_id]
                comments = comments.where(user_id: params[:user_id])
            end
            if params[:artwork_id]
                comments = comments.where(artwork_id: params[:artwork_id])
            end 
        else
            comments = comments.all
        end    
        render json: comments
    end

    def create
    end

    def destroy
    end
end
