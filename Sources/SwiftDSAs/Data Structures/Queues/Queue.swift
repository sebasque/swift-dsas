//
//  Queue.swift
//  SwiftDSA
//
//  Created by Michael Koohang on 10/15/25.
//

class Queue<T> {
    private var queue = [T?]()
    private var front: Int = 0
    private var size: Int = 0

    var isEmpty: Bool {
        size == 0
    }

    func first() -> T? {
        if isEmpty {
            return nil
        }
        return queue[front]
    }

    func enqueue(_ value: T) {
        if size == queue.count {
            resize(cap: queue.count * 2)
        }
        let avail = (front + size) % queue.count
        queue[avail] = value
        size += 1
    }

    func dequeue() -> T? {
        if isEmpty {
            return nil
        }
        let value = queue[front]
        queue[front] = nil
        size -= 1
        front = (front + 1) % queue.count
        return value
    }

    private func resize(cap: Int) {
        let oldQueue = queue
        queue = Array<T?>(repeating: nil, count: cap)
        var walk = front
        for i in 0..<size {
            queue[i] = oldQueue[walk]
            walk = (walk + 1) % oldQueue.count
        }
        front = 0
    }
}
