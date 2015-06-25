import UIKit
import Scrollable

class ViewController: UIViewController {
  @IBOutlet weak var scrollView: UIScrollView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    Scrollable.createContentView(scrollView)   
  }
}

