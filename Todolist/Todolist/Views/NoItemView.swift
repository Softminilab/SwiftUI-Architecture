//
//  NoItemView.swift
//  Todolist
//
//  Created by 0x2ab70001b1 on 2023/8/6.
//

import SwiftUI

struct NoItemView: View {
    
    @State var showAnimation: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image("placeholder")
                .resizable()
                .scaledToFit()
                .frame(width: 260, height: 260)
            Text("哦，列表里面啥都没有")
                .font(.subheadline)
                .fontWeight(.semibold)
            Text("你是一个非常有效率的人？试着写点什么。请点击下方按钮，开始吧！")
            
            NavigationLink {
                AddItemView()
            } label: {
                Text("Add")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(showAnimation ? Color.accentColor : Color("background_color_1"))
                    .cornerRadius(10)
            }
            .padding(.horizontal, showAnimation ? 30 : 40)
            .shadow(
                color:
                    showAnimation ? Color.accentColor.opacity(0.7) : Color("background_color_1").opacity(0.7),
                radius: showAnimation ? 30 : 10,
                y: showAnimation ? 10 : 20
            )
            .scaleEffect(showAnimation ? 1.1 : 1.0)
            .offset(y: showAnimation ? -7 : 0)
            Spacer()
        }
        .padding()
        .multilineTextAlignment(.center)
        .frame(maxWidth: 400, maxHeight: .infinity)
        .onAppear(perform: {
            guard !showAnimation else { return }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                withAnimation(
                    Animation
                        .easeInOut(duration: 2.0)
                        .repeatForever()
                ) {
                    showAnimation.toggle()
                }
            })
        })
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemView()
        }
        .navigationTitle("Todo list")
        .preferredColorScheme(.dark)
    }
}
