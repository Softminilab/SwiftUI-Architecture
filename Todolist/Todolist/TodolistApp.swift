//
//  TodolistApp.swift
//  Todolist
//
//  Created by 0x2ab70001b1 on 2023/8/5.
//

import SwiftUI

@main
struct TodolistApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
