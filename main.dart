// Define the Book class
class Book {
  String title;
  String author;

  Book(this.title, this.author);
}

// Define the Member class
class Member {
  String name;
  String membershipNumber;
  List<Book> borrowedBooks = [];

  Member(this.name, this.membershipNumber);

  // Method to borrow a book
  void borrowBook(Book book) {
    borrowedBooks.add(book);
    print('Book "${book.title}" borrowed by $name.');
  }

  // Method to return a book
  void returnBook(Book book) {
    if (borrowedBooks.remove(book)) {
      print('Book "${book.title}" returned by $name.');
    } else {
      print('Book "${book.title}" not found in $name\'s borrowed list.');
    }
  }

  // Method to print member information
  void printMemberInfo() {
    print('Member Name: $name');
    print('Membership Number: $membershipNumber');
    print('Borrowed Books:');
    if (borrowedBooks.isEmpty) {
      print('  No books borrowed.');
    } else {
      for (var book in borrowedBooks) {
        print('  - ${book.title} by ${book.author}');
      }
    }
  }
}

void main() {
  // Create some Book objects
  Book book1 = Book('My Book', 'Shams Khalil');
  Book book2 = Book('c++ basics', 'mhmed Eldosoky');
  Book book3 = Book('c++ advansed', 'Adel Nassim');

  // Create some Member objects
  Member sama = Member('sama', 'M001');
  Member ahmed = Member('Ahmed', 'M002');

  // Members borrow books
  sama.borrowBook(book1);
  sama.borrowBook(book2);
  ahmed.borrowBook(book3);

  // Print member information
  print('\n--- Member Information ---');
  sama.printMemberInfo();
  ahmed.printMemberInfo();

  // Members return books
  sama.returnBook(book1);
  ahmed.returnBook(book1); // Trying to return a book not borrowed by ahmed

  // Print updated member information
  print('\n--- Updated Member Information ---');
  sama.printMemberInfo();
  ahmed.printMemberInfo();
}
