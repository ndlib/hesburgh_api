module HesburghAPI
  class Person < Base
    BASE_PATH = "/1.0/people/"

    def email
      @data['contact_information']['email']
    end
  end



end
