Program Eletrolandia;
//-----------------------------------------------------------------------------------------------------------------------
{INTEGRANTES
Hiago Carlos Moreira - 2018207176
Vitor Viana Silva - 2016204051
}
//-------declara��o de variaveis------------------------------------
const
linha=10;
coluna=10;


type

raio=record
  caiu:boolean;
  data:array[1..3] of integer;
  intensidade:real;
  condicao:string[20];
  cond:integer;
end;

Var
x,y,n,opcao,cont,Psano:integer;
local:array[1..linha,1..coluna]of raio;
newev:char;
arq_dados:text;

//-----------------------------------------------------------------------------------------------------------------------
//----Procedimentos e fun��es--------------------------------------

procedure menu_prog; //menu do programa
begin
  writeln(' ___________________________________________');
  writeln('|-------------Projeto Pratico 1-------------|');
  writeln('|-------------Eletrolandia 2018-------------|');
  writeln('|1)Marcar Raio                              |');
  writeln('|2)Pesquisar Raio                           |');
  writeln('|3)Quantos Raios ja cairam                  |');
  writeln('|4)Imprimir matriz                          |');
  writeln('|5)Salvar                                   |');
  writeln('|6)Sair                                     |');
  writeln('|- - - - - - - - - - - - - - - - - - - - - -|');
  writeln('|-------------------------------------------|');
  
end;

//-----------------------------------------------------------------------------------------------------------------------

procedure marcar_raio;  //primeira op��o
begin
		clrscr;
    writeln('Marcar Raio');
    repeat
      writeln('Digite as coordenadas aonde o raio ocorreu');
      read(x,y);
    until((x >= 1) and (x <= linha) and (y >= 1) and (y <= coluna));
    if(local[x,y].caiu=true)then
    begin
      clrscr;
      writeln('O raio ja caiu neste quadrante');
    end
    else
    begin
      local[x,y].caiu:=true;
      writeln('Digite a data que ocorreu o evento (dia/m�s/ano)');
      for cont:=1 to 3 do
      begin   //delimitar dias e meses
        read(local[x,y].data[cont]);
      end;
      writeln('Qual foi a intensidade de 0 a 10');
      read(local[x,y].intensidade);
      writeln('Escolha das op��es abaixo a condi��o do clima');
      writeln('--Clima--');
      writeln('1)N�o Chuvoso');
      writeln('2)Chuvoso');
      writeln('3)Tempestade');
      read(local[x,y].cond);
       	if(local[x,y].cond=1)then
       		begin
       				local[x,y].condicao:='N�o chuvoso'
       		end;
       	if(local[x,y].cond=2)then
       		begin
       				local[x,y].condicao:='Chuvoso'
       		end;
      	if(local[x,y].cond=3)then
       		begin
       				local[x,y].condicao:='Tempestade'
       		end;
      		
      		
           	
    end;
    clrscr;
    
    
   
end;

//-----------------------------------------------------------------------------------------------------------------------

procedure pesquisar_raio;  //segunda op��o
begin
  
  clrscr;
  writeln('Pesquisar quantidade Raio por ano');
  writeln('Digite o ano');
  read(Psano);
  n:=0;
  for x:=1 to  linha do
  begin
    for y:=1 to coluna do
    begin
      if(local[x,y].data[3]=Psano)then
      begin
        n:=n+1;
      end;
    end;
  end;
  writeln('tem ',n,' raios neste ano' );
  
end;

//-----------------------------------------------------------------------------------------------------------------------

procedure quantidade_raio;    //terceira op��o
begin
  
  clrscr;
  n:=0;
  writeln('Quantidade de raios que cairam na cidade');
  for x:=1 to  linha do
  begin
    for y:=1 to coluna do
    begin
      if(local[x,y].caiu=true)then
      begin
        n:=n+1;
      end;
    end;
  end;
  writeln(n);
  
end;

//-----------------------------------------------------------------------------------------------------------------------

procedure imprimir_raio;       //quarta op��o
begin
  clrscr;
  writeln('Impress�o de matriz');
  for x:=1 to linha do
  begin
    for y:=1 to coluna do
    begin
      if(local[x,y].caiu=true)then
      begin
        write('[x]');
      end
      else
      begin
        write('[ ]');
      end;
    end;
    
    writeln('');
  end;
  
end;

//-----------------------------------------------------------------------------------------------------------------------

procedure salvar_prog;      //quinta op��o
begin
  assign(arq_dados,'Dados_Eletrolandia.txt');
  rewrite(arq_dados);
  for x:=1 to linha do
  begin
    for y:=1 to coluna do
    begin
      if(local[x,y].caiu=true)then
      begin
        if(x>1)then
        begin
        append(arq_dados);
        clrscr;
        writeln(arq_dados,'linha : ',x);
        writeln(arq_dados,'coluna : ',y);
        for cont:=1 to 3 do
        begin
          writeln(arq_dados,'Data : ',local[x,y].data[cont]);
        end;
        writeln(arq_dados,'Intensidade : ',local[x,y].intensidade);
        writeln(arq_dados,'condi��o do tempo : ',local[x,y].condicao);
        writeln(arq_dados,'---------------------------------------------------------');
      end
      else
      begin
        clrscr;
        writeln(arq_dados,'linha : ',x);
        writeln(arq_dados,'coluna : ',y);
        for cont:=1 to 3 do
        begin
          writeln(arq_dados,'Data : ',local[x,y].data[cont]);
        end;
        writeln(arq_dados,'Intensidade : ',local[x,y].intensidade);
        writeln(arq_dados,'condi��o do tempo : ',local[x,y].condicao);
        writeln(arq_dados,'---------------------------------------------------------');
      end;
      
    end;
  end;
  close(arq_dados);
end;
end;

//-----------------------------------------------------------------------------------------------------------------------
 	
procedure close_prog; //Fechar programa
begin
	clrscr;
	writeln('At� mais');
	exit;
end;

Begin  //inicio do programa
    writeln('eletrolandia esta dividida inicialmente em quadrantes de 10x10');
    
  repeat
  	menu_prog;
    read(opcao);
    case opcao of
      1:marcar_raio;
      2:pesquisar_raio;
      3:quantidade_raio;
      4:imprimir_raio;
      5:salvar_prog;
      6:close_prog;//sair
    end;
  until(opcao=6);
  
End.