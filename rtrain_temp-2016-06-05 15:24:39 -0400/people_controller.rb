class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

	def index
	  @people = Person.all
	end

	def show
	  @people = Person.all
	end

	def new
	    @person = Person.new
	end

	def edit
	    @person = Person.find(params[:id])
	end

	def create
	   @people = Person.all
	   @person = Person.create(person_params)
	end

	def update
	    @people = Person.all
	    @person = Person.find(params[:id])    
	    @person.update_attributes(person_params)
	end

	def delete
	    @person = Person.find(params[:id])
	end

	def destroy
	   @people = Person.all
	   @person = Person.find(params[:id])
	   @person.destroy
	end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :address, :phone, :email_address, :about)
    end
end	