//
//  ContentView.swift
//  Todolist
//
//  Created by 0x2ab70001b1 on 2023/8/5.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemView()
                    .transition(AnyTransition.opacity.animation(Animation.easeInOut(duration: 0.35)))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                listViewModel.updateItem(item)
                            }
                    }
                    .onMove(perform: listViewModel.moveItem)
                    .onDelete(perform: listViewModel.deleteItem)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Todo list 📝")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading, content: {
                EditButton()
            })
            
            ToolbarItem(placement: .navigationBarTrailing, content: {
                NavigationLink(destination: AddItemView()) {
                    Text("Add")
                }
            })
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var listViewModel: ListViewModel = ListViewModel()
    static var previews: some View {
        NavigationView {
            ListView()
        }.environmentObject(listViewModel)
    }
}
