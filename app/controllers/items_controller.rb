class ItemsController < ApplicationController
  def new
    @item = Item.new
   end

   def create
    　@item = Item.new(item_params)
    　if @item.save!
       item = Item.find(@item.id)
      #  redirect_to root_path
    　else
       redirect_to new_item_path
    　end
    end

    def item_params
      params.require(:item).permit(:name, :price, images: []) .merge(seller_id: current_user.id)
    end
end

