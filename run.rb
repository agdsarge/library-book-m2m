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



    #Instances of Book Class
    ruby = Book.new("Ruby for Dummies", "Bob McSmart", "reference", 123)
    python = Book.new("Python for beginners", "Paul nicholsen", "refernce", 321)
    warandpeace = Book.new("War and Peace", "Leo Tolstoy", "Russian Lit", 1180)

    #Instances of Library Class
    swem = Library.new("SWEM", "Williamsburg", true)
    wrl = Library.new("WRL", "Williamsburg", false)
    uva = Library.new("Alderman", "Charlottesville", true)
    cville = Library.new("Jefferson Madison Reg. Library", "Charlottesville", false)

    #Method Calls
    swem.buy_book(ruby, 2)
    wrl.buy_book(python, 4)
    cville.buy_book(ruby, 1)
    cville.buy_book(warandpeace, 1)
    wrl.buy_book(warandpeace,1)
    # puts wrl.ownership.map {|b| b.quantity}.reduce(:+) # 5
    # #puts swem.books[0]
    # puts swem.stock_of_book(ruby)   #2  test passed
    # puts wrl.stock_of_book(ruby)    #0  test passed
    # puts wrl.stock_of_book(python)  #4  test passed
    # puts swem.stock_of_book(python) #0 test passed
    # puts uva.stock_of_book(ruby)    #0 test passed


    #swem.transfer_to_peer(ruby, wrl, 1)
    puts "NEW TEST BELOW"
    # puts wrl.ownership.map {|b| b.quantity}.reduce(:+) #
    # puts swem.stock_of_book(ruby)   #1  test passed
    # puts wrl.stock_of_book(ruby)    #1  test passed

    # swem.transfer_to_peer(ruby, uva, 1)

    #puts swem.stock_of_book(ruby)

    #   { :book_obj => [ 0ind  "ownership quantity"  ,  1index "instock quantity"   ]  }=> 
    
    puts swem.ownership
    pp swem.how_many_checked_out(ruby)


    # puts swem.stock_of_book(ruby)
    # puts uva.stock_of_book(ruby)
    # puts wrl.stock_of_book(ruby)

    # puts python.how_many_in(wrl) # should be 4
    #
    # puts Library.has_agreement(swem, uva) # true
    # puts Library.has_agreement(wrl, cville) # false
    # puts Library.has_agreement(uva, cville) # true
    # puts Library.has_agreement(swem, wrl) # true
    #
    #
    # puts cville.longest_book # War and Peace
    # puts ruby.is_longest?(cville) # False
    # puts warandpeace.is_longest?(cville) # True





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
