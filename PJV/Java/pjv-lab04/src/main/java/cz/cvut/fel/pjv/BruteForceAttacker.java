package cz.cvut.fel.pjv;

public class BruteForceAttacker extends Thief {
    
   
    @Override
    public void breakPassword(int sizeOfPassword) {
        char[] characters = getCharacters();
        char [] possiblePassword = new char[sizeOfPassword];
        if(sizeOfPassword == 1){
            for(int i = 0; i < characters.length;i++){
                possiblePassword[0] = characters[i];
                if(tryOpen(possiblePassword))
                    break;
            }
        } else {
        
            for(int i = 0; i < sizeOfPassword; i++){
                possiblePassword[i] = characters[0];
            }
            int help = 0;
            helpFunction(possiblePassword, sizeOfPassword-1, characters, help);
        }
    }
    private boolean helpFunction(char[] possiblePassword,int sizeOfPassword, char[] characters, int help){
        //System.out.println(possiblePassword);
        if(tryOpen(possiblePassword)){
            return true;
        } 
        if(help == sizeOfPassword+1){
            return false;
        } else {
            
            for(int i = 0; i < characters.length; i++){
                possiblePassword[help] = characters[i];
                if(helpFunction(possiblePassword, sizeOfPassword, characters, help+1)){
                    return true;
                }
                
            }
        }
        return false;
    }
}

