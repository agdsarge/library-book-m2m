class Book

    @@all = []

    attr_accessor :title, :author, :genre, :page_count

    def initialize(title, author, genre, page_count)
        # puts method(:initialize).parameters
        # raise "Danger, Will Robinson!" unless method(:initialize).parameters.all? { |elem| elem[1].class == Symbol } # +> array of parameters
        @title = title
        @author = author
        @genre = genre
        @page_count = page_count

        @@all << self
    end

    def libraries
        x = ILL.all.select {|lib| lib.book_obj == self}
    end



    #Class Methods
    def self.all
        @@all
    end

    #Instance Methods


end


# hp = Book.new("title_diddledee", "author_diddledee", "genre_diddledee", "pub_date_diddledee", "page_count_diddledee", true)
#
# puts hp.title
