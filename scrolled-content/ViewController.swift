import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var scrollView: UIScrollView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    TegScrolledContent.createContentView(scrollView)
   
    println("Scroll view constraints \(scrollView.constraints().count)")
  }
}

