class MenuitemsController < ApplicationController
  before_action :set_menuitem, only: %i[ show edit update destroy ]

  # GET /menuitems or /menuitems.json
  def index
    @menuitems = Menuitem.all
  end

  # GET /menuitems/1 or /menuitems/1.json
  def show
  end

  # GET /menuitems/new
  def new
    @menuitem = Menuitem.new
  end

  # GET /menuitems/1/edit
  def edit
  end

  # POST /menuitems or /menuitems.json
  def create
    @menuitem = Menuitem.new(menuitem_params)

    respond_to do |format|
      if @menuitem.save
        format.html { redirect_to menuitems_path, notice: "Menuitem was successfully created." }
        format.json { render :show, status: :created, location: @menuitem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menuitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menuitems/1 or /menuitems/1.json
  def update
    respond_to do |format|
      if @menuitem.update(menuitem_params)
        format.html { redirect_to menuitems_path, notice: "Menuitem was successfully updated." }
        format.json { render :show, status: :ok, location: @menuitem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menuitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menuitems/1 or /menuitems/1.json
  def destroy
    @menuitem.destroy

    respond_to do |format|
      format.html { redirect_to menuitems_url, notice: "Menuitem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def move
    @menuitem = Menuitem.find(params[:id])
    if params[:ancestry] == 'undefined'
      @menuitem.update_columns(ancestry: nil)
    else
      @menuitem.update_columns(ancestry: params[:ancestry])
    end

    @menuitem.siblings.order(:position).each.with_index(1) do |item, index|
      item.update_column(:position, index)
    end

    @menuitem.insert_at(params[:position].to_i)
    head :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_menuitem
    @menuitem = Menuitem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def menuitem_params
    params.require(:menuitem).permit(:name, :ancestry).transform_values { |value| value == '' ? nil : value }
  end
end
