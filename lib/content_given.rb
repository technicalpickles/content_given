require 'rubygems'
require 'active_support' # for blank?

# ContentGiven is a just a view helper for determining if +content_for+ was used in a view.
module ContentGiven
  # Was +content_for+ called for +name+?
  # 
  # Use it like:
  #
  #    <!-- In app/views/layouts/application.html.erb %>
  #    <html>
  #      <body>
  #        <% if content_given? :sidebar %>
  #          <div id="sidebar">
  #            <%= yield :sidebar
  #          </div>
  #        <% end %>
  #        
  #        <div id="content">
  #          <%= yield %>
  #        </div>
  #      </body>
  #    </html>
  def content_given?(name)
    content = instance_variable_get("@content_for_#{name}")
    ! content.blank?
  end
end