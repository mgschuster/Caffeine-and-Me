//
//  ViewController.swift
//  Caffeine and Me
//
//  Created by Mitchell Schuster on 11/2/21.
//

import UIKit

var currentCaf: Int = 500

class CategoriesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var receivedCaf: Int = 0
    @IBOutlet weak var undoBtn: UIButton!
    
    @IBOutlet weak var totalCaffeine: UILabel!
    @IBOutlet weak var categoryTable: UITableView!
    @IBOutlet weak var dailyLimitText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTable.dataSource = self
        categoryTable.delegate = self
        categoryTable.rowHeight = 155
        
        navigationItem.hidesBackButton = true
        totalCaffeine.text = "\(newCaf())" + "mg"
    }
    
    func newCaf() -> Int {
        let finalCaf = currentCaf - receivedCaf
        
        if finalCaf < 500 && finalCaf >= 0 {
            currentCaf = finalCaf
            undoBtn.isHidden = false
            return finalCaf
        } else if finalCaf == 500 {
            undoBtn.isHidden = true
            return finalCaf
        } else {
            
            let negativeCaf = finalCaf * -1
            
            let exceedMessage = UIAlertController(title: "WARNING", message: "You have exceeded your daily caffeine limit by \(negativeCaf)mg!", preferredStyle: .alert)
            
            exceedMessage.addAction(UIAlertAction(title: "CLOSE", style: .destructive, handler: {action in
                
            }))
            
            currentCaf = finalCaf
            undoBtn.isHidden = false
            
            categoryTable.allowsSelection = false
            present(exceedMessage, animated: true)
            dailyLimitText.isHidden = false
            return finalCaf
        
        }
    }
    
    func resetCaf() -> Int {
        let finalResetCaff = currentCaf + receivedCaf
        currentCaf = finalResetCaff
        return finalResetCaff
    }
    
    func showAlert() {
        
        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you'd like to reset your caffeine intake?", preferredStyle: .alert)
        
        dialogMessage.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
        }))
        
        dialogMessage.addAction(UIAlertAction(title: "Reset", style: .destructive, handler: { action in
            self.totalCaffeine.text = "500mg"
            currentCaf = 500
            self.dailyLimitText.isHidden = true
            self.categoryTable.allowsSelection = true
            self.undoBtn.isHidden = true
        }))
        
        present(dialogMessage, animated: true)
    }
    
    func showUndoAlert() {
        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you'd like to undo your latest caffeine intake log?", preferredStyle: .alert)
        
        dialogMessage.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
        }))
        
        dialogMessage.addAction(UIAlertAction(title: "Undo", style: .destructive, handler: { action in
            self.totalCaffeine.text = "\(self.resetCaf())mg"
            self.undoBtn.isHidden = true
            
            self.categoryTable.allowsSelection = true
            self.dailyLimitText.isHidden = true
        }))
        
        present(dialogMessage, animated: true)
    }
    
    @IBAction func resetBtn(_ sender: UIButton) {
        showAlert()
    }
    
    
    @IBAction func undoBtn(_ sender: UIButton) {
        showUndoAlert()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            let category = DataService.instance.getCategories()[indexPath.row]
            cell.updateViews(category: category)
            return cell
        } else {
            return CategoryCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.row]
        performSegue(withIdentifier: "ProductsVC", sender: category)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productsVC = segue.destination as? ProductsVC {
            
            let barBtn = UIBarButtonItem()
            barBtn.title = ""
            navigationItem.backBarButtonItem = barBtn
            
            assert(sender as? Category != nil)
            productsVC.initProducts(category: sender as! Category)
            
        }
    }

}

