# module API
#   module V1
#     class Users < Grape::API
#       include API::V1::Defaults

#       resources :users do

#       	desc "Register user and return user object, access token"
#          params do
#             requires :name, :type => String, :desc => "First Name"
#             requires :username, :type => String, :desc => "Last Name"
#             requires :email, :type => String, :desc => "Email"
#             requires :password, :type => String, :desc => "Password"
#             requires :confirmpassword, :type => String, :desc => "Password"
#           end
#           post 'signup' do
#             user = User.new(
#               name: params[:name],
#               username:  params[:username],
#               email:      params[:email],
#               password:   params[:password],
#               confirmpassword:   params[:password],
#             )
