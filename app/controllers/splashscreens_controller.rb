class SplashscreensController < ApplicationController
     before_action :redirect_authenticated_user, if: :user_signed_in?

    def index;end

    private

     def redirect_authenticated_user
    redirect_to authenticated_root_path
     end
end
