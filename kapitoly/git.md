<!--

Linux Kniha kouzel, kapitola Git
Copyright (c) 2019 Singularis <singularis@volny.cz>

Toto dílo je dílem svobodné kultury; můžete ho šířit a modifikovat pod
podmínkami licence Creative Commons Attribution-ShareAlike 4.0 International
vydané neziskovou organizací Creative Commons. Text licence je přiložený
k tomuto projektu nebo ho můžete najít na webové adrese:

https://creativecommons.org/licenses/by-sa/4.0/

-->

# Git

## Úvod
Git je systém správy verzí. Umožňuje vám zachytit přesný stav souborů v určitém
adresáři a jeho podadresářích. Každý takto zachycený stav se opatří datem, časem
a popisem a později se k němu můžete vrátit, nebo ho exportovat do samostatného
adresáře. Kromě toho umožňuje git synchronizaci a slučování změn v jinak oddělených
kopiích daného adresáře a perfektní evidenci změn v textových souborech.

## Definice
* **Pracovní adresář** je množina všech verzovaných souborů v gitem spravovaném uživatelském adresáři. Nikdy nezahrnuje obsah speciálního adresáře „.git“.
* **Revize** je konkrétní neměnný (historický) stav pracovního adresáře zapsaný do repozitáře a doplněný o další údaje. Revizi lze v příkazovém řádku určit řadou způsobů, viz níže.
* **Repozitář** je skupina souborů a adresářů, do kterých git vysoce optimalizovaným způsobem ukládá všechny revize. Pracovní adresář má vždy přiřazený právě jeden „lokální“ repozitář a k němu pak mohou být přiřazeny vzdálené repozitáře (nejčastěji pouze jeden, zvaný **origin**).
* **Tag** je symbolický název pevně přiřazený uživatelem určité konkrétní revizi; není vhodné jej dodatečně měnit.
* **Větev** je proměnný symbolický název přiřazený určité revizi v repozitáři (s výjimkou takzvané prázdné větve). Součástí operace „commit“ je přiřazení nové revize větvi. (Větev je v gitu analogií proměnné v programování.)
* **HEAD** je „aktuální revize“. Nejčastěji je to prostě revize, která byla načtena z repozitáře jako poslední.
* **Index** (také zvaný „staging area“) je myšlená kopie revize HEAD, do které lze průběžně zapisovat změny a pak z ní operací „commit“ vytvořit novou revizi. Do indexu se rovněž provádí slučování větví (merge). Doporučuji představovat si index jako skrytý adresář.

### Označení revize

Každá revize je jednoznačně identifikována pomocí své MD5 hashe. Kromě této úplné hashe můžeme pojmenovat revizi těmito způsoby:

* Jednoznačný prefix hashe (Nebude-li uvedený prefix jednoznačný, git vyvolá chybu a umožní vám situaci napravit.)
* HEAD
* Název větve
* Název tagu
* Jiné označení revize, tilda a číslo; takto získáte N-tého předka dané revize, např. **HEAD\~1** je bezprostřední předek aktuální revize, **vetev\~3** je čtvrtá nejčerstvější revize ve větvi „vetev“ apod.

## Zaklínadla

### Práce s repozitáři

*# vytvořit nový repozitář v aktuálním adresáři*<br>
**git init** [**\-\-bare**]

*# vytořit lokální repozitář ze vzdáleného*<br>
**git clone** {*vzdálená-adresa*} [{*místní-adresář*}]

*# získat do nového adresáře konkrétní revizi*<br>
**git clone -s -n** {*lokální-repozitář*} {*nový-adresář*}<br>
**git -C** {*nový-adresář*} **checkout** {*revize*}<br>
**rm -Rf** {*nový-adresář*}**/.git**

*# konverze bare repozitáře na normální*<br>
**git -C** {*repozitář*} **config \-\-local core.bare false**<br>
**mv** {*repozitář*} {*repozitář*}**-git**<br>
**mkdir** {*repozitář*}<br>
**mv** {*repozitář*}**-git** {*repozitář*}**/.git**<br>
**git -C** {*repozitář*} **reset \-\-hard**

