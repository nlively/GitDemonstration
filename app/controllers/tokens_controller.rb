class TokensController < Doorkeeper::TokensController
  def create
    response.headers.merge!({
      'Pragma'        => 'no-cache',
      'Cache-Control' => 'no-store',
    })
    if token.authorize
      #logger.debug token.inspect
      output = token.authorization
      output[:user_id] = token.resource_owner.id
      render :json => output #token.authorization
    else
      render :json => token.error_response, :status => token.error_response.status
    end
  end

end
