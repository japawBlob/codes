import os
import corpus
from quality import compute_quality_for_corpus

spam_triggers = ["FREE", "PORN", "SAVE", "!!!", "<HTML>", "BUY", "sexy", "SEX", "100%", "DIET", "diet",
                 "RICH", "DOLLAR", "guaranteed", "for free", "hesitate"]  # trigger words


class MyFilter:

    def train(self, path):
        pass

    def test(self, path):
        data = corpus.Corpus(path)

        with open(os.path.join(path, "!prediction.txt"), 'w+', encoding='utf-8') as f:
            for name, body in data.emails():
                mode = 0
                for i in spam_triggers:  # if there is one of 'trigger' words - put it into spam
                    if i in body:
                        f.write("%s SPAM\n" % name)
                        mode += 1
                        break
                    else:
                        continue
                if mode == 0:
                    f.write("%s OK\n" % name)


if __name__ == "__main__":
    # used for testing
    filter = MyFilter()
    filter.test("2")

    print(compute_quality_for_corpus("2"))