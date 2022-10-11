//
//  CoreDataManager.swift
//  SimpleTodoListProject
//
//  Created by 효우 on 2022/10/12.
//

import UIKit
import CoreData

final class CoreDataManager {
    static let shred = CoreDataManager()
    private init() { }
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    lazy var context = appDelegate?.persistentContainer.viewContext
    let modelName: String = "MemoData"
    
    // MARK: - [Read] 코어데이터에 저장된 데이터 모두 읽어오기
    func getMemoDataFromCoreData() -> [MemoData] {
        var memoList: [MemoData] = []
        
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            let dateOrder = NSSortDescriptor(key: "date", ascending: false)
            request.sortDescriptors = [dateOrder]
            
            do {
                if let fetchedMemoList = try context.fetch(request) as? [MemoData] {
                    memoList = fetchedMemoList
                }
            } catch {
                print("코어데이터 불러오기 실패")
            }
        }
        return memoList
    }
    
    // MARK: - [Create] 코어데이터에 데이터 생성하기
    func saveMemoData(memoText: String?, colorInt: Int64, completion: @escaping () -> Void) {
        if let context = context {
            if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
                if let memoData = NSManagedObject(entity: entity, insertInto: context) as? MemoData {
                    memoData.memoText = memoText
                    memoData.date = Date()
                    memoData.color = colorInt
                    
                    if context.hasChanges {
                        do {
                            try context.save()
                            completion()
                        } catch {
                            print(error)
                            completion()
                        }
                    }
                }
            }
        }
        completion()
    }
    
    // MARK: - [Delete] 코어데이터에서 데이터 삭제하기 (일치하는 데이터 찾아서 ===> 삭제)
    func deleteToDo(data: MemoData, completion: @escaping () -> Void) {
        guard let date = data.date else {
            completion()
            return
        }
        
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
            
            do {
                if let fetchedMemoList = try context.fetch(request) as? [MemoData] {
                    if let targetMemo = fetchedMemoList.first {
                        context.delete(targetMemo)
                        
                        if context.hasChanges {
                            do {
                                try context.save()
                                completion()
                            } catch {
                                print(error)
                                completion()
                            }
                        }
                    }
                }
                completion()
            } catch {
                print("코어데이터 삭제 실패")
                completion()
            }
        }
    }
    
    // MARK: - [Update] 코어데이터에서 데이터 수정하기 (일치하는 데이터 찾아서 ===> 수정)
    func updateToDo(newMemoData: MemoData, completion: @escaping () -> Void) {
        guard let date = newMemoData.date else {
            completion()
            return
        }
        
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
            
            do {
                if let fetchMemolist = try context.fetch(request) as? [MemoData] {
                    if var targetMemo = fetchMemolist.first {
                        targetMemo = newMemoData
                        
                        if context.hasChanges {
                            do {
                                try context.save()
                                completion()
                            } catch {
                                print(error)
                                completion()
                            }
                        }
                    }
                }
                completion()
            } catch {
                print("코어데이터 업데이트 실패")
                completion()
            }
        }
    }
}
