/**
* UFRJ - Universidade Federal do Rio de Janeiro
* IM - Instituto de Matemática
*
* TMAA - Programação C/C++ & Banco de Dados
* Professor: Milton Ramirez (milton@labma.ufrj.br)
*
* Nome1: Jean Sette Siqueira Vianna 
* DRE:116027396
* 
* Nome2: Antonio Frederico Nesti Lopes 
* DRE:112079163
*
* Nome3: Gabriel Felipe de Oliveira Antão
* DRE:114046394
*
* Rio de Janeiro, 21 de julho de 2018
**/

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- SCRIPT DA RESPOSTA PARA A PERGUNTA 1)
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/**
*Qual é a quantia total das despesas por partido em 2012, 2014 e 2016 nos estados do RJ e SP?
**/


-- SCRIPT

select partido, uf, round(sum(a2012),2) as a2012, round(sum(a2014),2) as a2014, round(sum(a2016),2) as a2016
from despesas_partidos_ano
group by partido, uf
order by partido;


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- SCRIPT DA RESPOSTA E A RESPOSTA PARA A PERGUNTA 2)
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/**
Qual o perfil de gastos (coluna "tipo_despesa") dos Prefeitos que mais gastaram na campanha de 2012 no RJ?  
O perfil é parecido com os dos que menos gastaram?
**/


-- SCRIPT

(select uf, cargo_candidato, nome_candidato, tipo_despesa, sum(valor) as total
from perfil_top_despesas_prefeitos
group by uf, cargo_candidato, nome_candidato, tipo_despesa
order by nome_candidato)
union all
(select uf, cargo_candidato, nome_candidato, tipo_despesa, sum(valor) as total
from perfil_low_despesas_prefeitos
group by uf, cargo_candidato, nome_candidato, tipo_despesa
order by nome_candidato);

 
/*
Podemos ver na tabela resultado, que apesar da diferença entre os valores gastos, eles sao em sua maioria para o mesmo propósito.
*/


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- SCRIPT DA RESPOSTA E A RESPOSTA PARA A PERGUNTA 3)
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/*
Quais são os maiores doadores nos estados do RJ e SP ano de 2016?
*/

-- SCRIPT

(select uf, cpfcnpj_doador, doador, round(sum(valor),2) as total_doado 
from receitas 
where substr(Data,7,4) = '2016' and uf = 'RJ'
group by uf, cpfcnpj_doador, doador
order by total_doado  DESC
limit 5)
union all
(select uf, cpfcnpj_doador, doador, round(sum(valor),2) as total_doado 
from receitas 
where substr(Data,7,4) = '2016' and uf = 'SP'
group by uf, cpfcnpj_doador, doador
order by total_doado  DESC
limit 5);


/*
No Rio de Janeiro o maior doador é o DIRETORIO REGIONAL DO RIO DE JANEIRO - PARTIDO DO MOVIMENTO DEMOCRATICO BRASILEIRO.
Enquanto que em São Paulo maior doador é o PARTIDO SOCIALISTA BRASILEIRO.
*/


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- SCRIPT DA RESPOSTA E A RESPOSTA PARA A PERGUNTA 4)
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/*
Qual é a quantia total das receitas por partido em 2012, 2014 e 2016 nos estados do RJ e SP? OK
*/


-- SCRIPT

select partido, uf, round(sum(a2012),2) as a2012, round(sum(a2014),2) as a2014, round(sum(a2016),2) as a2016
from receitas_partidos_ano
group by partido, uf
order by partido;


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- SCRIPT DA RESPOSTA E A RESPOSTA PARA A PERGUNTA 5)
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/*
Dentre os 3 maiores partidos (em numero de candidatos) do RJ, qual é cada saldo final (receita total - despesa total) no ano em questão?
*/


-- SCRIPT

select t1.uf as uf, t1.partido as partido, round(t1.receitatotal - t2.despesatotal,2) as saldoAno2012
from total_receitas_top_partidos as t1
left join 
total_despesas_top_partidos as t2
on t1.Partido = t2.Partido
order by saldoAno2012 desc;


