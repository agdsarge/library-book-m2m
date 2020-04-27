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



    ruby = Book.new("Ruby for Dummies", "Bob McSmart", "reference", 123)
    python = Book.new("Python for beginners", "Paul nicholsen", "refernce", 321)
    swem = Library.new("SWEM", "Williamsburg", true)
    wrl = Library.new("WRL", "Williamsburg", false)
    uva = Library.new("Alderman", "Charlottesville", true)
    swem.buy_book(ruby, 2)
    wrl.buy_book(python, 4)

    #puts swem.books[0]
    puts swem.stock_of_book(ruby)   #2  test passed
    puts wrl.stock_of_book(ruby)    #0  test passed
    puts wrl.stock_of_book(python)  #4  test passed
    puts swem.stock_of_book(python) #0 test passed
    puts uva.stock_of_book(ruby)    #0 test passed


    swem.loan_to_peer(ruby, wrl, 1)
    puts swem.stock_of_book(ruby)   #1  test passed
    puts wrl.stock_of_book(ruby)    #1  test passed

    swem.loan_to_peer(ruby, uva, 1)

    puts swem.stock_of_book(ruby)
    puts uva.stock_of_book(ruby)
    # puts wrl.stock_of_book(ruby)


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
