class PagesController < ApplicationController
  def taskboard
   @stories = Story.all
  end

  def new_keyword
  end

  def new_story_title
  end

  private
  def story_keyword_params
    params.require(:story).permit(:keyword)
  end

end
