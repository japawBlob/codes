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

node* recu (long long int totalWeight, int numberOfPlanes, int* planes, node* parent);
long int placePils(node* root, int pilotWeight, int imbalance, int NumberOfPilots);
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
	tempImbalance = imbalance-root->balance+llabs(root->rightWeight-(root->leftWeight+NumberOfPilots*pilotWeight));

	//volam rekurzi na levy podstrom s pozmenenymi balancemi
	temp = placePils(root->left, pilotWeight, tempImbalance, NumberOfPilots);

	//Hej je to lepsi nez dosavadni best??
	if(temp < possibleBest){
		possibleBest = temp;
	}
	//obdobny pristup jako vyse, ale pro druhou stranu
	tempImbalance = imbalance-root->balance+llabs(-root->rightWeight+(root->leftWeight-NumberOfPilots*pilotWeight));
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
	//Da se i pouzit abs(), ale clang rve, kdyz to tam neni, gcc to nevadi - v originale tam mam abs(), tak muzete pouzit llabs()
	//jedinne, co to znamena je, ze to pracuje s long longem
	ret->balance = llabs(rightWeight-leftWeight);

	//Rovnou tu pri vytvareni stormu pocitam celkovou disBalanci
	totalImbalance += ret->balance;

	//A rekurzi opakuji na leveho a praveho potomka
 	ret->left = recu(leftWeight, i, planes, ret);
 	//planes+numberOfPlanes-j znamena, ze vezmu pointer ukazujici na zacatek pole planes
 	//a posunu ho na zacatek casti nalezici k rightWeight
 	//Da se to udelat i pomoci memcpy bez toho aniz by to bylo nejak extra pomalejsi
 	//https://stackoverflow.com/questions/5850000/how-to-split-array-into-two-arrays-in-c
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
