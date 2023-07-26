
import UIKit

struct UserDetails {
    let section: String
    let rows: [String]
    
    static func getData() -> [UserDetails] {
        let data = [
        UserDetails(section: "Sports", rows: ["Cricket","Golf","Table Tennis"]),
        UserDetails(section: "Fruits", rows: ["Apple","Mangoes"]),
        UserDetails(section: "Games", rows: ["GTA V"]),
        UserDetails(section: "People", rows: [""])
        
    ]
        return data  
    }
}
