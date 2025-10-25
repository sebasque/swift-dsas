//
//  LinkedStack.swift
//  SwiftDSA
//
//  Created by Michael Koohang on 10/16/25.
//

class LinkedStack<T> {
    private var head: LinkedNode<T>? = nil
    private var size = 0

    var isEmpty: Bool {
        size == 0
    }

    func push(_ value: T) {
        self.head = LinkedNode(element: value, next: head)
        size += 1
    }

    @discardableResult
    func top() -> T? {
        if isEmpty {
            return nil
        }
        return head?.element
    }

    @discardableResult
    func pop() -> T? {
        if isEmpty {
            return nil
        }
        let element = head?.element
        head = head?.next
        size -= 1
        return element
    }
}
