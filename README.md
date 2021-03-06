<!--

Linux Kniha kouzel, README
Copyright (c) 2019, 2020 Singularis <singularis@volny.cz>

Toto dílo je dílem svobodné kultury; můžete ho šířit a modifikovat pod
podmínkami licence Creative Commons Attribution-ShareAlike 4.0 International
vydané neziskovou organizací Creative Commons. Text licence je přiložený
k tomuto projektu nebo ho můžete najít na webové adrese:

https://creativecommons.org/licenses/by-sa/4.0/

-->
![Linux: Kniha kouzel](obrázky/banner.png)

„Linux: Kniha kouzel“ je multimediální sbírka krátkých řešených příkladů
z prostředí svobodného software v linuxových operačních systémech,
především distribucích Ubuntu a Linux Mint.
Je vydávána v PDF A4 a B5 pro profesionální i domácí tisk a ve formát HTML
pro snadné vykopírování zaklínadel, můžete ji tedy používat na papíře i v počítači,
proto „multimediální“.

Verze *vanilková příchuť 2.0* je cílena na *Ubuntu 20.04 Focal Fossa* a jeho deriváty.

Obsah podléhá licenci [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).
Podrobné údaje o autorství zdrojových souborů jsou uvedeny v komentářích v jejich záhlaví;
údaje o autorství obrázkových souborů jsou uvedeny v souboru [COPYRIGHT](COPYRIGHT).

## Návod k použití

### Použití online (pro začátečníky)

