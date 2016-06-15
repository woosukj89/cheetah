class StoriesController < ApplicationController
  def update
    @stories = Story.all
    @story = Story.find(params[:id])
    if @story.update_attributes(story_params)
       respond_to do |format|
	  format.js {}
       end
    end
  end

  private
    def story_params
      params.require(:story).permit(:project, :sprint, :title, :story_points, :priority, :keyword, :acceptance_criteria, :description, :color, :order)
    end

end
