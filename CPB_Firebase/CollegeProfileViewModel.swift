//
//  CollegeProfileViewModel.swift
//  CPB_Firebase
//
//  Created by Valerie Morales on 11/8/23.
//

import SwiftUI
import FirebaseDatabase
import FirebaseDatabaseSwift

class CollegeViewModel: ObservableObject {
    @Published var Colleges: [CollegeProfile] = []
    init() {
        
        PullFromFirebase()
        print(6)
    }
   
    func AddCollege(currentCollege: CollegeProfile) {
        print(1)
        Colleges.append(currentCollege)
        AddToFirebase(college: currentCollege)
    }
    func AddToFirebase(college: CollegeProfile) {
        print(2)
        let database = Database.database().reference()
        database.child("College").child(college.name).child("numberOfStudents").setValue(college.numberOfStudents)
        database.child("College").child(college.name).child("location").setValue(college.location)
        database.child("College").child(college.name).child("nameURL").setValue(college.nameURL)
    }
    func PullFromFirebase() {
        print(3)
        let databaseRef = Database.database().reference().child("College")
        databaseRef.getData { myError, myDataSnapshot in
            var newList : [CollegeProfile] = []
            print(4)
            for theCollege in myDataSnapshot?.children.allObjects as! [DataSnapshot] {
                print(10)
                let nameOfCollege = theCollege.key
                let dictionary = theCollege.value as! [String:String]
                guard let studentNumber = dictionary["numberOfStudents"] else { return }
                guard let locationName = dictionary["location"] else { return }
                guard let urlName = dictionary["nameURL"] else { return }
                print(11)
                let theCurrentCollege = CollegeProfile(name: nameOfCollege, numberOfStudents: studentNumber, location: locationName, nameURL: urlName)
                newList.append(theCurrentCollege)
                print(5)
            }
            self.Colleges = newList
            print(7)
        }
    }
   
}
