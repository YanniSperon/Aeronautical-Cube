//
//  Data Management.swift
//  Humzah Bird
//
//  Created by Yanni Speron on 6/12/20.
//  Copyright © 2020 Yanni Speron. All rights reserved.
//

import Foundation
import SceneKit

let SaveData = UserDefaults.standard

/// The keys used to save data using user defaults
struct SaveKeys {
    static let uuid = "uuid"
    static let highScore = "highScore"
    static let timesPlayed = "timesPlayed"
    static let sumOfScores = "sumOfScores"
}

/// Load an integer from user defaults
/// - Parameters:
///   - key: The key for the value you would like to retrieve
///   - defaultValue: The value you would like to return if the key does not exist
/// - Returns: The read integer if the key is valid, or the defaultValue if it is not
func LoadInt(key: String, defaultValue: Int) -> Int {
    let tempInt = SaveData.integer(forKey: key)
    if (tempInt == 0) {
        return defaultValue
    } else {
        return tempInt
    }
}

/// Load a string from user defaults
/// - Parameters:
///   - key: The key for the value you would like to retrieve
///   - defaultValue: The value you would like to return if the key does not exist
/// - Returns: The read string if the key is valid, or the defaultValue if it is not
func LoadString(key: String, defaultValue: String) -> String {
    if let tempString = SaveData.string(forKey: key) {
        return tempString
    } else {
        return defaultValue
    }
}

/// Load a UUID from user defaults
/// - Parameter key: The key for the value you would like to retrieve
/// - Returns: The read UUID if the key is valid, or a new UUID if it is not
func LoadUUID(key: String) -> UUID {
    if let tempString = SaveData.string(forKey: key) {
        if let tempUUID = UUID(uuidString: tempString) {
            return tempUUID
        } else {
            return UUID()
        }
    } else {
        return UUID()
    }
}

/// Load an array from user defaults
/// - Parameter key: The key for the value you would like to retrieve
/// - Returns: The read array if the key is valid, or an empty array if it is not
func LoadArray(key: String) -> [Any] {
    if let tempArray = SaveData.array(forKey: key) {
        return tempArray
    } else {
        return []
    }
}

/// Save an integer to user defaults
/// - Parameters:
///   - key: The key for the value you would like to save
///   - value: The value you would like to save
func SaveInt(key: String, value: Int) {
    SaveData.set(value, forKey: key)
}

/// Save a string to user defaults
/// - Parameters:
///   - key: The key for the value you would like to save
///   - value: The value you would like to save
func SaveString(key: String, value: String) {
    SaveData.set(value, forKey: key)
}

/// Save a UUID to user defaults
/// - Parameters:
///   - key: The key for the value you would like to save
///   - value: The value you would like to save
func SaveUUID(key: String, value: UUID) {
    SaveData.set(value.uuidString, forKey: key)
}

/// Save an array to user defaults
/// - Parameters:
///   - key: The key for the values you would like to save
///   - value: The values you would like to save
func SaveArray(key: String, value: [Any]) {
    SaveData.set(value, forKey: key)
}

extension CGFloat {
    /// Truncate a CGFloat
    /// - Parameters:
    ///   - number: The CGFloat you would like to truncate
    ///   - decimalPlaces: The amount of places from the decimal you would like to keep
    /// - Returns: A tuple containing the intregral part as the first element and the truncated fractional part as the second element
    func Truncate(decimalPlaces: Int) -> (Int, Int) {
        let integralPart = Int(self)
        let fractionalPart = Int(self * pow(CGFloat(10.0), CGFloat(decimalPlaces)) - (CGFloat(integralPart) * pow(CGFloat(10.0), CGFloat(decimalPlaces))))
        return (integralPart, fractionalPart)
    }
    
    func RemoveTrailingAndLeadingZeros() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: Double(self))
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = (String(Double(self)).components(separatedBy: ".").last)!.count
        return String(formatter.string(from: number) ?? "")
    }
}

/// Converts a tuple containing the integral part as the first element and the fractional part as the second element into a CGFloat
/// - Parameter number: A tuple containing the integral part as the first element and the fractional part as the second element
/// - Parameter decimalPlaces: The amount of decimal places the number contains
/// - Returns: A CGFloat with the value of the input
func IntIntTupleToCGFloat(number: (Int, Int), decimalPlaces: Int) -> CGFloat {
    return CGFloat(number.0) + CGFloat(number.1) / pow(CGFloat(10.0), CGFloat(decimalPlaces))
}

/// Convert a tuple containing the integral part as the first element and the fractional part as the second element into a
/// - Parameters:
///   - number: The tuple containing the integral part as the first element and the fractional part as the second element
///   - decimalPlaces: The amount of decimal places the number contains
/// - Returns: A String representation of the value of the number
func IntIntTupleToString(number: (Int, Int), decimalPlaces: Int) -> String {
    let tempString: String = (CGFloat(number.1) / pow(CGFloat(10.0), CGFloat(decimalPlaces))).RemoveTrailingAndLeadingZeros().DropFirstReturn()
    return String(number.0) + tempString
}

extension String {
    func DropFirstReturn () -> String {
        return String(self.dropFirst())
    }
}
