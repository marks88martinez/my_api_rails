class ItemsController < ApplicationController
    before_action :set_item, only: [:show, :update, :destroy]
  
    # GET /items
    def index
      @items = Item.all
      render json: @items
    end
  
    # GET /items/:id
    def show
      render json: @item
    end
  
    # POST /items
    def create
      @item = Item.new(item_params)
      if @item.save
        render json: @item, status: :created
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    end
  
    # PUT /items/:id
    def update
      if @item.update(item_params)
        render json: @item
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /items/:id
    def destroy
      @item.destroy
    end
  
    private
  
    def set_item
      @item = Item.find(params[:id])
    end
  
    def item_params
      params.require(:item).permit(:name, :description)
    end
  end
  