//
//  ProductsVC.swift
//  Caffeine and Me
//
//  Created by Mitchell Schuster on 11/2/21.
//

import UIKit

class ProductsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var productsCollection: UICollectionView!

    private(set) public var products = [Product]()
    
    var newCaffeineContent: Int = 500
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productsCollection.dataSource = self
        productsCollection.delegate = self
        
    }
    
    func showActionSheet() {

        let textAlert = UIAlertController(title: "ESTIMATE", message: "Please estimate amount of caffeine using serving suggestion", preferredStyle: .alert)

        textAlert.addTextField { (textField) in
            textField.placeholder = "Type in the estimated mg of caffeine"
            textField.keyboardType = .numberPad
        }

        textAlert.addAction(UIAlertAction(title: "Submit", style: .default, handler: { _ in

            if (textAlert.textFields![0].text!.isEmpty)  {
                textAlert.dismiss(animated: true, completion: nil)
            } else {

                if let userText = Int(textAlert.textFields![0].text!) {
                    self.newCaffeineContent = userText
                    
                } else {
                    print("didn't work")
                }
                self.performSegue(withIdentifier: "CategoriesVC", sender: self)
            }

        }))

        textAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
        }))

        present(textAlert, animated: true)
    }

    func initProducts(category: Category) {
        products = DataService.instance.getProducts(forCategoryTitle: category.title)
        navigationItem.title = category.title
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
            let product = products[indexPath.row]
            cell.updateViews(product: product)
            return cell
        } else {
            return ProductCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showActionSheet()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cvc = segue.destination as? CategoriesVC {
            cvc.receivedCaf = newCaffeineContent
            
            let barBtn = UIBarButtonItem()
            barBtn.title = ""
            navigationItem.backBarButtonItem = barBtn
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((self.view.frame.size.width/2)-5), height: 255)
        }

}
