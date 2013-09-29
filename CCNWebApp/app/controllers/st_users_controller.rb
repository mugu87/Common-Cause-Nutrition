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
    data_table.new_column('string', 'Task' )
    data_table.new_column('number', 'Hours per Day')

    # Add Rows and Values
    data_table.add_rows([
      ['one', 85],
      ['two', 10],
      ['three', 85],
      ['bah',85],
      ['four',10],
      ['four',85]

    ])
    option = { width: 500, height: 340, title: 'CALORIE BANK', :backgroundColor => '#0B534B', pieHole: 0.6,
               legend:{position:'none'}, titleTextStyle:{ color: 'white',  fontSize: 16,},
               slices: [{color:'green'}, {color: 'blue'}, {color:'green'}, {color: 'green'},{color: 'blue'},{color: 'green'}],
               pieSliceText: 'none',
               tooltip:{trigger: 'none'}, pieSliceBorderColor:'green'
    }
    @chart = GoogleVisualr::Interactive::PieChart.new(data_table, option)


    # chart two
    data_table2 = GoogleVisualr::DataTable.new
    # Add Column Headers
    data_table2.new_column('string', 'Date' )
    data_table2.new_column('number', 'Team Progress')
    #  data_table2.new_column({type:'string', role:'annotation'})
    #    data_table2.new_column({type:'string', role:'annotationText'})



    # Add Rows and Values
    data_table2.add_rows([
      ['3/22', 1160],
      ['3/24', 1170],
      ['3/26', 1135],
      ['3/29', 1156],
      ['4/1', 1158]
    ])
    option2 = { title: 'TEAM PROGRESS', backgroundColor: '#3AA88A', 
                vAxes:[{textStyle:{color:'white'}}],  hAxes:[{textStyle:{color:'white'}}],
                legend:{position:'none'}, titleTextStyle:{ color: 'white',  fontSize: 16,},
                series: [{color: 'green'}]
    }
    @chart2 = GoogleVisualr::Interactive::AreaChart.new(data_table2, option2)
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
    #raise params
    @st_user = StUser.find(params[:id])

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def st_user_params
    params.require(:st_user).permit(:name, :height, :weight, :sex, :total_calorie_in, :total_calorie_out)
  end
end
