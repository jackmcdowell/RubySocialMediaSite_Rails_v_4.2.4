class StatusesController < ApplicationController
  # GET /statuses
  # GET /statuses.json

  def index
    @statuses = Status.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @statuses }
    end
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
    @status = Status.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @status }
    end
  end

  # GET /statuses/new
  # GET /statuses/new.json
  def new
    @status = Status.new(params[:status])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @status }
    end
  end

  # GET /statuses/1/edit
  def edit
    @status = Status.find(params[:id])
  end

  # POST /statuses
  # POST /statuses.json
  def create
  @status = Status.new(status_params)
  #   @status = Status.new(status_params[:status].permit(:status, :statuses))
  #   @status = Status.new(params[:status].permit(:status, :statuses))

    respond_to do |format|
      if @status.save
        format.html { redirect_to @status, notice: 'Status was successfully created.' }
        format.json { render json: @status, status: :created, location: @status }
      else
        format.html { render action: "new" }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /statuses/1
  # PUT /statuses/1.json
  def update
    @status = Status.find(params[:id])

    respond_to do |format|
      if @status.update_attributes(params[:status])
        format.html { redirect_to @status, notice: 'Status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @status = Status.find(params[:id])
    @status.destroy

    respond_to do |format|
      format.html { redirect_to statuses_url }
      format.json { head :no_content }
    end
  end
end
  private

    def status_params
      params.require(:status).permit(:user_id, :content)
    end
# class StatusesController < ApplicationController
#   before_action :set_status, only: [:show, :edit, :update, :destroy]

#   # GET /statuses
#   # GET /statuses.json
#   def index
#     @statuses = Status.all
#   end

#   # GET /statuses/1
#   # GET /statuses/1.json
#   def show
#   end

#   # GET /statuses/new
#   def new
#     @status = Status.new
#   end

#   # GET /statuses/1/edit
#   def edit
#   end

#   # POST /statuses
#   # POST /statuses.json
#   def create
#     @status = Status.new(status_params)

#     respond_to do |format|
#       if @status.save
#         format.html { redirect_to @status, notice: 'Status was successfully created.' }
#         format.json { render :show, status: :created, location: @status }
#       else
#         format.html { render :new }
#         format.json { render json: @status.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /statuses/1
#   # PATCH/PUT /statuses/1.json
#   def update
#     respond_to do |format|
#       if @status.update(status_params)
#         format.html { redirect_to @status, notice: 'Status was successfully updated.' }
#         format.json { render :show, status: :ok, location: @status }
#       else
#         format.html { render :edit }
#         format.json { render json: @status.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /statuses/1
#   # DELETE /statuses/1.json
#   def destroy
#     @status.destroy
#     respond_to do |format|
#       format.html { redirect_to statuses_url, notice: 'Status was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_status
#       @status = Status.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def status_params
#       params.require(:status).permit(:name, :content)
#     end
# end
