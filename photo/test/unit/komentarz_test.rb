require 'test_helper'

class KomentarzTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Komentarz.new.valid?
  end
end
