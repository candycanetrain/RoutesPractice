class ContactSharesController < ApplicationController
  def index
    @contact_shares = ContactShare.all
    render json: @contact_shares
  end

  def create
    @contact_share = ContactShare.find(contact_share_params)
    if @contact_share.save
      render json: @contact_share
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end

  end

  def update
    @contact_share = ContactShare.find(contact_share_params)
    if @contact_share.update
      render json: @contact_share
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end

  end

  def destroy
    @contact_share = ContactShare.find(params[:id])
    ContactShare.destroy(@contact_share)
    render json: @contact_share
  end

  def show
    @contact_share = ContactShare.find(params[:id])
    render json: @contact_share


  end

  private

  def contact_share_params
    params.require(:contact_share).permit(:id, :user_id, :contact_id)
  end
end
