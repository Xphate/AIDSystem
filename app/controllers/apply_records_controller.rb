class ApplyRecordsController < ApplicationController
  before_action :set_apply_record, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /apply_records
  # GET /apply_records.json
  def index
    if current_user.job=="申请人员"
      @apply_records = ApplyRecord.where(:user=>current_user.username)
    elsif current_user.job=="鉴别业务人员"
      @apply_records=ApplyRecord.where( :state => "申请复核通过")
    elsif current_user.job=="鉴别复核人员"
      @apply_records=ApplyRecord.where( :state => "鉴定通过")
    elsif current_user.job=="证书草拟人员"
      @apply_records=ApplyRecord.where( :state => "鉴定复核通过")
    elsif current_user.job=="证书颁发人员"
      @apply_records=ApplyRecord.where( :state => "证书草拟完成")
    elsif current_user.job=="证书绑定人员"
      @apply_records=ApplyRecord.where( :state => "证书颁发完成")
    else
      @apply_records=ApplyRecord.all
    end
  end

  # GET /apply_records/1
  # GET /apply_records/1.json
  def show
  end

  # GET /apply_records/new
  def new
    @apply_record = ApplyRecord.new
  end

  # GET /apply_records/1/edit
  def edit
  end

  # POST /apply_records
  # POST /apply_records.json
  def create
    @apply_record = ApplyRecord.new(apply_record_params)
    @apply_record.user=current_user.username

    respond_to do |format|
      if @apply_record.save
        format.html { redirect_to @apply_record, notice: 'Apply record was successfully created.' }
        format.json { render :show, status: :created, location: @apply_record }
      else
        format.html { render :new }
        format.json { render json: @apply_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apply_records/1
  # PATCH/PUT /apply_records/1.json
  def update
    if current_user.job=="申请复核人员"
      @apply_record.shenqingfuhe=current_user.username
    elsif current_user.job=="鉴别业务人员"
      @apply_record.jianding=current_user.username
    elsif current_user=="鉴别复核人员"
      @apply_record.jiandingfuhe=current_user.username
    elsif current_user=="证书草拟人员"
      @apply_record.zhengshucaoli=current_user.username
    elsif current_user=="证书发放人员"
      @apply_record.zhengshufafang=current_user.username
    elsif current_user=="证书绑定人员"
      @apply_record.zhengshubangding=current_user.username
    end
    respond_to do |format|
      if @apply_record.update(apply_record_params)
        format.html { redirect_to @apply_record, notice: 'Apply record was successfully updated.' }
        format.json { render :show, status: :ok, location: @apply_record }
      else
        format.html { render :edit }
        format.json { render json: @apply_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apply_records/1
  # DELETE /apply_records/1.json
  def destroy
    @apply_record.destroy
    respond_to do |format|
      format.html { redirect_to apply_records_url, notice: 'Apply record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apply_record
      @apply_record = ApplyRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apply_record_params
      params.require(:apply_record).permit(:personcategory, :item, :timelimit, :artcategory, :organization, :state)
    end
end
