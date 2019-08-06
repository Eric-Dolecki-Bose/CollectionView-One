//
//  ViewController.swift
//  CollectionView
//
//  Created by Eric Dolecki on 8/5/19.
//  Copyright © 2019 Eric Dolecki. All rights reserved.
//
//  Up the irons!
//  =============
//  Running, scrambling, flying
//  Rolling, turning, diving, going in again
//  Running, scrambling, flying
//  Rolling, turning, diving
//  Run, live to fly, fly to live, do or die
//  Won't you run, live to fly, fly to live, Aces high.

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, SquareFlowLayoutDelegate
{
    var myCollectionView:   UICollectionView!
    let reuseIdentifier = "cellIdentifier"
    let titles:[String] = ["Playful foxes.", "Hmmm...","Galadriel.", "Shhh...", "Yawn.", "Alert.", "Smokey.", "Rascal.", "Group."]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let flowLayout = SquareFlowLayout()
        flowLayout.flowDelegate = self
        flowLayout.scrollDirection = .vertical
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize //to grow as needed?
        
        myCollectionView = UICollectionView(frame: CGRect(x: 10, y: 100, width: self.view.frame.width - 20, height: 235), collectionViewLayout: flowLayout)
        myCollectionView.backgroundColor = UIColor.white
        myCollectionView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        myCollectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: reuseIdentifier)
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.indicatorStyle = .white
        myCollectionView.scrollIndicatorInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 5)
        myCollectionView.isPagingEnabled = false
        
        self.view.addSubview(myCollectionView)
    }

    //MARK: - CollectionView Protocols
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
        cell.backgroundColor = UIColor.lightGray
        cell.myLabel.text = "\(indexPath.row)"
        cell.myImageView.image = UIImage(named: "\(indexPath.row).jpg")
        cell.myTitleLabel.text = titles[indexPath.row].uppercased()
        return cell
    }
    
    // Specific to the SquareFlowLayoutDelegate.
    func shouldExpandItem(at indexPath: IndexPath) -> Bool {
        if indexPath.row == 0 || indexPath.row == 5 {
            return true
        } else {
            return false
        }
    }
}

