import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var scrollView: UIScrollView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    TegScrolledContent.createContentView(scrollView)
   
    print("Scroll view constraints \(scrollView.constraints.count)")
  }
}

