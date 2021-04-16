#PlaceHistory Serializer
class PlaceHistorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :date
  
end
