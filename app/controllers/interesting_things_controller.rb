class InterestingThingsController < ApplicationController
  before_action :set_student
  before_action :set_interesting_thing, only: [:show, :edit, :update, :destroy]

  # GET /interesting_things
  # GET /interesting_things.json
  def index
    @interesting_things = @student.interesting_things
    @other_interesting_things = Student.where.not(id: @student.id).map do|student|
      student.interesting_things[@student.id % Student.count] || student.interesting_things.sample
    end.compact
  end

  # GET /interesting_things/1
  # GET /interesting_things/1.json
  def show
  end

  # GET /interesting_things/new
  def new
    @interesting_thing = InterestingThing.new(student: @student)
  end

  # GET /interesting_things/1/edit
  def edit
  end

  # POST /interesting_things
  # POST /interesting_things.json
  def create
    @interesting_thing = InterestingThing.new(interesting_thing_params)

    respond_to do |format|
      if @interesting_thing.save
        format.html { redirect_to new_student_interesting_thing_path(@student), notice: 'Interesting thing was successfully created.' }
        format.json { render :show, status: :created, location: @interesting_thing }
      else
        format.html { render :new }
        format.json { render json: @interesting_thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interesting_things/1
  # PATCH/PUT /interesting_things/1.json
  def update
    respond_to do |format|
      if @interesting_thing.update(interesting_thing_params)
        format.html { redirect_to student_interesting_things_path(@student), notice: 'Interesting thing was successfully updated.' }
        format.json { render :show, status: :ok, location: @interesting_thing }
      else
        format.html { render :edit }
        format.json { render json: @interesting_thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interesting_things/1
  # DELETE /interesting_things/1.json
  def destroy
    @interesting_thing.destroy
    respond_to do |format|
      format.html { redirect_to student_interesting_things_url, notice: 'Interesting thing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interesting_thing
      @interesting_thing = InterestingThing.find(params[:id])
    end

    def set_student
      @student = Student.find(params[:student_id]) if params[:student_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interesting_thing_params
      params.require(:interesting_thing).permit(:name, :student_id)
    end
end
