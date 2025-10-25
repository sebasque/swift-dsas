//
//  LinkedQueue.swift
//  SwiftDSA
//
//  Created by Michael Koohang on 10/16/25.
//

class LinkedQueue<T> {
    private var head: LinkedNode<T>?
    private var tail: LinkedNode<T>?
    private var size: Int = 0

    var isEmpty: Bool {
        size == 0
    }

    func first() -> T? {
        if isEmpty {
            return nil
        }
        return head?.element
    }

    func enqueue(_ value: T) {
        let newest = LinkedNode(element: value)
        if isEmpty {
            head = newest
        } else {
            tail?.next = newest
        }
        tail = newest
        size += 1
    }

    func dequeue() -> T? {
        if isEmpty {
            return nil
        }
        let value = head?.element
        head = head?.next
        size -= 1
        if isEmpty {
            tail = nil
        }
        return value
    }
}
