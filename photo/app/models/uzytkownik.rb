class Uzytkownik < ActiveRecord::Base
  acts_as_authentic
  ajaxful_rater
end
