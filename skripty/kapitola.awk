# Linux Kniha kouzel, skript kapitola.awk
# Copyright (c) 2019 Singularis <singularis@volny.cz>
#
# Toto dílo je dílem svobodné kultury; můžete ho šířit a modifikovat pod
# podmínkami licence Creative Commons Attribution-ShareAlike 4.0 International
# vydané neziskovou organizací Creative Commons. Text licence je přiložený
# k tomuto projektu nebo ho můžete najít na webové adrese:
#
# https://creativecommons.org/licenses/by-sa/4.0/
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

@include "skripty/utility.awk"

BEGIN {
    if (IDKAPITOLY == "") {
        ShoditFatalniVyjimku("Vyžadovaná proměnná IDKAPITOLY není nastavena pomocí parametru -v!");
    }
    if (TELOKAPITOLY == "") {
        ShoditFatalniVyjimku("Vyžadovaná proměnná TELOKAPITOLY není nastavena pomocí parametru -v!");
    }
    prikaz = "egrep '^[^\t]*\t" IDKAPITOLY "\t' soubory_prekladu/fragmenty.tsv";
    prikaz | getline zaznam;
    close(prikaz);

    if (zaznam != "") {
        split(zaznam, zaznam2, "\t");
        if (zaznam2[2] != IDKAPITOLY) {
            ShoditFatalniVyjimku("Interní chyba: id \"" zaznam2[2] "\" != \"" IDKAPITOLY "\"!");
        }
        ADRESAR = zaznam2[1];
        NAZEVKAPITOLY = zaznam2[3];
        if (zaznam2[4] != "NULL") {
            ID_PREDCHOZI = zaznam2[4];
            NAZEV_PREDCHOZI = zaznam2[5];
        } else {
            ID_PREDCHOZI = "";
            NAZEV_PREDCHOZI = "";
        }
        if (zaznam2[6] != "NULL") {
            ID_NASLEDUJICI = zaznam2[6];
            NAZEV_NASLEDUJICI = zaznam2[7];
        }
        CISLO_KAPITOLY = zaznam2[8];
    } else {
# kapitola, pro kterou neexistuje záznam, takže pravděpodobně nebude zapsána na výstup:
#       ShoditFatalniVyjimku("Nepodařilo se najít záznam o kapitole či dodatku " IDKAPITOLY ".md pomocí příkazu: {" prikaz "}!");
        EXISTUJE_KAPITOLA = !system("test -r kapitoly/" IDKAPITOLY ".md");
        EXISTUJE_DODATEK = !system("test -r dodatky/" IDKAPITOLY ".md");
        if (EXISTUJE_DODATEK == EXISTUJE_KAPITOLA) {
            ShoditFatalniVyjimku("ID \"" IDKAPITOLY "\": " (EXISTUJE_KAPITOLA ? "existuje kapitola i dodatek!" : "neexistuje ani kapitola ani dodatek!"));
        }
        ADRESAR = (EXISTUJE_KAPITOLA ? "kapitoly" : "dodatky");
        NAZEVKAPITOLY = "(Není na výstup)";
        ID_PREDCHOZI = "";
        NAZEV_PREDCHOZI = "";
        ID_NASLEDUJICI = "";
        NAZEV_NASLEDUJICI = "";
        CISLO_KAPITOLY = 0;
    }

    STAV_PODMINENENO_PREKLADU = 0;
    # 0 - mimo podmíněný blok
    # 1 - v podmíněném bloku, ale tiskne se
    # 2 - v podmíněném bloku, přeskakuje se
}

# Podmíněný překlad
# ====================================================
/^\{\{POKUD JE PRVNÍ\}\}$/ {
    if (STAV_PODMINENENO_PREKLADU != 0) {
        ShoditFatalniVyjimku("Chyba syntaxe: {{POKUD ...}} bez ukončení předchozího podmíněného bloku!");
    }
    STAV_PODMINENENO_PREKLADU = (ID_PREDCHOZI == "") ? 1 : 2;
}

/^\{\{POKUD NENÍ PRVNÍ\}\}$/ {
    if (STAV_PODMINENENO_PREKLADU != 0) {
        ShoditFatalniVyjimku("Chyba syntaxe: {{POKUD ...}} bez ukončení předchozího podmíněného bloku!");
    }
    STAV_PODMINENENO_PREKLADU = (ID_PREDCHOZI != "") ? 1 : 2;
}

/^\{\{POKUD JE POSLEDNÍ\}\}$/ {
    if (STAV_PODMINENENO_PREKLADU != 0) {
        ShoditFatalniVyjimku("Chyba syntaxe: {{POKUD ...}} bez ukončení předchozího podmíněného bloku!");
    }
    STAV_PODMINENENO_PREKLADU = (ID_NASLEDUJICI == "") ? 1 : 2;
}

/^\{\{POKUD NENÍ POSLEDNÍ\}\}$/ {
    if (STAV_PODMINENENO_PREKLADU != 0) {
        ShoditFatalniVyjimku("Chyba syntaxe: {{POKUD ...}} bez ukončení předchozího podmíněného bloku!");
    }
    STAV_PODMINENENO_PREKLADU = (ID_NASLEDUJICI != "") ? 1 : 2;
}

# správně zpracovat neznámé direktivy „{{POKUD}}“
/^\{\{POKUD .*\}\}$/ {
    if (STAV_PODMINENENO_PREKLADU == 0) {
        STAV_PODMINENENO_PREKLADU = 1;
        next;
    }
}

/^\{\{KONEC POKUD\}\}$/ {
    if (STAV_PODMINENENO_PREKLADU != 0) {
        STAV_PODMINENENO_PREKLADU = 0;
        next;
    } else {
        ShoditFatalniVyjimku("{{KONEC POKUD}} bez odpovídajícího začátku");
    }
}

STAV_PODMINENENO_PREKLADU == 2 {
    next;
}

{
    JE_RIDICI_RADEK = $0 ~ /^\{\{[^{}]+\}\}$/;
    VYTISKNOUT = 0;
}

/^\{\{ZAČÁTEK KAPITOLY\}\}$/,/^\{\{KONEC KAPITOLY\}\}$/ {
    VYTISKNOUT =  !JE_RIDICI_RADEK;
    switch ($0) {
        case "{{TĚLO KAPITOLY}}":
            system("cat '" TELOKAPITOLY "'");
            break;
    }
}

VYTISKNOUT {
    gsub(/\{\{NÁZEV KAPITOLY\}\}/, NAZEVKAPITOLY, $0);
    gsub(/\{\{PŘEDCHOZÍ ID\}\}/, ID_PREDCHOZI, $0);
    gsub(/\{\{PŘEDCHOZÍ NÁZEV\}\}/, NAZEV_PREDCHOZI, $0);
    gsub(/\{\{PŘEDCHOZÍ ČÍSLO\}\}/, ID_PREDCHOZI != "" ? CISLO_KAPITOLY - 1 : 0, $0);
    gsub(/\{\{NÁSLEDUJÍCÍ ID\}\}/, ID_NASLEDUJICI, $0);
    gsub(/\{\{NÁSLEDUJÍCÍ NÁZEV\}\}/, NAZEV_NASLEDUJICI, $0);
    gsub(/\{\{NÁSLEDUJÍCÍ ČÍSLO\}\}/, ID_NASLEDUJICI != "" ? CISLO_KAPITOLY + 1 : 0, $0);
    gsub(/\{\{ČÍSLO KAPITOLY\}\}/, CISLO_KAPITOLY, $0);
    print $0;
}

END {
    if (FATALNI_VYJIMKA) {
        exit FATALNI_VYJIMKA;
    }
}