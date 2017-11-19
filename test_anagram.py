import unittest
from anagram import anagram


class MyTest(unittest.TestCase):

    def test1(self):
        self.assertTrue(anagram("silent", "listen"))

    def test2(self):
        self.assertFalse(anagram("aa", "a"))

    def test3(self):
        self.assertTrue(anagram("aba", "baa"))

    def test4(self):
        self.assertTrue(anagram("", ""))

    def test5(self):
        self.assertTrue(anagram("madam curie", "radium came"))


if __name__ == "__main__":
    unittest.main()