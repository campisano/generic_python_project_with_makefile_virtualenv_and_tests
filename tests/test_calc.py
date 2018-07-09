import unittest
from app.calc import Calc


class TestCalc(unittest.TestCase):

    def setUp(self):
        self.calc = Calc()

    def test_add(self):
        self.calc.sum(1)

        self.assertEqual(1, self.calc.get_result())
        self.assertEqual(1, len(self.calc.get_history()))
        self.assertEqual("+ 1", self.calc.get_history()[0])

    def test_sub(self):
        self.calc.sub(1)

        self.assertEqual(-1, self.calc.get_result())
        self.assertEqual(1, len(self.calc.get_history()))
        self.assertEqual("- 1", self.calc.get_history()[0])

    def test_mult(self):
        self.calc.mult(1)

        self.assertEqual(0, self.calc.get_result())
        self.assertEqual(1, len(self.calc.get_history()))
        self.assertEqual("* 1", self.calc.get_history()[0])

    def test_div(self):
        self.calc.div(1)

        self.assertEqual(0, self.calc.get_result())
        self.assertEqual(1, len(self.calc.get_history()))
        self.assertEqual("/ 1", self.calc.get_history()[0])
