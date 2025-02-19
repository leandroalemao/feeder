require 'test_helper'
require_relative '../support/normalizer_test_helper'

class EsquirePhotosNormalizerTest < Minitest::Test
  include NormalizerTestHelper

  def subject
    EsquirePhotosNormalizer
  end

  def processor
    RssProcessor
  end

  def sample_data_file
    'feed_esquire-photos.xml'.freeze
  end

  def test_have_sample_data
    assert(processed.present?)
    assert(processed.any?)
  end

  def test_normalization
    assert(normalized.any?)
    assert(normalized.all?(&:success?))
  end

  # rubocop:disable Metric/LineLength
  FIRST_SAMPLE = {
    uid: 'https://esquire.ru/escobar-netflix',
    link: 'https://esquire.ru/escobar-netflix',
    published_at: nil,
    text: 'Брат Пабло Эскобара требует с Netflix миллиард долларов - https://esquire.ru/escobar-netflix',
    attachments: ['https://images.esquire.ru/files/cache/images/f7/16/4572a4a1.crop1200x628x0x12-fit705x705.9f0ac3.TASS_23154406.jpg'],
    comments: ['«Если мы не получим деньги, то прикроем их маленькое шоу».'],
    validation_errors: []
  }.freeze
  # rubocop:enable Metric/LineLength

  def test_normalized_sample
    assert_equal(FIRST_SAMPLE, normalized.first.value!)
  end
end
