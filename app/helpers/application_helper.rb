module ApplicationHelper
  def kithub_title
    if( @title )
      @title + " - kitHub"
    else
      "kitHub"
    end
  end
end
