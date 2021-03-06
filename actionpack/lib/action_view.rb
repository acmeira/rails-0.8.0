#--
# Copyright (c) 2004 David Heinemeier Hansson
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

begin
  require 'rubygems'	
  require 'builder'
rescue LoadError
  # RubyGems is not available, use included Builder
  $:.unshift(File.dirname(__FILE__) + "/action_view/vendor")
  require 'action_view/vendor/builder'
ensure
  # Temporary patch until it's in Builder 1.2.2
  class BlankSlate
    class << self
      def hide(name)
        undef_method name if instance_methods.include?(name) and name !~ /^(__|instance_eval)/
      end
    end
  end
end

require 'action_view/base'
require 'action_view/partials'

ActionView::Base.class_eval do
  include ActionView::Partials
end

ActionView::Base.load_helpers(File.dirname(__FILE__) + "/action_view/helpers/")