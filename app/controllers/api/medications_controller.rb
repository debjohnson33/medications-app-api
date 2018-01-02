class Api::MedicationsController < ApplicationController

	def index
		medications = Medication.all
		render json: medications, status: 200
	end
end