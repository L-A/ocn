module CommentHelper
  def display_none_if(condition)
    puts condition
    ' style="display: none;"' if condition
  end
end

