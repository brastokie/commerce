
class LineItemsController < ApplicationController
    skip_before_filter :authorize, only: :create


  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html
      format.json { render json: @line_items }
      format.xml { render xml: @line_items }
    end
  end


  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @line_item }
    end
  end


  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html
      format.json { render json: @line_item }
    end
  end



  def edit
    @line_item = LineItem.find(params[:id])
  end


  def create
    @cart = current_cart
    if params[:line_item]

      params[:line_item][:order_id] = params[:order_id]
      @line_item = LineItem.new(params[:line_item])
    else

      product = Product.find(params[:product_id])
      @line_item = @cart.add_product(product.id)
    end

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to store_url }
        format.js   { @current_item = @line_item }
        format.json { render json: @line_item,
          status: :created, location: @line_item }
      else
        format.html { render action: "new" }
        format.json { render json: @line_item.errors,
          status: :unprocessable_entity }
      end
    end
  end


  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to line_items_url }
      format.json { head :no_content }
    end
  end
end
