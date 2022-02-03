# users GET    /users(.:format)     users#index
# GET    /users/:id(.:format)       users#show
# POST   /users(.:format)           users#create
# PATCH  /users/:id(.:format)       users#update
# PUT    /users/:id(.:format)       users#update
# DELETE /users/:id(.:format)       users#destroy

class UsersController < ApplicationController
    def index
        user = User.all
        render json: user
    end

    def show    
        user = User.find(params[:id])
        render json: user  
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            # render plain "not successful"
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            redirect_to "/users/#{user.id}"
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find(params[:id])
        if user.destroy
            render json: 'User was destroyed'
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def user_params
        params.require(:user).permit(:name, :email)
    end

end
