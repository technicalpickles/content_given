require 'test/unit'

require 'rubygems'
gem 'activesupport'
require 'active_support'
require 'active_support/test_case'
require File.join(File.dirname(__FILE__), '..', 'lib', 'content_given')

# Ideally, this should use ActionView::TestCase, so I can call 'content_for :foo' directly, instead of setting @content_for_foo.
# Unfortunately, at some point, 'html/document' is required, which isn't availble for some reason.
class ContentGivenTest < ActiveSupport::TestCase
  include ContentGiven
  
  def test_nil_given
    assert ! content_given?(:foo)
  end
  
  def test_empty_string_given
    @content_for_foo = ""
    assert ! content_given?(:foo)
  end
  
  def test_real_content_given
    @content_for_foo = 'oh hai there'
    assert content_given?(:foo)
  end
end
