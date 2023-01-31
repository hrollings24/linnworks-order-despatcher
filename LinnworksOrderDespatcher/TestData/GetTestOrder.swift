//
//  GetTestOrder.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 14/01/2023.
//

import Foundation

func GetTestOrder() -> Order?
{
    if let url = Bundle.main.url(forResource: "10066", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Order.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
    return nil
}
