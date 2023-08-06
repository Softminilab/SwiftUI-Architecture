//
//  ListRowView.swift
//  Todolist
//
//  Created by 0x2ab70001b1 on 2023/8/5.
//

import SwiftUI

struct ListRowView: View {
    var item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
            Text(item.content)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static let itemModel = ItemModel(content: "买一个鸡蛋", isCompleted: false)
    static let itemModel2 = ItemModel(content: "买一把青菜🥬", isCompleted: true)
    static var previews: some View {
        Group {
            ListRowView(item: itemModel)
            ListRowView(item: itemModel2)
        }
    }
}
