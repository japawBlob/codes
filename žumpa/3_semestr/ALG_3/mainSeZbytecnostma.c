#include <stdio.h>
#include <stdlib.h>

typedef struct s {
	long long int weight;
	int balance;
	int plane;
	long long int leftWeight;
	long long int rightWeight;
	struct s *parent;
	struct s *left;
	struct s *right;
} node;

long long int totalImbalance = 0;
node** hangedPlanes;
int blob = 0;

node* recu (long long int totalWeight, int numberOfPlanes, int* planes, node* parent);
long int placePilots(int pilotWeight, int long numberOfPlanes);
long int placePils(node* root, int pilotWeight, int imbalance, int NumberOfPilots);
long int onlyVLevo(node* root, int pilotWeight, int imbalance, int NumberOfPilots);
long int onlyVPravo(node* root, int pilotWeight, int imbalance, int NumberOfPilots);
void freeNodes(node* root);

int main(int argc, char const *argv[]){
	long long int numberOfPlanes;
	int pilotWeight;
	scanf("%lli %i", &numberOfPlanes, &pilotWeight);

	long long int totalWeight=0;
	int planes[numberOfPlanes];
	for (int i = 0; i < numberOfPlanes; ++i){
		scanf("%i ", &planes[i]);
		totalWeight+=planes[i];
	}


	node* root = recu(totalWeight, numberOfPlanes, planes, NULL);

	long int bestBalance;
	bestBalance = placePils(root, pilotWeight, totalImbalance, 2);

	freeNodes(root);

	printf("%lli %li\n", totalImbalance, bestBalance);

	return 0;
}

//Moje uzasna funkce na hozeni pilotu, ktera trva tak dlouho, ze ani po 15ti minutach mi moje i7 v pocitaci nespocitala pub10...
long int placePilots(int pilotWeight, long int numberOfPlanes){
	long int bestBalance = 2147483647;
	long int tempBalance = totalImbalance;
	for (int i = 0; i < numberOfPlanes; ++i){
		hangedPlanes[i]->weight+=pilotWeight;
		node* temp = hangedPlanes[i];

		temp = hangedPlanes[i];
		while(temp->parent!=NULL){
			temp=temp->parent;
			temp->weight+=pilotWeight;
			tempBalance -= temp->balance;
			temp->balance=abs(temp->left->weight-temp->right->weight);
			tempBalance += temp->balance;
		}
		temp = hangedPlanes[i];

		for (int j = i+1; j < numberOfPlanes; ++j){
			hangedPlanes[j]->weight+=pilotWeight;
			node* temp2 = hangedPlanes[j];
			while(temp2->parent!=NULL){
				temp2=temp2->parent;
				temp2->weight+=pilotWeight;
				tempBalance -= temp2->balance;
				temp2->balance=abs(temp2->left->weight-temp2->right->weight);
				tempBalance += temp2->balance;
			}
			if(tempBalance<bestBalance){
				bestBalance = tempBalance;
			}
			hangedPlanes[j]->weight-=pilotWeight;
			temp2=hangedPlanes[j];
			while(temp2->parent!=NULL){
				temp2=temp2->parent;
				temp2->weight-=pilotWeight;
				tempBalance -= temp2->balance;
				temp2->balance=abs(temp2->left->weight-temp2->right->weight);
				tempBalance += temp2->balance;
			}
		}
		hangedPlanes[i]->weight-=pilotWeight;
		temp=hangedPlanes[i];
		while(temp->parent!=NULL){
			temp=temp->parent;
			temp->weight-=pilotWeight;
			tempBalance -= temp->balance;
			temp->balance=abs(temp->left->weight-temp->right->weight);
			tempBalance += temp->balance;
		}
	}
	return bestBalance;
}
//FUNKCE POUZITA NA VHOZENI PILOTU DO LETADEL
//pokud se chcete odlisit, tak pilotWeight muzete mit jako globalni promennou
long int placePils(node* root, int pilotWeight, int imbalance, int NumberOfPilots){
	if(root->plane == 1){
		return imbalance;
	}
	//possible best zacina jako ∞ - ja mam nastaveno na max hodnotu intu
	int possibleBest = 2147483647;
	int temp;
	long tempImbalance;

	//tempImbalance ze znazornuje, jak by vypadala celkova Imbalance, kdyby se oba piloti dali na levou stranu od rootu
	//kdybychom meli celkovou imbalanci 100, ale balanc rootu by byl 0, tak pridanim vsechny piloty ovlivnim akorat tu 0 u rootu
	//a tempImbalance by byla 100+x*pilot
	//Tedy od imbalance odectu balanc rootu - dostanu imbalaci bez rootu a prictu modifikovanou balanci rootu...
	tempImbalance = imbalance-root->balance+abs(root->rightWeight-(root->leftWeight+NumberOfPilots*pilotWeight));

	//volam rekurzi na levy podstrom s pozmenenymi balancemi
	temp = placePils(root->left, pilotWeight, tempImbalance, NumberOfPilots);

	//Hej je to lepsi nez dosavadni best??
	if(temp < possibleBest){
		possibleBest = temp;
	}
	//obdobny pristup jako vyse, ale pro druhou stranu
	tempImbalance = imbalance-root->balance+abs(-root->rightWeight+(root->leftWeight-NumberOfPilots*pilotWeight));
	temp = placePils(root->right, pilotWeight, tempImbalance, NumberOfPilots);

	//Hej je to lepsi nez dosavadni best??
	if(temp < possibleBest){
		possibleBest = temp;
	}

	//Tady nastava situace, kdy piloty splitnu. Podminka zarucuje, ze budu splitovat jen pokud mam oba piloty u sebe. Vrchni rekurze se
	//mohou provest i s jednim pilotem
	if(NumberOfPilots-1>0){
		//Tim, ze pridam pilota na obe strany zarucim, ze balance rootu bude stejna - proto zde neni zadne zbesile prepocitavani tempImbalance
		//protoze placePils v sobe nese zmenu po pridani pilota a pak cely zbytek stromu. Tak pri secteni dvou placePils mam 
		//1 x zmenaProLevouStanu + celkovaImbalance + 1 x zmena proPravouStranu + celkovaImbalance - z toho plyne ze musim jednou tu celkovou imbalanci odecist
		temp = placePils(root->right, pilotWeight, imbalance, NumberOfPilots-1) + placePils(root->left, pilotWeight, imbalance, NumberOfPilots-1) - imbalance;

		//Hej je to lepsi nez dosavadni best??
		if(temp < possibleBest){
			possibleBest = temp;
		}
	}
	return possibleBest;
}
//POMOCNA FUNKCE NA KTERE JSEM JEN ZKOUSEL, ZDA UMIM ALESPON REKURZIVNE POSLAT OBA LETCE DO LEVA
long int onlyVLevo(node* root, int pilotWeight, int imbalance, int NumberOfPilots){
	if(root->plane == 1){
		return imbalance;
	}
	int possibleBest = 2147483647;
	int temp;

	int tempImbalance = imbalance-root->balance+abs(root->rightWeight-(root->leftWeight+NumberOfPilots*pilotWeight));
	temp = onlyVLevo(root->left, pilotWeight, tempImbalance, NumberOfPilots);
	if(temp < possibleBest){
		possibleBest = temp;
	}
	return possibleBest;
}
//POMOCNA FUNKCE NA KTERE JSEM JEN ZKOUSEL, ZDA UMIM ALESPON REKURZIVNE POSLAT OBA LETCE DO PRAVA
long int onlyVPravo(node* root, int pilotWeight, int imbalance, int NumberOfPilots){
	if(root->plane == 1){
		return imbalance;
	}
	int possibleBest = 2147483647;
	int temp;

	int tempImbalance = imbalance-root->balance+abs(-root->rightWeight+(root->leftWeight-NumberOfPilots*pilotWeight));
	temp = onlyVPravo(root->right, pilotWeight, tempImbalance, NumberOfPilots);
	if(temp < possibleBest){
		possibleBest = temp;
	}
	return possibleBest;
}

