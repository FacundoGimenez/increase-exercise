# frozen_string_literal: true

module FindClient
  extend ActiveSupport::Concern

  included do
    before_action :set_client
  end

  def set_client
    id = params[:id] || params[:client_id]
    @client = Client.find_by(client_id: id)

    return @client if @client

    render json: { message: 'We were not able to found any client that matches with the provided id.' },
           status: :not_found
  end
end
