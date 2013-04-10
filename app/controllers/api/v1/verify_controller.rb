module Api::V1
  class VerifyController < ApiController
    before_filter :verify_identity

    def show
    end

    private

    def verify_identity
      if access_token
        render json: JSON.parse({}), status: 200
      else
        render text: 'Unauthorized', status: 403
      end
    end

    def user
      @user ||= User.find_by_uid(params[:id])
    end

    def access_token
      @access_token ||= Doorkeeper::AccessGrant.where(resource_owner_id: user.id).
        where(token: params[:token]).where('revoked_at is NULL')
    end
  end
end
