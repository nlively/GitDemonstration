class TokensController < Doorkeeper::TokensController
  def create
    response.headers.merge!({
      'Pragma'        => 'no-cache',
      'Cache-Control' => 'no-store',
    })

    if token.authorize
      output = token.authorization
      unless token.access_token.resource_owner_id.blank?
        output[:user_id] = token.access_token.resource_owner_id
      end
      render :json => output #token.authorization
    else
      render :json => token.error_response, :status => token.error_response.status
    end
  end

end
