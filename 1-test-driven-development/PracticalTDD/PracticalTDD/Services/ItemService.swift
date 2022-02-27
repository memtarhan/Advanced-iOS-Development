//
//  ItemService.swift
//  PracticalTDD
//
//  Created by Mehmet Tarhan on 27/02/2022.
//

import Foundation

class ItemService {
    let isTest: Bool

    init(isTest: Bool = false) {
        self.isTest = isTest
    }

    func getItems(_ completion: ([Item]) -> Void) {
        completion(getMockItems())
//        if isTest {
//            completion(getMockItems())
//        }
//
//        return completion([])
    }

    private func getMockItems() -> [Item] {
        guard let url = Bundle(for: type(of: self)).url(forResource: "items", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return []
        }

        let items = try? JSONDecoder().decode([Item].self, from: data)
        return items ?? []
    }
}
