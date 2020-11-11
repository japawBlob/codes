#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    int days, earn, last;
    short* active;
} _exp;

int ret = 0;
int n, d;
int score = 0;
int days_active = 0;

int find(int id, _exp* exps, int cur_val, short* lab) {
    int val = 0;
	int next_id = id - 1;
    for (int i = 0; i < id; i++) {
        int use = 0;
        short* temp = (short*)calloc(d, sizeof(short));
        memcpy(temp, lab, d * sizeof(short));
        for (int j = 0; j < d - exps[i].active[(exps[i].days - 1)]; j++) {
            int b = 0;
            for (int k = 0; k < exps[i].days; k++) {
                if (lab[j + exps[i].active[k]] == 0) {
                    b++;
                    printf("B %i\n", b);
                } else {
                    b = 0;
                }
            }
            if (b == exps[i].days) {
                 printf("B %i\n", b);
                use = 1;
                for (int l = 0; l < exps[i].days; l++) {
                    temp[j + exps[i].active[l]] = 1;
                }
                break;
            }
        }
        if (use == 0) {
            free(temp);
			continue;
        }
        _exp* next_exps = (_exp*)malloc(next_id * sizeof(_exp));
        for (int a = 0; a < next_id; a++) {
            if (i == a) {
                next_exps[a] = exps[next_id];
            } else {
                next_exps[a] = exps[a];
            }
        }
        val = cur_val + exps[i].earn;
        if(val > score) {
            score = val;
            int days = 0;
            for (int z = 0; z < d; z++){
                if (temp[z] == 1) {
                    days++;
                }
            }
            days_active = days;
        }
        find(next_id, next_exps, val, temp);
        free(temp);
		free(next_exps);
    }
    return 0;
}

int countDays(int * array)
{
    int days = 0;
    for (int i = 0; i < d; ++i){
        if (array[i] == 1) ++days;
    }
    return days;
}

int main(int argc, char const *argv[]) {
    if (scanf("%d %d\n", &n, &d) != 2) {
        exit(1);
    }
    _exp* exps = (_exp*)malloc(n * sizeof(_exp));
    for (int i = 0; i < n; i++) {
        if (scanf("%d %d\n", &exps[i].days, &exps[i].earn) != 2){
            ret = 1;
            break;
        }
        exps[i].active = (short*)calloc(d, sizeof(short));
        for (int j = 0; j < exps[i].days; j++) {
            if (scanf("%hd", &exps[i].active[j]) != 1) {
                ret = 1;
                break;
            }
        }
    }

    short* lab = (short*)calloc(d, sizeof(short));

    if (!ret && find(n, exps, 0, lab) == 0) {
        printf("%d %d\n", score, days_active);
    } else {
        ret = -1;
    }

    for (size_t x = 0; x < n; x++) {
        free(exps[x].active);
    }
    free(lab);
    free(exps);

    if (ret != 0) {
        fprintf(stderr, "ERROR: %d\n", ret);
    }
    return ret;
}
