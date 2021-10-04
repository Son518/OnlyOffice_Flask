class UsermanagementsController < ApplicationController
    include JSONAPI::Errors
    include JSONAPI::Deserialization

    # archiving an user
    def archive
        user = User.find_by(email: management_params[:email]))
        # if user exists, change the user's status attribute
        if user
            user.status = true
            if user.save
                render jsonapi: user, status: :ok
            end
            render jsonapi_errors: user.errors, status: :unprocessable_entity
        else
            render json: { error: 'Invalid email' }, status: :unprocessable_entity
    end

    # unarchiving an user

    # deleting an user

    # get user data from params
    def management_params
        params.require(:management).permit(:email)
    end
end
