class MedicationSerializer < ActiveModel::Serializer
  attributes :id, :generic_name, :uses, :side_effects, :precautions
  has_many :reviews
end
