//
//  LinkedBinaryTree.swift
//  SwiftDSA
//
//  Created by Michael Koohang on 10/21/25.
//

class LinkedBinaryTree<Item: Equatable>: BinaryTree {
    typealias P = BinaryTreePosition

    private var _root: BinaryNode<Item>?
    private var _size: Int

    init() {
        self._root = nil
        self._size = 0
    }

    class BinaryTreePosition: Position {
        typealias T = Item
        let node: BinaryNode<Item>

        init(node: BinaryNode<Item>) {
            self.node = node
        }

        func element() -> Item {
            self.node.element
        }

        static func == (lhs: LinkedBinaryTree.BinaryTreePosition, rhs: LinkedBinaryTree.BinaryTreePosition) -> Bool {
            lhs === rhs
        }
    }

    enum ValidationError: Error {
        case invalidPosition
        case rootExists
        case leftExists
        case rightExists
        case twoChildren
        case positionNeedsToBeLeaf
    }

    func isEmpty() -> Bool {
        _size == 0
    }

    func left(_ position: BinaryTreePosition) -> BinaryTreePosition? {
        do {
            let node = try validate(p: position)
            return makePosition(node: node.left)
        } catch {
            return nil
        }
    }

    func right(_ position: BinaryTreePosition) -> BinaryTreePosition? {
        do {
            let node = try validate(p: position)
            return makePosition(node: node.right)
        } catch {
            return nil
        }
    }

    func root() -> BinaryTreePosition? {
        makePosition(node: _root)
    }

    func parent(_ position: BinaryTreePosition) -> BinaryTreePosition? {
        do {
            let node = try validate(p: position)
            return makePosition(node: node.parent)
        } catch {
            return nil
        }
    }

    func numberOfChildren(_ position: BinaryTreePosition) -> Int {
        do {
            let node = try validate(p: position)
            var count = 0
            if node.left != nil {
                count += 1
            }
            if node.right != nil {
                count += 1
            }
            return count
        } catch {
            return -1
        }
    }

    private func validate(p: P) throws -> BinaryNode<Item> {
        if p.node.parent === p.node {
            throw ValidationError.invalidPosition
        }
        return p.node
    }

    private func makePosition(node: BinaryNode<Item>?) -> P? {
        if let node {
            return BinaryTreePosition(node: node)
        } else {
            return nil
        }
    }
}

extension LinkedBinaryTree {
    private func addRoot(_ e: Item) throws -> P? {
        if _root != nil {
            throw ValidationError.rootExists
        }

        _size = 1
        _root = BinaryNode(element: e)
        return makePosition(node: _root)
    }

    private func addLeft(p: P, e: Item) throws -> P? {
        let node = try validate(p: p)
        if node.left != nil {
            throw ValidationError.leftExists
        }
        _size += 1
        node.left = BinaryNode(parent: node, element: e)
        return makePosition(node: node.left)
    }

    private func addRight(p: P, e: Item) throws -> P? {
        let node = try validate(p: p)
        if node.right != nil {
            throw ValidationError.rightExists
        }
        _size += 1
        node.right = BinaryNode(parent: node, element: e)
        return makePosition(node: node.right)
    }

    private func replace(p: P, e: Item) throws -> Item {
        let node = try validate(p: p)
        let old = node.element
        node.element = e
        return old
    }

    private func delete(p: P) throws -> Item {
        let node = try validate(p: p)
        if numberOfChildren(p) == 2 {
            throw ValidationError.twoChildren
        }
        let child = if node.left != nil {
            node.left
        } else {
            node.right
        }
        if child != nil {
            child?.parent = node.parent
        }
        if node === _root {
            _root = child
        } else {
            let parent = node.parent
            if node === parent?.left {
                parent?.left = child
            } else {
                parent?.right = child
            }
        }
        _size -= 1
        node.parent = node
        return node.element
    }

    private func attach(p: P, t1: LinkedBinaryTree<Item>, t2: LinkedBinaryTree<Item>) throws {
        let node = try validate(p: p)
        if !isLeaf(p) {
            throw ValidationError.positionNeedsToBeLeaf
        }
        _size += t1._size + t2._size
        if !t1.isEmpty() {
            t1._root?.parent = node
            node.left = t1._root
            t1._root = nil
            t1._size = 0
        }
        if !t2.isEmpty() {
            t2._root?.parent = node
            node.right = t2._root
            t2._root = nil
            t2._size = 0
        }
    }
}
