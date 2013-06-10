# encoding: utf-8

require "dynamoid/paperclip/version"

begin
  require 'paperclip'
rescue LoadError
  puts "Dynamoid::Paperclip requires that you install the Paperclip gem."
  exit
end

begin
  require 'dynamoid'
rescue LoadError
  puts "Dynamoid::Paperclip requires that you install the Dynamoid gem."
  exit
end

##
# The id of dynamoid is not integer, so correct the id_partition.
Paperclip.interpolates :id_partition do |attachment, style|
  attachment.instance.id.to_s.scan(/.{4}/).join("/")
end

module Dynamoid
  module Paperclip

    ##
    # Extends the model with the defined Class methods
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      ##
      # Adds Dynamoid::Paperclip's "#has_dynamoid_attached_file" class method to the model
      # which includes Paperclip and Paperclip::Glue in to the model. Additionally
      # it'll also add the required fields for Paperclip since DynamoDB is schemaless and doesn't
      # have migrations.
      def has_dynamoid_attached_file(field, options = {})

        ##
        # Include Paperclip and Paperclip::Glue for compatibility
        unless self.ancestors.include?(::Paperclip)
          include ::Paperclip
          include ::Paperclip::Glue
        end

        ##
        # Invoke Paperclip's #has_attached_file method and passes in the
        # arguments specified by the user that invoked Dynamoid::Paperclip#has_dynamoid_attached_file
        has_attached_file(field, options)

        ##
        # Define the necessary collection fields in Dynamoid for Paperclip
        field(:"#{field}_file_name")
        field(:"#{field}_content_type")
        field(:"#{field}_file_size", :integer)
        field(:"#{field}_updated_at", :datetime)
      end
    end

  end
end