Navštivte [webové stránky](https://singularis-mzf.github.io/) a vyberte si nejnovější verzi
pro váš operační systém (verzi 2.x pro Ubuntu 20.04 a jeho deriváty; verzi 1.x pro Ubuntu 18.04
a jeho deriváty). Na přehledové stránce si pak zvolíte jednu či více kapitol, které si chcete
prohlédnout (zvolíte-li si více kapitol, doporučuji je otevít v samostatných „panelech“ prohlížeče).
Ve vybraných kapitolách pak najděte nějaké zaklínadlo, které si chcete vyzkoušet.
Obvyklý postup jeho použití je následující:

1. Zamyslete se, jaký kontext zaklínadlo vyžaduje. (Nemá smysl se např. snažit vypsat název větve gitu mimo jeho pracovní adresář. Ne všechna zaklínadla se zapisují přímo na příkazovou řádku.)
2. Označte zaklínadlo v prohlížeči (má-li zaklínadlo víc alternativních variant, označte jen jednu z nich).
3. Zkopírujte ho do schránky (Ctrl+C).
4. Přepněte se do okna terminálu (nebo otevřete nové).
5. Vložte zaklínadlo (Shift+Ctrl+V).
6. Projděte zaklínadlo a místa, která jsou na webové stránce označena podtržením (k doplnění), doplňte odpovídajícími parametry. Smažte hranaté závorky obklopující volitelné parametry.
7. Potvrďte příkaz (Enter).

*Poznámka:* Linux: Kniha kouzel není tutorial. Pokud na první pokus nepochopíte, jak se
uvedená zaklínadla používají, musíte nejprve získat zkušenosti nebo navštívit jiné stránky,
kde vám použití daných nástrojů někdo názorně vysvětlí. Odkazy na takové stránky (včetně videí)
najdete v sekci „Další zdroje informací“ prakticky v každé kapitole.

### Použití online (pro pokročilé)

Navštivte [webové stránky](https://singularis-mzf.github.io/), vyberte požadovanou verzi knihy,
zvolte kapitoly, které jsou blízké tématu, které vás zajímá, a projděte přehled zaklínadel,
který kapitola nabízí. Zaklínadla můžete ze stránky přímo vykopírovat, jen bude potřeba
doplnit parametry označené podtržením a odstranit hranaté závorky vyznačující volitelné parametry.

### Použití offline

Na stránce [releases](https://github.com/singularis-mzf/linux-spellbook/releases) tohoto repozitáře
si můžete stáhnout offline HTML variantu libovolné vydané verze projektu. Offline HTML verze funguje
opravdu offline; internet budete potřebovat, jedině pokud se budete chtít podívat na některý
z odkazovaných webů.

Pro tisk jsou určeny varianty ve formátu PDF, které jsou rovněž ke stažení na stránce
[releases](https://github.com/singularis-mzf/linux-spellbook/releases). Tištěná verze
je podstatně přehlednější než jakákoliv elektronická. Doporučuji vytištěné listy svázat
do kroužkové vazby a použít lepící záložky k označení nejčastěji používaných zaklínadel.

## Návod k sestavení

Následující postup popisuje takzvané „malé sestavení“, kdy vzniknou jen formáty HTML a LOG.
Úplné sestavení je popsáno v souboru [PŘEKLAD.md](PŘEKLAD.md).

Budete potřebovat:

* Git
* GNU make
* GNU awk
* ImageMagick
* qrencode, iconv, xxd
* kvůli řazení české locale „cs\_CZ.UTF-8“ (musí fungovat české řazení příkazem „sort“)

V Ubuntu 20.04 LTS, Ubuntu 18.04 LTS, Linuxu Mint 20 a Linuxu Mint 17.3 můžete tyto nástroje nainstalovat příkazem:

> ``sudo apt-get install git make gawk imagemagick qrencode xxd``

Až budete mít nainstalované potřebné nástroje, stáhněte a nastavte si repozitář:

> ``git clone --branch stabilni https://github.com/singularis-mzf/linux-spellbook.git``<br>
> ``cd linux-spellbook``<br>
> ``git config --local core.quotePath false``

A nakonec spusťte make:

> ``make -j4 log html``

Předpokládám použití **české lokalizace** daného systému.

## Návod k zapojení se

Viz soubor [JAK-SE-ZAPOJIT.md](JAK-SE-ZAPOJIT.md).

### Výběr a pořadí kapitol

Chcete-li si sám/a vybrat, které kapitoly se sestaví do výstupního adresáře, zkopírujte soubor
[pořadí-kapitol.výchozí.lst](pořadí-kapitol.výchozí.lst) na „pořadí-kapitol.lst“ a upravte.
Píše se jedno id kapitoly či dodatku na řádek (id je název souboru bez adresářové cesty a bez přípony)
a kapitoly ani dodatky se nesmějí opakovat.

## Již vydané kapitoly

| ID | Název kapitoly | Vydána od verze |
| :--- | :--- | :--- |
| [awk](kapitoly/awk.md) | AWK | 1.2 |
| [datum-čas-kalendář](kapitoly/datum-čas-kalendář.md) | Datum, čas a kalendář | 1.1 |
| [diskové-oddíly](kapitoly/diskové-oddíly.md) | Diskové oddíly | 1.6 |
| [git](kapitoly/git.md) | Git | 1.0 |
| [hledání-souborů](kapitoly/hledání-souborů.md) | Hledání souborů | 1.5 |
| [make](kapitoly/make.md) | Make | 1.0 |
| [markdown](kapitoly/markdown.md) | Markdown | 1.0 |
| [práce-s-archivy](kapitoly/práce-s-archivy.md) | Práce s archivy | 1.1 |
| [proměnné](kapitoly/proměnné.md) | Proměnné prostředí a interpretu | 1.9 |
| [regulární-výrazy](kapitoly/regulární-výrazy.md) | Regulární výrazy | 1.1 |
| [sed](kapitoly/sed.md) | Sed | 1.8 |
| [soubory-a-adresáře](kapitoly/soubory-a-adresáře.md) | Soubory a adresáře | 1.5 |
| [správa-balíčků](kapitoly/správa-balíčků.md) | Správa balíčků | 1.1 |
| [správa-procesů](kapitoly/správa-procesů.md) | Správa procesů | 1.4 |
| [správa-uživatelských-účtů](kapitoly/správa-uživatelských-účtů.md) | Správa uživatelských účtů | 1.11 |
| [stahování-videí](kapitoly/stahování-videí.md) | Stahování videí | 1.0 |
| [systém](kapitoly/systém.md) | Systém | 1.2 |
| [terminál](kapitoly/terminál.md) | Terminál | (1.0) |
| [vim](kapitoly/vim.md) | Vim | 1.8 |
| [zpracování-binárních-souborů](kapitoly/zpracování-binárních-souborů.md) | Zpracování binárních souborů | 2.0 |
| [zpracování-textových-souborů](kapitoly/zpracování-textových-souborů.md) | Zpracování textových souborů | 1.2 | [zpracování-videa-a-zvuku](kapitoly/zpracování-videa-a-zvuku.md) | Zpracování videa a zvuku | 1.0 |

## Vyřazené kapitoly

* [Docker](kapitoly/docker.md) — Nenaplňuje kvalitativní standard a dostala se mimo okruh mých zájmů; bude zachována ve větvi 1.x, ale ve větvi 2.x se jí již nebudu věnovat.
* [Plánování úloh](kapitoly/plánování-úloh.md) — Dospěl/a jsem k názoru, že pro běžného uživatele není dobré ani „klasické“ řešení plánování úloh démonem *cron*, který úlohu spustí kdesi zcela mimo grafické rozhraní, a tedy mimo interakci s uživatelem, ale ani hybridní řešení, které jsem navrhl/a v této kapitole. Správným řešením je instalace zcela samostatného plánovače, který bude pracovat jako uživatelská aplikace. Proto se místo údržby této kapitoly raději po takovém plánovači poohlédnu.

## Kapitoly ve vývoji

| ID | Název kapitoly | Růst | Stav |
| :--- | :--- | ---: | :--- |
| [x](kapitoly/x.md) | X (Správce oken) | 60% | dítě |
| [firefox](kapitoly/firefox.md) | Firefox | 60% | dítě |
| [kalkulace](kapitoly/kalkulace.md)| Kalkulace | 50% | dítě |
| [zpracování-obrázků](kapitoly/zpracování-obrázků.md) | Zpracování obrázků | 40% | dítě |
| [odkazy](kapitoly/odkazy.md) | Pevné a symbolické odkazy | 20% | dítě |
| [perl](kapitoly/perl.md) | Základy Perlu | 20% | dítě |
| [moderní-věci](kapitoly/moderní-věci.md) | Moderní věci | 10% | dítě |
| [unicode](kapitoly/unicode.md) | Unicode a emotikony | 10% | dítě |
| [uživatelská-rozhraní](kapitoly/uživatelská-rozhraní.md) | Uživatelská rozhraní skriptů | 5% | dítě |
| [apache](kapitoly/apache.md) | Webový server Apache | 5% | dítě |
| [latex](kapitoly/latex.md) | LaTeX | 5% | dítě |
| [dosbox](kapitoly/dosbox.md) | DosBox | 5% | dítě |
| [bash](kapitoly/bash.md) | Bash | 2% | dítě |
| [lkk](kapitoly/lkk.md) | Linux: Kniha kouzel | 2% | dítě |
| [zpracování-psv](kapitoly/zpracování-psv.md) | Zpracování PSV | 2% | dítě |
| [správa-balíčků-2](kapitoly/správa-balíčků-2.md) | Správa balíčků 2 | 1% | dítě |
| [grub](kapitoly/grub.md) | GRUB a jádro | 1% | dítě |
| [konverze-formatů](kapitoly/konverze-formatů.md) | Konverze formátů | 0% | embryo |
| [wine](kapitoly/wine.md) | Wine | 0% | embryo |
| [pdf](kapitoly/pdf.md) | PDF | 0% | embryo |
| [virtualbox](kapitoly/virtualbox.md) | VirtualBox | 0% | embryo |
| [stahování-z-webu](kapitoly/stahování-z-webu.md) | Stahování z webu | 0% | embryo |
| [šifrování](kapitoly/šifrování.md) | Šifrování a kryptografie | 0% | embryo |
| přehrávání-videa | Přehrávání videa, zvuku a obrázků | - | přál/a bych si |
| firewall | Firewall | - | přál/a bych si |
| sql | SQL | - | přál/a bych si |
| ascii-art | ASCII art | - | přál/a bych si |
| záznam-x | Záznam obrazovky | - | přál/a bych si |
| css | Kaskádové styly CSS | - | přál/a bych si |
| nabídka-aplikací | Nabídka aplikací | - | přál/a bych si |

## Zvláštní kapitoly

* [_ostatní](kapitoly/_ostatní.md) − Slouží k dočasnému shromážďování dosud nezařazených zaklínadel.
* [_šablona](kapitoly/_šablona.md) − Nepřekládá se. Slouží jako výchozí podoba pro nově založené kapitoly.
* [_ukázka](kapitoly/_ukázka.md) − Překládá se, ale není součástí vydaných verzí. Slouží k dokumentaci a testování mechanismu překladu. Obsahuje všechny podporované jazykové konstrukce a znaky.

## Větve na GitHubu

* *vyvojova* – Aktivně vyvíjený zdrojový kód. Sem směřují nejčerstvější příspěvky.
* *stabilni* – Zdrojový kód poslední vydané verze. Pokud vám nepůjde přeložit kód z větve „vyvojova“, použijte kód z větve „stabilni“.
* *v1* — Větev 1.x; ve stádiu dlouhodobé pasivní údržby do 1. března 2023.

## Podobné projekty

*Poznámka: Uvedené údaje o licencích jsou orientační, a ačkoliv je uvádím v dobré víře, nemusí již být aktuální!*

* [Sallyx.org](https://www.sallyx.org/) (nesvobodná licence CC BY-NC-SA 3.0) jsou vynikající, obsáhlé a dodnes velmi dobře udržované stránky o linuxu a programování. Na rozdíl od *Linuxu: Knihy kouzel* nejsou open-source (autor je udržuje sám, v podstatě jde o freeware) a nemají knižní ambice, jsou však optimalizovány pro samouky, aby se z nich uváděné nástroje mohli snadno naučit. Dle mého názoru jde o nejlepší konkurenční zdroj v češtině.
* [Pure Bash Bible](https://github.com/dylanaraps/pure-bash-bible) (anglicky, licence: MIT) je stejně jako *Linux: Kniha kouzel* knihou řešených příkladů (ačkoliv jde o e-book) a také se snaží nabízet ověřená a co nejlepší řešení, autor dokonce na svoje příkazy píše automatizované testy. Oproti Linuxu: Knize kouzel je ale Pure Bash Bible zaměřená pouze na příkazový interpret „bash“.
* [Linux Journey](https://linuxjourney.com/) (anglicky, licence pouze textu: CC BY-SA 4.0) je rozsáhlý a kvalitní výukový kurz linuxových příkazů z různých oblastí. Hlavním rozdílem oproti Linuxu: Knize kouzel zde je, že je zaměřený na výuku (dokonce u jednotlivých sekcí nabízí i úkoly k procvičení), není však tak podrobný a vyhýbá se komplikovaným a nejmodernějším technologiím (např. tam nenajdete vysvětlení ACL, LVM apod.).
* [TL;DR](https://github.com/tldr-pages/tldr) (anglicky − „Too Long; Didn't Read“, licence: MIT) představuje výrazně zjednodušené manuálové stránky s krátkými příklady k jednotlivým nástrojům. Na rozdíl od *Linuxu: Knihy kouzel* je organizován po nástrojích, takže musíte vědět, k čemu chcete nápovědu, a neporadí vám lepší nástroje k provedení dané činnosti. Ke každému nástrojí navíc uvádí jen nejběžnější příklady. Kladem je, že jeden z jeho klientů je dostupný jako balíček [Ubuntu](https://packages.ubuntu.com/bionic/tldr) a [Debianu](https://packages.debian.org/buster/tldr).
* Projekt [eg](https://github.com/srsudar/eg) (anglicky, licence MIT) nabízí zjednodušené a velmi praktické „manuálové stránky“ s vynikajícím zvýrazňováním syntaxe, snadným přístupem a možností je snadno upravovat (v Markdownu). Jeho nedostatkem je orientace na dokumentaci nástrojů spíš než na řešení úloh. Také již není příliš aktivně vyvíjen (poslední verze 1.1.1 je z října 2018). (Mimochodem, autor má smysl pro humor, když radí přejmenovat „eg“ na „woman“.)
* [Cheat](https://github.com/chrisallenlane/cheat) (anglicky, licence: MIT) je nástroj pro správu vlastních jednoduchých „manuálových stránek“. Používá se snadno, ale není určen k objevování nových programů a ve srovnání s klasickými manuálovými stránkami má horší zvýrazňování syntaxe.

### Zastaralé podobné projekty

* [The Linux Documentation Project](http://www.tldp.org/) (anglicky, licence: GFDL 1.2, některé části i pod jinými svobodnými licencemi) je monumentální historická sbírka návodů a příruček mapující programy GNU a Linux. Je již ovšem prakticky neudržovaná a většinou velmi zastaralá. K návštěvě ji mohu doporučit jen „počítačovým archeologům“, rozhodně ne současným začátečníkům.
* [GNU/Linux Desktop Survival Guide](https://togaware.com/linux/survivor/) (anglicky, licence: GPL v2+ nebo CC BY 2.0+) je původně rozsáhlá sbírka jednostránkových článků o konkrétních problémech uživatele Debianu. Ačkoliv je dodnes udržovaná, připadá mi, že jedinou formou aktualizace je odstraňování již neaktuálního obsahu, po kterém bohužel zůstávají prázdné články. Na rozdíl od Linuxu: Knihy kouzel již vyšla knižně a PDF verze je placená (HTML verze je dostupná online a zdarma).

## Licence

Kniha a všechny zdrojové kódy podléhají licenci [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/),
některé soubory nabízejí také jinou licenci.
Podrobné údaje o autorství a konkrétní licenci zdrojových souborů jsou uvedeny v komentářích
v jejich záhlaví; údaje o autorství obrázkových a datových souborů (včetně formátu .tsv)
jsou uvedeny v souboru [COPYRIGHT](COPYRIGHT).
