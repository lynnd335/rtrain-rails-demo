class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      flash[:notice] = 'Person created'
      redirect_to @person
    else
      flash[:alert] = 'Person not created'
      render :new
    end
  end

  def update
    if @person.update_attributes(person_params)
      flash[:notice] = 'Person updated'
      redirect_to @person
    else
      flash[:alert] = 'Person not updated'
      render :edit
    end      
  end

  def destroy
    @person.destroy
    flash[:notice] = 'Person deleted'
    redirect_to @person
  end

  private

    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:description, :deadline)
    end
end