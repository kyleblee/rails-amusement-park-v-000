module AttractionsHelper

  def submit_text(attraction)
    if attraction.id
      "Update Attraction"
    else
      "Create Attraction"
    end
  end
end
