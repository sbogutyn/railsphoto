require 'test_helper'

class ZdjecieTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Zdjecie.new.valid?
  end
end
