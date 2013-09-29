class StUsersController < ApplicationController
  before_action :set_st_user, only: [:show, :edit, :update, :destroy]

  # GET /st_users
  # GET /st_users.json
  def index
    @st_users = StUser.all
  end

  # GET /st_users/1
  # GET /st_users/1.json
  def show
    @user =@st_user
    @mydonations = Donation.where(:st_user_id => current_user)
    data_table = GoogleVisualr::DataTable.new
    # Add Column Headers
    data_table.new_column('string', 'Year' )
    data_table.new_column('number', 'Sales')
    data_table.new_column('number', 'Expenses')

    # Add Rows and Values
    data_table.add_rows([
        ['2004', 1000, 400],
        ['2005', 1170, 460],
        ['2006', 660, 1120],
        ['2007', 1030, 540]
    ])
    option = { width: 400, height: 240, title: 'Company Performance' }
    @chart = GoogleVisualr::Interactive::BarChart.new(data_table, option)
  end

  # GET /st_users/new
  def new
    @st_user = StUser.new
  end

  # GET /st_users/1/edit
  def edit
  end

  # POST /st_users
  # POST /st_users.json
  def create
    @st_user = StUser.new(st_user_params)

    respond_to do |format|
      if @st_user.save
        format.html { redirect_to @st_user, notice: 'St user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @st_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @st_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /st_users/1
  # PATCH/PUT /st_users/1.json
  def update
    respond_to do |format|
      if @st_user.update(st_user_params)
        format.html { redirect_to @st_user, notice: 'St user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @st_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /st_users/1
  # DELETE /st_users/1.json
  def destroy
    @st_user.destroy
    respond_to do |format|
      format.html { redirect_to st_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_st_user
      @st_user = StUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def st_user_params
      params.require(:st_user).permit(:name, :height, :weight, :sex, :total_calorie_in, :total_calorie_out)
    end
end
