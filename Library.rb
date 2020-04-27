require 'pry'

class Library
    attr_reader :name, :city, :isUniversity, :ownership
    @@all = []
    def initialize(name, city, isUniversity)
        raise "ERROR" unless [name, city].all? {|arg| arg.class == String}
        raise "Bool ERROR" unless isUniversity.class == TrueClass or isUniversity.class == FalseClass
        @name = name
        @city = city
        @isUniversity = isUniversity
        @ownership = []

        @@all << self
    end


    # Instance Methods

    def books
        ILL.all.select {|bk| bk.lib_obj == self}.map {|bk| bk.book_obj}
    end

    def buy_book(book_obj, quantity=1)
        @ownership << ILL.new(self, book_obj, quantity)
    end

    def loan_book(book_obj, quantity=1)
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
            receiver.loan_book(book_obj, quantity)
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

    def how_many_checked_out(book_obj)
        #wrl.how_many_left(warandpeace) #=>
        #if book_obj.in_stock?(self)
        #self.ownership.map {|b| b.quantity}.reduce(:+) #produces integer that tells us how many of a book the library bought
        self.ownership #array of book obj
        #self.books #array of book objs that are in this library (ILL self x book)
        enriques_hash = {} #{book_obj => array[ownership_quant, self_books ]}

        self.ownership.each do |ill|

            if enriques_hash[ill.book_obj.title]
                enriques_hash[ill.book_obj.title][0] += ill.quantity
            else
                enriques_hash[ill.book_obj.title] = [ill.quantity, 0]
            end
        end
        ILL.all.select {|bk| bk.lib_obj == self}.each do |ill|
            
            if enriques_hash[ill.book_obj.title]
                enriques_hash[ill.book_obj.title][1] += ill.quantity
            else
                enriques_hash[ill.book_obj.title] = [0, ill.quantity]
            end
        end
        enriques_hash
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
