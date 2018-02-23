import UIKit
import Cosmos

protocol AddBookViewControllerDelegate: class {
  func addBookToArray(book: Book)
}

class AddBookViewController: UIViewController {
  
  @IBOutlet weak var bookNameButton: UITextField?
  @IBOutlet weak var dateRead: UIDatePicker?
  @IBOutlet weak var starRating: CosmosView?
  weak var delegate: AddBookViewControllerDelegate?
  
  @IBAction func saveButtonPressed(_ sender: Any) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/mm/yyyy"
    if let date = dateRead?.date,
      let name = bookNameButton?.text,
      let rating = starRating?.rating {
      let formattedDate = dateFormatter.string(from: date)
      let book = Book(name: name,
                      dateRead: formattedDate,
                      starRating: rating)
      delegate?.addBookToArray(book: book)
      self.dismiss(animated: true, completion: nil)
    }
    
  }
  
  @IBAction func backButtonPressed(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
}
