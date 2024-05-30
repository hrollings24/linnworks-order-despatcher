//
//  OrderExtensions.swift
//  LinnworksOrderDespatcher
//
//  Created by Harry Rollings on 30/05/2024.
//

import Foundation

extension GeneralInfo
{
    public var formattedDespatchByDate: Date? {
        return parseDate(from: despatchByDate)
    }
    
    public var formattedRecievedDate: Date? {
        return parseDate(from: receivedDate)
    }
    
    private func parseDate(from dateString: String) -> Date? {
        let dateFormats = [
            "yyyy-MM-dd'T'HH:mm:ss.SSSZ", // Format with fractional seconds
            "yyyy-MM-dd'T'HH:mm:ssZ" // Format without fractional seconds
        ]
        
        for format in dateFormats {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            
            if let date = dateFormatter.date(from: dateString) {
                return date
            }
        }
        
        return nil
    }
    
    public var formattedDespatchByDateString: String {
        guard let date = formattedDespatchByDate else {
           return "Invalid date"
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: date)
    }
    
    public var formattedRecievedDateString: String {
        guard let date = formattedRecievedDate else {
           return "Invalid date"
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: date)
    }
}
