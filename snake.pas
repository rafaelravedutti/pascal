program snake;

uses crt;

const 
    TAMANHO  = 20;
    CEREJA   = -1;
    MURO     = -2;
    DIREITA  = 1;
    CIMA     = 2;
    ESQUERDA = 3;
    BAIXO    = 4;
    USARMURO = false;

type
    matriz = array [1..TAMANHO, 1..TAMANHO] of integer;

var
    m : matriz;
    cabecal, cabecac, rabol, raboc, pontos : integer;
    perdeu : boolean;

function eh_cereja(n : integer) : boolean;
begin
    eh_cereja := (n = CEREJA);
end;

function eh_muro(n : integer) : boolean;
begin
    eh_muro := (n = MURO);
end;

function eh_cobra(n : integer) : boolean;
begin
    eh_cobra := (n > 0);
end;

procedure gerarcereja(var m : matriz);
var i, j : integer;
begin
    repeat
        i := random(TAMANHO - 2) + 2;
        j := random(TAMANHO - 2) + 2;
    until m[i, j] = 0;

    m[i, j] := CEREJA;
end;

procedure zerarmatriz(var m : matriz);
var i, j : integer;
begin
    for i := 1 to TAMANHO do
        for j := 1 to TAMANHO do
            m[i, j] := 0;
end;

procedure inicializarmatriz(var m : matriz; var cabecal, cabecac, raboc, rabol : integer);
var i : integer;
begin
    zerarmatriz(m);

    for i := 1 to TAMANHO do
    begin
        m[i, 1] := MURO;
        m[1, i] := MURO;
        m[i, TAMANHO] := MURO;
        m[TAMANHO, i] := MURO;
    end;

    rabol := (TAMANHO div 2);
    raboc := (TAMANHO div 2);
    cabecal := rabol;
    cabecac := raboc + 1;
    m[rabol, raboc] := DIREITA;
    m[cabecal, cabecac] := DIREITA;

    gerarcereja(m);
end;

procedure imprimirmatriz(var m : matriz);
var i, j : integer;
begin
    clrscr;

    for i := 1 to TAMANHO do
    begin
        for j := 1 to TAMANHO do
            if eh_muro(m[i, j]) then
                write('-')
            else if eh_cereja(m[i, j]) then
                write('b')
            else if eh_cobra(m[i, j]) then
                write('o')
            else
                write(' ');

        writeln;
    end;
end;

function obternovadirecao(var direcaoatual : integer) : integer;
var
    resultado : integer;
    ch         : char;
begin
    resultado := direcaoatual;

    if keypressed then
    begin
        ch := readkey;
        if ch = #0 then
        begin
            ch := readkey;

            if (ch = 'M') and (direcaoatual <> ESQUERDA) then
                resultado := DIREITA
            else if (ch = 'H') and (direcaoatual <> BAIXO) then
                resultado := CIMA
            else if (ch = 'K') and (direcaoatual <> DIREITA) then
                resultado := ESQUERDA
            else if (ch = 'P') and (direcaoatual <> CIMA) then
                resultado := BAIXO;
        end;
    end;

    while keypressed do
        readkey;

    obternovadirecao := resultado;
end;

procedure obterproximaposicao(var destinol, destinoc : integer ; fontel, fontec, direcao : integer);
begin
    destinol := fontel;
    destinoc := fontec;

    case direcao of
        DIREITA  : destinoc := destinoc + 1;
        CIMA     : destinol := destinol - 1;
        ESQUERDA : destinoc := destinoc - 1;
        BAIXO    : destinol := destinol + 1;
    end;

    if not USARMURO then
    begin
        if destinol = TAMANHO then
            destinol := 2
        else if destinol = 1 then
            destinol := TAMANHO - 1;

        if destinoc = TAMANHO then
            destinoc := 2
        else if destinoc = 1 then
            destinoc := TAMANHO - 1;
    end;
end;

procedure movimentarcobra(var m : matriz; var cabecal, cabecac, rabol, raboc, pontos : integer; var perdeu : boolean);
var direcao, posl, posc, posc2, posl2 : integer;
begin
    direcao := obternovadirecao(m[cabecal, cabecac]);
    obterproximaposicao(posl, posc, cabecal, cabecac, direcao);

    if eh_cereja(m[posl, posc]) then
    begin
        pontos := pontos + 10;
        gerarcereja(m);
    end
    else 
    begin
        if eh_muro(m[posl, posc]) or eh_cobra(m[posl, posc]) then
            perdeu := true;

        obterproximaposicao(posl2, posc2, rabol, raboc, m[rabol, raboc]);
        m[rabol, raboc] := 0;
        rabol := posl2;
        raboc := posc2;
    end;

    m[cabecal, cabecac] := direcao;
    m[posl, posc] := direcao;
    cabecal := posl;
    cabecac := posc;
end;

begin
    randomize;
    inicializarmatriz(m, cabecal, cabecac, rabol, raboc);
    imprimirmatriz(m);
    pontos := 0;
    perdeu := false;

    while not perdeu do
    begin
        delay(100);
        movimentarcobra(m, cabecal, cabecac, rabol, raboc, pontos, perdeu);
        imprimirmatriz(m);
        writeln('Pontos: ', pontos);
    end;
end.
