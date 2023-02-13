class ListsController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update, :destroy]

    def index
       @lists = current_user.lists.order(created_at: :desc)
       @list = List.new
    #    @uncompleted_items = current_user.uncompleted
       @completed_items = current_user.completed
    end

    def new
        @list = List.new
    end

    def create
        @list = current_user.lists.build(list_params)
        if @list.save
            flash[:success] = "List successfully created"
            redirect_to root_url
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def edit
        
    end

    def update
        if @list.update(list_params)
            flash[:success] = "List successfully updated"
            redirect_to root_url
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def destroy
        @list.destroy
        flash[:danger] = "List succecssfully deleted"
        redirect_to root_url, status: :see_other
    end

    def delete_completed
        @delete_completed = current_user.completed.destroy_all
        flash[:danger] = "Completed lists deleted"
        redirect_to root_url, status: :see_other
    end

    def delete_uncompleted
        @delete_uncompleted = current_user.uncompleted.destroy_all
        flash[:danger] = "Completed lists deleted"
        redirect_to root_url, status: :see_other
    end

    def delete_all
        @delete_all = current_user.lists.destroy_all
        flash[:danger] = "All lists deleted"
        redirect_to root_url, status: :see_other
    end

    def completed
        @lists = current_user.completed
    end

    def uncompleted
        @lists = current_user.uncompleted
    end

    private

        def list_params
            params.require(:list).permit(:description, :completed)
        end

        def set_lists
            @list = List.find(params[:id])
        end

        def correct_user
            @list = current_user.lists.find_by(id: params[:id])
            redirect_to root_url, status: :see_other if @list.nil?
        end
end
