
class PagesController < ApplicationController
  def search
    @parameter = params[:search].downcase

    @results = Product.where('productName LIKE :search OR productLine LIKE :search OR productCode LIKE :search OR productVendor LIKE :search OR productDescription LIKE :search', search: "%#{@parameter}%")
  end
end


#MyApp/app/controllers/pages_controller.rb
