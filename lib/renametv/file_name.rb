# frozen_string_literal: true

module Renametv
  class FileName
    REGEX = /s(\d+)e(\d+)/i.freeze

    attr_reader :original_name

    def initialize(original_name)
      @original_name = original_name
    end

    def new_name
      @new_name ||= \
        match
        .pre_match
        .gsub('.', '_')
        .gsub(' ', '_')
        .concat(season_and_episode_str)
        .concat(extension)
        .downcase
    end

    def file_of_interest?
      !!match
    end

    private

    def basename
      @basename ||= File.basename(@original_name, '.*')
    end

    def extension
      @extension ||= File.extname(@original_name)
    end

    def match
      @match ||= basename.match(REGEX)
    end

    def season_and_episode
      return unless match

      @season_and_episode ||= {
        season: match.values_at(1).first,
        episode: match.values_at(2).first
      }
    end

    # s01e02
    def season_and_episode_str
      @season_and_episode_str ||= format('s%<season>se%<episode>s', season_and_episode)
    end
  end
end
