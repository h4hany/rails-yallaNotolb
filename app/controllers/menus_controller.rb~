class MenusController < ApplicationController
   def index
      @menus = Menu.all
   end
   
   def new
      @menu = Menu.new
   end
   
   def create
      @menu = Menu.new(menu_params)
      
      if @menu.save
         redirect_to menus_path, notice: "The menu #{@menu.name} has been uploaded."
      else
         render "new"
      end
      
   end
   
   def destroy
      @menu = menu.find(params[:id])
      @menu.destroy
      redirect_to menus_path, notice:  "The menu #{@menu.name} has been deleted."
   end
   
   private
      def menu_params
      params.require(:menu).permit(:name, :attachment)
   end
end
