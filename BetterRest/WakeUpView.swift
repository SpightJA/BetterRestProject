//
//  WakeUpView.swift
//  BetterRest
//
//  Created by Jon Spight on 5/12/24.
//

import SwiftUI

struct WakeUpView: View {
    @Binding var wakeup : Date
    var body: some View {
        Section("When do you want to wake up?") {
            HStack {
                Spacer()
                DatePicker("Time to wake up", selection: $wakeup, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.secondaryBlue)
            }
        }
        .listRowBackground(Color.clear)
        
    }
}

#Preview {
    WakeUpView(wakeup: .constant(.now))
}
