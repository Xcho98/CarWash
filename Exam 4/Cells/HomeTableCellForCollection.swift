//
//  HomeTableCellForCollection.swift
//  Exam 4
//
//  Created by XchoBeglaryan on 27.05.21.
//

import UIKit

struct DataModel {
    var image: UIImage
    var imageName: String
}
class HomeTableCellForCollection: UITableViewCell {

    @IBOutlet weak var collection: UICollectionView!
    var data: [DataModel] = []
    var image1: [UIImage] = [#imageLiteral(resourceName: "motorist"), #imageLiteral(resourceName: "xodovik"), #imageLiteral(resourceName: "electric")]
    var texts = ["Matorist","Xodovik", "Diagnostic"]
    override func awakeFromNib() {
        super.awakeFromNib()
        delegates()
        creatingData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func delegates() {
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }
    func creatingData() {
        for i in 0..<image1.count {
            data.append(DataModel(image: image1[i], imageName: texts[i]))
        }
    }
}
extension HomeTableCellForCollection: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.images.image = image1[indexPath.row]
        cell.imageName.text = texts[indexPath.row]
        return cell
    }
    
    
}
