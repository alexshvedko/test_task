class ApplicationController < ActionController::API

  def render_success(object = {}, status = :ok, options = {})
    render options.merge({ json: object, status: status })
  end

  def render_errors(object, status, options = {})
    render options.merge({ json: { errors: object }, status: status })
  end

end
