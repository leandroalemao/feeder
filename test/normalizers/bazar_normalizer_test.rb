require 'test_helper'
require_relative '../support/normalizer_test_helper'

class BazarNormalizerTest < Minitest::Test
  include NormalizerTestHelper

  def subject
    BazarNormalizer
  end

  def processor
    FeedjiraProcessor
  end

  def sample_data_file
    'feed_bazar.xml'
  end

  def test_normalization
    assert(normalized.any?)
    assert(normalized.all?(&:success?))
  end

  # rubocop:disable Metric/LineLength
  FIRST_SAMPLE = {
    uid: 'https://meduza.io/episodes/2019/08/21/glava-v-kotoroy-russkie-nikak-ne-rasstanutsya-s-shapkami-ushankami-a-donna-tartt-materitsya',
    link: 'https://meduza.io/episodes/2019/08/21/glava-v-kotoroy-russkie-nikak-ne-rasstanutsya-s-shapkami-ushankami-a-donna-tartt-materitsya',
    published_at: DateTime.parse('2019-08-21 12:02:53 UTC'),
    text: "Глава, в которой русские никак не расстанутся с шапками-ушанками, а Донна Тартт матерится - https://meduza.io/episodes/2019/08/21/glava-v-kotoroy-russkie-nikak-ne-rasstanutsya-s-shapkami-ushankami-a-donna-tartt-materitsya\n\nЗапись: http://meduza.io/audio/1566413787/episodes/2019/08/21/glava-v-kotoroy-russkie-nikak-ne-rasstanutsya-s-shapkami-ushankami-a-donna-tartt-materitsya.mp3 (38:29)",
    attachments: [],
    comments: ['В восьмом выпуске летнего «Книжного базара» литературный обозреватель «Медузы» Галина Юзефович и кинокритик Антон Долин обсуждают, как западные режиссеры и писатели показывают Россию и русских. Можно ли избежать кокошников, ушанок и тостов «на здоровье»?'],
    validation_errors: []
  }.freeze
  # rubocop:enable Metric/LineLength

  def test_normalized_sample
    assert_equal(FIRST_SAMPLE, normalized.first.value!)
  end
end
