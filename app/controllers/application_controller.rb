class ApplicationController < ActionController::Base
    before_action :new_list
    def new_list
        @list = List.new
    end
end
