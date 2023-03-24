# frozen_string_literal: true

require_relative 'renametv/version'
require_relative 'renametv/file_name'
require_relative 'renametv/renamer'

module Renametv
  def self.call(options)
    Renamer.new(dry_run: options[:dry_run]).rename_all!
  end
end
