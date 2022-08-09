//
//  RealmManager.swift
//  JustDo
//
//  Created by Michał Barnat on 08/08/2022.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    @Published var tasks: [Task] = []
    var localRealm: Realm?
    
    init() {
        loadRealm()
        getTasks()
    }
    
   func loadRealm() {
       let config = Realm.Configuration(schemaVersion: 1)
       Realm.Configuration.defaultConfiguration = config
       
       do {
           localRealm = try Realm()
       } catch {
           print("Error while load Realm : \(error.localizedDescription)")
       }
    }
    
    //MARK: - CRUD ACTIONS:
    
    func getTasks() {
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "done")
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
    
    func addTask(title: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value: ["title": title, "done": false])
                    localRealm.add(newTask)
                    getTasks()
                }
            } catch {
                print("Error while adding task of title: \(title) \(error.localizedDescription)")
            }
        }
    }
    
    
    func updateTasks(id: ObjectId, done: Bool) {
        if let localRealm = localRealm {
            do {
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else {return}
                
              try  localRealm.write {
                    taskToUpdate[0].done = done
                    getTasks()
                }
                
            } catch {
                print("Error while updating task of id \(id) \(error.localizedDescription)")
            }
        }
    }
    
    func deleteAllDone() {
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self)
            
//            var tasksToDelete: [Task] = []
//
//            allTasks.forEach { task in
//                if task.done == true {
//                    tasksToDelete.append(task)
//                }
//            }
//
//            do {
//                try localRealm.write {
//                    tasksToDelete.forEach { task in
//                        localRealm.delete(task)
//                        getTasks()
//                    }
//                }
//            } catch {
//                print("error while delete all done")
//            }
            
            
            
            do {
                try localRealm.write {
                    allTasks.forEach { task in
                        if task.done == true {
                            localRealm.delete(task)
                            getTasks()
                        }
                    }
                }
            } catch {
                print("Error while deleting all task done \(error.localizedDescription)")
            }
            
            
        }
    }
    
}
