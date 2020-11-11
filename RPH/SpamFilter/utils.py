import os


def read_classification_from_file(path):

    dic = {}
    with open(path, 'r', encoding='utf-8') as f:
        for line in f:
            word = line.split()
            dic[word[0]] = word[1]
    return dic

def write_classification_to_file(path):
    with open(os.path.join(dir,"!prediction.txt"),'w',encoding="utf-8") as f:
        for key in dic:
            f.write(key + " " + dic[key] + "\n")