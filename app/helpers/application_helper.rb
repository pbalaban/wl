module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Wl"      
    end
  end
end
