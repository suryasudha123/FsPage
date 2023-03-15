//
//  ViewController.swift
//  FSPageview
//
//  Created by RP-14 on 15/03/23.
//

import UIKit
import FSPagerView

class ViewController: UIViewController,FSPagerViewDelegate,FSPagerViewDataSource {

    @IBOutlet weak var fspage: FSPagerView!
    
 let imgarray = ["img1","img2","img3","img4","img5"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fspage.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        fspage.transformer = FSPagerViewTransformer(type:.invertedFerrisWheel)
        fspage.delegate = self
        fspage.dataSource = self
        fspage.automaticSlidingInterval = 2.0
        print("hy")
    }

    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imgarray.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index) as! FSPagerViewCell
        cell.textLabel?.text = "Text:\(index)"
        cell.imageView?.image = UIImage(named: imgarray[index])
        return cell
    }
}

