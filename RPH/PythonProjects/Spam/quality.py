import os
import confmat
import utils


def quality_score(tp, tn, fp, fn):
    citatel = tp + tn
    jmenovatel = tp + tn + 10*fp + fn

    q = citatel/jmenovatel

    return q


def compute_quality_for_corpus(corpus_dir):
    truth = os.path.join(corpus_dir, '!truth.txt')
    prediction = os.path.join(corpus_dir, '!prediction.txt')

    truth_dir = utils.read_classification_from_file(truth)
    pred_dir = utils.read_classification_from_file(prediction)

    brambora = confmat.BinaryConfusionMatrix("SPAM", "OK")
    brambora.compute_from_dicts(truth_dir, pred_dir)

    bramborova_kase = brambora.as_dict()
    rizek_s_bramborovou_kasi = quality_score(bramborova_kase['tp'], bramborova_kase['tn'], bramborova_kase['fp'], bramborova_kase['fn'])
    return rizek_s_bramborovou_kasi

