//
//  CoffeeIntelligence.swift
//  coffeeai
//
//  Created by Alex Logan on 10/06/2025.
//

import Foundation
import FoundationModels

@Observable
@MainActor
final class CoffeeIntelligence {
    var session: LanguageModelSession

    private let coffeeTool: CoffeeTool

    private(set) var reccomendation: CoffeeReccomendation.PartiallyGenerated?
    private var error: Error?

    init() {
        let coffeeTool = CoffeeTool()

        self.session = LanguageModelSession(
            guardrails: .default,
            tools: [coffeeTool],
            instructions: Instructions {
                "Your job is to reccomend a coffee for the user, available at the shop Alex's Coffee."

                "You must take into account all details of their query, such as milk preference and taste"

                """
                Always use the coffeetool tool to find coffees available at Alex's Coffee, to reccomend based on their query, as these are the ones we actually sell.
                """
        })

        self.coffeeTool = coffeeTool

        session.prewarm()
    }

    func generate(prompt: String) async throws {
        do {
            let stream = session.streamResponse(
                to: Prompt {
                   """
                   Use the coffeetool tool to find coffees to reccomend based on their query, which is below, as these are the ones we actually sell.
                   
                   Find a coffee for the user based on their query, which is below.
                   \(prompt)
                   """
                },
                generating: CoffeeReccomendation.self,
                includeSchemaInPrompt: false, options: GenerationOptions(sampling: .greedy)
            )

            for try await partialResponse in stream {
                reccomendation = partialResponse
            }

            for entry in session.transcript.entries {
                print("===================")
                print(entry)
            }
        } catch {
            print(error.localizedDescription)
            print(error)
            self.error = error
        }
    }

}

@Generable
struct CoffeeReccomendation: Equatable {
    @Guide(description: "A coffee to reccomend")
    let name: String
    @Guide(description: "The description of the coffee")
    let description: String

    @Guide(description: "The reason for this reccomendation")
    let reason: String
}
