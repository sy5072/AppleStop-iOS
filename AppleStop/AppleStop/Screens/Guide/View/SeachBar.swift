//
//  SeachBar.swift
//  AppleStop
//
//  Created by 김보영 on 2022/04/10.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText = ""
    @State var searching = false
    
    let myFruits = [
        "Apple 🍏", "Banana 🍌", "Blueberry 🫐", "Strawberry 🍓", "Avocado 🥑", "Cherries 🍒", "Mango 🥭", "Watermelon 🍉", "Grapes 🍇", "Lemon 🍋"
    ]
    
    let guideCards = ["플라스틱", "종이", "비닐", "유리"]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                SearchBar(searchText: $searchText, searching: $searching)
                
                List {
                    ForEach(myFruits.filter({ (fruit: String) -> Bool in
                        return fruit.hasPrefix(searchText) || searchText == ""
                    }), id: \.self) {
                        fruit in Text(fruit)
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationTitle(searching ? "Searching" : "MyFruits")
                .toolbar {
                    if searching {
                        Button("Cancel") {
                            searchText = ""
                            withAnimation {
                                searching = false
                                UIApplication.shared.dismissKeyboard()
                            }
                        }
                    }
                }
                .gesture(DragGesture()
                            .onChanged({ _ in
                    UIApplication.shared.dismissKeyboard()
                })
                )
            }
        }
    }
}


struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var searching: Bool
    
    var body: some View {
        ZStack {
            Color.backgroundGrey
                .ignoresSafeArea()
            
            Rectangle()
                .foregroundColor(.white)
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                TextField("분리수거 방법을 검색하세요(ex. 플라스틱)", text: $searchText) { startedEditing in
                    if startedEditing {
                        withAnimation {
                            searching = true
                        }
                    }
                } onCommit: {
                    withAnimation {
                        searching = false
                    }
                }
            }
            .padding(.leading, 12)
        }
        .frame(height: 40)
        .cornerRadius(8)
        .padding(.vertical)
        .customShadow()
    }
}

struct SeachBar_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
        
    }
}

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
