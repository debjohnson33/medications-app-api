class Api::MedicationsController < ApplicationController

	before_action :set_medication, only: [:show, :update]

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

	def show
		if @medication
			render json: @medication, status: 200
		end
	end

	def update
		if @medication.update(medication_params)
			render json: @medication, status: 201
		else
			render_errors_in_json
		end	
	end

	def destroy
		medications = Medication.all
		if @medication.destroy
			render json: medications, status: 200
		else
			render_errors_in_json, status: 400
		end
	end

	private

	def medication_params
		params.require(:medication).permit(:name, :generic_name, :uses, :side_effects, :precautions, :likes)
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