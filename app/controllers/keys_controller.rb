class KeysController < ApplicationController
  before_action :set_key, only: %i[ show update destroy ]

  # GET /keys
  def index
    @keys = Key.all

    render json: @keys
  end

  # GET /keys/:key
  # def show
  #   if @key
  #     render json: @key
  #   else
  #     render json: { error: 'Key not found' }, status: :not_found
  #   end
  # end
  def show
    render json: @key || { error: 'Key not found' }, status: (@key ? :ok : :not_found)
  end

  # POST /keys
  def create
    if Key.exists?(key: key_params[:key])
      render json: { error: 'Key already exists' }, status: :conflict
    else
      @key = Key.new(key_params)
      if @key.save
        render json: @key, status: :created, location: key_url(@key)
      else
        render json: @key.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /keys/:key
  def update
    new_value = params[:value] || key_params[:value]
    if @key&.update(value: new_value)
      render json: @key
    else
      render json: @key&.errors || { error: 'Key not found' }, status: (@key ? :unprocessable_entity : :not_found)
    end
  end

  # PATCH /keys/:key/:value
  def update
    if @key
      if @key.update(value: params[:value])
        render json: @key
      else
        render json: @key.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Key not found' }, status: :not_found
    end
  end

  # DELETE /keys/:key
  def destroy
    if @key
      @key.destroy
      head :no_content
    else
      render json: { error: 'Key not found' }, status: :not_found
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_key
      @key = Key.find_by(key: params[:key])
    end

    # Only allow a list of trusted parameters through.
    def key_params
      params.permit(:key, :value)
    end
    
end
