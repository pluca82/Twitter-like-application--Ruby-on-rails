class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user , only: :delete

    def create
        @micropost = current_user.microposts.build(micropost_params)
        @micropost.image.attach(params[:micropost][:image])
        if @micropost.save
            flash[:succes] = "Micropost Created Succesfully"
            redirect_to root_url
        else 
            @feed_items = current_user.feed.paginate(page: params[:page])
            render 'static_pages/home'
        end 
    end 

    def destroy
        @micropost.destroy 
        flash[:succes] = "Micropost succesfully destroy"
        redirect_to root_url || request.referrer
    end 

    def micropost_params
        params.require(:micropost).permit(:content,:image)
    end 

    def correct_user
        @micropost = current_user.micropost.find_by(id: params[:id])
        redirect_to root_url if @micropost.nil?
    end 
end
