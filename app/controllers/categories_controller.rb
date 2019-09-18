class CategoriesController < ApplicationController
	 before_action :set_category, only: :show

  def show
    @campaigns = Campaign.where(category_id: @category).paginate(page: params[:page], per_page: 5)
  end


  private
  def set_category
    @category = Category.find(params[:id])
  end
end
