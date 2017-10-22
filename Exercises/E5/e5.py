"""
Author gongyi2
CSCC24 E5
"""
from abc import ABCMeta, abstractmethod
from enum import Enum, unique
from collections import Counter


@unique
class POrdering(Enum):
    '''
    A POrdering Enumerator class
    '''
    PLT = 1
    PGT = 2
    PEQ = 3
    PIN = 4


class POrd(metaclass=ABCMeta):
    '''
    A POrd abstract class that implements <, >, <=, >=
    also defines the abstact method pcompare
    '''
    def __lt__(self, other):
        return self != other and\
            self.pcompare(other) == POrdering.PLT

    def __le__(self, other):
        return self == other or self < other

    @abstractmethod
    def pcompare(self, other):
        '''
        Abstract method
        '''
        pass


class Infix:
    '''
    An Infix predefined for the assignment
    '''
    def __init__(self, function):
        self.function = function

    def __ror__(self, other):
        return Infix(lambda x, self=self, other=other: self.function(other, x))

    def __or__(self, other):
        return self.function(other)

    def __call__(self, value1, value2):
        return self.function(value1, value2)


pin = Infix(lambda x, y: x.pcompare(y) == POrdering.PIN)


class PSet(POrd):
    '''
    PSet class that does the main job for this assignment
    '''
    def __init__(self, lst=None):
        self.lst = lst if lst != None else []

    def __str__(self):
        return str(self.lst)

    def __repr__(self):
        return str(self.lst)

    def __eq__(self, other):
        return Counter(self.lst) == Counter(other.lst)

    def pcompare(self, other):
        lte = all(x in other.lst for x in self.lst)
        gte = all(x in self.lst for x in other.lst)

        if self == other:
            return POrdering.PEQ
        elif not self.lst and other.lst:
            return POrdering.PLT
        elif self.lst and not other.lst:
            return POrdering.PGT
        elif lte:
            return POrdering.PLT
        elif gte:
            return POrdering.PGT
        else:
            return POrdering.PIN
