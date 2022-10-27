//
//  MusicSearch+CoreDataProperties.swift
//  MusicSearchProject
//
//  Created by 효우 on 2022/10/27.
//
//

import Foundation
import CoreData


extension MusicSearch {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MusicSearch> {
        return NSFetchRequest<MusicSearch>(entityName: "MusicSearch")
    }

    @NSManaged public var somgName: String?
    @NSManaged public var savedDate: Date?
    @NSManaged public var releaseDate: String?
    @NSManaged public var previewUrl: String?
    @NSManaged public var myMessege: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var artistName: String?
    @NSManaged public var albumName: String?
    
    var savedDateString: String? {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = savedDate else { return "" }
        let savedDateString = myFormatter.string(from: date)
        return savedDateString
    }
}

extension MusicSearch : Identifiable {

}
