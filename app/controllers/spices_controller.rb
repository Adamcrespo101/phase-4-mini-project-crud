class SpicesController < ApplicationController

    def index 
        render json: Spice.all
    end

    def show 
        spice = Spice.find(params[:id])
        render json: spice
    end

    def create 
        spice = Spice.create(spice_params)
        render json: spice, status: 201
    end

    def update 
        spice = Spice.find(params[:id])
        if spice
            spice.update(spice_params)
            render json: spice
        else 
            render json: {message: "spice not found"}, status: :not_found

        end
    end

    def destroy 
        spice = Spice.find(params[:id])
        if spice 
            spice.destroy 
            head :no_content
        else
            render json: {message: "spice not found"}, status: :not_found
    end     
end








private 
 def  spice_params 
    params.permit(:title, :image, :description, :notes, :rating)
 end


end
