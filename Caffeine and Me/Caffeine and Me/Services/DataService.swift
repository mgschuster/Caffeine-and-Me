//
//  DataService.swift
//  Caffeine and Me
//
//  Created by Mitchell Schuster on 11/2/21.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    private let categories = [
        Category(title: "COFFEE", imageName: "Coffee-1.jpg"),
        Category(title: "ENERGY DRINKS", imageName: "Energy-1.jpg"),
        Category(title: "TEA", imageName: "Tea.jpg"),
        Category(title: "OTHER", imageName: "Other.jpg")
    ]
    
    private let coffee = [
        Product(title: "Latte", caffeineContent: " 8oz: 75mg", imageName: "Latte.jpg"),
        Product(title: "Americano", caffeineContent: "8oz: 77mg", imageName: "Americano.jpg"),
        Product(title: "Black Coffee", caffeineContent: "8oz: 95mg", imageName: "BC.jpg"),
        Product(title: "Macchiato", caffeineContent: "8oz: 69mg", imageName: "Macchiato.jpg"),
        Product(title: "Espresso", caffeineContent: "8oz: 115mg", imageName: "Espresso.jpg")
    ]
    
    private let energyDrinks = [
        Product(title: "Monster Ultra Sunrise", caffeineContent: "1 can: 75mg", imageName: "MES.jpg"),
        Product(title: "Sugar Free NOS", caffeineContent: "1 can: 130mg", imageName: "SFN.jpg"),
        Product(title: "5 Hour Energy", caffeineContent: "1 can: 200mg", imageName: "5HE.jpg"),
        Product(title: "Alani", caffeineContent: "1 can: 200mg", imageName: "Alani.jpg")
    ]
    
    private let tea = [
        Product(title: "White Tea", caffeineContent: "8oz: 55mg", imageName: "WT.jpg"),
        Product(title: "Green Tea", caffeineContent: "8oz: 65mg", imageName: "GT.jpg"),
        Product(title: "Herbal Tea", caffeineContent: "8oz: 71mg", imageName: "HT.jpg"),
        Product(title: "Black Tea", caffeineContent: "8oz: 77mg", imageName: "BT.jpg")
    ]
    
    private let other = [
        Product(title: "BCAA", caffeineContent: "1 scoop: 115mg", imageName: "BCAA.jpg")
    ]
    
    private let digitalGoods = [Product]()
    
    func getCategories() -> [Category] {
        return categories
    }
    
    func getProducts(forCategoryTitle title: String) -> [Product] {
        switch title {
        case "COFFEE":
            return getCoffee()
        case "ENERGY DRINKS":
            return getEnergyDrinks()
        case "TEA":
            return getTea()
        case "OTHER":
            return getOther()
        default:
            return getCoffee()
        }
    }
    
    func getCoffee() -> [Product] {
        return coffee
    }
    
    func getEnergyDrinks() -> [Product] {
        return energyDrinks
    }
    
    func getTea() -> [Product] {
        return tea
    }
    
    func getOther() -> [Product] {
        return other
    }
    
    
}
