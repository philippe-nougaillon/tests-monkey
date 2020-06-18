class ScriptsController < ApplicationController
  before_action :set_script, only: [:show, :edit, :update, :destroy]

  # GET /scripts
  # GET /scripts.json
  def index
    @scripts = Script.all

    unless params[:name].blank?
      @scripts = @scripts.where('name like ?', "%#{params[:name]}%")
    end
    
    unless params[:passed].blank?
      @scripts = @scripts.where(passed: params[:passed])
    end

    @scripts = @scripts.paginate(page: params[:page], per_page: 10)
  end

  # GET /scripts/1
  # GET /scripts/1.json
  def show
  end

  def run
    script = Script.find(params[:script_id])
    execute_script(script)

    redirect_to scripts_url
  end 

  # GET /scripts/new
  def new
    @script = Script.new
  end

  # GET /scripts/1/edit
  def edit
  end

  # POST /scripts
  # POST /scripts.json
  def create
    @script = Script.new(script_params)

    respond_to do |format|
      if @script.save
        
        execute_script(@script)

        format.html { redirect_to @script, notice: 'Script was successfully created.' }
        format.json { render :show, status: :created, location: @script }
      else
        format.html { render :new }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scripts/1
  # PATCH/PUT /scripts/1.json
  def update
    respond_to do |format|
      if @script.update(script_params)

        execute_script(@script)

        format.html { redirect_to @script }
        format.json { render :show, status: :ok, location: @script }
      else
        format.html { render :edit }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scripts/1
  # DELETE /scripts/1.json
  def destroy
    @script.destroy
    respond_to do |format|
      format.html { redirect_to scripts_url, notice: 'Script was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_script
      @script = Script.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def script_params
      params.require(:script).permit(:name, :description, :body)
    end

    # Execute le script de test avec les assertions du script #id
    def execute_script(script)

      cmd = "script_id=#{script.id} rails test test/system/automat_test.rb"
      wasGood = system(cmd)

      copy_screenshoot(script.id, wasGood)

      script.passed    = wasGood
      script.passed_at = DateTime.now
      script.save

      if wasGood
        flash[:notice] = "OK => Test passed"
      else
        flash[:alert] = "KO => Test failed!"
      end

    end

    def copy_screenshoot(script_id, wasGood)

      path = '/home/philnoug/RailsProjects/tests_monkey/'
      dest = "public/screenshot_#{script_id}.png"

      if wasGood
        system("cp #{ path }tmp/screenshots/test_assertions_from_database.png #{ path + dest }")
      else  
        system("cp #{ path }tmp/screenshots/failures_test_assertions_from_database.png #{ path + dest }")
      end  

    end

end
