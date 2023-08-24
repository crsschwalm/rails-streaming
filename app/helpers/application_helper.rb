module ApplicationHelper
    def randomNum
      @randomNum ||= SecureRandom.base64
    end
  end
