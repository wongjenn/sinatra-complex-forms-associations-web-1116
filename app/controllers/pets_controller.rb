class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    erb :'/pets/new'
  end

  post '/pets' do
    @pet = Pet.create(params[:pet])
    if !params[:owner][:name].empty?
      @owner = Owner.create(name: params[:owner][:name])
      @pet.owner_id = @owner.id
    end
      @pet.save
    # binding.pry
    redirect to "pets/#{@pet.id}"
  end

  get "/pets/:id/edit" do
    @pet = Pet.find(params[:id])
    # binding.pry
    erb :'/pets/edit'
  end

  get "/pets/:id" do
    @pet = Pet.find(params[:id])
    # binding.pry
    erb :"/pets/show"
  end

  post "/pets/:id" do
    # binding.pry
    @pet = Pet.find(params[:id])
    @pet.update(name: params[:pet][:name], owner_id: params[:pet][:owner_ids].last)
    if !params[:owner][:name].empty?
      @owner = Owner.create(name: params[:owner][:name])
      @pet.owner_id = @owner.id
    end
    @pet.save
    # binding.pry
    redirect to "pets/#{@pet.id}"
  end


end
