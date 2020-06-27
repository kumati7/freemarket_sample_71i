class ItemDeliverAddressesController < ApplicationController
  def new
    @deliver_address = DeliverAddress.new

  end
  
  def create
    DeliverAddress.create(deliver_address_params)
    redirect_to new_item_trading_path(params[:item_id])
  end

  def edit
    @deliver_address = DeliverAddress.find_by(user_id: current_user)
  end
  
  def update
    deliver_address = DeliverAddress.find(params[:id])
    deliver_address.update(deliver_address_params)
    redirect_to new_item_trading_path(params[:item_id])
  end
end

private
def deliver_address_params
  params.require(:deliver_address).permit(:deliver_family_name,:deliver_first_name,:deliver_family_name_kana,:deliver_first_name_kana,:deliver_yubin_bango,:deliver_todofuken,:deliver_shichoson,:deliver_banchi,:deliver_building,:deliver_tel_no).merge(user_id: current_user.id)
end