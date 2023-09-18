class EntitiesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_group


    def new
        @entity = Entity.new
        @user_groups = current_user.groups
      end

    def create
        @entity = @group.entities.new(entity_params)
        @entity.user = current_user
        if @entity.save
            redirect_to group_path(@group), notice: "Entity Created Successfuly"
        else
            render new
        end
    end


    private

    def find_group
        @group = current_user.groups.find(params[:group_id])
    end

    def entity_params
        params.require(:entity).permit(:name, :amount)
    end
end
