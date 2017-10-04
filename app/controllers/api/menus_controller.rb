module Api
	class MenusController < ApplicationController
		
		def index
			restaurant = Restaurant.find_by_id(params[:restaurant_id])
			if restaurant.present?
				menu = restaurant.menus
         render json: {status: 'SUCCESS',data: menu}, status:200
       else
   				render json: {status: 'failed'}, status:200
      	end		
     end

 		def show
 			begin
				menu=Menu.find(params[:id])
				render json: {status: 'SUCCESS', message: '', data: menu}, status:200
 			rescue => exception
 				render json: {status: 'failure', message: 'record not found'},status:404
 			end 		
 		end
		
		def create
 			@menu=Menu.new(menu_params)
 			if(@menu.save)
 			  render json: {status: 'SUCCESS', message: 'one record inserted successfully', data: @menu}, status:200
 			 else
 			   render json: {status: 'failed', message: 'failed to insert', data: "somethng went wrong"}, status:200

 			 end

 		end

 		def destroy
 			begin
 				menu = Menu.find(params[:id])
 				menu.destroy
 			    render json: {status: 'SUCCESS', message: 'one record deleted successfully'}, status:200
 			rescue
 				render json: {status: 'failed to delete ', message: 'record not found'},status:404
 			end

 		end

 		def update
 			begin
 				menu = Menu.find(params[:id])
 				if(menu.update(menu_params))
 			    render json: {status: 'SUCCESS', message: 'one record update successfully', data:menu}, status:200
 				else
 				  render json: {status: 'failed', message: 'failed to update,because record not found'}, status:404
 				end
 			rescue
 				render json: {status: 'failed to update ', message: 'record not found'},status:404
 			end
 		end
 		private 
		  	def menu_params
		    params.require(:menu).permit(:Name,:Description,:category, :restaurant_id)
		  end

	end
end