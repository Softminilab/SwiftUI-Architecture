//
//  AddItemView.swift
//  Todolist
//
//  Created by 0x2ab70001b1 on 2023/8/5.
//

import SwiftUI

struct AddItemView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var textFieldText: String = ""
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            TextField(text: $textFieldText) {
                Text("说点啥...")
            }
            .padding()
            .background(Color(uiColor: UIColor.secondarySystemBackground))
            .cornerRadius(10)
            
            Button {
                saveAction()
            } label: {
                Text("Save")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor.cornerRadius(10))
            }
            Spacer()
        }
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
        .padding()
        .navigationTitle("Add Item 🖋️")
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    func saveAction() {
        guard textFieldText.count > 3 else {
            alertTitle = "必须大于三个字符🥲"
            showAlert = true
            return
        }
        
        listViewModel.addItem(title: textFieldText)
        dismiss()
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddItemView()
        }
        .preferredColorScheme(.dark)
    }
}
