class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @user = StUser.find(1)
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
    option = { width: 400, height: 190, :backgroundColor => '#FF7300', pieHole: 0.5,
               legend:{position:'none'}, titleTextStyle:{ color: 'white',  fontSize: 16,},
               slices: [{color:'#F85000'}, {color: '#F85000'}, {color:'#F7982A'}, {color: '#F7982A'},{color: '#F7982A'},{color: '#F7982A'}],
               pieSliceText: 'none',
               tooltip:{trigger: 'none'}, pieSliceBorderColor:'#F7982A'
    }
    @chart = GoogleVisualr::Interactive::PieChart.new(data_table, option)
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render action: 'show', status: :created, location: @organization }
      else
        format.html { render action: 'new' }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name, :location, :discription)
    end
end
