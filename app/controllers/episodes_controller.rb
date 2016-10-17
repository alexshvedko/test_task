class EpisodesController < ApplicationController
  before_action :set_episode, except: :index

  def index
    serie = Serie.find_by(id: params[:show_id])
    if serie
      render_success(serie.episodes, :ok)
    else
      render_errors('episodes not found', :not_found)
    end
  end

  def show
    render_success(@episode, :ok)
  end

  def like
    @episode.likes << @current_user.id
    @episode.likes.uniq!
    @episode.check_dislikes(@current_user.id)
    @episode.save!
    render_success(@episode, :accepted)
  end

  def dislike
    @episode.dislikes << @current_user.id
    @episode.dislikes.uniq!
    @episode.check_likes(@current_user.id)
    @episode.save!
    render_success(@episode, :accepted)
  end

  def delete_like
    @episode.check_likes(@current_user.id)
    render_success(@episode, :accepted, serializer: LikeSerializer)
  end

  def delete_dislike
    @episode.check_dislikes(@current_user.id)
    render_success(@episode, :accepted, serializer: LikeSerializer)
  end

  private

  def set_episode
    @episode = Episode.find(params[:id])
  end
end
