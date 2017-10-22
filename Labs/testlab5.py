"""Tester for CSCC24 Lab 5"""

import lab5
import unittest


class TestRecursion(unittest.TestCase):

    m1 = [[1, 0, 2],
          [2, 1, 4],
          [-1, 1, -1]]
    m2 = [[1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]]
    m3 = [[2, 2, 5],
          [6, 6, 10],
          [6, 9, 8]]
    m4 = [[15, 18, 21],
          [34, 41, 48],
          [-4, -5, -6]]
    m5 = [[2, 0, 4],
          [4, 2, 8],
          [-2, 2, -2]]
    m1tr = [[1, 2, -1],
            [0, 1, 1],
            [2, 4, -1]]

    def testDotProduct1(self):

        self.assertEqual(lab5.dot_product1([], []), 0)
        self.assertEqual(lab5.dot_product1([1], [-2]), -2)
        self.assertEqual(lab5.dot_product1([1, -2, 6], [-2, 0, 1]), 4)

    def testDotProduct2(self):

        self.assertEqual(lab5.dot_product2([], []), 0)
        self.assertEqual(lab5.dot_product2([1], [-2]), -2)
        self.assertEqual(lab5.dot_product2([1, -2, 6], [-2, 0, 1]), 4)

    def testDotProduct3(self):

        self.assertEqual(lab5.dot_product3([], []), 0)
        self.assertEqual(lab5.dot_product3([1], [-2]), -2)
        self.assertEqual(lab5.dot_product3([1, -2, 6], [-2, 0, 1]), 4)

    def testVectorAdd1(self):

        self.assertEqual(lab5.vector_add1([], []), [])
        self.assertEqual(lab5.vector_add1([1], [-2]), [-1])
        self.assertEqual(lab5.vector_add1([1, -2, 6], [-2, 0, 1]), [-1, -2, 7])

    def testVectorAdd2(self):

        self.assertEqual(lab5.vector_add2([], []), [])
        self.assertEqual(lab5.vector_add2([1], [-2]), [-1])
        self.assertEqual(lab5.vector_add2([1, -2, 6], [-2, 0, 1]), [-1, -2, 7])

    def testAdd1(self):
        self.assertEqual(lab5.add1(self.m1, self.m2), self.m3)
        self.assertEqual(lab5.add1([], []), [])
        self.assertEqual(lab5.add1([[]], [[]]), [[]])
        self.assertEqual(lab5.add1([[1]], [[-2]]), [[-1]])
        self.assertEqual(lab5.add1([[1, -2, 6]], [[-2, 0, 1]]), [[-1, -2, 7]])
        self.assertEqual(lab5.add1([[1, 2], [1, 2]], [
                         [1, 2], [1, 2]]), [[2, 4], [2, 4]])

    def testAdd2(self):
        self.assertEqual(lab5.add2([], []), [])
        self.assertEqual(lab5.add2([[]], [[]]), [[]])
        self.assertEqual(lab5.add2([[1]], [[-2]]), [[-1]])
        self.assertEqual(lab5.add2([[1, -2, 6]], [[-2, 0, 1]]), [[-1, -2, 7]])
        self.assertEqual(lab5.add2([[1, 2], [1, 2]], [
                         [1, 2], [1, 2]]), [[2, 4], [2, 4]])

    def testScalar_Vector_Mult1(self):
        self.assertEqual(lab5.scalar_vector_mult1(3, [1, 2, 3]), [3, 6, 9])
        self.assertEqual(lab5.scalar_vector_mult1(0, []), [])

    def testScalar_Vector_Mult2(self):
        self.assertEqual(lab5.scalar_vector_mult2(3, [1, 2, 3]), [3, 6, 9])
        self.assertEqual(lab5.scalar_vector_mult2(0, []), [])

    def testScalar_Mult1(self):
        self.assertEqual(lab5.scalar_mult1(
            3, [[1, 2], [1, 2]]), [[3, 6], [3, 6]])
        self.assertEqual(lab5.scalar_mult1(3, [[1, 2, 3]]), [[3, 6, 9]])
        self.assertEqual(lab5.scalar_mult1(0, [[]]), [[]])

    def testScalar_Mult2(self):
        self.assertEqual(lab5.scalar_mult2(
            3, [[1, 2], [1, 2]]), [[3, 6], [3, 6]])
        self.assertEqual(lab5.scalar_mult2(3, [[1, 2, 3]]), [[3, 6, 9]])
        self.assertEqual(lab5.scalar_mult2(0, []), [])
if __name__ == '__main__':

    unittest.main()
