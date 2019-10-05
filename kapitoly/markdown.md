<!--

Linux Kniha kouzel, kapitola Markdown
Copyright (c) 2019 Singularis <singularis@volny.cz>

Toto dílo je dílem svobodné kultury; můžete ho šířit a modifikovat pod
podmínkami licence Creative Commons Attribution-ShareAlike 4.0 International
vydané neziskovou organizací Creative Commons. Text licence je přiložený
k tomuto projektu nebo ho můžete najít na webové adrese:

https://creativecommons.org/licenses/by-sa/4.0/

-->

# Markdown

## Úvod
Markdown je jednoduchý a praktický značkovací jazyk pro pohodlné psaní i čtení textů s jednoduchým formátováním v editorech prostého textu. Je primárně určen k převodu do HTML, kde se na něj aplikují kaskádové styly.

Bohužel existuje řada implementací Markdownu, které nejsou plně kompatibilní. Proto se tato kapitola zaměřuje především na původní (standardní) Markdown, který je základem pro všechny ostatní varianty, a poměrně značně rozšířenou variantu Markdown Extra. Všechna uvedená zaklínadla kromě nestandardních mají fungovat v.

<!--
-- Definice nejsou v této kapitole třeba.
## Definice
-->

## Zaklínadla (Markdown)

### Nadpisy

*# nadpis první/druhé/třetí/čtvrté/páté/šesté úrovně*<br>
**\#** {*nadpis*}<br>
**\##** {*nadpis*}<br>
**\###** {*nadpis*}<br>
**\####** {*nadpis*}<br>
**\#####** {*nadpis*}<br>
**\######** {*nadpis*}<br>

### Základní formátování

*# dva odstavce*<br>
{*první řádek prvního odstavce*}<br>
[{*další řádek prvního odstavce*}]...<br>
{*prázdný řádek*}<br>
{*první řádek druhého odstavce*}<br>
[{*další řádek druhého odstavce*}]...<br>

*# tučný text*<br>
**\*\***{*text*}**\*\***

*# kurzíva*<br>
**\***{*text*}**\***

*# podtržení*<br>
**&lt;u&gt;**{*text*}**&lt;/u&gt;**

