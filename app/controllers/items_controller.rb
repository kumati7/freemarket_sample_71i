class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.images.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end
  
  def updata
  end

  def show
    @item = Item.find(params[:id])
    @images = Image.where(item_id: @item)
  end

  def destroy
    item = Item.find(params[:id])
    images = Image.where(item_id: item)
    images.delete_all
    item.destroy
    redirect_to user_path(current_user)
  end

end

def item_params
  params.require(:item).permit(:item_name, :item_info, :category_id, :brand_id, :condition, :postage_burden, :shipping_area, :days_to_ship, :price, images_attributes: [:item_image]).merge(user_id: current_user.id)

end

