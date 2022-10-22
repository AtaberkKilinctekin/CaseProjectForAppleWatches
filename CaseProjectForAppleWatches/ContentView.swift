//
//  ContentView.swift
//  CaseProjectForAppleWatches
//
//  Created by Ataberk on 22.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var boxViewModel: BoxViewModel = BoxViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black.opacity(0.74)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    Button("Add") {
                        for i in 0..<boxViewModel.boxes.count {
                            boxViewModel.boxes[i].number += 1
                        }
                    }
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .frame(width: 100, height: 50)
                    .cornerRadius(10)
                    .background(Rectangle().fill(Color.white.opacity(0.8)).cornerRadius(20))
                    
                    Spacer()

                    Button("Reset") {
                        for i in 0..<boxViewModel.boxes.count {
                            boxViewModel.boxes[i].number = 0
                        }
                    }
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .frame(width: 100, height: 50)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .background(Rectangle().fill(Color.red).cornerRadius(20))
                    
                    Spacer()

                }
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: UIScreen.main.bounds.size.width / 6))], content: {
                        ForEach(boxViewModel.boxes, id: \.self) { item in
                            BoxView(colorCode: item.colorCode, number: item.number)
                                .onTapGesture {
                                    for i in 0..<boxViewModel.boxes.count {
                                        if(item.colorCode == 1 && item.id == boxViewModel.boxes[i].id) { boxViewModel.boxes[i].number += 1 }
                                        if(item.colorCode == 2 && item.id == boxViewModel.boxes[i].id) { boxViewModel.boxes[i].number += 2 }
                                        if(item.colorCode == 3 && item.id == boxViewModel.boxes[i].id) { boxViewModel.boxes[i].number += 3 }
                                    }
                                }
                        }
                    })
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Test Case")
            }.padding(10)
        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
