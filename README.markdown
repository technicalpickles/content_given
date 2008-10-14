# ContentGiven

Adds a very small helper to your views for determining if `content_for :foo` was used.

This means you don't always have to render the containing markup around `yield :foo`.

## Example


### Before content\_given:

    <!-- In app/views/layouts/application.html.erb %>
    <html>
      <body>
        <div id="sidebar">
          <%= yield :sidebar
        </div>
        
        <div id="content">
          <%= yield %>
        </div>
      </body>
    </html>
    
`<div id="sidebar">` is always rendered.
    
### After content\_given:

    <!-- In app/views/layouts/application.html.erb %>
    <html>
      <body>
        <% if content_given? :sidebar %>
          <div id="sidebar">
            <%= yield :sidebar
          </div>
        <% end %>
        
        <div id="content">
          <%= yield %>
        </div>
      </body>
    </html>
    
`<div id="sidebar">` is only rendered if you used `content_for :sidebar`

## Copyright

Copyright (c) 2008 Josh Nichols, released under the MIT license
