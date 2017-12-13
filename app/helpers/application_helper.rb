module ApplicationHelper

  def flash_messsages(flash)
    content_tag(:div, flash[:notice], :id => "notice") if flash[:notice]
    # can add notices and errors, too; if they want them
  end

end
