//
//  ContentView.swift
//  BetterRest
//
//  Created by Jon Spight on 4/14/24.
//
import CoreML
import SwiftUI

struct BetterRestView: View {
    @State private var viewModel  = BetterRestViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                Form {
                    WakeUpView(wakeup: $viewModel.wakeUp)
                    SleepAmountView(sleepAmount: $viewModel.SleepHours)
                    CoffeeIntakeView(coffeeAmount: $viewModel.coffeeAmount)
                }
                .frame(maxHeight: 330 )
                Spacer()
                BedTimeView(idealSleep: $viewModel.idealSleep)
                Spacer()
            }
            .navigationTitle("Better Rest")
            .alert(viewModel.alertTitle, isPresented: $viewModel.showingAlert) {
                Button("Ok"){viewModel.showingAlert.toggle()}
            } message: {
                Text(viewModel.alertMessage)
            }
        }
        .onChange(of: viewModel.SleepHours, initial: true) { _, _ in
            viewModel.CalculateSleep()
        }
        .onChange(of: viewModel.coffeeAmount, initial: true) { _, _ in
            viewModel.CalculateSleep()
        }
    }
}

#Preview {
    BetterRestView()
}

struct CoffeeIntakeView: View {
    @Binding var coffeeAmount : Int
    var body: some View {
        Section("Daily Coffee intake"){
            Picker("^[\(coffeeAmount)](inflect : true) cup", selection: $coffeeAmount) {
                ForEach(1..<21) {
                    Text("\($0)")
                }
            }
        }
    }
}

struct SleepAmountView: View {
    @Binding var sleepAmount : Double
    var body: some View {
        Section("Daily amount of sleep"){
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12 ,step: 0.25)
        }
    }
}

struct WakeUpView: View {
    @Binding var wakeup : Date
    var body: some View {
        Section("When do you want to wake up?") {
            HStack {
                Spacer()
                DatePicker("Time to wake up", selection: $wakeup, displayedComponents: .hourAndMinute)
                    .labelsHidden()
            }
        }
    }
}

struct BedTimeView: View {
    @Binding var idealSleep : String
    var body: some View {
        Text("Bed time is: \(idealSleep)")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .padding()
    }
}
