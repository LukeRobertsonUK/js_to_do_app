class ToDoItemsController < ApplicationController
  # GET /to_do_items
  # GET /to_do_items.json
  def index
    @to_do_items = ToDoItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @to_do_items }
    end
  end

  def move_in_list
    @to_do_item = ToDoItem.find(params[:id])
    case params[:direction]
    when 'up'
      @to_do_item.move_higher
    when 'down'
      @to_do_item.move_lower
    end
    redirect_to @to_do_item.to_do_list
  end

  def update_position

    @to_do_item = ToDoItem.find(params[:id])
    @to_do_item.insert_at((params[:position]).to_i + 1 )

    respond_to do |format|
      format.js { render nothing: true }
    end
  end


  def update_list_and_position
    @to_do_item = ToDoItem.find(params[:id])
    @to_do_item.remove_from_list
    @new_list_id = params[:new_list].to_i
    @position = params[:position].to_i + 1
    @to_do_item.update_attributes(to_do_list_id: @new_list_id)
    @to_do_item.insert_at((params[:position]).to_i + 1 )

     respond_to do |format|
      format.js { render nothing: true }
    end
  end




  # GET /to_do_items/1
  # GET /to_do_items/1.json
  def show
    @to_do_item = ToDoItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @to_do_item }
    end
  end

  # GET /to_do_items/new
  # GET /to_do_items/new.json
  def new
    @to_do_item = ToDoItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @to_do_item }
    end
  end

  # GET /to_do_items/1/edit
  def edit
    @to_do_item = ToDoItem.find(params[:id])
  end

  # POST /to_do_items
  # POST /to_do_items.json
  def create
    @to_do_item = ToDoItem.new(params[:to_do_item])

    respond_to do |format|
      if @to_do_item.save
        format.html { redirect_to @to_do_item, notice: 'To do item was successfully created.' }
        format.json { render json: @to_do_item, status: :created, location: @to_do_item }
      else
        format.html { render action: "new" }
        format.json { render json: @to_do_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /to_do_items/1
  # PUT /to_do_items/1.json
  def update
    @to_do_item = ToDoItem.find(params[:id])
    unless params[:to_do_item]["to_do_list_id"].to_i == @to_do_item.to_do_list_id
      @to_do_item.remove_from_list
    end
    respond_to do |format|
        if @to_do_item.update_attributes(params[:to_do_item])
          format.html { redirect_to @to_do_item, notice: 'To do item was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @to_do_item.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /to_do_items/1
  # DELETE /to_do_items/1.json
  def destroy
    @to_do_item = ToDoItem.find(params[:id])
    @to_do_item.destroy

    respond_to do |format|
      format.html { redirect_to to_do_items_url }
      format.json { head :no_content }
    end
  end
end
