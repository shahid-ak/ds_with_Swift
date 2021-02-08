//
//  main.swift
//  Linkedlist
//
//  Created by ShahidAK on 03/02/21.
//  Copyright © 2021 ShahidAK. All rights reserved.
//

import Foundation

class Node{
    var value : Int
    var next : Node?
    init(value : Int, next : Node?){
        self.value = value
        self.next = next
    }
}

class Linkedlist{
    var head: Node?
    
    func insert(value:Int ){
        if head == nil{
            head = Node(value: value, next: nil)
            return
        }
        
        var current = head
        while current?.next != nil{
            current = current?.next
        }
        current?.next = Node(value: value, next: nil)
    }
    
    func delete(value:Int){
        if head?.value == value{
            head = head?.next
        }
        var prev : Node?
        var current = head
        while current != nil && current?.value != value  {
            prev = current
            current = current?.next
        }
        prev?.next = current?.next
    }
    
    func displayListItems(){
        print("Elements inside the list:")
        var current = head
        while current != nil {
            print(current?.value ?? "")
            current = current?.next
        }
    }
    
    func setUpDummyNodes(){
        let three = Node(value: 3, next: nil)
        let two = Node(value: 2, next: three)
        head = Node(value: 1, next: two)
    }
}

let sampleList = Linkedlist()
sampleList.insert(value: 1)
sampleList.insert(value: 2)
sampleList.insert(value: 1)
sampleList.insert(value: 3)
sampleList.displayListItems()
sampleList.delete(value: 5)
sampleList.displayListItems()
