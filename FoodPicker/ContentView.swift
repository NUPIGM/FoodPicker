//
//  ContentView.swift
//  FoodPicker
//
//  Created by Meei Chyun on 2025/10/21.
//

import SwiftUI

struct ContentView: View {
    let foods:Array = [
        "苹果", "香蕉", "披萨", "汉堡", "寿司",
        "面条", "沙拉", "牛排", "蛋糕", "冰淇淋"
    ]
    @State private var selectedFood:String?
    
    var body: some View {
        VStack(spacing: 30) {
            Image( "dinner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(40)
                
            Text("今天吃什么？")
                .bold()
            if selectedFood != nil{
                Text(selectedFood ?? "还没选好")
                    .bold()
                    .foregroundStyle(.green)
//                    .transition(.asymmetric(
//                        insertion: .opacity
//                                    .animation(.easeInOut(duration: 0.5).delay(0.2)),
//                        removal: .opacity
//                                    .animation(.easeInOut(duration: 0.4))))
                    
            }
            
            Button(role: .confirm,action: {
                selectedFood = foods.shuffled().first
                },label: {
                    Text( selectedFood == nil ? "告诉我" : "切换" )
                    .frame(width: 200,alignment: .center)
                })
            .buttonStyle(.glassProminent)
            .controlSize(.large)
            .padding(.bottom,-15)
            
            Button(role: .none,action: {
                selectedFood = nil
                },label: {
                    Text("重置")
                    .frame(width: 200)
                })
            .buttonStyle(.glass)
        }
        .font(.title)
        .frame(maxHeight: .infinity)
        .background(Color(.secondarySystemBackground))
        .animation(.easeInOut(duration: 1), value: selectedFood)

    }
}

#Preview {
    ContentView()
}
