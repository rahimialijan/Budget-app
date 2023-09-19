class GroupsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @groups = current_user.groups.all
    end
  
    def new
      @group = current_user.groups.new
    end
  
    def create
        @entity = @group.entities.new(entity_params.merge(user_id: current_user.id))
      
        if @entity.save
          redirect_to group_path(@group), notice: 'Entity created successfully.'
        else
          render 'new'
        end
      end
      
  
    def show
      @group = current_user.groups.find(params[:id])
      @entities = @group.entities
    end
  
    private
  
    def group_params
      params.require(:group).permit(:name, :icon)
    end
  end
  