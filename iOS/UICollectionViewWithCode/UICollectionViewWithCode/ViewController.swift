//
//  ViewController.swift
//  UICollectionViewWithCode
//
//  Created by Jackie Thind on 3/27/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit

class CustomCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    // name a custom cell
    let customCellIdentifier = "customCellIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // test to see if view controller is connecting to the ui screen
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: customCellIdentifier)
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIdentifier, for: indexPath) as! CustomCell
        customCell.nameLabel.text = names[indexPath.item]
        return customCell
    }
    
    let names = ["Mark Zuckerburg", "Bill Gates", "Steve Jobs"]
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    // size the collection view from default 50 by 50 px, they have a default value of 10 px bottom padding
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}

class CustomCell: UICollectionViewCell {
    // lets fill the cells with labels
    // init frame is called with collection view deques a cell
    override init(frame:CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom Text"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }() // this is an execution of creating a nameLabel
    // this is a hook that we will use to make a custom label
    func setupViews() {
        backgroundColor = UIColor.red
        addSubview(nameLabel)
        // H means horizontally || means bounds left and right, v[0] expand by this so it touches the bounds
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : nameLabel]))
    }
    // swift specific compile error that needs to be fixed
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
