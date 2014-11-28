//
//  ViewController.swift
//  scrolled-content
//
//  Created by Evgenii Neumerzhitckii on 28/11/2014.
//  Copyright (c) 2014 The Exchange Group Pty Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var scrollView: UIScrollView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    TegScrolledContent.createContentView(scrollView)
   
    println("Scroll view constraints \(scrollView.constraints().count)")
  }
}

