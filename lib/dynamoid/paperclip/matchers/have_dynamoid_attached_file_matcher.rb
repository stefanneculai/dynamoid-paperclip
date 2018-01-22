module Dynamoid
  module Paperclip
    module Shoulda
      module Matchers
        def have_dynamoid_attached_file(name)
          HaveDynamoidAttachedFileMatcher.new(name)
        end

        class HaveDynamoidAttachedFileMatcher < ::Paperclip::Shoulda::Matchers::HaveAttachedFileMatcher
          def has_column?
            column_names = @subject.attributes.keys.map(&:to_s)
            column_names.include?("#{@attachment_name}_file_name")
          end
        end
      end
    end
  end
end
