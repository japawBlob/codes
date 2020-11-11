import random


words = []

with open("myboybuildscoffins.txt", 'r', encoding='utf-8') as f:
    for line in f:
        #print(line)
        for word in line.split():
            words.append(word)

print(words)

with open("randomMyBoyAllSymbols.txt", "w+") as f1:
    for i in range(3000):
        f1.write(random.choice(words) + " ")