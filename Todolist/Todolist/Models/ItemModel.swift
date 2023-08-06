//
//  ItemModel.swift
//  Todolist
//
//  Created by 0x2ab70001b1 on 2023/8/5.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let content: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, content: String, isCompleted: Bool) {
        self.id = id
        self.content = content
        self.isCompleted = isCompleted
    }
    
    func updateItem() -> ItemModel {
        return ItemModel(id: self.id, content: self.content, isCompleted: !self.isCompleted)
    }
}
