/* 
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */ 
#include <stdio.h>
#include "cachelab.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. 
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{   
    /*
    We have here a cache with s=5 and direct maping. Hence we have 32 sets available in the cache, since it's directed mapped, each contains 32 bytes.
    Moreover an int is 4 bytes long. Hence we can store up to 8 int in a block.
    The matrix here is 32x32. Hence 1 row contains 32 int, so a row is contained in 4 lines of cache. And since there's 32 sets available, 8 lines of the matrix are contained
    in the cache.
    For the 32x32 matrix, we can just divide the matrix into 16 8x8 submatrix. Each submatrix will then use the cache optimally. 
    Indeed, reading A and writing B won't map the same set in the cache,since that when it's not a diagonal element, the part of their address indicating which set they are going
    to is different. So when We read the first row of a submatrix from A, the read of the first element of the row will load the entire row of A's submatrix in the cache (cold miss),
    By transposing afterwards, and writing into B's submatrix, we load the first column of the submatrix. This is equivalent of loading the entire submatrix since this is a row major read
    
    However when there is a diagonal, A and B will map the same set. Hence if we keep this algorithm, we'll have a lot of miss. Because we would miss
    when reading A's row, then we would evict and miss the same row when writing on B's Diagonal value. And finally, we would miss again by copying A's line and finish the tansposition.
    So what we did is just store the diagonal value, when there's one. 
    So in the end, by doing this, with a submatrix containing a diagonal, we load the first row of A's submatrix, A[0][0] is stored in a register. Then we continue reading as usual
    and writing afterwards. At the end we loaded 7 rows of B's submatrix into the cache and the first row of A. So 8 misses.
    When we're taking the second row of A's submatrix, we read the first element A[1][0], this evict the second row of B's submatrix (since it's mapped on the same set) and do a miss.
    Then we're putting this value in B[0][1]. This will evict the first line of A's submatrix and do a miss. Then we read A[1][1] value store it since it's on the diagonal. And we continue
    like this for the rest. So 2 misses for the second and all other rows.
    So in the end we have 8 misses + 6*2 misses + 3 misses (for the last line) = 23 misses 

    Finally, we have 16 submatrices. All the matrix without diagonal (12 submatrices) we have : (8 misses from reading A + 8 misses from writing on B) = 16 misses.
    For diagonal submatrices we have (8 misses from reading A + 8 misses from writing on B + 7 misses afterwards for the diagonal) = 23 misses.
    Hence we have 12*16+24*4 = 284 misses. And we actually have 287 misses.
    */
    int k,col,row;
    int size = 8;
    int i;
    int temp0,temp1,temp2,temp3,temp4,temp5,temp6,temp7;


    if(N==32){
        for(col=0; col <N; col += size){
            for(row=0; row <N; row+=size){
                for(k = col; k<col+size; k++){
                    for(i = row; i<row+size; i++){
                        if(i!=k){
                            B[i][k] = A[k][i];
                        }
                        else{
                            temp0 = A[k][i];
                            temp1 = i;
                        }
                    }
                    if(row == col){
                        B[temp1][temp1] = temp0;
                    }

                }
            }
        }
    }

    /*
    Since we have the same cache, for a 64x64, only 4 rows of the matrix fit in the cache. This means that 8x8 submatrix is pretty bad for this one.
    Indeed, by doing this, when we load the 4 first lines we have a miss (cold miss). However by loading the other 4, we'll have a conflict miss because,
    they will be mapped to the same set.
    However when I tested the same code as the 32x32 and just changed the size to 4, I had 1795 misses, which is not enough. In face're not fully using 
    the cache there. The line are half used. Let's see what it does by applicating the same algorithm as above.
    Let's take a submatrix without a diagonal. By reading the frist element of the first row of A's sbmatrix we loaded the first row + 4 elements (since blocks are 8 bytes long).
    When we're doing the transpose, we load the 4 rows (+4 elements for each row) of B's submatrix. Hence in total 4*4 + 4*4 = 32 elements are not used.
    To solve this issue, we divide the matrix into 8x8 submatrices, and then we divide again those submatrices into 4x4 sub-submatrices, and we're doing then the transposition.
    Let's take 
    A = |A1|A2|     B= |B1|B2|
        |A3|A4|        |B3|B4|
    We know that tA (transpose of A):
    tA = |tA1|tA3|
         |tA2|tA4|
    The algorithm rest upon this, we're transposing A1 copying it into B1, then transposing A2 copying it into B2. In the cache : we've loaded the first 4 rows of A 8x8 submatrix
    And we did the same with 8x8 B submatrix. So here only 8 misses.
    However to have the real transposed matrix, we copy B2 in B3. And in parallel we transpose A3 and load it in B2. (for each line of B2, we store the line in a register,
    and then we fill in the same line on B3. Aferwards we put the line of tA3 in tB2. By doing this, we're avoiding conflict miss on B2). And Finally, we copy tA4 in tB4.
    We're doing this for all the 8x8 submatrix. of the 64x64 matrix.
    I think this is the most efficient way to use the cache and avoid misses, since we're using all the Block.

    */

    if(N==64){
        for(col=0; col <N; col += 8){              
            for(row=0; row <N; row+=8){
                /*
                We're copying tA1 to B1 and tA2 to B2
                */
                for(k = col; k<col+4; k++){
                    temp0 = A[k][row+0];
                    temp1 = A[k][row+1];
                    temp2 = A[k][row+2];
                    temp3 = A[k][row+3];
                    temp4 = A[k][row+4];
                    temp5 = A[k][row+5];
                    temp6 = A[k][row+6];
                    temp7 = A[k][row+7];

                    B[row+0][k] = temp0;
                    B[row+1][k] = temp1;
                    B[row+2][k] = temp2;                    
                    B[row+3][k] = temp3;
                    B[row+0][k+4] = temp4;
                    B[row+1][k+4] = temp5;
                    B[row+2][k+4] = temp6;
                    B[row+3][k+4] = temp7;

                }

                for(i = row+4; i<row+8; i++){
                    /*
                    Here we save tA3 in registeries
                    */
                    temp0 = A[col+4][i-4];
                    temp1 = A[col+5][i-4];
                    temp2 = A[col+6][i-4];
                    temp3 = A[col+7][i-4];

                    /*
                    Here we save B2 (tA2) in registeries
                    */
                    temp4 = B[i-4][col+4];
                    temp5 = B[i-4][col+5];
                    temp6 = B[i-4][col+6];
                    temp7 = B[i-4][col+7];
                    
                    /*
                    Now we match them
                    tA3 goes into B2
                    */
                    B[i-4][col+4] = temp0;
                    B[i-4][col+5] = temp1;
                    B[i-4][col+6] = temp2;
                    B[i-4][col+7] = temp3;

                    /*
                    And B2 (tA2) goes into B3
                    */
                    B[i][col+0] = temp4;
                    B[i][col+1] = temp5;
                    B[i][col+2] = temp6;
                    B[i][col+3] = temp7;

                    /*
                    Finally, tA4 goes into B4
                    */
                    temp0 = A[col+4][i];
                    temp1 = A[col+5][i];
                    temp2 = A[col+6][i];
                    temp3 = A[col+7][i];

                    B[i][col+4] = temp0;
                    B[i][col+5] = temp1;
                    B[i][col+6] = temp2;
                    B[i][col+7] = temp3;
                    

                }
            }
        }
    }
    
    /*
    Here we're doing the same thing that with the 32x32 matrix. Unlike the 64x64 matrix, since it's a rectangular matrix, we don't have the same map issues. 
    However Divide by 8x8 submatrices is not perfect. I tested different size until I found one that coressponded to the result.
    
    */
    else if (M == 61 && N == 67) {
        size = 17;
        for (col = 0; col < N; col+= size) {
            for (row = 0;  row < M; row += size) {
                for (k = col;( k < col + size) &&( k < N); k++) { //Condition in case it's out of bound
                    for (temp0 = row; (temp0 < row + size) && (temp0 < M); temp0++) { 
                        temp1 = A[k][temp0];
                        B[temp0][k] = temp1;
                    }
                }
            }
        }
    }

}



/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */ 

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }    

}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc); 

    /* Register any additional transpose functions */
    registerTransFunction(trans, trans_desc); 

}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}

