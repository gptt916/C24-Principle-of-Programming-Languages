'''
Learning objective:
study Python's functional features

We go back to our previous lab, where we practised using higher
order procedures in Scheme. We will re-implement some of the functions
from that lab in Python3.  Once again, we will use lists and lists of
lists to represent vectors and matrices.

Now that you are familiar with the style, albeit in a different
language, it is up to you to find suitable higher order functions or
other funcitonal constructs to use in your solutions.

You should begin by looking at what's available. For example:
  -- generator expressions
  -- list comprehensions
  -- map, reduce, filter, zip, any, all, ...

You will probably need to use zip for most of your solutions.

Finally, as always, make sure your code passes pep8 and pyint.

'''

from functools import reduce


def dot_product1(vector1, vector2):
    '''Return dot product of vector1 and vector2. Use a generator.

    '''

    def gen(vec1, vec2):
        '''Generator for the 2 vectors that yields the product of 2 elements

        '''
        for i, j in zip(vec1, vec2):
            yield i * j
    return sum(gen(vector1, vector2))


def dot_product2(vector1, vector2):
    '''Return dot product of vector1 and vector2. Use map and lambda.

    '''
    return sum(map(lambda x, y: x * y, vector1, vector2))


def dot_product3(vector1, vector2):
    '''Return dot product of vector1 and vector2. Use reduce and lambda.

    '''

    return reduce(lambda x, y: x + y[0] * y[1], zip(vector1, vector2), 0)


def vector_add1(vector1, vector2):
    '''Return the sum of vector1 and vector2. Use list comprehension.

    '''

    return [x[0] + x[1] for x in zip(vector1, vector2)]


def vector_add2(vector1, vector2):
    '''Return the sum of vector1 and vector2. Use map and lambda.

    '''
    return list(map(lambda x, y: x + y, vector1, vector2))


def add1(matrix1, matrix2):
    '''Return the sum of matrix1 and matrix2. Use list comprehension.

    '''

    return [vector_add1(vec1, vec2) for vec1, vec2 in zip(matrix1, matrix2)]


def add2(matrix1, matrix2):
    '''Return the sum of matrix1 and matrix2. Use map.

    '''

    return list(map(lambda x, y: vector_add1(x, y), matrix1, matrix2))


def scalar_vector_mult1(k, vector):
    '''Return scalar product of number k and vector.

    '''
    return [x * k for x in vector]


def scalar_vector_mult2(k, vector):
    '''Return scalar product of number k and vector. Give a solution
    different from the one above.

    '''
    return list(map(lambda x: k * x, vector))


def scalar_mult1(k, matrix):
    '''Return scalar product of number k and matrix.

    '''
    # for i in range(len(matrix)):
    #     for j in range(len(matrix[i])):
    #         matrix[i][j]*=k
    # return matrix

    return [list(map(lambda x: k * x, vector)) for vector in matrix]


def scalar_mult2(k, matrix):
    '''Return scalar product of number k and matrix.  Give a solution
    different from the one above.

    '''

    return [[k * x for x in i] for i in matrix]
