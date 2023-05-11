
import Foundation

struct CustomNames {
    
    let name: String
    
    static func getData() -> [CustomNames] {
        let data: [CustomNames] = [
            CustomNames(name: "Atul"),
            CustomNames(name: "Vishal"),
            CustomNames(name: "Virat"),
            CustomNames(name: "Shyam"),
            CustomNames(name: "Dharmik"),
            CustomNames(name: "Darshan"),
            CustomNames(name: "Shubham"),
            CustomNames(name: "Faizan")
        ]
        return data
    }
}
