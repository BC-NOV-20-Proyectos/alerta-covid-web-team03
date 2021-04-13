#Serializer for symptom
class SymptomSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description
end
