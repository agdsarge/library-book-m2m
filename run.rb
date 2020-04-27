require_relative "./Book.rb"
require_relative "./ILL.rb"
require_relative "./Library.rb"

def run_tests
    # #test whether Books can be created
    # #def initialize(title, author, genre, pub_date, page_count, canShare)
    #alpha = Book.new("Ruby for Dummies", "Bob McSmart", "reference", "01 Jan 2020", 123, true)
    # puts alpha.author
    # #test whether Libraries can be created
    # #initialize(name, street_address, city, has_ILL, state="VA")
    #beta = Library.new("SWEM", "Jamestown Rd", "Williamsburg", true)
    # puts beta.street_address

    # 
    # alpha = Book.new("Ruby for Dummies", "Bob McSmart", "reference", "01 Jan 2020", 123, true)
    # beta = Library.new("SWEM", "Jamestown Rd", "Williamsburg", true)
    #
    # ILL.new(beta, alpha)
    # print alpha.libraries
    # puts beta.books

end

# def run
#     initial load
#
#     while true
#         gets user_input
#         if input == C|R|U|D| Q
#             c.method, r.method, u.method, d.method

#CRUD
run_tests
