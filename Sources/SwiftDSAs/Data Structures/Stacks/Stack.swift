//
//  Stack.swift
//  SwiftDSA
//
//  Created by Michael Koohang on 10/15/25.
//

class Stack<T> {
    private var stack: [T] = []
    private var size = 0

    var isEmpty: Bool {
        size == 0
    }

    func push(_ value: T) {
        stack.append(value)
        size += 1
    }

    @discardableResult
    func top() -> T? {
        return stack.last
    }

    @discardableResult
    func pop() -> T? {
        if stack.isEmpty {
            return nil
        }
        size -= 1
        return stack.removeLast()
    }
}
