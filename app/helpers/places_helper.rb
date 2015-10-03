module PlacesHelper
  def boolean_to_icons(value)
    if value
      content_tag(:i, '', class: "fa fa-check text-success")
    else
      content_tag(:i, '', class: "fa fa-times text-danger")
    end
  end

  def boolean_to_spanish(value)
    if value
      Si
    else
      No
    end
  end
end
