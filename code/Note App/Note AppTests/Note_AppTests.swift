//
//  Note_AppTests.swift
//  Note AppTests
//
//  Created by Sajani Jayasinghe on 2023-04-29.
//

import XCTest
import CoreData
@testable import Note_App

final class Note_AppTests: XCTestCase {

    var sut: addNotesVC!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            sut = storyboard.instantiateViewController(identifier: "addNotesVC") as? addNotesVC
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
        
    }

    func testExample() throws {
        let subjectname = "Test Subject Name"
        let lessontitle = "Test Lesson Title"
        let selectdate = Date()
        let lessondescription = "Test Description"
        let duration: Float = 3.0
        
        sut.txtsubjectname.text = subjectname
        sut.txtlessontitle.text = lessontitle
        sut.txtselectdate.setDate(selectdate, animated: false)
        sut.txtlessondescription.text = lessondescription
        sut.txtduration.setValue(duration, animated: false)
         }
        let context = DBManager.share.context
        let tasksFetchRequest: NSFetchRequest<StudentNotes> = StudentNotes.fetchRequest()
    }

