class Ability
  include Hydra::Ability
  
  include Hyrax::Ability
  self.ability_logic += [:everyone_can_create_curation_concerns]

#  def admin?
#    if current_user.admin?
#      return true
#    else
#      return false
#    end
#  end

  # Define any customized permissions here.
  def custom_permissions
    # Limits deleting objects to a the admin user
    #
    # if current_user.admin?
    #   can [:destroy], ActiveFedora::Base
    # end

    # Limits creating new objects to a specific group
    #
    # if user_groups.include? 'special_group'
    #   can [:create], ActiveFedora::Base
    # end
    if current_user.admin?
      can [:show, :create, :add_user, :remove_user, :index, :edit, :update, :destroy], Role
    end
  end
end
