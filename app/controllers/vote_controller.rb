# frozen_string_literal: true

class VoteController < ApplicationController
  before_action :authenticate_user!

  def up
    vote = Vote.new(kind: :up_voted)
    vote.assign_attributes(vote_params)

    if vote.save
      flash[:success] = 'You up-voted a video'
    else
      flash[:error] = vote.errors.full_messages
    end

    redirect_to root_url
  end

  def down
    vote = Vote.new(kind: :down_voted)
    vote.assign_attributes(vote_params)

    if vote.save
      flash[:success] = 'You down-voted a video'
    else
      flash[:error] = vote.errors.full_messages
    end

    redirect_to root_url
  end

  def unvote
    vote = Vote.find_by(user_id: vote_params[:user_id], video_id: vote_params[:video_id])

    if vote&.destroy
      flash[:success] = 'You un-voted a video!!!'
    else
      flash[:error] = 'You have not voted this video yet!!!'
    end

    redirect_to root_url
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :video_id)
  end
end
