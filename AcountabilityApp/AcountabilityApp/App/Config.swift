//
//  Config.swift
//  AcountabilityApp
//
//  Created by Daniel W on 2/18/25.
//


import Foundation

struct Config {
    static func getAPIKey() -> String {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "OpenAIAPIKey") as? String else {
            print("⚠️ Warning: API key is missing from Info.plist")
            return "" // Return a safe default value to prevent crashes
        }
        return apiKey
    }
}
