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


    # Instance Methods

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

    def transfer_to_peer(book_obj, receiver, quantity=1)
        
        #error handling
        raise "Can't loan to yourself" if self == receiver
        raise "Can't loan more books than you have" if self.stock_of_book(book_obj) < quantity
        
        # check if in same city or both universities
        if Library.has_agreement(self, receiver)
            receiver.buy_book(book_obj, quantity)
            x = ILL.all.select {|bk| bk.lib_obj == self and bk.book_obj == book_obj}
            x[0].quantity -= quantity
        else
            #handle exception
            return "Sorry these libraries do not have an ILL agreement!"
        end
    end

    def longest_book
        a = ILL.all.select { |ill_obj| ill_obj.lib_obj == self }
        
        a.map! { |ill_obj| ill_obj.book_obj }

        book = a.max { |a, b| a.page_count <=> b.page_count }

        book.title
    end



    #Class methods

    def burn_book(book_obj)
        self.books.delete(book_obj)
    end

    def self.all
        @@all
    end

    def self.has_agreement(lib1, lib2)
        # check if in same city and check if both university
        # return true for same city or both university
        return lib1.city == lib2.city || ( lib1.isUniversity && lib2.isUniversity )
    end


end



# wrl = Library.new("WRL", "Baker St", "Williamsburg", true, "VA")
# puts wrl.name
