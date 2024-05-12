//
//  BedTimeView.swift
//  BetterRest
//
//  Created by Jon Spight on 5/12/24.
//

import SwiftUI

struct BedTimeView: View {
    @Binding var idealSleep : String
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .foregroundStyle(.secondaryBlue)
            Image(.footer)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            HStack {
                Text("Bed time \(idealSleep)")
                    .font(.largeTitle).fontWeight(.black)
                    .foregroundStyle(.text)
                
                    .padding()
                Spacer()
            }
            .offset(CGSize(width: 10.0, height: -20.0))
            
        }
        .frame(maxHeight: 200)
        .padding(.horizontal, 30)
    }
}

#Preview {
    BedTimeView(idealSleep: .constant("Now"))
}
