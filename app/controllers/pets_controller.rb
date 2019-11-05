class PetsController < ApplicationController
  before_action :set_pet, only: [:show,:edit,:update,:destroy]
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    #get stuff from params
    #create new instance
    @pet = Pet.new(pet_params)
    if @pet.save
     redirect_to pets_path
    else
     render :new
    end
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name,:address,:species,:date_found)

  end
end
