class RecommendationsController < ApplicationController
	before_filter :load_current_narrative, only: [:new, :create]
	before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
	before_filter :correct_author,   only: [:edit, :update, :destroy]
	before_filter :already_recommended, only: [:new, :create]

	def show
		@recommendation = Recommendation.find(params[:id])
	end

	def new
		@recommendation = Recommendation.new
	end

	def edit
    	@recommendation = Recommendation.find(params[:id])
 	end

  def show
  end

	def create
		@recommendation = @narrative.recommendations.build(params[:recommendation])
  	@recommendation.user = current_user
  	if @recommendation.save
  		redirect_to @narrative, notice: 'You successfully recommended this narrative.'
  	elsif !narrative_contains?
      render action: "new", notice: 'Snippet must be contained by content.'
    else
		  render action: "new", status: :unprocessable_entity
    end
	end

	def update
		@recommendation = Recommendation.find(params[:id])
		@narrative = @recommendation.narrative
		if @recommendation.update_attributes(params[:recommendation])
		  redirect_to @narrative, notice: 'Updated your recommendation.'
    elsif !narrative_contains?
      render action: "edit", notice: 'Snippet must be contained by content.'
    else
		  render action: "edit", status: :unprocessable_entity
    end
	end

	def destroy
		@recommendation = Recommendation.find(params[:id])
		@narrative = @recommendation.narrative
		@recommendation.destroy
		redirect_to @narrative, notice: 'Removed your recommendation.'
	end

	private
    def correct_author
  		@recommendation = Recommendation.find(params[:id])
  		@user = User.find(@recommendation.user_id)
  		redirect_to @narrative unless current_user?(@user)
  	end

  	def already_recommended
    	if current_user.recommendations.include?(@narrative)
      	redirect_to @narrative, notice: 'You already recommended this.'
    	end
    end

    def load_current_narrative
    		@narrative = Narrative.find(params[:narrative_id])
  	end

  	def narrative_contains?
  		load_current_narrative
			@narrative.content.contains?(params[:snippet])
		end
end