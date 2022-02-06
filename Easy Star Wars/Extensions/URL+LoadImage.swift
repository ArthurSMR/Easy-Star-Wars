//
//  String+LoadImage.swift
//  Easy Star Wars
//
//  Created by Arthur Rodrigues on 06/02/22.
//

import Foundation
import UIKit

extension URL {
    
    func load() -> UIImage {
        
        do {
            
            let data = try Data(contentsOf: self)
            
            return UIImage(data: data) ?? UIImage()
            
        } catch {
            print("Error trying to load image from URL \(self)")
        }
        
        return UIImage()
    }
}
