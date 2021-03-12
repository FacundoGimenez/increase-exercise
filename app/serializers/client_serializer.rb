class ClientSerializer < ActiveModel::Serializer
  attributes :client_id, :email, :first_name, :last_name, :job, :country, :address, :zip_code, :address
end
