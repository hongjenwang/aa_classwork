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
        render json: params
    end

    def create
        user = User.new(params.require(:user).permit(:name, :email))
        if user.save
            render json: user
        else
            # render plain "not successful"
            render json: user.errors.full_messages, status: :unprocessable_entity
        end

    end

end
