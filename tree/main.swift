import Foundation

class Node{
    var data:Int
    var left: Node?
    var right: Node?
    init(data:Int){
        self.data = data
    }
}

class Tree{
    var head: Node?
    
    func inorder(temp: Node?){
        if temp?.left != nil{
            inorder(temp: temp?.left)
        }
        print(temp!.data)
        if temp?.right != nil{
            inorder(temp: temp?.right)
        }
    }
    
    func preorder(temp: Node?){
        print(temp!.data)
        if temp?.left != nil{
            inorder(temp: temp?.left)
        }
        if temp?.right != nil{
            inorder(temp: temp?.right)
        }
    }
    
    func postorder(temp: Node?){
        if temp?.left != nil{
            inorder(temp: temp?.left)
        }
        if temp?.right != nil{
            inorder(temp: temp?.right)
        }
        print(temp!.data)
    }
    
    func display(){
        print("Inorder:")
        inorder(temp: head)
        print("Preorder:")
        preorder(temp: head)
        print("Postorder")
        postorder(temp: head)
    }
    
    func insert(data: Int){
        if head == nil{
            head = Node(data: data)
        }
        else{
            var temp = head
            var parent: Node?
            while temp != nil {
                parent = temp
                if temp!.data > data{
                    parent = temp
                    temp = temp?.left
                }
                else if temp!.data < data{
                    parent = temp
                    temp = temp?.right
                }
                else{
                    return
                }
            }
            temp = Node(data: data)
            if parent!.data<data{
                parent?.right = temp
            }
            else{
                parent?.left = temp
            }
        }
    }
    func delete(data:Int){
        var temp = head
        var parent: Node?
        if temp == nil{
            return
        }
        while temp != nil && temp!.data != data {
            if temp!.data > data{
                parent = temp
                temp = temp?.left
            }
            else{
                parent = temp
                temp = temp?.right
            }
        }
        if temp?.data != nil{
            if temp?.left == nil && temp?.right == nil{
                if parent!.data > data{
                    parent?.left = nil
                }
                else{
                    parent?.right = nil
                }
            }
            else if temp?.left != nil{
                var replace = temp
                while replace?.right != nil {
                    parent = replace
                    replace = replace?.right
                }
                temp?.data = replace!.data
                if replace?.left != nil {
                    parent?.right = replace?.left
                }
            }
            else{
                var replace = temp
                while replace?.left != nil {
                    parent = replace
                    replace = replace?.right
                }
                temp?.data = replace!.data
                if replace?.right != nil{
                    parent?.left = replace?.right
                }
            }
        }
    }
}
var newTree = Tree()
newTree.insert(data: 5)
newTree.insert(data: 2)
newTree.insert(data: 8)
newTree.insert(data: 1)
newTree.insert(data: 4)
newTree.insert(data: 3)
newTree.preorder(temp: newTree.head)
newTree.delete(data: 8)
newTree.display()
