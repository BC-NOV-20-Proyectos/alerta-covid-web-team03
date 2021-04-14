#Serializer for institution
class InstitutionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description
end
