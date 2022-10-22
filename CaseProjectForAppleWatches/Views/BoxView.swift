//
//  BoxView.swift
//  CaseProjectForAppleWatches
//
//  Created by Ataberk on 22.10.2022.
//

import SwiftUI

struct BoxView: View {

    let colorCode : Int
    @State var number : Int
    
    var body: some View {
        
        let colorList = [
            1 : Color.green,
            2 : Color.init(red: 0, green: 32/255, blue: 133/255),
            3 : Color.red
        ]
        
        ZStack(alignment: .bottomTrailing, content: {
            colorList[colorCode]
            Text(String(number))
                .foregroundColor(.white)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .padding(8)
        })
        .frame(width: SGConvenience.deviceWidth / 6 , height: SGConvenience.deviceWidth / 6,alignment: .bottomTrailing)
        .cornerRadius(10)
    }
}

struct Box_Previews: PreviewProvider {
    static var previews: some View {
        BoxView(colorCode: 2, number: 0)
    }
}
