require 'content_given'

ActionView::Base.class_eval do
  include ContentGiven
end