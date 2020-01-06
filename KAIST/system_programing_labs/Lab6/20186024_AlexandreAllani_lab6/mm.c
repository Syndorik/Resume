/*
 * Id : 20186024
 * Name : Alexandre Allani
 * mm.c - The fastest, least memory-efficient malloc package.
 * 
 *We we'll use a segregated Free list in 2^k 0<=k<=20.
 *

//////// FORMAT OF BLOCKS ////////////

A: Allocated bit

////////////////////////////////////////////ALLOCATED BLOCK\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

             31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0
            +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
    HEADER  |                     BLOCK SIZE                                                             |A |
            +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
            |                                                                                               |
            |                                                                                               |
            |                                        PAYLOAD                                                |
           ...                                                                                              ... 
            +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
    FOOTER  |                     BLOCK SIZE                                                             |A |
            +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+

///////////////////////////////////////////////FREE BLOCK\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

             31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0
            +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
    HEADER  |                     BLOCK SIZE                                                             |A |
            +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
            |                                     Predecessor in segregated list                            |
            +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
            |                                     Successor in segregated list                              |
            +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
            |                                        NOTHING                                                |
           ...                                                                                              ... 
            +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
    FOOTER  |                     BLOCK SIZE                                                             |A |
            +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+

 */
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <unistd.h>
#include <string.h>

#include "mm.h"
#include "memlib.h"



/* single word (4) or double word (8) alignment */
#define ALIGNMENT 8
#define WSIZE 4
#define DSIZE 8
#define NEWCHUNCKSIZE (1<<6)
#define CHUNCKSIZE (1<<12)

/* My constans*/ 
#define LISTLIMIT 20


/* My macros*/ 

#define MAX(x,y) ((x)>(y) ? (x) : (y))
#define MIN(x,y) ((x)<(y) ? (x) : (y))


/* Macro from p893 of the book*/
/* Pack a size and allocated bit into a word*/
#define PACK(size,alloc) ((size)|(alloc))

/* Read and write a word at address p */
#define GET(p) (*(unsigned int *) (p))
#define PUT(p,val) (*(unsigned int *) (p) = (val))

/* Read the size and allocated fields from address p */
#define GET_SIZE(p) (GET(p) & ~0x7)
#define GET_ALLOC(p) (GET(p) & 0x1)

/* Given block ptr bp, compute address of ts header and footer*/
#define HDRP(bp) ((char *)(bp) - WSIZE)
#define FTRP(bp) ((char *)(bp) + GET_SIZE(HDRP(bp)) -DSIZE)


/* Address of previous and next blocks */

#define NEXT_BLKP(bp) ((char *) (bp) + GET_SIZE(((char *) (bp)-WSIZE)))
#define PREV_BLKP(bp) ((char *) (bp) - GET_SIZE(((char *) (bp) - DSIZE)))

/* Address of the next free block predecessor and successor */
#define PREV_FREE(bp) ((char *) (bp))
#define NEXT_FREE(bp) ((char *) (bp) + WSIZE)

/* For a block pointer give address of predecessor and successor */
#define PRED_ADD(bp) ((char *) GET(PREV_FREE(bp)))
#define SUCC_ADD(bp) ((char *) GET(NEXT_FREE(bp)))


void *seglist[LISTLIMIT];
void* heap_listp;

/* rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(size) (((size) + (ALIGNMENT-1)) & ~0x7)


#define SIZE_T_SIZE (ALIGN(sizeof(size_t)))
int DEBUGG=0;

/* Functions */

static void *extend_heap(size_t word);
static void *coalesce(void* bp);
static void *place(void* bp, size_t bpsize);
static void add_to_free_list(void* bp, size_t size);
static void remove_from_free_list(void* bp);
static void print_block(void *bp);
static void print_heap();
static void check_integrity_block(void *bp);
static void check_seglist();


/*
 extend_heap : extend the heap when required ie in mm_init and when there's not enough space in the heap to do a mm_maloc
*/

static void *extend_heap(size_t word){
    void* bp;
    size_t asize;

    asize = ALIGN(word); // We do the alignement

    if((long) (bp = mem_sbrk(asize))==-1){
        return NULL;
    }

    /* Initialisze free block header/footer and the epilogue header */
    PUT(HDRP(bp),PACK(asize,0));
    PUT(FTRP(bp),PACK(asize,0));
    PUT(HDRP(NEXT_BLKP(bp)),PACK(0,1));

    add_to_free_list(bp,asize);

    return coalesce(bp);

}

