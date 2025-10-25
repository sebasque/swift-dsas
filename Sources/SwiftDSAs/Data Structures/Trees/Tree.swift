//
//  LinkedTree.swift
//  SwiftDSA
//
//  Created by Michael Koohang on 10/21/25.
//

// MARK: - Podes

final class Node<T: Equatable>: Equatable {
    var parent: Node<T>?
    var child: Node<T>?
    var element: T

    init(parent: Node<T>? = nil, child: Node<T>? = nil, element: T) {
        self.parent = parent
        self.child = child
        self.element = element
    }

    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.element == rhs.element &&
        lhs.parent == rhs.parent &&
        lhs.child == rhs.child
    }
}

// MARK: - Tree

protocol Tree {
    associatedtype P: Position

    func root() -> P?
    func parent(_ position: P) -> P?
    func numberOfChildren(_ position: P) -> Int
    func children(_ position: P) -> [P]
    func isRoot(_ position: P) -> Bool
    func isLeaf(_ position: P) -> Bool
    func isEmpty() -> Bool
    func depth(_ position: P) -> Int
    func height(_ position: P) -> Int
}

extension Tree {
    func isRoot(_ position: P) -> Bool {
        root() == position
    }

    func isLeaf(_ position: P) -> Bool {
        numberOfChildren(position) == 0
    }

    func depth(_ position: P) -> Int {
        if isRoot(position) {
            return 0
        } else {
            guard let parent = parent(position) else {
                return 0
            }

            return 1 + depth(parent)
        }
    }

    func height(_ position: P) -> Int {
        if isLeaf(position) {
            return 0
        } else {
            return 1 + (children(position).compactMap { height($0) }.max() ?? 0)
        }
    }
}
