module ApplicationHelper
  def auth_token
    <<-html.html_safe
      <input type='hidden' name='authenticity_token' value="#{form_authenticity_token}">
    html
  end
end
