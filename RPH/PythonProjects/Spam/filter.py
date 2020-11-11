import os
import corpus
from confmat import BinaryConfusionMatrix
import utils


class MyFilter:

    def train(self, path):
        pass

    def test(self, path):
        data = corpus.Corpus(path)

        with open(os.path.join(path, "!prediction.txt"), 'w+', encoding='utf-8') as f:
            for name, body in data.emails():
                f.write("%s OK" % name)
                f.write()

    if __name__ == "__main__":
        # used for testing and debugging
        filter = MyFilter()
        filter.test("1")
        confusion_matrix = BinaryConfusionMatrix('SPAM', 'OK')