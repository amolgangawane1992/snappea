module Api
   class RestaurantsController < ApplicationController
      
      def index
      	restaurants= Restaurant.all
      	render json: {status: 'SUCCESS', restaurants: restaurants}, status: 200
      end
 		
 		def show
 			begin
				@restaurant=Restaurant.find(params[:id])
				render json: {status: 'SUCCESS', message: '', data: @restaurant}, status: 200
 			rescue => exception
 				render json: {status: 'failure', message: 'record not found'},status:404
 			end 		
 		end

 		def create
 			@restaurant=Restaurant.new(restaurant_params)
 			if(@restaurant.save)
 			  render json: {status: 'SUCCESS', message: 'one record inserted successfully', data: @restaurant}, status: 200
 			 else
 			   render json: {status: 'failed', message: 'failed to insert', data: "somethng went wrong"}, status: 404

 			 end

 		end

 		def destroy
 			begin
 				restaurant=Restaurant.find(params[:id])
 				restaurant.destroy
 			    render json: {status: 'SUCCESS', message: 'one record deleted successfully'}, status:200
 			rescue
 				render json: {status: 'failed to delete ', message: 'record not found'},status:404
 			end

 		end

 		def update
 			begin
 				restaurant=Restaurant.find(params[:id])
 				if(restaurant.update(restaurant_params))
 			    render json: {status: 'SUCCESS', message: 'one record update successfully', data:restaurant}, status:200
 				else
 				  render json: {status: 'failed', message: 'failed to update,because record not found'}, status:404
 				end
 			rescue
 				render json: {status: 'failed to update ', message: 'record not found'},status:404
 			end
 		end

 		private 
		  	def restaurant_params
		    params.require(:restaurant).permit(:name, :rating,:address,:description)
		  end
  
  end
end
