class InterventionsController < ApplicationController
    before_action :authenticate_user!, :only => [:index]
#   def show
#     redirect_to main_app.root_path unless current_user && current_user.admin? || current_user.employee?
#     # redirect_to :back #"#home"#:authenticate_user!, :only => [:show]
#     # puts(signed_in?)
#     # puts(@user)
#   end
end
