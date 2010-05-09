require 'test_helper'

class KategoriaTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Kategoria.new.valid?
  end
end
