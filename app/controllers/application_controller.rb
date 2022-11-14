class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # add routes
    get '/bakeries' do
      "Hello World"
      bakeries = Bakery.all
      bakeries.to_json
    end

    get '/bakeries/:id' do
      baked = Bakery.find(params[:id])
      baked.to_json(include: :baked_goods)
    end
 
    get '/baked_goods/by_price' do
      bakedGoods = BakedGood.all.order(price: :desc)
      bakedGoods.to_json
    end

    get '/baked_goods/most_expensive' do 
      most_expensive = BakedGood.all.order(:price).last
      most_expensive.to_json
    end



end
