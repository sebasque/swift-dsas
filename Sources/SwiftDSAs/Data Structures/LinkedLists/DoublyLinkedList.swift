//
//  DoublyLinkedList.swift
//  SwiftDSA
//
//  Created by Michael Koohang on 10/16/25.
//

class DoublyLinkedList<T> {
    var header: DoublyLinkedNode<T>
    var trailer: DoublyLinkedNode<T>
    var size: Int

    init() {
        self.header = DoublyLinkedNode()
        self.trailer = DoublyLinkedNode()
        self.header.next = self.trailer
        self.trailer.prev = self.header
        self.size = 0
    }

    var isEmpty: Bool {
        size == 0
    }

    @discardableResult
    func deleteNode(_ node: DoublyLinkedNode<T>?) -> T? {
        let prev = node?.prev
        let next = node?.next
        prev?.next = next
        next?.prev = prev
        size -= 1

        let element = node?.value
        node?.prev = nil
        node?.next = nil
        return element
    }

    @discardableResult
    func insertBetween(
        _ value: T,
        prev: DoublyLinkedNode<T>?,
        next: DoublyLinkedNode<T>?
    ) -> DoublyLinkedNode<T> {
        let newest = DoublyLinkedNode(value: value, prev: prev, next: next)
        prev?.next = newest
        next?.prev = newest
        size += 1
        return newest
    }
}