static void add_to_free_list(void* bp, size_t size){
    
    int list=0;
    size_t tmp = size;
    void* start_ptr;
    
    /* Looking the index of the segregated list we should look at, for instance if size is between 2^10 and 2^11, we should look at index 10 */

    while((tmp > 1) && (list < (LISTLIMIT -1))){
        list++;
        tmp = tmp>>1;
    }

    start_ptr = seglist[list];
    /* The seglist contains NULL pointer if there's no one in the class */

    if(start_ptr == (void *) NULL){
        seglist[list] = bp;
        PUT(NEXT_FREE(bp),(unsigned int) NULL);
        PUT(PREV_FREE(bp), (unsigned int) NULL); //COUOCO
        return;
    }

    else{
        /*We insert the free block to add, at the begining of the list
          We set the "predecessor in segregated list" and "successor in segregated list" fields of the free block */
        PUT(PREV_FREE(bp), (unsigned int) NULL);
        PUT(NEXT_FREE(bp), (unsigned int) start_ptr);

        /*We set the predecessor in segregated list of the sucessor  */
        PUT(PREV_FREE(start_ptr),(unsigned int) bp);
        seglist[list] = bp;
        return;
    }



}

static void remove_from_free_list(void* bp){

    int list =0;
    size_t tmp = GET_SIZE(HDRP(bp));


    /* Looking the index of the segregated list we should look at, for instance if size is between 2^10 and 2^11, we should look at index 10 */

    while((tmp > 1) && (list < (LISTLIMIT -1))){
        list++;
        tmp = tmp>>1;
    }

    
    /*
      Here we're deleting a special node from the linked list
    */
    if(GET(NEXT_FREE(bp)) == (unsigned int) NULL){
        /* If the successor and predecessor are NULL, then it was the only node in this class*/
        if(GET(PREV_FREE(bp)) == (unsigned int) NULL){
            seglist[list] = (void *) NULL;
        }
        /*If the successor is NULL but the predecessor isn't, then the successor of the predecessor (of bp) will be NULL*/
        else{
            PUT(NEXT_FREE(GET(PREV_FREE(bp))),(unsigned int) NULL);
        }
    }
    else{
        /*If the predecessor is NULL but the successor isn't, then the predecessor of the successor (of bp) will be NULL */
        if(GET(PREV_FREE(bp)) == (unsigned int) NULL){
            PUT(PREV_FREE(GET(NEXT_FREE(bp))),(unsigned int) NULL);
            seglist[list] = (void *) GET(NEXT_FREE(bp));
        }
        /*If the both predecessor and successor aren't NULL, we're not on an edge,
          Then, the successor of the predeccesor (of bp) will be the successor of bp
          And the predecessor of the successor (of bp) will be the predecessor of bp */
        else{
            PUT(NEXT_FREE(GET(PREV_FREE(bp))),GET(NEXT_FREE(bp)));
            PUT(PREV_FREE(GET(NEXT_FREE(bp))),GET(PREV_FREE(bp)));
        }
    }
    return;

}

static void *coalesce(void* bp){
    /* As described in the book we're going to distinguish 3 cases and according to this we're going to coaelse*/
    size_t prevbloc = GET_ALLOC(HDRP(PREV_BLKP(bp)));
    size_t nextbloc = GET_ALLOC(HDRP(NEXT_BLKP(bp)));
    size_t size = GET_SIZE(HDRP(bp));
    void* ret_ptr;

    if(prevbloc){

        /*If both next block and previous block are not free, then we do nothing*/
        if(nextbloc){
            return bp;
        }
        /* If next block is free, then we remove from free list first both Next block and the current block pointers
           Then we compute the new size and update the footer and header
           We insert the node at the end*/
        else{
            remove_from_free_list(bp);
            remove_from_free_list(NEXT_BLKP(bp));
            size = size + GET_SIZE(HDRP(NEXT_BLKP(bp))); //Don't forget the HDRP Otherwise hard error to debug
            PUT(HDRP(bp), PACK(size,0));
            PUT(FTRP((bp)),PACK(size,0)); // AND NOT : PUT(FTRP(NEXT_BLKP(bp)),PACK(size,0)); because FTRP already goes to the end of the block
            ret_ptr =bp;

        }
    }
    else{
        /* Here we're doing the same thing as when the nextblock was free, but with the previous one*/
        if(nextbloc){
            remove_from_free_list(bp);
            remove_from_free_list(PREV_BLKP(bp));
            size = size + GET_SIZE(HDRP(PREV_BLKP(bp)));
            PUT(FTRP(bp), PACK(size,0));
            PUT(HDRP(PREV_BLKP(bp)), PACK(size,0));
            ret_ptr= PREV_BLKP(bp);
        }
        /* Finally when both next and previous block are free, we remove everyone from the free list,
           Then we compute the new size
           And we update the header of the Previous block and the footer of the Next block*/
        else{
            remove_from_free_list(bp);
            remove_from_free_list(PREV_BLKP(bp));
            remove_from_free_list(NEXT_BLKP(bp));

            size = size + GET_SIZE(HDRP(PREV_BLKP(bp)))+ GET_SIZE(HDRP(NEXT_BLKP(bp)));
            PUT(HDRP(PREV_BLKP(bp)),PACK(size,0));
            PUT(FTRP(NEXT_BLKP(bp)), PACK(size,0));
            ret_ptr = PREV_BLKP(bp);
        }
    }

    add_to_free_list(ret_ptr, size);
    return ret_ptr;
}

