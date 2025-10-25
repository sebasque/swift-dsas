//
//  BinaryTree.swift
//  SwiftDSA
//
//  Created by Michael Koohang on 10/23/25.
//


final class BinaryNode<T: Equatable>: Equatable {
    var parent: BinaryNode<T>?
    var left: BinaryNode<T>?
    var right: BinaryNode<T>?
    var element: T

    init(
        parent: BinaryNode<T>? = nil,
        left: BinaryNode<T>? = nil,
        right: BinaryNode<T>? = nil,
        element: T
    ) {
        self.parent = parent
        self.left = left
        self.right = right
        self.element = element
    }

    static func == (lhs: BinaryNode<T>, rhs: BinaryNode<T>) -> Bool {
        return lhs.element == rhs.element &&
        lhs.parent == rhs.parent &&
        lhs.left == rhs.left &&
        lhs.right == rhs.right
    }
}

protocol BinaryTree: Tree {
    func left(_ position: P) -> P?
    func right(_ position: P) -> P?
}

extension BinaryTree {
    func sibling(position: P) -> P? {
        if let parent = parent(position) {
            if position == self.left(parent) {
                return self.right(parent)
            } else {
                return self.left(parent)
            }
        } else {
            return nil
        }
    }

    func children(_ position: P) -> [P] {
        [left(position), right(position)].compactMap { $0 }
    }
}
