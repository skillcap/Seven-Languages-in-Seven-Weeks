/* 
   Day 3 sudoku Solutions
   Nathaniel Morrow 
   Due 4/30/2021
*/

/* Modify the Sudoku solver to work on six-by-siz puzzles 
   (blocks are 3x2) and 9x9 puzzles */

/* 
   RULES:
   values 1-X
   X rows, columns, rectangles, each with no repeating elements
   X*X cells
   for "prettier" output, grab each row and output that?
*/

   /* test that all items in each list are unique */
   valid([]).
   valid([Head|Tail]) :-
      fd_all_different(Head),
      valid(Tail).

   /* print each element separated by an endline */
   print_board([Head|Tail]) :-
   print(Head), print('\n'),
   print_board(Tail).

   /* 4x4 - given example */
   sudoku(Puzzle, Solution) :-
      Solution = Puzzle,

      Puzzle = [S11, S12, S13, S14,
                S21, S22, S23, S24,
                S31, S32, S33, S34,
                S41, S42, S43, S44],

      fd_domain(Solution, 1, 4),
      
      Row1 = [S11, S12, S13, S14],
      Row2 = [S21, S22, S23, S24],
      Row3 = [S31, S32, S33, S34],
      Row4 = [S41, S42, S43, S44],      
      
      Col1 = [S11, S21, S31, S41],
      Col2 = [S12, S22, S32, S42],
      Col3 = [S13, S23, S33, S43],
      Col4 = [S14, S24, S34, S44],      
      
      Square1 = [S11, S12, S21, S22],
      Square2 = [S13, S14, S23, S24],
      Square3 = [S31, S32, S41, S42],
      Square4 = [S33, S34, S43, S44],      
      
      valid([Row1, Row2, Row3, Row4,
               Col1, Col2, Col3, Col4,
               Square1, Square2, Square3, Square4]),

      print_board([Row1, Row2, Row3, Row4]).

/* example input
sudoku([_, _, _, _,
         _, _, _, _,
         _, _, _, _,
         _, _, _, _], Solution).
*/

   /*  6x6  */
   sudoku(Puzzle, Solution) :-
      Solution = Puzzle,
      Puzzle = [S11, S12, S13, S14, S15, S16,
                S21, S22, S23, S24, S25, S26,
                S31, S32, S33, S34, S35, S36,
                S41, S42, S43, S44, S45, S46,
                S51, S52, S53, S54, S55, S56, 
                S61, S62, S63, S64, S65, S66],
      fd_domain(Solution, 1, 6),
      /* rows */
      Row1 = [S11, S12, S13, S14, S15, S16],
      Row2 = [S21, S22, S23, S24, S25, S26],
      Row3 = [S31, S32, S33, S34, S35, S36],
      Row4 = [S41, S42, S43, S44, S45, S46],      
      Row5 = [S51, S52, S53, S54, S55, S56],
      Row6 = [S61, S62, S63, S64, S65, S66],
      /* columns */
      Col1 = [S11, S21, S31, S41, S51, S61],
      Col2 = [S12, S22, S32, S42, S52, S62],
      Col3 = [S13, S23, S33, S43, S53, S63],
      Col4 = [S14, S24, S34, S44, S54, S64],      
      Col5 = [S15, S25, S35, S45, S55, S65],      
      Col6 = [S16, S26, S36, S46, S56, S66],    
      /* blocks */
      Blk1 = [S11, S12, S13, S21, S22, S23],
      Blk2 = [S14, S15, S16, S24, S25, S26],
      Blk3 = [S31, S32, S33, S41, S42, S43],
      Blk4 = [S34, S35, S36, S44, S45, S46],
      Blk5 = [S51, S52, S53, S61, S62, S63],
      Blk6 = [S54, S55, S56, S64, S65, S66],
      /*invoke valid rule*/
      valid([Row1, Row2, Row3, Row4, Row5, Row6, 
             Col1, Col2, Col3, Col4, Col5, Col6,
             Blk1, Blk2, Blk3, Blk4, Blk5, Blk6]),
      /* print row by row */
      print_board([Row1, Row2, Row3, Row4, Row5, Row6]).
      
