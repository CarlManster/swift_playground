//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

extension UIColor {
    static var indigo: UIColor {
        return UIColor(red: 75.0/255.0, green: 0.0, blue: 130.0/255.0, alpha: 1.0)
    }
}

class TestCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    struct UIConstant {
        static let size = CGSize(width: 50.0, height: 100.0)
    }
    
    class TestCollectionViewLayout: UICollectionViewFlowLayout {
        override init() {
            super.init()
            itemSize = UIConstant.size
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError()
        }
    }
    
    class TestCollectionViewCell: UICollectionViewCell {
        
    }
    
    init() {
        super.init(collectionViewLayout: TestCollectionViewLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.backgroundColor = .white
        self.collectionView?.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: "HelloCellId")
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HelloCellId", for: indexPath)
        switch (indexPath.row % 7) {
        case 0:
            cell.backgroundColor = .red
        case 1:
            cell.backgroundColor = .orange
        case 2:
            cell.backgroundColor = .yellow
        case 3:
            cell.backgroundColor = .green
        case 4:
            cell.backgroundColor = .blue
        case 5:
            cell.backgroundColor = .indigo
        case 6:
            cell.backgroundColor = .purple
        default:
            cell.backgroundColor = .white
        }
        print("cell! == \(indexPath)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        print("size!")
        
        return UIConstant.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.0
    }
}

PlaygroundPage.current.liveView = TestCollectionViewController()
