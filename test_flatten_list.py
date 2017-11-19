import unittest
from flatten_list import flatten_list


class MyTest(unittest.TestCase):

    def test1(self):
        self.assertEqual(flatten_list([]), [])

    def test2(self):
        self.assertEqual(flatten_list([[]]), [])

    def test3(self):
        self.assertEqual(flatten_list([1, [2, 3]]), [1, 2, 3])

    def test4(self):
        self.assertEqual(flatten_list([[5, 6], 7, 8]), [5, 6, 7, 8])

    def test5(self):
        thrown = False
        try:
            flatten_list(["a"])
        except ValueError:
            thrown = True
        self.assertTrue(thrown)


if __name__ == "__main__":
    unittest.main()
