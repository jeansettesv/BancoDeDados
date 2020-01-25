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
-- VIEWS PARA RESPONDER A PERGUNTA 1) 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/**
*Qual é a quantia total das despesas por partido em 2012, 2014 e 2016 nos estados do RJ e SP?
**/


-- despesas_partidos

create view despesas_partidos as
select * from despesas where Partido is not null;

create view despesas_partidos_ano as
select partido, uf,
case when substr(Data,7,4) = '2012'
     then Valor
     when substr(Data,8,2) = '12'
     then Valor
     else '0' 
end as a2012,
case when substr(Data,7,4) = '2014'
     then Valor
     when substr(Data,8,2) = '14'
     then Valor
     else '0' 
end as a2014,
case when substr(Data,7,4) = '2016'
     then Valor
     when substr(Data,8,2) = '16'
     then Valor
     else 0 
end as a2016
from despesas_partidos;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- VIEWS PARA RESPONDER A PERGUNTA 2) 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/*
Qual o perfil de gastos (coluna "tipo_despesa") dos Prefeitos que mais gastaram na campanha de 2012 no RJ?  
O perfil é parecido com os dos que menos gastaram?
*/


-- despesas_candidatos

create view despesas_candidatos as 
select * from despesas where Partido is null;


-- top_despesas_prefeitos

create view top_despesas_prefeitos as
select uf, Partido_candidato, Cargo_candidato, Nome_candidato, sum(valor) as total
from despesas_candidatos 
where Cargo_candidato = 'Prefeito' and substr(Data,7,4) = '2012'
group by uf, Partido_Candidato, Cargo_candidato, Nome_Candidato
order by total DESC
limit 5;


-- low_despesas_prefeitos

create view low_despesas_prefeitos as
select uf, Partido_candidato, Cargo_candidato, Nome_candidato, sum(valor) as total
from despesas_candidatos 
where Cargo_candidato = 'Prefeito' and substr(Data,7,4) = '2012'
group by uf, Partido_Candidato, Cargo_candidato, Nome_Candidato
order by total ASC
limit 5;


-- perfil_top_despesas_prefeitos

create view perfil_top_despesas_prefeitos as
select t1.uf as uf, t1.Cargo_Candidato as Cargo_Candidato, t1.Nome_candidato as nome_candidato, t1.Tipo_despesa as tipo_despesa, t1.valor as valor
from despesas_candidatos as t1
right join
top_despesas_prefeitos as t2
on t1.uf = t2.uf and t1.Cargo_Candidato = t2.Cargo_Candidato and t1.Nome_candidato = t2.Nome_candidato;


-- perfil_low_despesas_prefeitos

create view perfil_low_despesas_prefeitos as
select t1.uf as uf, t1.Cargo_Candidato as Cargo_Candidato, t1.Nome_candidato as nome_candidato, t1.Tipo_despesa as tipo_despesa, t1.valor as valor
from despesas_candidatos as t1
right join
low_despesas_prefeitos as t2
on t1.uf = t2.uf and t1.Cargo_Candidato = t2.Cargo_Candidato and t1.Nome_candidato = t2.Nome_candidato;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- VIEWS PARA RESPONDER A PERGUNTA 3)
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/*
Quais são os maiores doadores nos estados do RJ e SP ano de 2016?
*/

-- NAO FOI NECESSÁRIA A CRIAÇÃO DE VIEWS PARA RESPONDER ESSA PERGUNTA

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- VIEWS PARA RESPONDER A PERGUNTA 4)
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/*
Qual é a quantia total das receitas por partido em 2012, 2014 e 2016 nos estados do RJ e SP?
*/


-- receitas_partidos

create view receitas_partidos as
select * from receitas where Partido is not null;


-- receitas_partidos_ano

create view receitas_partidos_ano as
select partido, uf,
case when substr(Data,7,4) = '2012'
     then Valor
     when substr(Data,8,2) = '12'
     then Valor
     else '0' 
end as a2012,
case when substr(Data,7,4) = '2014'
     then Valor
     when substr(Data,8,2) = '14'
     then Valor
     else '0' 
end as a2014,
case when substr(Data,7,4) = '2016'
     then Valor
     when substr(Data,8,2) = '16'
     then Valor
     else 0 
end as a2016
from receitas_partidos;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- VIEWS PARA RESPONDER A PERGUNTA 5) 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/*
Dentre os 3 maiores partidos (em numero de candidatos) do RJ, qual é cada saldo final (receita total - despesa total) no ano em questão?
*/


-- top_partidos_2012

create view top_partidos_2012 as
select uf, Partido, count(*) as ncandidatos
from candidatos
where uf = 'RJ'
group by uf, Partido
order by ncandidatos desc
limit 3;


-- total_receitas_partidos

create view total_receitas_partidos as
select uf, partido, sum(valor) as receitatotal
from receitas
where partido is not null and substr(Data,7,4) = '2012' and uf = 'RJ'
group by uf, partido;


-- total_despesas_partidos

create view total_despesas_partidos as
select uf, partido, sum(valor) as despesatotal
from despesas
where partido is not null and substr(Data,7,4) = '2012' and uf = 'RJ'
group by uf, partido;


-- total_receitas_top_partidos

create view total_receitas_top_partidos as
select t1.uf as uf, t1.partido as partido, round(receitatotal,2) as receitatotal
from total_receitas_partidos as t1
right join
top_partidos_2012 as t2
on t1.partido = t2.partido;


-- total_despesas_top_partidos

create view total_despesas_top_partidos as
select t1.uf as uf, t1.partido as partido, round(despesatotal,2) as despesatotal
from total_despesas_partidos as t1
right join
top_partidos_2012 as t2
on t1.partido = t2.partido;