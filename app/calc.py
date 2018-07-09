class Calc:

    def __init__(self):
        self.__result = 0.0
        self.__history = list()

    def get_result(self):
        return self.__result

    def get_history(self):
        return self.__history

    def sum(self, num):
        self.__result += num
        self.__hist_push("+", num)

    def sub(self, num):
        self.__result -= num
        self.__hist_push("-", num)

    def mult(self, num):
        self.__result *= num
        self.__hist_push("*", num)

    def div(self, num):
        self.__result /= num
        self.__hist_push("/", num)

    def __hist_push(self, oper, num):
        self.__history.append(oper + " " + str(num))
