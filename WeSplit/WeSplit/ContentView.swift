//
//  ContentView.swift
//  WeSplit
//
//  Created by Shariq Nadeem Malik on 11/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberofPeaople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountisFocused: Bool
    
    
    let tipPercentages = [10, 20, 25, 15, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberofPeaople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalAmount: Double {
        let total = totalPerPerson * Double(numberofPeaople + 2)
        return total
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD") )
                        .keyboardType(.decimalPad)
                        .focused($amountisFocused)
                    
                    Picker("Number of People", selection: $numberofPeaople){
                        ForEach(2..<100){
                            Text("\($0) People")
                        }
                    }
                }
                
                Section{
                    Picker("Tip Percentages", selection: $tipPercentage){
                        ForEach(0..<101){
                            Text($0, format: .percent)
                        }
                    }
                }header: {
                    Text("How much tip do you want to leave ?")
                }
                
                Section{
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }header: {
                    Text("Amount per person")
                }
                
                Section{
                    Text(totalAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }header: {
                    Text("Total Amount")
                }
                
                
                .navigationTitle("WeSplit")
                .toolbar{
                    ToolbarItem(placement: .keyboard) {
                        Button("Done"){
                            amountisFocused = false
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
