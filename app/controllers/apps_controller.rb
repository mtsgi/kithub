class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]

  # GET /apps
  # GET /apps.json
  def index
    @apps = App.all
  end

  # GET /apps/1
  # GET /apps/1.json
  def show
    render("error") if( !@app.present? )
  end

  # GET /apps/new
  def new
    @app = App.new
  end

  # GET /apps/1/edit
  def edit
  end

  # POST /apps
  # POST /apps.json
  def create
    @app = App.new(app_params)
    @app.data = params[:app][:data].read if( @app.data.present? )

    if( @app.appid == "new" )
      render(plain: "使用できないアプリケーションIDです。")
      return
    end

    respond_to do |format|
      if @app.save
        format.html { redirect_to "/apps/"+@app.appid, notice: 'App was successfully created.' }
        format.json { render :show, status: :created, location: @app }
      else
        format.html { render :new }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apps/1
  # PATCH/PUT /apps/1.json
  def update
    respond_to do |format|
      if @app.update(app_params)
        format.html { redirect_to @app, notice: 'App was successfully updated.' }
        format.json { render :show, status: :ok, location: @app }
      else
        format.html { render :edit }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apps/1
  # DELETE /apps/1.json
  def destroy
    @app.destroy
    respond_to do |format|
      format.html { redirect_to apps_url, notice: 'App was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete
    set_app
  end

  def download
    if( App.find_by_id(params[:id]) )
      @app = App.find_by_id(params[:id]) 
    else
      @app = App.find_by_appid(params[:id]) 
    end
    send_data( @app.data, type: "application/zip", filename: @app.appid+".zip" )
  end

  def search
    @apps = App.search(params[:q])
    render("search")
  end

  def error
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      if( App.find_by_id(params[:id]) )
        @app = App.find_by_id(params[:id]) 
      else
        @app = App.find_by_appid(params[:id]) 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_params
      params.require(:app).permit(:name, :appid, :author, :desc, :genre, :url, :data)
    end
end