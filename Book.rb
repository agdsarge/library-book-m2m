class Book

    @@all = []

    attr_reader :title, :author, :genre, :pub_date, :page_count, :canShare

    def initialize(title, author, genre, pub_date, page_count, canShare)
        # puts method(:initialize).parameters
        # raise "Danger, Will Robinson!" unless method(:initialize).parameters.all? { |elem| elem[1].class == Symbol } # +> array of parameters
        @title = title
        @author = author
        @genre = genre
        @pub_date = pub_date
        @page_count = page_count
        @canShare = canShare
        @@all << self
    end

    #Class Methods
    def self.all
        @@all
    end

    #Instance Methods


end


hp = Book.new("title_diddledee", "author_diddledee", "genre_diddledee", "pub_date_diddledee", "page_count_diddledee", true)

puts hp.title