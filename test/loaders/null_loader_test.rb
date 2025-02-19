require 'test_helper'

class NullLoaderTest < Minitest::Test
  def subject
    NullLoader
  end

  def sample_feed
    build(:feed)
  end

  def test_always_succeed
    result = subject.call(sample_feed)
    assert(result.success?)
  end

  def test_returns_nothing
    result = subject.call(sample_feed)
    assert_nil(result.value!)
  end
end
