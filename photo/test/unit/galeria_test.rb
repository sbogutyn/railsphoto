require 'test_helper'

class GaleriaTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Galeria.new.valid?
  end
end