/*
  Now we're going to place a block inside the memory. We're splitting the free block memory if the free block we're going to put our allocated block in is too big.
  Hence we're going to limit fragmentation
*/

static void* place(void* bp, size_t bp_size){
    size_t block_size = GET_SIZE(HDRP(bp));
    size_t diff = block_size - bp_size;
    /*Since we're allocating the block we're deleting it from the free lis */
    remove_from_free_list(bp); 

    /* Splitting algorithm */
    /*If the difference between the size of the block and the size required is lesser than 2*DSIZE, we shouldn't split
      Because we would just have a Footer, (predecessor and successor) => 2 and the Footer. Hence we would not have any space for the free block*/
    if(diff <= 2*DSIZE){
        PUT(HDRP(bp), PACK(block_size,1));
        PUT(FTRP(bp), PACK(block_size, 1));

    }
    else if (bp_size >= 100) {
        // Split block
        PUT(HDRP(bp), PACK(diff, 0));
        PUT(FTRP(bp), PACK(diff, 0));
        PUT(HDRP(NEXT_BLKP(bp)), PACK(bp_size, 1));
        PUT(FTRP(NEXT_BLKP(bp)), PACK(bp_size, 1));
        add_to_free_list(bp, diff);
        return NEXT_BLKP(bp);
        
    }
    else{
        /*First allocate the block*/
        PUT(HDRP(bp), PACK(bp_size,1));
        PUT(FTRP(bp),PACK(bp_size, 1));

        /*Create a new free block*/
        PUT(HDRP(NEXT_BLKP(bp)),PACK(diff,0));
        PUT(FTRP(NEXT_BLKP(bp)),PACK(diff,0));

        /* Insert the new free block in the adequate segregated list*/
        add_to_free_list(NEXT_BLKP(bp),diff);
        //printf("diff =%lu ", diff);
    }

    return bp;

}

/* 
 * mm_init - initialize the malloc package.
 */
int mm_init(void)
{
    
    int list =0;

    /* Initialisation of the segregated list */

    for(list=0; list<LISTLIMIT; list++){
        seglist[list]= NULL;
    }

    /* Create the initial empty heap */

    if((heap_listp = mem_sbrk(4*WSIZE)) == (void *) -1){
        return -1;
    }

    PUT(heap_listp,0);
    PUT(heap_listp+ (1*WSIZE), PACK(DSIZE,1));
    PUT(heap_listp+ (2*WSIZE), PACK(DSIZE,1));
    PUT(heap_listp + (3*WSIZE), PACK(0,1));
    heap_listp += (2*WSIZE);

    /* Extend the heap with a free block of CHUCKSIZE bytes */

    if(extend_heap(1<<6) == NULL){
        return -1;
    }
    return 0;
}




/* 
 * mm_malloc - Allocate a block by incrementing the brk pointer.
 *     Always allocate a block whose size is a multiple of the alignment.
 */
