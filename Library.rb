class Library
    attr_reader :name, :street_address, :city, :state, :has_ILL
    @@all = []
    def initialize(name, street_address, city, has_ILL, state="VA")
        raise "ERROR" unless [name, street_address, city, state].all? {|arg| arg.class == String}
        @name = name
        @street_address = street_address
        @city = city
        @state = state
        @has_ILL = has_ILL
        @@all << self
    end

    def self.all
        @@all
    end
end

# wrl = Library.new("WRL", "Baker St", "Williamsburg", true, "VA")
# puts wrl.name
