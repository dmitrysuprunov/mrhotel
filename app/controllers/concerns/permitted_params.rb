module PermittedParams
  extend ActiveSupport::Concern

  included do

    private

    def permitted_params
      {
          :customer => params.fetch(:customer, {}).permit(
              :name,
              :email,
              :checkin_date,
              :checkout_date,

          )
      }
    end

  end
  end


