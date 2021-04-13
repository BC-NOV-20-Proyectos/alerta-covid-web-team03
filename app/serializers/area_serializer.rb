#Serializer for Area.
class AreaSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description
end
