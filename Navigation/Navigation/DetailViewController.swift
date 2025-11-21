import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!

    var item: CellItem?   // <-- The selected cell data

    override func viewDidLoad() {
        super.viewDidLoad()

        if let item = item {
            itemImageView.image = item.image
            titleLabel.text = item.title
            subtitleLabel.text = item.subtitle
            reviewLabel.text = item.review
        }
    }
}
