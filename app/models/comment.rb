class Comment < ActiveRecord::Base
  belongs_to :user, :order=>'nombre'
end
