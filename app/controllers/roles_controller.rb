class RolesController < ApplicationController
  include Hydra::RoleManagement::RolesBehavior
  
  def create
    @role = Role.new(role_params)
    if @role.save
      redirect_to role_management.roles_path, notice: 'Role was successfully created.'
    else
      render action: "new"
    end
  end
  
end
