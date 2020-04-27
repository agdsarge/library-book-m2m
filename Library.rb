class Library
    attr_reader :name, :city, :isUniversity
    @@all = []
    def initialize(name, city, isUniversity)
        raise "ERROR" unless [name, city].all? {|arg| arg.class == String}
        raise "Bool ERROR" unless isUniversity.class == TrueClass or isUniversity.class == FalseClass
        @name = name
        @city = city
        @isUniversity = isUniversity

        @@all << self
    end

    def books
        ILL.all.select {|bk| bk.lib_obj == self}.map {|bk| bk.book_obj}

    end

    def buy_book(book_obj, quantity=1)
        ILL.new(self, book_obj, quantity)
    end

    def stock_of_book(book_obj)
        a = ILL.all.select {|bk| bk.lib_obj == self}
        a.find {|bk| bk.book_obj == book_obj} ? a.find {|bk| bk.book_obj == book_obj}.quantity : 0
    end

    def loan_to_peer(book_obj, lib_obj, quantity=1)
        raise "Can't loan to yourself" if self == lib_obj
        raise "Can't loan more books than you have" if self.stock_of_book(book_obj) < quantity
        lib_obj.buy_book(book_obj, quantity)
        x = ILL.all.select {|bk| bk.lib_obj == self and bk.book_obj == book_obj}
        x[0].quantity -= quantity
    end


    def burn_book(book_obj)
        self.books.delete(book_obj)
    end

    def self.all
        @@all
    end
end



# wrl = Library.new("WRL", "Baker St", "Williamsburg", true, "VA")
# puts wrl.name
