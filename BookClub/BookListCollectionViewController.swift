import UIKit

class BookListCollectionViewController: UICollectionViewController, AddBookViewControllerDelegate {
  
  var books = [Book]()
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return books.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BookCollectionViewCell.self), for: indexPath) as? BookCollectionViewCell else { return UICollectionViewCell() }
    cell.bookName?.text = books[indexPath.row].name
    cell.dateRead?.text = "Read \(books[indexPath.row].dateRead)"
    cell.starRating?.rating = books[indexPath.row].starRating
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let addBookViewController = segue.destination as? AddBookViewController {
      addBookViewController.delegate = self
    }
  }
  
  // MARK: AddBookViewControllerDelegate
  func addBookToArray(book: Book) {
    books.append(book)
    collectionView?.reloadData()
  }
  
}
