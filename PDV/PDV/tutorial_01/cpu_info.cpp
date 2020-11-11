// Knihovna pro zjisteni skutecneho poctu jader. Jine pristupy vetsinou vraci pocet
// vlaken, coz je v pripade procesoru s hyperthreadingem jina hodnota.




//cpuid function defined in instrset_detect.cpp by Agner Fog (2014 GNU General Public License)
//http://www.agner.org/optimize/vectorclass.zip

// Define interface to cpuid instruction.
// input:  eax = functionnumber, ecx = 0
// output: eax = output[0], ebx = output[1], ecx = output[2], edx = output[3]
static inline void cpuid (int output[4], int functionnumber) {
#if defined (_MSC_VER) || defined (__INTEL_COMPILER)       // Microsoft or Intel compiler, intrin.h included

    __cpuidex(output, functionnumber, 0);                  // intrinsic function for CPUID

#elif defined(__GNUC__) || defined(__clang__)              // use inline assembly, Gnu/AT&T syntax

    int a, b, c, d;
    __asm("cpuid" : "=a"(a),"=b"(b),"=c"(c),"=d"(d) : "a"(functionnumber),"c"(0) : );
    output[0] = a;
    output[1] = b;
    output[2] = c;
    output[3] = d;

#else                                                      // unknown platform. try inline assembly with masm/intel syntax

    __asm {
    mov eax, functionnumber
      xor ecx, ecx
      cpuid;
    mov esi, output
      mov [esi],    eax
      mov [esi+4],  ebx
      mov [esi+8],  ecx
      mov [esi+12], edx
      }

#endif
}

int get_num_cores() {
    //Assuming an Intel processor with CPUID leaf 11
    int cores = 0;
#pragma omp parallel reduction(+:cores)
    {
        int regs[4];
        cpuid(regs,11);
        if(!(regs[3]&1)) cores++;
    }
    return cores;
}