*# konverze normálního repozitáře na bare repoziťář*<br>
**mv** {*repozitář*}**/.git** {*repozitář*}**-git**<br>
**rm -R** {*repozitář*}<br>
**mv** {*repozitář*}**-git** {*repozitář*}<br>
**git -C** {*repozitář*} **config \-\-local core.bare true**

### Mezi pracovním adresářem, indexem a lokálním repozitářem

*# načíst zadanou revizi do pracovního adresáře i indexu (jen načíst/vytvořit z ní ní novou větev)*<br>
*// Jsou-li v pracovním adresáři změny, tento příkaz se je pokusí zachovat.*<br>
**git checkout** {*revize*}<br>
**git checkout -b** {*nová-větev*} [{*revize*}]


*# přenést do indexu změny v pracovním repozitáři (všech souborů/jen již verzovaných)*<br>
*// Normálně „git add“ přenese smazání souboru jen tehdy, je-li daný soubor výslovně jmenován na příkazovém řádku. S parametrem „-A“ přenese všechna smazání.*<br>
**git add** [**-A**] [**\-\-**] {*soubor-nebo-adresář*}...<br>
**git add -u** [**-A**] [**\-\-**] [{*soubor-nebo-adresář*}]...

*# operace commit (vytvořit z indexu novou revizi a nastavit na ni aktuální větev)*<br>
**git commit** [**-m** {*komentář*}] [**-a**] [**\-\-allow-empty**] [**\-\-amend**] [*\-\-reset-author*]

*# nahradit poslední commitnutou revizi novým commitem se zachováním původního autora, předků, komentáře a časové známky*<br>
*// Pozn.: hash commitu se v tomto případě změní, protože revize je neměnná, takže jediný způsob, jak ji upravit, je vytvořit novou revizi a nahradit s ní tu původní.*<br>
**git commit \-\-amend \-\-no-edit**


*# načíst konkrétní soubory z revize v repozitáři do pracovního adresáře a indexu*<br>
*// Výchozí revize je HEAD. Pozor, bez ptaní přepíše změny v pracovním adresáři!*<br>
**git checkout** [{*revize*}] [**\-\-**] {*soubor-nebo-adresář*}...

*# načíst konkrétní soubory z revize v repozitáři do indexu*<br>
*// Výchozí revize je HEAD.*<br>
**git reset** [{*revize*}] [**\-\-**] {*soubor-nebo-adresář*}...


*# smazat soubor z pracovního adresáře i indexu/jen z indexu*<br>
**git rm** [**-f**] [**-r**] [[\-\-] {*soubor-či-adresář*}...]
**git rm \-\-cached** [**-f**] [**-r**] [[\-\-] {*soubor-či-adresář*}...]

*# přesunout či přejmenovat soubor/přesunout soubory v pracovním adresáři i indexu*<br>
**git mv** {*původní-cesta*} {*nová-cesta*}<br>
**git mv** {*zdroj*}... {*cílový-adresář*}

*# načíst HEAD do indexu/do indexu a pracovního adresáře (zrušit všechny změny)*<br>
**git reset**<br>
**git reset \-\-hard**


### Práce se vzdáleným repozitářem (origin)

*# stáhnout všechny novinky a aktualizovat právě načtenou větev*<br>
*// Pokud ve vzdáleném repozitáři nastaly změny i v jiných větvích, než té, která je právě načtená do pracovního adresáře, příkaz „git pull“ tyto jiné větve neaktualizuje!*<br>
**git pull**

*# vytvořit novou větev z HEAD a odeslat ji do vzdáleného repozitáře*<br>
**git checkout -b** {*nová-větev*}<br>
**git push \-\-set-upstream origin** {*nová-větev*}

*# odeslat změny v aktuální větvi z lokálního repozitáře do vzdáleného (jednorázově/nastavit/větev už je nastavená)*<br>
**git push origin** {*větev*}<br>
**git push \-\-set-upstream origin** {*větev*}
**git push**

*# odeslat zadané větve (existující větve ve vzdáleném repozitáři budou přepsány)*<br>
*// Poznámka: Příkaz „git push“ selže, pokud vzdálený repozitář není bare.*<br>
**git push** [**\-\-set-upstream**] **origin** {*větev*}...

*# odeslat zadané tagy*<br>
**git push origin** {*tag*}...

