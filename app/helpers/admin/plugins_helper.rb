module Merb
  module Admin
    module PluginsHelper
      def link_to_author(author)
        if author['homepage']
          link_to(author['name'], author['homepage'])
        elsif author['email']
          link_to(author['name'], "mailto:#{author['email']}")
        else
          author['name']
        end
      end
    end
  end
end