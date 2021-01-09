
%problema1
Vabc= [120; -380i ; 380i];
alpha = -.5 +.87i;
alpha2 = -.5 -.87i ;

Tm= [1 1 1
    1 alpha alpha2
    1 alpha2 alpha];

Tm012 = (1/3).*Tm;

V0123 = Tm012.*Vabc



%problema2

V012 = [(86.60 + 50i); 220; (50 -86.60i)];

T= [ 1 1 1 
    1 alpha2 alpha
    1 alpha alpha2];

Vabc = T*V012



%problema3

alpha = -.5 +.87i;
alpha2 = -.5 -.87i ;


Tma= [1 1 1
    1 alpha alpha2
    1 alpha2 alpha];

Tma1 = (1/3)*Tma;
Iabc = [10; -10; 0];
Ia = Tma1*Iabc;


Tmb= [1 alpha2 alpha
    1 alpha alpha2
    1 1 1 ];

Tmb1 = (1/3)*Tmb;
Ibac = [-10; 10; 0];
Ib = Tmb1*Ibac;


Tmc= [1 alpha alpha2
    1 1 1 
    1 alpha2 alpha ];

Tmc1 = (1/3)*Tmc;
Icab = [0; 10; -10];
Ic = Tmc1*Icab;

I= [Ia Ib Ic]

