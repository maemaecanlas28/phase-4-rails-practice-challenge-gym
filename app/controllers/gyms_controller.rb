class GymsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def show
        gym = find_gym
        render json: gym, except: [:created_at, :updated_at]
    end

    def destroy
        gym = find_gym
        gym.destroy
        head :no_content
    end

    private

    def find_gym
        Gym.find(params[:id])
    end

    def params_permit
        params.permit(:name, :address)
    end

    def render_not_found_response
        render json: { error: "Gym not found" }, status: :not_found
    end
end
