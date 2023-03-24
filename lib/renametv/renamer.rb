# frozen_string_literal: true

module Renametv
  class Renamer
    def initialize(dry_run: false)
      @dry_run = dry_run
    end

    def rename_all!
      file_names.each do |file_name|
        if file_name.new_name == file_name.original_name
          puts "#{file_name.original_name} is already good."
          next
        end

        if File.exist?(file_name.new_name)
          puts "#{file_name.new_name} already exists in this location."
          next
        end

        if @dry_run
          puts "#{file_name.original_name} -> #{file_name.new_name}"
        else
          File.rename(file_name.original_name, file_name.new_name)
          puts "#{file_name.original_name} -> #{file_name.new_name} RENAMED"
        end
      end
    end

    def file_names
      @file_names ||= Dir['*'].sort.map { |name| FileName.new(name) }.select(&:file_of_interest?)
    end
  end
end