*# vložený kód v rámci řádku*<br>
*// Uvnitř kódu se neinterpretují formátovací sekvence, takže je není nutno escapovat.*<br>
**\`\`**{*kód*}**\`\`**

*# víceřádkový kód*<br>
**&blank;&blank;&blank;&blank;**{*první řádek*}<br>
[**&blank;&blank;&blank;&blank;**{*další řádek*}]...

### Odkazy a obrázky

*# hypertextový odkaz (normální/zjednodušený)*<br>
*// Některé interprety markdownu automaticky převádějí úplné URL adresy na hypertextové odkazy bez zjevné možnosti escapování.*<br>
**[**{*text odkazu*}**\](**{*adresa-odkazu*}[**&blank;"**{*titulek*}**"**]**)**<br>
**&lt;**{*adresa-odkazu*}**&gt;**

*# předdefinovaný hypertextový odkaz (definice/použití)*<br>
*// Definice se uvádí pro každý identifikátor pouze jednou a může být kdekoliv v dokumentu (ale na samostatném řádku). Definovaný identifikátor může být použit na více místech, a to i s různými texty odkazů. Identifikátor může začínat číslem a obsahovat mezery a NENÍ citlivý na velikost písmen!*<br>
**[**{*identifikátor*}**]:&blank;**[{*bílé znaky*}]{*adresa-odkazu*}[**&blank;"**{*titulek*}**"**]<br>
**[**{*text odkazu*}**\][**{*identifikátor*}**]**

*# vložit obrázek (jako znak)*<br>
**![**{*alternativní text*}**\](**{*adresa-odkazu*}[**&blank;"**{*titulek*}**"**]**)**

*# předdefinovaný obrázek (definice/použití)*<br>
**[**{*identifikátor*}**]:&blank;**[{*bílé znaky*}]{*adresa-obrázku*}[**&blank;"**{*titulek*}**"**]<br>
**![**{*alternativní text*}**\][**{*identifikátor*}**]**

### Seznamy a odsazení

*# odrážkovaný seznam*<br>
**\*** {*položka seznamu*}<br>
[**\*** {*další položka seznamu*}]...<br>
{*prázdný řádek*}

*# automaticky číslovaný seznam*<br>
**1.** {*položka seznamu*}<br>
[**1.** {*další položka seznamu*}]...<br>
{*prázdný řádek*}

<!--
-- Nefunguje?

*# odrážkovaný seznam s odstavci*<br>
**\*&blank;&blank;&blank;**{*text prvního odstavce*}<br>
[**&blank;&blank;&blank;&blank;**{*pokračování*}]<br>
<br>
**&blank;&blank;&blank;&blank;**{*text druhého odstavce*}<br>
[**&blank;&blank;&blank;&blank;**{*pokračování*}]<br>
<br>
**\*&blank;&blank;&blank;**{*druhá položka*}<br>
{*prázdný řádek*}

*# automaticky číslovaný seznam s odstavci*<br>
**1.&blank;&blank;**{*text prvního odstavce*}<br>
[**&blank;&blank;&blank;&blank;**{*pokračování*}]<br>
<br>
**&blank;&blank;&blank;&blank;**{*text druhého odstavce*}<br>
[**&blank;&blank;&blank;&blank;**{*pokračování*}]<br>
<br>
**1.&blank;&blank;**{*druhá položka*}
-->

*# výrazné odsazení odstavce zleva (první úroveň)*<br>
**&gt;** {*začátek textu*}<br>
[**&gt;** {*pokračování*}]...

*# výrazné odsazení odstavce zleva (druhá úroveň)*<br>
**&gt; &gt;** {*začátek textu*}<br>
[**&gt; &gt;** {*pokračování*}]...

### Ostatní

*# komentář*<br>
**&lt;!\-\-** {*obsah komentáře, i víc řádků*} **\-\-&gt;**

*# horizontální čára*<br>
**\*\*\***

## Zaklínadla (Markdown Extra)

*# nadpis s kotvou/odkaz na takový nadpis*<br>
{*nadpis*} [{*bílé znaky*}]**\{\#**{*id*}**}**<br>
**\[**{*text odkazu*}**\](#**{*id*}[**&blank;"**{*titulek*}**"**]**)**

*# víceřádkový kód*<br>
*// Pro tuto syntaxi můžete použít i více než tři znaky \~, ale jejich počet v zahajujícím a ukončujícím řádku se musí shodovat.*<br>
**\~\~\~**[&blank;**.**{*CSS-třída*}]<br>
{*řádek kódu*}...<br>
**\~\~\~**

*# tabulka *<br>
*// Zarovnání je „:---“ vlevo, „---“ na střed nebo „---:“ vpravo. Řádek se záhlavím a řádek se zarovnáními jsou povinné, ostatní řádky tabulky jsou nepovinné. Buňky tabulky mohou obsahovat formátování.*<br>
**\|** {*záhlaví 1*} [**\|** {*další záhlaví*}]...<br>
**\|** {*zarovnání 1*} [**\|** {*další zarovnání*}]...<br>
[**\|** {*buňka 1*} [**\|** {*další buňka*}]...]...

*# seznam definic se dvěma definicemi (druhá má dva pojmy)*<br>
{*první pojem*}<br>
**:**&blank;{*odstavec popisující první pojem*}<br>
{*prázdný řádek*}<br>
{*druhý pojem*}<br>
{*třetí pojem*}<br>
**:**&blank;{*odstavec popisující druhý a třetí pojem*}

*# poznámka pod čarou (odkaz na poznámku/text poznámky)*<br>
*// Omezení: Na jednu poznámku pod čarou lze odkazovat tímto způsobem pouze jednou!*<br>
**\[\^**{*id*}**]**<br>
**\[\^**{*id*}**]:&blank;**{*text poznámky*}

*# zkratky (&lt;abbr&gt;)(definice/použití)*<br>
**\*[**{*zkratka*}**]:** {*vysvětlení*}<br>
{*zkratka*}

## Zaklínadla (nestandardní)

*# přeškrtnutý text*<br>
**\~\~**{*text*}**\~\~**

*# kód se zvýrazněním syntaxe*<br>
**\`\`\`**{*syntaxe*}<br>
{*řádek kódu*}...<br>
**\`\`\`**



## Parametry příkazů
*# převod Markdownu na HTML*<br>
**markdown** [**\-\-html4tags**] [**\-\-**] [{*vstupní-soubor*}]... [**&gt;** {*výstupní-soubor*}]

## Jak získat nápovědu
Doporučuji prohledat online zdroje v sekci „Odkazy“ této kapitoly, nebo experimentovat s nástrojem, který pro překlad Markdownu používáte.

## Tipy a zkušenosti
* Asi nejhorším problémem v Markdownu je escapování. Speciální znaky se totiž escapují zpětným lomítkem pouze tehdy, když mají speciální význam; v ostatních případech se zpětné lomítko před takovým znakem exportuje jako normální znak. Problém však je, že inteprety Markdownu se velmi značně liší v tom, které znaky a v jakých kontextech považují za speciální. Proto nelze dosáhnout zcela jednotných výsledků. Stanardní Markdown však zaručuje možnost zpětným lomíkem escapovat: \!, \#, \*, \+, \-, \., \\, \_, \` a všechny tři druhy závorek. Markdown Extra k tomu přidává znaky \: a \|.
* Identifikátory předdefinovaných odkazů a obrázků jsou prakticky obecné řetězce. Vhodný identifikátor je i např. „3.12;Dobrý den/Žlutoučký kůň\*“. Jejich maximální délka je ale omezena implementací.
* V Markdownu můžete přímo používat inline prvky HTML (např. &lt;br&gt; či &lt;strong&gt;).
* Markdown (standardní) umožňuje vložit zalomení řádku pomocí dvou či více mezer na konci řádku. Osobně to nedoporučuji, protože některé textové editory (např. vim) bílé znaky na konci řádku nezobrazují a některé nástroje je mohou považovat za překlep a automaticky odstranit. Doporučuji místo toho používat HTML značku &lt;br&gt;, případně &lt;br&nbsp;/&gt;.
* Markdown neumožňuje vloženému obrázku definovat rozměry. Toto můžete učinit buď pomocí CSS, nebo místo syntaxe Markdownu přímo použít značku &lt;img&gt;.


## Ukázka

*# *<br>
**\# Ukázka Markdownu**<br>
**\## Nadpis druhé úrovně**<br>
**Text prvního**<br>
**odstavce obsahuje část \*\*tučně\*\*, část \*kurzívou\* a část &lt;u&gt;podtrženou&lt;/u&gt; a také \`\`vložený kód\`\`.**<br>
<br>
**Text druhého odstavce. [Odkaz s&amp;nbsp;textem\](http:⫽www.slovnik-synonym.cz/), [s&nbsp;id\][Slovník synonym] a &lt;http:⫽www.slovnik-synonym.cz/&gt;.**<br>
<br>
**Obrázky: ![tento\][ve výstavbě] a ![tento\](../obrazky/ve-vystavbe.png).**<br>
<br>
**\[Slovník synonym]: http://www.slovnik-synonym.cz/**<br>
**\[ve výstavbě]: ../obrazky/ve-vystavbe.png**<br>
**\[^pozn-pod-carou]: S poznámkou pod čarou.**<br>
<br>
**&gt; Odstavec odsazený**<br>
**na první úroveň\[^pozn-pod-carou].**<br>
<br>
**&gt; &gt; Odstavec odsazený**<br>
**na druhou úroveň.**<br>
**\### Tabulka (Markdown Extra)**<br>
**\| Sloupec 1 \| Sloupec 2 \| Sloupec 3**<br>
**\| :\-\-\- \| \-\-\- \| \-\-\-:**<br>
**\| vlevo \| na střed \| vpravo**

Tato ukázka je funkční, ale zestručněná. Úplnou ukázku můžete najít v repozitáři na GitHubu v souboru „ukazka_markdownu.md“.

## Snímek obrazovky
![snímek obrazovky](../obrazky/gpl/retext.png)

## Instalace na Ubuntu
*# příkaz...*<br>
**sudo apt-get install markdown**

*# editor (grafický)*<br>
**sudo apt-get install retext**

Existuje i modernější a propracovanější editor [Remarkable](https://remarkableapp.github.io/linux.html) (licence MIT) zaměřený především na Arch Linux, ale je možno ho nainstalovat i v Ubuntu.

## Odkazy
* [stránka na Wikipedii](https://cs.wikipedia.org/wiki/Markdown)
* [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
* [oficiální stránky: Markdown Syntax](https://daringfireball.net/projects/markdown/syntax) (anglicky)
* [GitHub Help: Basic writing and formatting syntax](https://help.github.com/en/articles/basic-writing-and-formatting-syntax)
* [Markdown Extra Syntax](https://catalog.olemiss.edu/help/markdown/extra) (anglicky)
* [video Markdown Syntax Cheat Sheet](https://www.youtube.com/watch?v=bpdvNwvEeSE) (anglicky)
* [video Markdown Tutorial](https://www.youtube.com/watch?v=6A5EpqqDOdk) (anglicky)
* [video How to Write MarkDown](https://www.youtube.com/watch?v=eJojC3lSkwg) (anglicky)
* [manuálová stránka o Markdownu](http://manpages.ubuntu.com/manpages/bionic/en/man7/markdown.7.html) (anglicky)
* [manuálová stránka příkazu markdown](http://manpages.ubuntu.com/manpages/bionic/en/man1/markdown.1.html) (anglicky)
* [balíček markdown](https://packages.ubuntu.com/bionic/markdown) (anglicky)
* [balíček retext](https://packages.ubuntu.com/bionic/retext) (anglicky)
* [balíček Remarkable v ALUR](https://aur.archlinux.org/packages/remarkable/) (anglicky)
* [specifikace GitHub Flavored Markdown](https://github.github.com/gfm/) (anglicky)