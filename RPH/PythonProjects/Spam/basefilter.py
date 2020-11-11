import os,sys
#sys.path.append("Spam")
import corpus


class BaseFilter:
    def train(self):
        pass

    def test(self):
        data = corpus.Corpus("1")

        with open(os.path.join(data.path, "!prediction"), 'w', encoding='utf-8') as f:
            for name, body in data.emails():
                f.write("%s OK" % name)
