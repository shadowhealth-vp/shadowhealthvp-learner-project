class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |user|
      if user.persisted?
        UserSetupService.new(user).call
      end
    end
  end
end
