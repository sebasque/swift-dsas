//
//  CircularQueue.swift
//  SwiftDSA
//
//  Created by Michael Koohang on 10/16/25.
//

class CircularQueue<T> {
    private var tail: LinkedNode<T>?
    private var size: Int = 0

    var isEmpty: Bool {
        size == 0
    }

    func first() -> T? {
        if isEmpty {
            return nil
        }
        let head = tail?.next
        return head?.element
    }

    func dequeue() -> T? {
        if isEmpty {
            return nil
        }
        let oldHead = tail?.next
        if size == 1 {
            tail = nil
        } else {
            tail?.next = oldHead?.next
        }
        size -= 1
        return oldHead?.element
    }

    func enqueue(_ value: T) {
        let newest = LinkedNode(element: value)
        if isEmpty {
            newest.next = newest
        } else {
            newest.next = tail?.next
            tail?.next = newest
        }
        tail = newest
        size += 1
    }
}
