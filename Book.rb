class Book

    @@all = []

    attr_reader :title, :author, :genre, :pub_date, :page_count, :canShare?

    def initialize(title, author, genre, pub_date, page_count, canShare?=true)
        @title = title
        @author = author
        @genre = genre
        @pub_date = pub_date
        @page_count = page_count
        @canShare? = canShare?
        @@all << self
    end

    #Class Methods
    def self.all
        @@all
    end

    #Instance Methods


end
