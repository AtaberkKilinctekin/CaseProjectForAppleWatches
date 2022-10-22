//
//  ContentView.swift
//  CaseProjectForAppleWatches Watch App
//
//  Created by Ataberk on 22.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var boxViewModel: BoxViewModel = BoxViewModel()
    
    var body: some View {
        ZStack {
            
            Color.gray.opacity(0.4)
                .ignoresSafeArea()
            
            VStack {
                HStack(spacing:0) {
                    Button("Add") {
                        for i in 0..<boxViewModel.boxes.count {
                            boxViewModel.boxes[i].number += 1
                        }
                    }
                    .font(.system(size: 19))
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .padding(4)
                    .buttonStyle(.borderedProminent)
                    .accentColor(.white.opacity(0.8))
                    
                    

                    Button("Reset") {
                        for i in 0..<boxViewModel.boxes.count {
                            boxViewModel.boxes[i].number = 0
                        }
                    }
                        .font(.system(size: 19))
                        .fontWeight(.bold)
                        .padding(4)
                        .buttonStyle(.borderedProminent)
                        .accentColor(.red)
                        .foregroundColor(.white)

                    

                }
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: SGConvenience.deviceWidth / 6))], content: {
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
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
