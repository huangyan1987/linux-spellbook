<!--

Linux Kniha kouzel, kapitola Docker
Copyright (c) 2019 Singularis <singularis@volny.cz>

Toto dílo je dílem svobodné kultury; můžete ho šířit a modifikovat pod
podmínkami licence Creative Commons Attribution-ShareAlike 4.0 International
vydané neziskovou organizací Creative Commons. Text licence je přiložený
k tomuto projektu nebo ho můžete najít na webové adrese:

https://creativecommons.org/licenses/by-sa/4.0/

-->
# Docker

## Úvod
Docker je nástroj pro odlehčenou virtualizaci formou takzvaných kontejnerů. Kontejner má vlastní souborový systém (včetně knihoven a systémových nastavení) a síťové rozhraní, ne však vlastní jádro.

## Definice
* **kontejner** je dočasné (ale perzistentní) virtualizované prostředí pro spouštění programů
* **image** je neměnný, opakovaně použitelný výchozí stav kontejneru
* **repozitář** je soubor imagí se společným označením (např. „ubuntu“). Jednotlivé image se pak identifikují pomocí **tagu** uvedeného za název repozitáře a dvojtečku (např. „ubuntu:18.04“). Není-li tag uveden, Docker automaticky doplní tag „latest“.
* **Dockerfile** je textový soubor s názvem „Dockerfile“, obsahující instrukce k vytvoření image.

## Zaklínadla


## Parametry příkazů

## Jak získat nápovědu

*# obecná nápověda*<br>**docker \-\-help**

*# nápověda ke konkrétnímu příkazu*<br>**docker** {*příkaz*} **\-\-help**

## Tipy a zkušenosti

## Odkazy
* [článek na Wikipedii](https://cs.wikipedia.org/wiki/Docker\_(software\))
* [oficiální stránky](https://www.docker.com/) (anglicky)
* [oficiální reference Dockerfilu](https://docs.docker.com/engine/reference/builder/) (anglicky)
* [repozitář „ubuntu“ na Docker Hubu](https://hub.docker.com/\_/ubuntu) (anglicky)
* [balíček Ubuntu](https://packages.ubuntu.com/bionic/docker.io) (anglicky)