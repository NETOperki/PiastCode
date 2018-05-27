class PostsController < ApplicationController
  def create
    event = Event.find_by(id: params[:event_id])
    @post = event.posts.new posts_params
    @post.user = current_user
    if @post.save then
      flash[:positive] = "Komentarz został dodany do wydarzenia."
    else
      flash[:negative] = "Nie można było dodać komentarza do systemu. Spróbuj ponownie."
    end
    redirect_to event
  end

  private
    def posts_params
      params.require(:post).permit(:content)
    end
end
