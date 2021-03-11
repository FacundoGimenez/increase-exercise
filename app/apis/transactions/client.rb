# frozen_string_literal: true

module Transactions
  class Client
    include ApiExceptions

    CLIENTS           = '/clients/'
    API_ENDPOINT      = 'https://increase-transactions.herokuapp.com'
    FILE_ENDPOINT     = '/file.txt'

    def initialize(oauth_token = nil)
      @oauth_token = oauth_token
    end

    def transaction_file
      @response = original_req(FILE_ENDPOINT)

      @response.success? ? @response.body : error_handling
    end

    def transaction_client(id)
      @response = original_req("#{CLIENTS}#{id}")

      @response.success? ? Oj.load(@response.body) : error_handling
    end

    private

    def original_req(endpoint)
      @original_req = HTTParty.get("#{API_ENDPOINT}#{endpoint}", headers: { Authorization: @oauth_token })
    end

    def error_handling
      raise error_codes, "Code: #{@response.response.code}, response: #{@response.body}"
    end

    def error_codes
      case  @response.response.code
      when 400
        BadRequestError
      when 401
        UnauthorizedError
      when 403
        ForbiddenError
      when 404
        NotFoundError
      when 422
        UnprocessableEntityError
      else
        ApiError
      end
    end
  end
end
