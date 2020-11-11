class MyMatrix:

    def __init__(self,matrix=None):
        self.matrix = matrix


    def save(self, filename):
        with open(filename, 'w', encoding='utf-8') as f:
            for i in range(len(self.matrix)):
                for j in range(len(self.matrix[i])):
                    if(j!=0):
                        f.write(' ')
                    f.write(str(self.matrix[i][j]))
                f.write('\n')

    def load(self,filename):
        i = 0
        with open(filename, 'r', encoding='utf-8') as f:
            for line in f:
                row = line.split(' ')
                self.matrix.append([])
                for j in range(len(row)):
                     self.matrix[i].append(int(row[j]))
                i += 1
