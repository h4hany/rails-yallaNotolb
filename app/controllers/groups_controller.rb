class GroupsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def getGroupNameLikeString
    groups = Group.where(user_id: current_user.id).where(["gname like ?","#{params[:keyword]}%"])
    arr = Array.new
    groups.each do |g|
      arr.push g.gname
    end
    render :json => {groups: arr}
  end
  def getUsers
    group = Group.find_by(gname: params[:str])
    if group.nil?
      render :json => {user:false}
    else
      uids = GroupUser.where(group_id: group).select(:user_id)
      users = Array.new
      uids.each {|uid| users.push User.find(uid.user_id) }
      render :json => {user:users}
    end
  end

  def index
    @groups = Group.where(user_id: current_user.id)
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new
    @group.gname = params[:group][:gname]
    @group.user_id = current_user.id

    respond_to do |format|
      if @group.save
        uids = params[:group][:uids].split(',')
        gid = @group.id
        uids.each do |uid|
          if !uid.empty?
            row = GroupUser.new
            row.group_id = gid
            row.user_id = uid
            row.save
          end
        end
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        GroupUser.where(group_id: @group.id).destroy_all
        uids = params[:group][:uids].split(',')
        gid = @group.id
        uids.each do |uid|
          if !uid.empty?
            row = GroupUser.new
            row.group_id = gid
            row.user_id = uid
            row.save
          end
        end
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:gname, :user_id)
    end
end