void *mm_malloc(size_t size)
{  
    /*Begining inspired of the book*/
    size_t asize;
    size_t extendsize;
    void* bp = NULL;
    int list =0;

    /*Ignore spurious requests*/

    if(size ==0){
        return NULL;
    }

    /*Adjust block size to include overhad and alignement reqs*/
    if(size < DSIZE){
        asize = 2*DSIZE;
    }else{
        asize = ALIGN(size + DSIZE); //Here size + DSIZE, because DSIZE is the size of the footer and header
    }

    size_t size_seglist= asize;

    /* We're trying to find which segregated list can contain the block */
    while(list<LISTLIMIT){
        if(seglist[list] == NULL){ // If it's NULL then the list for this size is empty
        }
        else if(((size_seglist<=1) && (seglist[list] != NULL)) || (list ==LISTLIMIT -1)){ // (if list == LISTLIMIT -1, this means that it belongs to the last segregated list ie the one that contains every blocks whose size is greater than 2^LISTLIMIT)

        /* Now our purpose is to find inside the segregated list if there's one big enough to hold our block */
            bp = seglist[list];
            while((bp != NULL) && (asize > GET_SIZE(HDRP(bp)))){
                
                /*Here we're getting each time the next element in segregated list. We know that at the
                end of the segregate list is a NULL pointer*/

                bp = (void *) GET(NEXT_FREE(bp));

            }
            if(bp != NULL){
                break; //This means that we have our free block
            }
        }
        size_seglist= size_seglist>>1;
        list++;
    }

    /*if there's nothing that can hold our block, we extend the heap*/
    if(bp == NULL){
        extendsize = MAX(asize,CHUNCKSIZE);
        if((bp = extend_heap(extendsize))== (void *) NULL){
            return NULL;
        }
    }
    /*
    if(DEBUGG){
        mm_check();
    }
    */

    return place(bp,asize);
}

/*
 * mm_free - Freeing a block does nothing.
 */
void mm_free(void *ptr)
{
    /* Here we simply free the block by changing the header and footer
       We then add it the free list
       And finally we coalesce to avoid fragmentation */
    size_t size = GET_SIZE(HDRP(ptr));
    PUT(HDRP(ptr),PACK(size,0));
    PUT(FTRP(ptr),PACK(size,0));

    add_to_free_list(ptr,size);

    coalesce(ptr);
}

/*
 * mm_realloc - Implemented simply in terms of mm_malloc and mm_free
 */
void *mm_realloc(void *ptr, size_t size)
{   
    /*If ptr is null, then it's a call to malloc */
    if (ptr == NULL) {
       return mm_malloc(size);
    }

    /*if size is equal to 0, then we just want to free the pointer*/
    if (size == 0) {
        mm_free(ptr);
        return NULL;
    }

    size_t prev_size = GET_SIZE(HDRP(ptr));
    size_t asize;
    size_t tmp;
    void* bp;
    //void* nbp;

    /* Alignement with the new size*/

    if (size <= DSIZE) {
        asize = 2 * DSIZE;
    } else {
        asize = ALIGN(size+DSIZE);
    }

    /* Now we have to distinguish two case, if we're allocating more space
       Or if we're allocating less space
       Or if it's exactly the same space */

    /* Same space case :*/

    if(asize == prev_size){
        return ptr;
    }

    /* If we're allocating more space:
       We have to see first if there's a free block next to it
       If there is and the size of both free block and the current allocate block are greter than the new size
       Then we "coalesce" the two blocks and allocate it again
       If there is not other block, we free the current block used and then allocate it with malloc*/

    if(asize > prev_size){
        size_t nb_size = GET_SIZE(HDRP(NEXT_BLKP(ptr)));
        //size_t nbp_size = GET_SIZE(HDRP(PREV_BLKP(ptr)));
        if((!GET_ALLOC(HDRP(NEXT_BLKP(ptr)))) && (asize <= (prev_size+nb_size))){
            remove_from_free_list(NEXT_BLKP(ptr));
            if(prev_size+nb_size-asize> 2*DSIZE){
                PUT(HDRP(ptr),PACK(asize,1));
                PUT(FTRP(ptr),PACK(asize,1));
                bp = NEXT_BLKP(ptr);

                /* Creation of the new free block*/
                tmp = prev_size+nb_size-asize;
                PUT(HDRP(bp), PACK(tmp,0));
                PUT(FTRP(bp), PACK(tmp,0));

                add_to_free_list(bp, GET_SIZE(HDRP(bp)));
                coalesce(bp);
            }
            else{
                PUT(HDRP(ptr),PACK(prev_size+nb_size,1));
                PUT(FTRP(ptr),PACK(prev_size+nb_size,1));
            }
            return ptr;
        }
        /* I wanted to do the same with the previous block but it doesn't work
        
        else if (!GET_ALLOC(HDRP(PREV_BLKP(ptr))) && (asize <= (prev_size +nbp_size))){
            nbp = PREV_BLKP(ptr);
            remove_from_free_list(PREV_BLKP(ptr));
            memcpy(nbp,ptr,prev_size-DSIZE);
            if(prev_size+nbp_size-asize>=2*DSIZE){
                PUT(HDRP(nbp),PACK(asize,1));
                PUT(FTRP(nbp), PACK(asize,1));

                bp = NEXT_BLKP(nbp);

                Creation of the new free block
                tmp = prev_size+nbp_size-asize;
                PUT(HDRP(bp), PACK(tmp,0));
                PUT(FTRP(bp), PACK(tmp,0));

                add_to_free_list(bp, GET_SIZE(HDRP(bp)));
                coalesce(bp);
            }
            else{
                PUT(HDRP(nbp),PACK(prev_size+nbp_size,1));
                PUT(FTRP(nbp),PACK(prev_size+nbp_size,1));
            }
            return nbp;
        }*/
        else{
            /*Here the size requested is too big */
            bp = mm_malloc(size);
            /* We still need to copy the current value in the new memory allocated */
            tmp = prev_size - DSIZE; // Do not forget the DSIZE otherwise we copy also Header and Footer
            memcpy(bp,ptr, tmp);
            
            /* Then we free ptr since it's not used anymore */
            mm_free(ptr);
            return bp;
        }


    }

    /* Now if we're allocating less space, we have to change header and footer,
       And add the new free block created to the free list or coalesce it
       */
    else{
        /*If the size isn't big enough, ie we're freeing two blocks of memory for example, the new free blocked memory
          Won't be able to belong to the free list since we need at least 4 words (cf top of the code). Then we ignore
          this case and act as if nothing was asked */
        if(prev_size-asize > 2*DSIZE){ 

            PUT(HDRP(ptr),PACK(asize,1));
            PUT(FTRP(ptr),PACK(asize,1));
            bp = NEXT_BLKP(ptr);

            /* Creation of the new free block*/
            tmp = prev_size-asize;
            PUT(HDRP(bp), PACK(tmp,0));
            PUT(FTRP(bp), PACK(tmp,0));

            add_to_free_list(bp, GET_SIZE(HDRP(bp)));
            coalesce(bp);
        }
        return ptr;


    }





}

