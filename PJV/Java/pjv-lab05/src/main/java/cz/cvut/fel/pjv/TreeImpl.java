/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv;

import java.util.Set;

/**
 *
 * @author Kolombo
 */
public class TreeImpl implements Tree{
    Node root;
    
    public TreeImpl() {
    }

    
    
    
    @Override
    public void setTree(int[] values) {
        int length = values.length;
        
        if(length > 0){
            root = setChildren(0, length-1, values);
        } else {
            root = null;
        }
        
        
    }
//FELT CUTE. MIGHT IMPLEMENT LATER...
/*
    public Node getLeft(int length, int [] values){
        if(length/2 == 0){
            return new NodeImpl(values[0]);
        } else {
            NodeImpl node = new NodeImpl(values[length/2]);
            node.setLeft(getLeft((length/2), values));
            if(length % 2 == 1){
                node.setRight(getRight((length/2), values, ));
            } else {
                node.setRight(getRight((length/2) -1, values, ));
            }
            return node;
        }
    }

    public Node getRight(int length, int [] values, int shift){
        if(length/2 == 0){
            return new NodeImpl(values[0]);
        }
    }

    public Node getChildren(int length, int [] values, int shift){
         if(length/2 == 0 || length == shift){
            return new NodeImpl(values[shift]);
        } else {
            NodeImpl node = new NodeImpl(values[length/2]);
            node.setLeft(getChildren(length/2, values, shift));
            if(length % 2 == 1){
                node.setRight(getChildren((length/2), values, shift+1+length/2));
            } else {
                node.setRight(getChildren((length/2)-1, values, shift+1+length/2)); 
            }
            return node; 
        }
        
    }
*/
    public Node setChildren(int leftBorder, int rightBorder, int [] values){
         if(leftBorder == rightBorder){
            return new NodeImpl(values[leftBorder]);
        } else {
            int middle;
            if((rightBorder-leftBorder)%2 == 1){
                middle = (rightBorder-leftBorder+1)/2 + leftBorder;
            } else {
                middle = (rightBorder-leftBorder)/2 + leftBorder;
            }
            NodeImpl node = new NodeImpl(values[middle]);
            node.setLeft(setChildren(leftBorder, middle-1, values));
            if(middle+1 > rightBorder){
                node.setRight(null);
            } else {
                node.setRight(setChildren(middle+1, rightBorder, values));
            }
            return node; 
        }
        
    }
    @Override
    public Node getRoot() {
        return root;
    }

    @Override
    public String toString() {
        return printChildren();
    }
    //public 
    public String printChildren(){
        int deepness = 0;
        String ret = "";
        Node blob = root;
        if(blob == null){
            return ret;
        }
        ret += "- " + Integer.toString(blob.getValue()) + "\n";  
        if(blob.getLeft() != null){
            ret += printChildren(blob.getLeft(), deepness+1);
            if(blob.getRight() != null){
                ret += printChildren(blob.getRight(), deepness+1);
            }
        }
        
        
        return ret;
    }
    public String printChildren(Node blob, int deepness){
        String ret = "";
        if(blob == null){
            return ret;
        }
        for(int i = 0; i<(deepness); i++){
            ret += " ";
        }
        ret += "- " + Integer.toString(blob.getValue())+"\n";  
        if(blob.getLeft() != null){
            ret += printChildren(blob.getLeft(), deepness+1);
            if(blob.getRight() != null){
                ret += printChildren(blob.getRight(), deepness+1);
            }
        }
        return ret;
    }

    
    
}
