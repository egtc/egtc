class FtesController < ApplicationController

  hobo_model_controller

  auto_actions :all
  
  def show
    @fte = find_instance
    
    end


end
