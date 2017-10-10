module API
    class login < Grape::API
      include API::V1::Defaults
          resources :login do
             desc "Authenticate user with token"
               params do
           requires :email, :type => String, :desc => "User email"
           requires :password, :type => String, :desc => "User password"
         end
         post 'authenticate' do
           email = params[:email]
           password = params[:password]

           if email.nil? or password.nil?
             error!({:error_code => 404, :error_message => "Invalid email or password."}, 401)
             return
           end

           user = User.find_by(email: " " , password: " ")
           if user.nil?
              error!({:error_code => 404, :error_message => "Invalid email or password."}, 401)
              return
           end

           if !user.valid_password?(password)
              error!({:error_code => 404, :error_message => "Invalid email or password."}, 401)
              return
           else
             user.ensure_authentication_token!
             user.save
             status(201){status: 'ok', token: user.authentication_token }
           end
    end
end
       