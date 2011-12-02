class List
  include Mongoid::Document
  field :name, :type => String
  attr_accessor :name
  validates_presence_of :name
end

