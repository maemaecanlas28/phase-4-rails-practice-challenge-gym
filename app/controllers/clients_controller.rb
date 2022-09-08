class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def show
        client = find_client
        render json: client
    end

    private

    def find_client
        Client.find(params[:id])
    end

    def params_permit
        params.permit(:name, :age)
    end

    def render_not_found_response
        render json: { error: "Client not found" }, status: :not_found
    end
end
