disp ('                                  Carga em Y-Y desequilibrada aterrada através da impedancia')
disp ('                                      obs: valores devem ser inseridos na forma retangular. ')
disp('-')
disp ('Insiras as tensões do gerador pedidas:')
disp('Van:')
Van = input('');
disp('Vbn:')
Vbn = input('');
disp('Vcn:')
Vcn = input('');
disp ('O sistema esta em ESTRELA(0) ou DELTA(1) ?')
resp = input('');

 if (resp == 0) 
        disp ('Insira as impedâncias pedidas:')
        disp('Za:')
        Za = input('');
        disp('Zb:')
        Zb = input('');
        disp('Zc:')
        Zc = input('');
        disp('Zp:')
        Zp = input('');
        disp('Zn:')
        Zn = input('');
end

    if (resp == 1) 
        disp ('Insira as impedâncias pedidas:')
        disp('Zab:')
        Zab = input('');
        disp('Zbc:')
        Zbc = input('');
        disp('Zca:')
        Zca = input('');
        disp('Zp:')
        Zp = input('');
        disp('Zn:')
        Zn = input('');
        Za = (Zab*Zca)/(Zab + Zbc + Zca);
        Zb = (Zab*Zbc)/(Zab + Zbc + Zca);
        Zc = (Zbc*Zca)/(Zab + Zbc + Zca);
    end
soma1 = Za + Zp ; soma2 = Zb + Zp ; soma3 = Zc + Zp; 

In = (Van/soma1 + Vbn/soma2 + Vcn/soma3)/(1 + Zn/soma1 + Zn/soma2 + Zn/ soma3);

Ia = Van/soma1 - In*(Zn/soma1) ; Ib = Vbn/soma2 - In*(Zn/soma2) ; Ic = Vcn/soma3 - In*(Zn/ soma3);

Valnl =Ia*Za ; Vblnl = Ib*Zb; Vclnl = Ic*Zc;

Valbl = Valnl - Vblnl ; Vblcl = Vblnl - Vclnl ; Vclal = Vclnl - Valnl ; 

disp('Tensões de fase no GERADOR.') 
abs(Van) ;  rad2deg(angle(Van));
abs(Vbn) ;  rad2deg(angle(Vbn));
abs(Vcn) ;  rad2deg(angle(Vcn));

TENSOES = ['VAN1';'VBN2';'VCN3'] ; V = [ abs(Van);abs(Vbn) ;abs(Vcn) ] ;
FASES = [ rad2deg(angle(Van)); rad2deg(angle(Vbn));rad2deg(angle(Vcn)) ] ; 

table(TENSOES, V , FASES) ;
disp('Tensão de VNNL.') 
Vnln = In*Zn ;

VNLN = abs(Vnln); Fase = rad2deg(angle(Vnln));

table( VNLN, Fase)

disp('Tensões de fase e linha na CARGA.') 

abs(Valnl) ;  rad2deg(angle(Valnl));
abs( Vblnl) ;  rad2deg(angle(Vblnl));
abs(Vclnl) ;  rad2deg(angle(Vclnl));
abs(Valbl) ;  rad2deg(angle(Valbl));
abs( Vblcl) ;  rad2deg(angle(Vblcl));
abs(Vclal) ;  rad2deg(angle(Vclal));

TENSOESCARGAFASE = ['VALNL1';'VBLNL2';'VCLNL3'];
TENSOESCARGALINHA = ['VALBL';'VBLCL';'VCLAL'] ; 
V1FASE = [ abs(Valnl);abs( Vblnl); abs(Vclnl)] ;
V1LINHA = [abs(Valbl); abs( Vblcl) ; abs(Vclal) ] ;
FASESCARGA = [ rad2deg(angle(Valnl));rad2deg(angle(Vblnl)); rad2deg(angle(Vclnl)) ];
FASESLINHA = [rad2deg(angle(Valbl));rad2deg(angle(Vblcl)); rad2deg(angle(Vclal))  ] ; 

table(TENSOESCARGAFASE, V1FASE , FASESCARGA ) 

table(TENSOESCARGALINHA, V1LINHA , FASESLINHA) 

disp('Correntes de NEUTRO e LINHA.')

abs(In) ;  rad2deg(angle(In));
abs(Ia) ;  rad2deg(angle(Ia));
abs(Ib) ;  rad2deg(angle(Ib));
abs(Ic) ;  rad2deg(angle(Ic));

CORRENTES = ['IN';'IA';'IB';'IC'] ; A = [ abs(In);abs(Ia); abs(Ib); abs(Ic)] ;

FASESCORRENTES = [rad2deg(angle(In));rad2deg(angle(Ia)); rad2deg(angle(Ib)) ;  rad2deg(angle(Ic))] ; 


table(CORRENTES,A,FASESCORRENTES)



