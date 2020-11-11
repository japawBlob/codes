/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv;

/**
 *
 * @author Kolombo
 */
public class NodeImpl implements Node{
    Node left;
    Node right;
    int value;

    public NodeImpl(Node left, Node right, int value) {
        this.left = left;
        this.right = right;
        this.value = value;
    }
    public NodeImpl(int value) {
        this.value = value;
    }

    public void setLeft(Node left) {
        this.left = left;
    }

    public void setRight(Node right) {
        this.right = right;
    }
    @Override
    public Node getLeft() {
        return left;
    }

    @Override
    public Node getRight() {
        return right;
    }

    @Override
    public int getValue() {
        return value;
    }
    
}
