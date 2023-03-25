# frozen_string_literal: true

RSpec.describe Renametv::FileName do
  describe '#file_of_interest?' do
    subject { described_class.new(file_name_str).file_of_interest? }

    cases = {
      's01e02' => true,
      'S01E02' => true,
      'Test.Show.S01E02.Name.Of.Episode.mkv' => true,
      'Test Show S01E02 Name Of Episode.mkv' => true,

      's01_e01' => false,
      'S01_E01' => false,
      's01 e01' => false,
      'S01 E01' => false,
      'Test.Show.Without.Season.And.Episode' => false,
      'Test Show Without Season And Episode' => false
    }

    cases.each do |file_name_str, expected_value|
      context "for `#{file_name_str}`" do
        let(:file_name_str) { file_name_str }

        it "is #{expected_value}" do
          expect(subject).to be expected_value
        end
      end
    end
  end

  describe '#new_name' do
    subject { described_class.new(file_name_str).new_name }

    cases = {
      's01e02' => 's01e02',
      'S01E02' => 's01e02',
      'Test.Show.S01E02.Name.Of.Episode.mkv' => 'test_show_s01e02.mkv',
      'Test Show S01E02 Name Of Episode.mkv' => 'test_show_s01e02.mkv'
    }

    cases.each do |file_name_str, expected_value|
      context "for `#{file_name_str}`" do
        let(:file_name_str) { file_name_str }

        it "is #{expected_value}" do
          expect(subject).to eq expected_value
        end
      end
    end
  end
end
