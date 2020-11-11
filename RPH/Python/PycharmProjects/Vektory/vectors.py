
class MyVector:

    def __init__(self, value):
        self.value = value

    def get_vector(self):
        return self.value

    def __mul__(self, other):
        x = 0
        for i in range(len(self.value)):
            x += self.value[i] * other.value[i]
        return x

    def is_perpendicular_to(self, other):
        if ((self.value*other.value)==0):
            return True
        else:
            return False

    def cross_product(self):

        # return MyVector[s1,s2,s3];

