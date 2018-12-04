class Api::V1::VotesController < ApplicationController
  def create
    @vote = Vote.create(vote_params)
    @vote.user = current_user
    if @vote.save
      render json: { votes: VoteSerializer.new(@vote) }, status: :created
    else
      render json: { error: 'failed to create vote' }, status: :not_acceptable
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:project_id)
  end
end