/*
######################## DEBUG FUNCTIONS #############################
*/

static void print_heap() {
    printf("heap\n");
    void *bp;
    for (bp = heap_listp+DSIZE; GET_SIZE(HDRP(bp)) > 0; bp = NEXT_BLKP(bp)) {
        check_integrity_block(bp);
        print_block(bp);
    }
    printf("heap-end\n");
}

static void print_block(void *bp) {
    printf("\tp: %p; ", bp);
    printf("| Next block: %p |",(void *) GET(NEXT_BLKP(bp)));
    printf("| Alloc ?: %s |", GET_ALLOC(HDRP(bp))? "yes": "no" );
    printf("| Header size: %d ", GET_SIZE(HDRP(bp)));
    printf("Footer size: %d | ", GET_SIZE(FTRP(bp)));
    printf("| Predecessor in free list: %p |", (void *) GET(PREV_FREE(bp)));
    printf("| Successor in free list: %p |", (void *) GET(NEXT_FREE(bp)));
    printf("| Prev block: %p |\n", (void *) GET(NEXT_BLKP(bp)));
    
}

static void check_integrity_block(void *bp) {
    if (GET_SIZE(HDRP(bp)) % DSIZE)
        printf("\tERROR: Alignement issue\n");
    if (GET(HDRP(bp)) != GET(FTRP(bp)))
        printf("\tERROR : HEADER != FOOTER\n");
}


static void check_seglist(){
    void* tmp;
    printf("Segregated list : \n");

    for(int i=0; i< LISTLIMIT; i++){
        if(seglist[i] == NULL){
            printf("%i : Empty class\n", i);
        }
        else{
            tmp = seglist[i];
            while(GET(HDRP(tmp))!= (unsigned int) NULL){
                printf("class : %i\n", i);
                printf("%p --> %p --> %p\n", (void *) GET(PREV_FREE(seglist[i])), seglist[i], (void *) GET(NEXT_FREE(seglist[i])));
                tmp = NEXT_FREE(tmp);

            }
        }
    }
}




int mm_check() {
    printf("\n");
    char *bp = heap_listp;
    /*check prologue */
    if (GET_SIZE(HDRP(heap_listp)) != DSIZE || !GET_ALLOC(HDRP(heap_listp)))
        printf("ERROR: Problem prologue header\n");

    printf("##########\n");
    /* check the heap*/
    print_heap();

    printf("##########\n");

    /* check epilogue*/
    if (GET_SIZE(HDRP(bp)) != 0 || !(GET_ALLOC(HDRP(bp))))
        printf("ERROR: Problem epilogue header\n");

    printf("##########\n");

    // check list
    check_seglist();
    return 0;
}














