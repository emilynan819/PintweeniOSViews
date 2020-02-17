//
//  Helper.swift
//  POI4
//   A small collection of quick helpers to avoid repeating the same old code.
//
//  Created by Emily Nan on 2019/10/31.
//  Copyright © 2019 Emily Nan. All rights reserved.
//

import UIKit

let poi = Bundle.main.decode([POIItem].self, from: "poiData.json")
   

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
