//
//  DBManager.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 30/01/2022.
//

import Foundation
import RealmSwift
import RxSwift
import Realm

enum  ROname : String {
    case ItemRO
    case SellerRO
}

class DBManager {
    private var   database:Realm
    static let   sharedInstance = DBManager()
    
    private init() {
        database = try! Realm()
        print("Realm >> ", Realm.Configuration.defaultConfiguration.fileURL!)
    }
}

extension DBManager {
    //MARK: - General CRUD
    
    public func saveDataList<T>(dataList: [T], value: T.Type, failure: @escaping (String) -> Void) where T : Object {
        do{
            database.refresh()
            try database.safeWrite{
                dataList.forEach { (item) in
                    saveData(data: item, value: T.self) { (err) in
                        failure(err)
                    }
                }
            }
            
        }catch let exception {
            failure(exception.localizedDescription)
        }
    }
    
    public func saveData<T>(data: T, value: T.Type, failure: @escaping (String) -> Void) where T : Object {
        do{
            database.refresh()
            try database.safeWrite{
                database.add(data, update: .modified)
            }
            
        }catch let exception {
            print("Failed to save")
            failure(exception.localizedDescription)
        }
    }
    
    public func updateData(_ closure: @escaping () -> Void, failure: @escaping (String) -> Void) {
        do {
            database.refresh()
            try database.safeWrite {
                closure()
            }
        } catch {
            failure(error.localizedDescription)
        }
    }
    
    public func deleteDataList<T>(value: T.Type, success: @escaping(() -> Void), failure: @escaping(String) -> Void) where T: Object {
        do{
            database.refresh()
            try database.safeWrite{
                database.delete(database.objects(T.self))
                success()
            }
        }catch let exception {
            failure(exception.localizedDescription)
        }
    }
    
    func deleteData(objectArray: [Object], success: @escaping(() -> Void), failure: @escaping(String) -> Void )   {
        do{
            try database.safeWrite {
                database.delete(objectArray)
                print("completely deleted . . . ")
            }
            success()
        } catch {
            print("Realm Debug : error occur when deleting \(error)")
            failure(error.localizedDescription)
        }
    }
        
    
    func deleteRealmData(success: @escaping(() -> Void), failure: @escaping(String) -> Void) {
        do{
            try database.safeWrite{
                database.deleteAll()
            }
            success()
            
        }catch let exception {
            failure(exception.localizedDescription)
        }
    }
    
    //MARK: - retrieve data list
    func getDataFromDB(roName : ROname) ->   [Object]! {
        switch roName {
        case .ItemRO:
            let results : Results<ItemRO> = database.objects(ItemRO.self)
            return Array(results)
        case .SellerRO:
            let results : Results<SellerRO> = database.objects(SellerRO.self)
            return Array(results)
        }
    }
    
    func getObjectById(id : Int,roName : ROname) -> Object? {
        let predicate = NSPredicate(format: "id == \(id)")
        
        switch roName {
        case .ItemRO :
            let result = database.objects(ItemRO.self).filter(predicate)
            return result.count > 0 ? result[0] : nil
        case .SellerRO :
            let result = database.objects(SellerRO.self).filter(predicate)
            return result.count > 0 ? result[0] : nil
        }
        
    }
    
}
