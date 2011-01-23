module ApplicationHelper
  def title
    base_title = "Micropost - RoR"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
      image_tag("rubyonrails.jpg", :width=>"300",:height=>"130",:class => "round")
  end
    
end
