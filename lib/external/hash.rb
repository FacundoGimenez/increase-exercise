# frozen_string_literal: true

# https://stackoverflow.com/questions/21725218/clear-all-values-in-nested-ruby-hash/21725335#21725335
class Hash
  def delete_values!
    each_key do |key|
      self[key].is_a?(Hash) ? self[key].delete_values! : self[key] = nil
    end
  end
end
