class Api::MedicationsController < ApplicationController

	before_action :set_medication, only: [:show, :update, :destroy]

	def index
		medications = Medication.all
		render json: medications, status: 200
	end

	def create
		@medication = Medication.new(medication_params)
		if @medication.save
			render json: @medication, status: 201
		else
			render_errors_in_json
		end		
	end


	private

	def medication_params
		params.require(:medication).permit(:name, :generic_name, :uses, :side_effects, :precautions)
	end

	def set_medication
		@medication = Medication.find_by(id: params[:id])
		if !@medication
			render json: {
				errors: {
					messages: { medication: "can't be found"}
				}
			}, status: 404
		end
	end

	def render_errors_in_json
		render json: { 
			errors: { 
				messages: @medication.errors.messages 
			}
		}, status: 422
	end
end