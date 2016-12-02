#!/usr/bin/env python

def hanoi(n,a,b,c):
    return hanoi(n-1,a,c,b) + [(a,b)] + hanoi(n-1,c,b,a) if n > 0 else []

assert hanoi(2,'a','b','c') == [('a','c'),('a','b'),('c','b')]
