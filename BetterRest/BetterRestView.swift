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
        NavigationStack {
            
            ZStack{
                VStack{
                    Form {
                        WakeUpView(wakeup: $viewModel.wakeUp)
                        SleepAmountView(sleepAmount: $viewModel.SleepHours)
                        CoffeeIntakeView(coffeeAmount: $viewModel.coffeeAmount)
                    }
                    .scrollContentBackground(.hidden)
                    .scrollBounceBehavior(.basedOnSize)
                    .frame(maxHeight: 420 )
                    Spacer()
                    BedTimeView(idealSleep: $viewModel.idealSleep)
                        
                    Spacer()
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
            .padding()
            .overlay{
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.secondaryBlue)
            }
        }
    }
}

struct SleepAmountView: View {
    @Binding var sleepAmount : Double
    var body: some View {
        Section("Daily amount of sleep"){
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12 ,step: 0.25)
                .padding()
                
                .overlay{
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(lineWidth: 2)
                        .foregroundStyle(.secondaryBlue)
                    
                }
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
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.secondaryBlue)
            }
        }
    }
}

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
