//
//  StudentNotes+CoreDataProperties.swift
//  Note App
//
//  Created by Randima Dilshani on 2023-04-22.
//
//

import Foundation
import CoreData


extension StudentNotes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StudentNotes> {
        return NSFetchRequest<StudentNotes>(entityName: "StudentNotes")
    }

    @NSManaged public var duration: Int16
    @NSManaged public var lessondescription: String?
    @NSManaged public var lessonimage: Data?
    @NSManaged public var lessontitle: String?
    @NSManaged public var selectdate: Date?
    @NSManaged public var subjectname: String?
    @NSManaged public var notestatus: Bool

}

extension StudentNotes : Identifiable {

}
