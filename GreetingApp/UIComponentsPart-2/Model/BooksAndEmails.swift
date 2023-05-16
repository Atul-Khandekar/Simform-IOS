
import UIKit

struct BooksAndEmails {
    let section: String
    var rows: [Any]
    
    static func getBooksAndEmails() -> [BooksAndEmails] {
        let data = [
            BooksAndEmails(section: "Books",
                           rows: [ getImage(UIImage.AtomicHabits) ,
                                   getImage(UIImage.AttitudeIsEverything) ,
                                   getImage(UIImage.PsychologyOfMoney) ,
                                   getImage(UIImage.TheAlchemist),
                                   getImage(UIImage.SherlockHolmes) ,
                                   getImage(UIImage.YouOnlyLiveOnce) ,
                                   getImage(UIImage.TheGirlWhoKnewTooMuch)]) ,
            
            BooksAndEmails(section: "Emails",
                           rows: [ "Kha",
                                   "aayushprajapati47834@hotmai.com",
                                   "meetrajsinghRathod.simformsolutions@hotmail.com",
                                   "ak@65.com",
                                   "hel.com",
                                   "vishalpatel234@hotmail.simformsolutions.com",
                                   "Goku9000@hotmail.com"
                                 ])
        ]
        return data
    }
    
    static func getBooks() -> [UIImage] {
        let model = [
            getImage(UIImage.AtomicHabits),
            getImage(UIImage.AttitudeIsEverything),
            getImage(UIImage.PsychologyOfMoney),
            getImage(UIImage.TheAlchemist),
            getImage(UIImage.SherlockHolmes),
            getImage(UIImage.YouOnlyLiveOnce),
            getImage(UIImage.TheGirlWhoKnewTooMuch)
        ]
        return model
    }
    
    static func getEmails() -> [String] {
        let emails = [
            "KhandekarAtul95@gmail.com",
            "aayushprajapati47834@hotmai.com",
            "meetrajsinghRathod.simformsolutions@hotmail.com",
            "ak@65.com",
            "vishalpatel234@hotmail.simformsolutions.com",
            "Goku9000@hotmail.com"
        ]
        return emails
    }
    
    static func getImage(_ image: String) -> UIImage {
        return UIImage(imageLiteralResourceName: image)
    }
}