*# smazat zadanou větev nebo tag ze vzdáleného repozitáře*<br>
**git push :**{*větev-nebo-tag*} [**:**{*další-větev-nebo-tag*}]...

*# stáhnout všechny novinky ze vzdáleného repozitáře*<br>
**git fetch**

### Jednoduchá práce s větvemi
*# vytvořit novou větev z HEAD*<br>
**git branch** {*nová-větev*}

*# vytvořit novou větev z HEAD a přepnout se na ni (nezmění pracovní adresář ani index)*<br>
**git checkout -b** {*nová-větev*}

*# přejmenovat větev*<br>
**git branch -m** {*starý-název*} {*nový-název*}

*# smazat větev (jen sloučenou/kteroukoliv)*<br>
**git branch -d** {*větev*}...<br>
**git branch -D** {*větev*}...

*# ručně přiřadit větvi určitou revizi (i nesouvisející)*<br>
**git reset \-\-soft** {*revize*}

*# vytvořit novou odpojenou větev (orphan branch)(z revize/zcela prázdnou)*<br>
**git checkout \-\-orphan** [{*revize*}]
**git checkout \-\-orphan &amp;&amp; git rm -rf .**

### Jednoduchá práce s tagy
*# vytvořit nový tag (normální/anotovaný)*<br>
**git tag** {*název-tagu*} [{*revize*}]<br>
**git tag -a -m** {*komentář*} [{*revize*}]

*# vypsat seznam tagů*<br>
**git tag** [**-l "**{*vzorek*}**"**]

*# smazat tag*<br>
*// Mazání a znovuvytvoření zcela lokálního tagu, který nemá obdobu ve vzdáleném repozitáři, je bezpečné. Všechny ostatní případy mohou mít nepříjemné nečekané důsledky.*<br>
**git tag -d** {*název-tagu*}

### Analýza stavu

*# vypsat „pro člověka“ běžné informace (aktuální větev a změněné soubory v indexu a pracovním adresáři)*<br>
**git status** [{*soubor-či-adresář*}]...

*# vypsat změny v pracovním adresáři oproti HEAD/v pracovním adresáři oproti indexu/v indexu oproti HEAD*<br>
**git diff HEAD** [**\-\-** {*soubor-nebo-adresář*}...]<br>
**git diff** [**\-\-** {*soubor-nebo-adresář*}...]<br>
**git diff \-\-cached** [**\-\-** {*soubor-nebo-adresář*}...]

*# vypsat rozdíly mezi dvěma revizemi*<br>
**git diff** {*revize1*} {*revize2*} [**\-\-** {*soubor-nebo-adresář*}...]

*# vypsat „pro člověka“ zpětnou historii předků aktuální revize (až po kořen/jen po první revizi dosažitelnou z „omezující-revize“)*<br>
**git log** [**\-\-pretty=**{*formát*}] [**-n** {*maximální-počet-revizí*}] [{*revize*}]<br>
**git log** [**\-\-pretty=**{*formát*}] [**-n** {*maximální-počet-revizí*}] {*omezující-revize*}**..**{*revize*}

*# vypsat „pro člověka“ zpětnou historii revizí, u kterých došlo ke změně v některém z uvedených souborů*<br>
**git log** [**\-\-pretty=**{*formát*}] [**-n** {*maximální-počet-revizí*}] [{*revize*}] **--** {*soubor-nebo-adresář*}...

*# vypsat podrobné informace o revizi*<br>
**git show** {*revize*}

*# vypsat (pro skript) seznam tvořený revizí a všemi jejími předky*<br>
**git rev-list** {*revize*}

*# vypsat úplnou hash dané revize*<br>
**git rev-list -n 1** {*revize*}

### Slučování větví

*# sloučit HEAD s dalšími revizemi (+ provést commit)*<br>
*// Dojde-li při slučování ke konfliktu, můžeme je zrušit příkazem „git merge \-\-abort“.*<br>
**git merge** {*revize*}...

### Práce se změnami (pokročilá)

*# odvolat změny z určitých revizí/z určitého rozsahu revizí a odvolání commitnout*<br>
*// Příkaz „git revert“ vyžaduje, aby v indexu ani pracovním adresáři nebyly žádné změny oproti HEAD.*<br>
**git revert** [**\-\-no-edit**] [**-n**] {*revize*}...<br>
**git revert** [**\-\-no-edit**] [**-n**] {*starší-revize*}**..**{*novější-revize*}

