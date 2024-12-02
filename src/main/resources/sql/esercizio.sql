--esercizio 1: estrai tutti i clienti con nome mario
select * from  clienti where clienti.nome = 'mario';

--esercizio 2: estrarre nome e cognome nati nel 1991
select nome, cognome from  clienti where clienti.anno_di_nascita = 1991;

--esercizio 3: estrarre il numero delle fatture con iva al 20%
select numero_fattura from fatture where iva = 20

--esercizio 4: estrarre prodotti attivati nel 2017 e che sono in produzione o in commercio
select * from prodotti where extract (year from prodotti.data_attivazione)= 2017
and (prodotti.in_produzione = true or prodotti.in_commercio = true);

--esercizio 5: estrarre le fatture con importo inferiore a 1000 ed i dati dei clienti ad esse collegate
SELECT * FROM fatture JOIN clienti ON clienti.numero_cliente = fatture.id_cliente WHERE fatture.importo < 1000;

--esercizio 6: riportare l'elenco delle fatture (numero importo iva e data) con aggiunta il nome del fornitore
select numero_fattura, importo, iva , data_fattura, fornitori.denominazione
from fatture join fornitori on fatture.numero_fornitore = fornitori.numero_fornitore

--esercizio 7: solo fatture iva al 20% estrarre il numero di fatture per ogni anno
select extract (year from data_fattura), count(*) as numero_fatture_anno from fatture
where fatture.iva = 20 GROUP BY extract (YEAR FROM data_fattura);

--esercizio 8: riportare il numero di fatture e la somma dei relativi importi divisi per anno di fatturazione
select extract (year from data_fattura) as anno, count(*) as numero_fatture_anno, sum(importo) as totale from fatture
GROUP BY extract (YEAR FROM data_fattura);

--esercizio 9 EXTRA: estrarre gli anni in cui sono stare registrate più fatture di tipologia a
select extract (year from data_fattura) as anno from fatture where fatture.tipologia = 'a' GROUP BY extract
(YEAR FROM data_fattura) having count(numero_fattura) > 2;

--esercizio 10 EXTRA: estrarre il totale degli importi delle fatture divisi per residenza dei clienti
select sum(fatture.importo) as totale_regione, clienti.regione_residenza from fatture join clienti on clienti.numero_cliente = fatture.id_cliente
group by clienti.regione_residenza;


