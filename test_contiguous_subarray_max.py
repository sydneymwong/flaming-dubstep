import unittest
from contiguous_subarray_max import max_contiguous

class MyTest(unittest.TestCase):

    def test1(self):
        self.assertEqual(max_contiguous([1,2,3]), [6, [1,2,3]])
        
    def test2(self):
        self.assertEqual(max_contiguous([-1,2,3]), [5, [2,3]])

    def test3(self):
        self.assertEqual(max_contiguous([-10,62,7.8,-2]), [69.8, [62,7.8]])
       
    def test4(self):
        self.assertEqual(max_contiguous([0]), [0, [0]])
        

if __name__ == "__main__":
    unittest.main()