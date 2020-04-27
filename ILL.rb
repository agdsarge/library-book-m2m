class ILL

    @@all = []
    attr_accessor :lib_obj, :book_obj, :quantity

    def initialize(lib_obj, book_obj, quantity=1)
        @lib_obj, @book_obj, @quantity = lib_obj, book_obj, quantity
        @@all << self
    end

    def self.all
        @@all
    end
end
