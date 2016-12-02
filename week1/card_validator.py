#!/usr/bin/env python

def toDigits(n):
    return toDigits(n / 10) + [n % 10] if n > 0 else []

def doubleEveryOther(seq):
    return [(i % 2 + 1) * e for i,e in enumerate(seq[::-1])][::-1]

def sumDigits(seq):
    return sum([sum(toDigits(x)) for x in seq])

def validate(n):
    return sumDigits(doubleEveryOther(toDigits(n))) % 10 == 0

assert toDigits(1234) == [1,2,3,4]
assert doubleEveryOther([8,7,6,5]) == [16,7,12,5]
assert doubleEveryOther([1,2,3]) == [1,4,3]
assert sumDigits([16,7,12,5]) == 22
assert validate(4012888888881881) == True
assert validate(4012888888881882) == False