/* example input
sudoku([_, _, _, _, _, _, 
        _, _, _, _, _, _,
        _, _, _, _, _, _,
        _, _, _, _, _, _,
        _, _, _, _, _, _,
        _, _, _, _, _, _], Solution).
*/

   /*  9x9 */
   sudoku(Puzzle, Solution) :-
      Solution = Puzzle,
      Puzzle = [S11, S12, S13, S14, S15, S16, S17, S18, S19,
                S21, S22, S23, S24, S25, S26, S27, S28, S29,
                S31, S32, S33, S34, S35, S36, S37, S38, S39,
                S41, S42, S43, S44, S45, S46, S47, S48, S49,
                S51, S52, S53, S54, S55, S56, S57, S58, S59,
                S61, S62, S63, S64, S65, S66, S67, S68, S69,
                S71, S72, S73, S74, S75, S76, S77, S78, S79,
                S81, S82, S83, S84, S85, S86, S87, S88, S89,
                S91, S92, S93, S94, S95, S96, S97, S98, S99],
      fd_domain(Solution, 1, 9),
      /* rows */
      Row1 = [S11, S12, S13, S14, S15, S16, S17, S18, S19],
      Row2 = [S21, S22, S23, S24, S25, S26, S27, S28, S29],
      Row3 = [S31, S32, S33, S34, S35, S36, S37, S38, S39],
      Row4 = [S41, S42, S43, S44, S45, S46, S47, S48, S49],     
      Row5 = [S51, S52, S53, S54, S55, S56, S57, S58, S59],
      Row6 = [S61, S62, S63, S64, S65, S66, S67, S68, S69],
      Row7 = [S71, S72, S73, S74, S75, S76, S77, S78, S79],
      Row8 = [S81, S82, S83, S84, S85, S86, S87, S88, S89],
      Row9 = [S91, S92, S93, S94, S95, S96, S97, S98, S99],
      /* columns */
      Col1 = [S11, S21, S31, S41, S51, S61, S71, S81, S91],
      Col2 = [S12, S22, S32, S42, S52, S62, S72, S82, S92],
      Col3 = [S13, S23, S33, S43, S53, S63, S73, S83, S93],
      Col4 = [S14, S24, S34, S44, S54, S64, S74, S84, S94],     
      Col5 = [S15, S25, S35, S45, S55, S65, S75, S85, S95],
      Col6 = [S16, S26, S36, S46, S56, S66, S76, S86, S96],
      Col7 = [S17, S27, S37, S47, S57, S67, S77, S87, S97],
      Col8 = [S18, S28, S38, S48, S58, S68, S78, S88, S98],
      Col9 = [S19, S29, S39, S49, S59, S69, S79, S89, S99], 
      /* blocks */
      Blk1 = [S11, S12, S13, S21, S22, S23, S31, S32, S33],
      Blk2 = [S14, S15, S16, S24, S25, S26, S34, S35, S36],
      Blk3 = [S17, S18, S19, S27, S28, S29, S37, S38, S39],
      Blk4 = [S41, S42, S43, S51, S52, S53, S61, S62, S63],     
      Blk5 = [S44, S45, S46 ,S54, S55, S56, S64, S65, S66],
      Blk6 = [S47, S48, S49, S57, S58, S59, S67, S68, S69],
      Blk7 = [S71, S72, S73, S81, S82, S83, S91, S92, S93],
      Blk8 = [S74, S75, S76, S84, S85, S86, S94, S95, S96],
      Blk9 = [S77, S78, S79, S87, S88, S89, S97, S98, S99],
      /*invoke valid rule*/
      valid([Row1, Row2, Row3, Row4, Row5, Row6, Row7, Row8, Row9,
             Col1, Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9,
             Blk1, Blk2, Blk3, Blk4, Blk5, Blk6, Blk7, Blk8, Blk9]),
      /* print row by row */
      print_board([Row1, Row2, Row3, Row4, Row5, Row6, Row7, Row8, Row9]).

/* example input
suduko([_, _, _, _, _, _, _, _, _,
        _, _, _, _, _, _, _, _, _,
        _, _, _, _, _, _, _, _, _,
        _, _, _, _, _, _, _, _, _,
        _, _, _, _, _, _, _, _, _,
        _, _, _, _, _, _, _, _, _,
        _, _, _, _, _, _, _, _, _,
        _, _, _, _, _, _, _, _, _,
        _, _, _, _, _, _, _, _, _], Solution).
*/