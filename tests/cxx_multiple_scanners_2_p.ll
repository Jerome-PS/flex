 //  This file is part of flex.
 //  
 //  Redistribution and use in source and binary forms, with or without
 //  modification, are permitted provided that the following conditions
 //  are met:
 //  
 //  1. Redistributions of source code must retain the above copyright
 //     notice, this list of conditions and the following disclaimer.
 //  2. Redistributions in binary form must reproduce the above copyright
 //     notice, this list of conditions and the following disclaimer in the
 //     documentation and/or other materials provided with the distribution.
 //  
 //  Neither the name of the University nor the names of its contributors
 //  may be used to endorse or promote products derived from this software
 //  without specific prior written permission.
 //  
 //  THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
 //  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
 //  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 //  PURPOSE.

%{
#include "config.h"

%}

%option 8bit prefix="S2_"
%option nounput nomain
%option warn stack noyy_top_state
%option yystall="0xBADC0DE2"
%option header="cxx_multiple_scanners_2_p.h"

%x OFF
%x ON
%%
<INITIAL>{
on    yy_push_state(ON); return 3;
off   yy_push_state(OFF); return 4;
.|\n  return 5;
}
<ON>.|\n  yy_pop_state(); return 6;

<OFF>.|\n yy_pop_state(); return 7;
%%

int S2_FlexLexer::yywrap()
{
    std::cout << "NOW WRAPPING." << std::endl;
    return 1;
}
