//
//  OnboardingScreenData.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 26/05/23.
//
import UIKit
import Foundation

struct OnboardingScreenData {
    let image: UIImage
    let title: String
    let description: String
    
    static func getOnboardingScreenData() -> [OnboardingScreenData] {
        let data = [
            OnboardingScreenData(image: UIImage(imageLiteralResourceName:UIImage.onBoardingScreenPage1), title: "Welcome to surf", description: "I provide essential stuff for your ui designs every Tuesday!") ,
            OnboardingScreenData(image: UIImage(imageLiteralResourceName:UIImage.onBoardingScreenPage2), title: "Design Template uploads Every Tuesday!", description: "Make sure to take a look  my uplab profile every Tuesday") ,
            OnboardingScreenData(image: UIImage(imageLiteralResourceName:UIImage.onBoardingScreenPage3), title: "Download now!", description: "You can follow me if you want and comment on any to get some freebies") ,
        ]
        return data
    }
}
