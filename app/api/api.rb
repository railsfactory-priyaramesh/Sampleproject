 	class API < Grape::API
        version 'v1', using: :path
        prefix "api"
        default_format :json


        resource :statuses do
          get do
            my_data = User.all
           present my_data: my_data
          end
        end
    end
