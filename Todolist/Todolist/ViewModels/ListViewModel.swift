//
//  ListViewModel.swift
//  Todolist
//
//  Created by 0x2ab70001b1 on 2023/8/5.
//

import Foundation

class ListViewModel: ObservableObject {
    
    enum Constants {
        static let KSaveName = "item_save_key"
    }
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItem()
        }
    }
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard let anyObject = UserDefaults.standard.object(forKey: Constants.KSaveName),
              let data = anyObject as? Data else { return }
        
        do {
            items = try JSONDecoder().decode([ItemModel].self, from: data)
        } catch {
            print("\(error)")
        }
    }
    
    func moveItem(indexSet: IndexSet, index: Int) {
        items.move(fromOffsets: indexSet, toOffset: index)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func addItem(title: String) {
        let itemModel = ItemModel(content: title, isCompleted: false)
        items.append(itemModel)
    }
    
    func updateItem(_ itemModel: ItemModel) {
        guard let index = items.firstIndex(where: { $0.id == itemModel.id }) else { return }
        items[index] = itemModel.updateItem()
    }
    
    func saveItem() {
        do {
            let data = try JSONEncoder().encode(items)
            UserDefaults.standard.set(data, forKey: Constants.KSaveName)
        } catch {
            print("\(error)")
        }
    }
}
