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

  def destroy
    post = Post.find_by(id: params[:id])
    if post.user == current_user then
      post.destroy
      flash[:positive] = "Komentarz został usunięty."
    else
      flash[:negative] = "Nie można było usunąć komentarza z systemu. Spróbuj ponownie."
    end
    redirect_to post.event
  end

  private
    def posts_params
      params.require(:post).permit(:content)
    end
end
