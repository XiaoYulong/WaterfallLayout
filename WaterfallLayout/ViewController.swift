//
//  ViewController.swift
//  WaterfallLayout
//
//  Created by yuxiao on 2019/11/15.
//  Copyright © 2019 yuxiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var collectionView: UICollectionView?
    private var contents = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareData()
        let waterfallLayout = WaterfallLayout()
        waterfallLayout.delegate = self
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: waterfallLayout)
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        collectionView.register(LabelCell.self, forCellWithReuseIdentifier: LabelCell.description())
        
        self.collectionView = collectionView
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelCell.description(), for: indexPath) as! LabelCell
        cell.configWith(string: contents[indexPath.item])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
}

extension ViewController: WaterfallLayoutDelegate {
    func hieghtModeFor(_ indexPath: NSIndexPath,
    of layout: WaterfallLayout,
    collectionView: UICollectionView) -> WaterfallLayoutCellHeightMode {
        return .dynamic
    }
}

extension ViewController {
    func prepareData() {
        contents.append("放弃诶过IG诶给我")
        contents.append("fheigeieg符合你分别风格我从vfdiiuvbbrrofherowhfhdohfdpvhdvpdvhp")
        contents.append("fjheofheoifheofhewqogfhero")
        contents.append("fheofheo非黑疯Gigi个fig分GFUI发挥各个废物狗肺癌是更大师傅测1分工二姑姑吧复合肥给与发VR平大V货币化；感觉热耦合购房人")
        contents.append("fjhewoh")
        contents.append("fesf")
    }
}

