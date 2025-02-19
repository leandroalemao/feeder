require 'test_helper'
require_relative '../support/normalizer_test_helper'

class XkcdNormalizerTest < Minitest::Test
  include NormalizerTestHelper

  def subject
    XkcdNormalizer
  end

  def processor
    RssProcessor
  end

  def sample_data_file
    'feed_xkcd.xml'
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
    uid: 'http://xkcd.com/1732/',
    link: 'http://xkcd.com/1732/',
    published_at: Time.parse('2016-09-12 04:00:00 UTC'),
    text: 'Earth Temperature Timeline - http://xkcd.com/1732/',
    attachments: ['http://imgs.xkcd.com/comics/earth_temperature_timeline.png'],
    comments: ['[After setting your car on fire] Listen, your car\'s temperature has changed before.'],
    validation_errors: []
  }.freeze
  # rubocop:enable Metric/LineLength

  def test_normalized_sample
    assert_equal(FIRST_SAMPLE, normalized.first.value!)
  end
end