*# přenést změny z uvedených revizí do aktuální větve (uvést v příkazu/načíst)*<br>
**git cherry-pick** [**-x**] [**-n**] {*revize*}...<br>
{*příkaz generující seznam revizí*} **\| git cherry-pick \-\-stdin** [**-x**] [**-n**]

*# zařadit změny provedené v jiné větvi před změny provedené v této větvi*<br>
**git rebase** {*revize-jiná-větev*}

### Konfigurace repozitáře
*# vypsat současnou hodnotu určitého klíče*<br>
**git config** [**\-\-global**] **\-\-get** {*klíč*}

*# nastavit hodnotu určitého klíče*<br>
**git config** [**\-\-global**] {*klíč*} "{*nová hodnota*}"

*# vypsat celou konfiguraci (lokální/globální/globální a pod ní lokální)*<br>
**git config** [**\-\-local**] **-l**
**git config** [**\-\-global**] **-l**
**git config -l**

*# vypsat platné konfigurační dvojice klíč=hodnota*<br>
**git config -l \| tac \| awk -F = '$0 \~ /=/ &amp;&amp; !($1 in A) {A[$1] = 1; print $0;}' \| LC_ALL=C sort**

*# najít seznam podporovaných konfiguračních klíčů*<br>
**git config \-\-help**

## Zaklínadla (.gitignore)

*# komentář*<br>
**#** [{*text*}]

*# ignorovat soubory a adresáře vyhovující vzorku (může obsahovat znaky ? a \* ve stejném významu jako v bashi)*<br>
{*vzorek*}

*# ignorovat pouze adresáře vyhovující vzorku*<br>
{*vzorek*}**/**

## Parametry příkazů
![ve výstavbě](../obrazky/ve-vystavbe.png)

## Jak získat nápovědu
*# *<br>
**git \-\-help**<br>
**git** {*příkaz-gitu*} **\-\-help**

Další dobrou možností je oficiální online referenční příručka (viz sekci „Odkazy“).

## Tipy a zkušenosti
* Normální repozitář je jednodušší než bare repozitář. Má vlastní pracovní adresář, se kterým pracuje. Normální repozitář můžete použít jako vzdálený repozitář, ale pouze ke čtení − nelze do něj zapisovat příkazem „git push“. Naopak bare repozitář slouží výhradně jako vzdálený repozitář.
* Revize vzniklé sloučením větví (merge) mají za předky všechny revize, ze kterých byly sloučeny.

## Ukázka
![ve výstavbě](../obrazky/ve-vystavbe.png)
<!--
Tuto sekci ponechávat jen v kapitolách, kde dává smysl.
-->

## Snímek obrazovky
![ve výstavbě](../obrazky/ve-vystavbe.png)
<!--
Tuto sekci ponechávat jen v kapitolách, kde dává smysl.
-->

## Instalace na Ubuntu
*# *<br>
**sudo apt-get install git**<br>
**git config \-\-global user.name "**{*vaše celé jméno*}**"**<br>
**git config \-\-global user.email "**{*váš e-mail*}**"**

Celé jméno a e-mail se používají k označení autorství revizí. Musíte je zadat, jinak git nebude fungovat, ale nemusí být pochopitelně pravdivé. Pro konkrétní repozitář můžete nastavit jiné hodnoty použitím stejných konfiguračních příkazů bez parametru **\-\-global**.

## Odkazy
![ve výstavbě](../obrazky/ve-vystavbe.png)

Co hledat:

* [stránka na Wikipedii](https://cs.wikipedia.org/wiki/Git)
* [oficiální stránka programu](https://git-scm.com/) (anglicky)
* [oficiální online referenční příručka](https://git-scm.com/docs) (anglicky)
* [manuálová stránka](http://manpages.ubuntu.com/manpages/bionic/en/man1/git.1.html) (anglicky)
* [balíček Bionic](https://packages.ubuntu.com/)
* online referenční příručky
* různé další praktické stránky, recenze, videa, tutorialy, blogy, ...
* publikované knihy