require 'test_helper'
require_relative '../support/normalizer_test_helper'

class SchneierNormalizerTest < Minitest::Test
  include NormalizerTestHelper

  def subject
    SchneierNormalizer
  end

  def processor
    AtomProcessor
  end

  def sample_data_file
    'feed_schneier.xml'
  end

  def test_normalization
    assert(normalized.any?)
    assert(normalized.all?(&:success?))
  end

  # rubocop:disable Metric/LineLength
  FIRST_SAMPLE = {
    uid: 'https://www.schneier.com/blog/archives/2019/08/google_finds_20.html',
    link: 'https://www.schneier.com/blog/archives/2019/08/google_finds_20.html',
    published_at: DateTime.parse('2019-08-21 11:46:38 UTC'),
    text: 'Google Finds 20-Year-Old Microsoft Windows Vulnerability - https://www.schneier.com/blog/archives/2019/08/google_finds_20.html',
    attachments: [],
    comments: ["There's no indication that this vulnerability was ever used in the wild, but the code it was discovered in -- Microsoft's Text Services Framework -- has been around since Windows XP."],
    validation_errors: []
  }.freeze
  # rubocop:enable Metric/LineLength

  def test_normalized_sample
    assert_equal(FIRST_SAMPLE, normalized.first.value!)
  end
end
