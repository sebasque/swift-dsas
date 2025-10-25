//
//  Deque.swift
//  SwiftDSA
//
//  Created by Michael Koohang on 10/15/25.
//

class Deque<T> {
    private var queue = [T?]()
    private var _size = 0
    private var front = 0
    private var back = 0

    var size: Int {
        _size
    }

    var isEmpty: Bool {
        _size == 0
    }

    func first() -> T? {
        if isEmpty {
            return nil
        }
        return queue[front]
    }

    func last() -> T? {
        if isEmpty {
            return nil
        }
        return queue[back]
    }

    func addFirst(_ value: T) {
        if _size == queue.count {
            resize(cap: queue.count * 2)
        }
        let avail = (front - 1) % queue.count
        queue[avail] = value
        front = avail
        _size += 1
    }

    func addLast(_ value: T) {
        if _size == queue.count {
            resize(cap: queue.count * 2)
        }
        let avail = (front + _size) % queue.count
        queue[avail] = value
        back = avail
        _size += 1
    }

    func delete_first() -> T? {
        if isEmpty {
            return nil
        }
        let value = queue[front]
        queue[front] = nil
        _size -= 1
        front = (front + 1) % queue.count
        return value
    }

    func delete_last() -> T? {
        if isEmpty {
            return nil
        }
        let value = queue[back]
        queue[back] = nil
        _size -= 1
        back = (back - 1) % queue.count
        return value
    }

    private func resize(cap: Int) {
        let oldQueue = queue
        queue = Array<T?>(repeating: nil, count: cap)
        var walk = front
        for i in 0..<_size {
            queue[i] = oldQueue[walk]
            walk = (walk + 1) % oldQueue.count
        }
        front = 0
    }
}
