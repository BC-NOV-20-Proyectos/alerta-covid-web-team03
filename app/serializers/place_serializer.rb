#Serializer for place
class PlaceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description, :qr_code
end
