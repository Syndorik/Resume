#include "cachelab.h"
#include <getopt.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <math.h>

/*
Name : Alexandre Allani
ID : 20186024
*/

// Infos of the cache
static int SIZE_CACHE = 64;

typedef struct cacheParameter{
    int s;
    int b;
    int E;
    int hits;
    int misses;
    int evictions;
}cacheParameter;

//Info of the line

typedef struct Line{
    int lastused;   //Show if it has been used recently or not
    int valid;
    unsigned long long int tag;
    int block;
}Line;

// One set is composed of multiple lines
typedef struct Set{
    Line* lines;
}Set;

//The cache is composed of multiple sets
typedef struct Cache{
    Set* lset;
}Cache;

/*Initialize the cache
Creation of a fully initialised cache, with all values set to 0.
*/
Cache set_the_cache(int s, int E){
    int S = (int) pow(2.0,s);
    Set set;
    Line line;
    Cache cache;

    cache.lset = (Set *) malloc(sizeof(Set)*S);
    for(int k=0; k< S; k++){
        set.lines  = (Line* ) malloc(sizeof(Line)*E);
        cache.lset[k] = set;

        for(int i =0; i<E; i++){
            line.lastused =0;
            line.valid = 0;
            line.tag = 0;
            line.block = 0;
            set.lines[i] = line;
        }

    }
    return cache;

    
}
/*
Function that release the previoused allocated memory (with function set_the_cache)
*/
void release(Cache cache,int s, int E){
    int S = (int) pow(2.0,s);

    for(int k=0; k<S; k++){
        Set set = cache.lset[k];
        if(set.lines != NULL){
            free(set.lines);
        }
    }

    if(cache.lset != NULL){
        free(cache.lset);
    }
}

int emptyIndex(Cache cache, int set, cacheParameter m_param,int* array){
    int e_index;
    int lused;
    int mused;

    lused = cache.lset[set].lines[0].lastused;
    mused = cache.lset[set].lines[0].lastused;
    e_index = 0;

    for(int k=0; k<m_param.E; k++){
        if(cache.lset[set].lines[k].lastused< lused){
            lused = cache.lset[set].lines[k].lastused;
            e_index = k;
        }
        if(cache.lset[set].lines[k].lastused>mused){
            mused = cache.lset[set].lines[k].lastused;
        }
    }
    array[0] = lused;
    array[1] = mused;
    return e_index;
}

/*
This function is updating the cache according to what it is given
*/

cacheParameter check(Cache cache, cacheParameter m_param, unsigned long long int cur_address, char operator, int v){
    Line cur_line;
    unsigned long long cur_set;
    int size_tag;
    int nbOfLine;
    int isSetFul;
    int previous_hits;
    int possible_move;
    int eindex;
    int *array = (int *) malloc(sizeof(int)*2);
    //int lused;
    int mused;


    previous_hits = m_param.hits;
    
    isSetFul = 1;
    nbOfLine = m_param.E;
    size_tag = (SIZE_CACHE - (m_param.b + m_param.s));
    cur_line.tag = cur_address >> (m_param.b+m_param.s); //The tag is obtained just by shifting
    cur_line.valid = 1;
    cur_set = (cur_address<< size_tag)>>(size_tag + m_param.b); //The set current address


    if(v){
        printf("curent set %llu \n", cur_set );
    }


    //We know the exact set where the data is supposed to be. We then have to check is one line is available.

    /*
    In this for loop we're verifying if a line with a valid bit and a tag corresponding to the one we're testing exist.
    If it does we're changing the current line with the one tested and break the loop.
    Otherwise, we're determining the position of an empty line. If there is not the last part of the function will solve the problem
    */

    for(int k = 0; k< nbOfLine; k++){
        /*
        if(v){
            printf("valid %d\n", cache.lset[cur_set].lines[k].valid);
            printf("init tag %llu\n",cache.lset[cur_set].lines[k].tag );
            printf("cur_tag %llu\n", cur_line.tag);
        } */


        if(cache.lset[cur_set].lines[k].valid == 1 && cache.lset[cur_set].lines[k].tag == cur_line.tag){
            cache.lset[cur_set].lines[k].lastused++;
            m_param.hits++;
            possible_move = k;
            break;
        }
        else if(cache.lset[cur_set].lines[k].valid != 1){
            isSetFul =0;
            possible_move = k;
        }
    }

    // eindex is the line which was least recently used, mused is the greatest latestused among the line of the same set. 
    eindex = emptyIndex(cache,cur_set,m_param, array);
    mused = array[1];

    /*
    Here we are testing all the possible solution. If we had a hit on the for loop, then we can update the lastused item of the line.
    "mused +1" is the integer choose for update   
    If we did not have a hit, then we have a miss, and we check for possible evictions
     */

    if(previous_hits == m_param.hits){
        m_param.misses++;
        if(operator == 'M'){
            m_param.hits++;
        }
    }
    else{
        if(operator == 'M'){
            m_param.hits++;
        }
        cache.lset[cur_set].lines[possible_move].lastused = mused +1;
        return m_param;
    }

    if(!isSetFul){
        cache.lset[cur_set].lines[possible_move] = cur_line;
        cache.lset[cur_set].lines[possible_move].lastused = mused +1;
        return m_param;
    }
    else{
        m_param.evictions++;
        cache.lset[cur_set].lines[eindex] = cur_line;
        cache.lset[cur_set].lines[eindex].lastused = mused +1;
        return m_param;
    }
    free(array);
}

int main(int argc,char** argv)
{   
    //File
    FILE *fptr;

    //Contain all the parameter of the cache
    cacheParameter cache_param;

    //Variable used to read the input
    char* file;
    int opt;
    char v;

    //fScan variable
    char operation;
    unsigned long long int address; 
    int size;



    // Retrieve the different arguments with getopt
    int option_index = 0;
    struct option long_option[] = {
            {"file", required_argument, NULL, 't'}
        };
    
    cache_param.hits = 0;
    cache_param.misses = 0;
    cache_param.evictions = 0;
    while(-1 != (opt = getopt_long(argc,argv, "vs:E:b:t:",long_option,&option_index))){
        switch(opt){
            case 'v':
                v = 1;
                break;
            case 's': 
                cache_param.s = atoi(optarg);
                break;
            case 'E':
                cache_param.E = atoi(optarg);
                break;
            case 'b':
                cache_param.b = atoi(optarg);
                break;
            case 't':
                file = optarg;
                break;
            default:
                printf("Invalid arg");
                break;
        }
    }

    // Check the results
    /*
    printf("v %d \n", v);
    printf("s %d \n", cache_param.s);
    printf("E %d \n", cache_param.E);
    printf("b %d \n", cache_param.b);
    printf("t %s \n", file);
    */
     //Initiate the cache

    Cache current_cache = set_the_cache(cache_param.s, cache_param.E);

    //Read the file
    fptr = fopen(file,"r");

    //Main part where evictions, misses and hit are set
    while(fscanf(fptr, " %c %llx,%d", &operation, &address, &size)>0){
        if(operation != 'I'){
            /*
            if(v){
                printf("%c ", operation);
                printf("%llx ", address);
                printf("%d\n", size);
            }
            */
            cache_param = check(current_cache,cache_param,address,operation,v);
            /*
            if(v){
                printf("hits : %d misses : %d eviction : %d\n #####################\n", cache_param.hits, cache_param.misses, cache_param.evictions);
            }
            */
        }
    }



    
    printSummary(cache_param.hits, cache_param.misses, cache_param.evictions);
    release(current_cache,cache_param.s,cache_param.E);
    fclose(fptr);
    return 0;
}
