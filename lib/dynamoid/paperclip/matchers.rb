require 'dynamoid/paperclip/matchers/have_dynamoid_attached_file_matcher'

module Dynamoid
  module Paperclip
    module Shoulda
      # Provides RSpec-compatible & Test::Unit-compatible matchers for testing Dynamoid::Paperclip attachments.
      #
      # *RSpec*
      #
      # In spec_helper.rb, you'll need to require the matchers:
      #
      #   require "dynamoid/paperclip/matchers"
      #
      # And _include_ the module:
      #
      #   RSpec.configure do |config|
      #     config.include Dynamoid::Paperclip::Shoulda::Matchers
      #   end
      #
      # Example:
      #   describe User do
      #     it { should have_dynamoid_attached_file(:avatar) }
      #   end
      #
      # *TestUnit*
      #
      # In test_helper.rb, you'll need to require the matchers as well:
      #
      #   require "dynamoid/paperclip/matchers"
      #
      # And _extend_ the module:
      #
      #   class ActiveSupport::TestCase
      #     extend Dynamoid::Paperclip::Shoulda::Matchers
      #
      #     #...other initializers...#
      #   end
      #
      # Example:
      #   require 'test_helper'
      #
      #   class UserTest < ActiveSupport::TestCase
      #     should have_dynamoid_attached_file(:avatar)
      #   end
      #
      module Matchers
      end
    end
  end
end
