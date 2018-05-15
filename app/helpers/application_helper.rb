module ApplicationHelper

  def item_active?(path, parse=false)
    if (not parse and request.path == path) or (parse and request.path.include?(path)) then
      'item active'
    else
      'item'
    end
  end

end
