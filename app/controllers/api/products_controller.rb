module DX
  module API
    class ProductsController < DX::App
      respond_to :json

      get '/featured' do
        sleep 2
        respond_with :json, [
          { name: 'Lisette Dress', price: 58, images: ['images/thumbnails/db_file_img_48_640xauto.jpg', 'images/thumbnails/db_file_img_49_640xauto.jpg'], type: 'standard' },
          { name: 'El Silencio', price: 50, images: ['images/thumbnails/db_file_img_48_640xauto.jpg', 'images/thumbnails/db_file_img_49_640xauto.jpg'], type: 'standard', sale: true, sale_price: 35 },
          { name: 'Malta Dress', price: 88, images: ['images/thumbnails/db_file_img_48_640xauto.jpg', 'images/thumbnails/db_file_img_49_640xauto.jpg'], type: 'standard' },
          { name: 'Babar Soul', price: 70, images: ['images/thumbnails/db_file_img_48_640xauto.jpg', 'images/thumbnails/db_file_img_49_640xauto.jpg'], type: 'standard' }
        ]
      end
    end
  end
end
