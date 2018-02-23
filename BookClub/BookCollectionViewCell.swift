import UIKit
import Cosmos

class BookCollectionViewCell: UICollectionViewCell {
 
  @IBOutlet var bookName: UILabel?
  @IBOutlet var dateRead: UILabel?
  @IBOutlet var starRating: CosmosView?
  
}
