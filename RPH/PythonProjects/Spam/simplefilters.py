import Spam.corpus
import os
import random
import Spam.basefilter


class BaseFilter:
    def train(self, path):
        with open(os.path.join(path, "!prediction"), 'w+', encoding='utf-8') as f:
            pass

    def test(self, path):
        data = Spam.corpus.Corpus("1")

        with open(os.path.join(path, "!prediction"), 'w+', encoding='utf-8') as f:
            for name, body in data.emails():
                f.write("%s OK" % name)


class NaiveFilter(BaseFilter):
    def test(self, path):
        data = Spam.corpus.Corpus("1")

        with open(os.path.join(path, "!prediction"), 'w+', encoding='utf-8') as f:
            for name, body in data.emails():
                f.write("%s OK" % name)


class ParanoidFilter(BaseFilter):
    def test(self, path):
        data = Spam.corpus.Corpus("1")

        with open(os.path.join(data.path, "!prediction"), 'w+', encoding='utf-8') as f:
            for name, body in data.emails():
                f.write("%s SPAM" % name)


class RandomFilter(BaseFilter):
    def test(self, path):
        data = Spam.corpus.Corpus("1")
        choices = ('OK', 'SPAM')
        with open(os.path.join(data.path, "!prediction"), 'w+', encoding='utf-8') as f:
            for name, body in data.emails():
                stamp = choices[random.randint(0, 1)]
                f.write("%s %s" % (name, stamp))
