class MedicationSerializer < ActiveModel::Serializer
  attributes :id, :name, :generic_name, :uses, :side_effects, :precautions, :likes
  #has_many :reviews
end
