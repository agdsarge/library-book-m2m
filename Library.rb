class Library
    attr_reader :name, :street_address, :city, :state, :has_ILL
    @@all = []
    def initialize(name, street_address, city, has_ILL, state=VA)
        raise "" unless
        @name = name
        @street_address = street_address
        @city = city
        @state = state
        @has_ILL = has_ILL
    end


    def self.all
        @@all
    end
end
