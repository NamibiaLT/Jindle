module ApplicationHelper
  def title(*array)
    unless array.empty?
      content_for :title do
        (array << 'Jindle')
      end
    end
  end
end
