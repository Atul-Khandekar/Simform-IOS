
import Foundation

struct ExpandableSectionDetails {
    let section: String
    var rows: [String]
    var visible: Bool
    
    static func getData() -> [ExpandableSectionDetails] {
        let data = [
            ExpandableSectionDetails(section: "A", rows: ["Atul","Aayush","Aniket"] , visible: true),
            ExpandableSectionDetails(section: "S", rows: ["Shubham","Samarth"], visible: true),
            ExpandableSectionDetails(section: "R", rows: ["Ruchit","Rahul"], visible: true),
            ExpandableSectionDetails(section: "X", rows: [], visible: true),
            ExpandableSectionDetails(section: "D", rows: ["Darshan","Dharmik","Devarsh"], visible: true),
            
        ]
        return data
    }
}
