//
//  ContentView.swift
//  coffeeai
//
//  Created by Alex Logan on 10/06/2025.
//

import SwiftUI
import FoundationModels

struct ContentView: View {
    @State var coffeeIntelligence: CoffeeIntelligence = .init()
    @State var prompt: String = ""

    var body: some View {
        List {
            TextField("How do you like your coffee?", text: $prompt)

            Button(action: {
                Task {
                    try? await coffeeIntelligence.generate(prompt: prompt)
                }
            }, label: {
                HStack {
                    Image(systemName: "sparkles")
                    Text("Generate")

                    Spacer()

                    if coffeeIntelligence.session.isResponding {
                        ProgressView()
                    }

                }
                .font(.headline.weight(.semibold))
            })
            .disabled(coffeeIntelligence.session.isResponding)

            if let reccomendation = coffeeIntelligence.reccomendation {
                Section(header: Text("Reccomendation"), content: {
                    VStack(alignment: .leading) {
                        Text(reccomendation.name ?? "")
                            .font(.headline)
                            .foregroundStyle(.primary)
                        Text(reccomendation.description ?? "")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                })
                Section(header: Text("Reasoning"), content: {
                    Text(reccomendation.reason ?? "")
                })
            }
        }
        .animation(.smooth, value: coffeeIntelligence.reccomendation)
        .animation(.smooth, value: coffeeIntelligence.session.isResponding)
    }
}

#Preview {
    ContentView()
}
