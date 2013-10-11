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
    option = { width: 450, height: 340, :backgroundColor => '#0B534B', pieHole: 0.7,
               legend:{position:'none'}, titleTextStyle:{ color: 'white',  fontSize: 40,},
               slices: [{color:'#45CCA7'}, {color: '#0B534B'}, {color:'#45CCA7'}, {color: '#45CCA7'},{color: '#0B534B'},{color: '#45CCA7'}],
               pieSliceText: 'none',
               tooltip:{trigger: 'none'}, pieSliceBorderColor:'#45CCA7'
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
    #    data_table2.add_rows([
    #      ['3/22', 1160],
    #      ['3/24', 1170],
    #      ['3/26', 1135],
    #      ['3/29', 1156],
    #      ['4/1', 1158]
    #    ])
    team_progress = @user.get_org_total_cal_in_five_days

    data_table2.add_rows([
      ['day 1', team_progress[:day_one]],
      ['day 2', team_progress[:day_two]],
      ['day 3', team_progress[:day_three]],
      ['day 4', team_progress[:day_four]],
      ['day 5', team_progress[:day_five]]
    ])

    option2 = { width: 440, height: 170, backgroundColor: '#3AA88A', 
                vAxes:[{textStyle:{color:'white'}}],  hAxes:[{textStyle:{color:'white'}}],
                legend:{position:'none'}, titleTextStyle:{ color: 'white',  fontSize: 16,},
                series: [{color: '#0B534B'}]
    }
    @chart2 = GoogleVisualr::Interactive::AreaChart.new(data_table2, option2)
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

  #update the user's status
  def update_db
    new_data = JSON.load(open("https://stark-reef-3410.herokuapp.com/api/show.JSON"))
    user_to_update = StUser.find(1) #NOTE use user 1 for now. Must change to something later
    user_to_update.update_data(new_data["calorie"])
    render nothing: true
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
