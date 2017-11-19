import unittest
from unique_characters import unique_characters, unique_characters_set

class MyTest(unittest.TestCase):

    def test1(self):
        self.assertTrue(unique_characters("abc"))
        self.assertTrue(unique_characters_set("abc"))

    def test2(self):
        self.assertFalse(unique_characters("aa"))
        self.assertFalse(unique_characters_set("aa"))

    def test3(self):
        self.assertFalse(unique_characters("aba"))
        self.assertFalse(unique_characters_set("aba"))

    def test4(self):
        self.assertTrue(unique_characters("15an2!-9lq*&"))
        self.assertTrue(unique_characters_set("15an2!-9lq*&"))


if __name__ == "__main__":
    unittest.main()