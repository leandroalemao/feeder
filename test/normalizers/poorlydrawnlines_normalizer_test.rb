require 'test_helper'
require_relative '../support/normalizer_test_helper'

class PoorlydrawnlinesNormalizerTest < Minitest::Test
  include NormalizerTestHelper

  def subject
    PoorlydrawnlinesNormalizer
  end

  def processor
    FeedjiraProcessor
  end

  def sample_data_file
    'feed_poorlydrawnlines.xml'
  end

  def test_have_sample_data
    assert(processed.present?)
    assert(processed.length.positive?)
  end

  def test_normalization
    assert(normalized.any?)
    assert(normalized.all?(&:success?))
  end

  # rubocop:disable Metric/LineLength
  FIRST_SAMPLE = {
    uid: 'http://www.poorlydrawnlines.com/comic/hello/',
    link: 'http://www.poorlydrawnlines.com/comic/hello/',
    published_at: Time.parse('2018-10-22 16:03:51 UTC'),
    text: 'Hello - http://www.poorlydrawnlines.com/comic/hello/',
    attachments: ['http://www.poorlydrawnlines.com/wp-content/uploads/2018/10/hello.png'],
    comments: [],
    validation_errors: []
  }.freeze
  # rubocop:enable Metric/LineLength

  def test_normalized_sample
    assert_equal(FIRST_SAMPLE, normalized.first.value!)
  end
end