//REKURZIVNI FCE PRO NACITANI DO STROMOVE STRUKTURY
node* recu (long long int totalWeight, int numberOfPlanes, int* planes, node* parent){
	node* ret = malloc(sizeof(node));

	//Pokud je v podstromu uz jen jidinne letadlo - dostal jsem se nakonec, zalozim letadlo a pokracuju
	//Pokud byste chteli se ozvlastnit, tak puvodne jsem si myslel, za budu letadlo poznavat tak, ze ma balance -1,
	//abych si nemusel ukladat jeste promennou plane. Ale ve finale pouzivam dal v kodu if(node->plane==1) a ne if(node->balance==-1)
	if(numberOfPlanes == 1){
		ret->weight = totalWeight;
		ret->balance = -1;
		ret->plane = 1;
		ret->parent = parent;
		ret->left=NULL;
		ret->right=NULL;
		return ret;
	}
	ret->parent = parent;
	ret->weight = totalWeight;
	ret->plane = 0;

	//Int i bude slouzit jako delka leveho podstromu letadel
	//Int j bude slouzit jako delka praveho podstromu letadel
	int i = 1;
	int j = 1;
	//Diky podmince vyse mam jistotu, ze zde mam minimalne 2 letadla. Jedno tedy dam do leveho a druhe do praveho
	long long int leftWeight = planes[0];
	long long int rightWeight = planes[numberOfPlanes-1];

	totalWeight=totalWeight-rightWeight-leftWeight;

	//pokud jsou jeste nejaka letadla k dispozici pridavam na stranu, ktera je momentalne lehci.
	//U i (leve strany) se pointer pohybuje do prava, u j (prave strany) pointer pohybuje do leva.
	//V momente, kdy se i a j potkaji (i+j==numberOfPlanes) by melo dojit aj k totalWeight==0. 
	//Da se tu zmenit podminka z totalWeight>0 na i+j==numberOfPlanes (myslim)
	while(totalWeight>0){
		if(leftWeight<rightWeight){
			totalWeight-=planes[i];
			leftWeight+=planes[i];
			i++;
		} else {
			totalWeight-=planes[numberOfPlanes-1-j];
			rightWeight+=planes[numberOfPlanes-1-j];
			j++;
		}
	}
	ret->leftWeight=leftWeight;
	ret->rightWeight=rightWeight;
	ret->balance = abs(rightWeight-leftWeight);

	//Rovnou tu pri vytvareni stormu pocitam celkovou disBalanci
	totalImbalance += ret->balance;

	//A rekurzi opakuji na leveho a praveho potomka
 	ret->left = recu(leftWeight, i, planes, ret);
	ret->right = recu(rightWeight, j, planes+numberOfPlanes-j, ret);
	
	return ret;
}

void freeNodes (node* root){
	if(root->left!=NULL){
		freeNodes(root->left);
	}
	if(root->right!=NULL){
		freeNodes(root->right);
	}
	free(root);
}
