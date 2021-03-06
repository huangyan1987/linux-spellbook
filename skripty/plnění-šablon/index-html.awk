# Linux Kniha kouzel, skript plnění-šablon/index-html.awk
# Copyright (c) 2019, 2020 Singularis <singularis@volny.cz>
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

# POŽADAVKY
# ============================================================================
BEGIN {
    VyzadujeFragmentyTSV();
    VyzadujePromennou("DATUMSESTAVENI");
    VyzadujePromennou("JMENOVERZE");
}

# VEŘEJNÉ FUNKCE
# ============================================================================
function Zacatek() {
    if (IDFORMATU == "") {IDFORMATU = "html"}
    datum = sprintf("%d. %s %s", substr(DATUMSESTAVENI, 7, 2), MesicVDruhemPade(sprintf("%d", substr(DATUMSESTAVENI, 5, 2))), substr(DATUMSESTAVENI, 1, 4));

    predevsim_pro = ZjistitPredevsimPro(JMENOVERZE);
    pocet = NacistFragmentyTSV(FRAGMENTY_TSV);
    for (i = 1; i <= pocet; ++i) {vycleneno[i] = 0}
    return 0;
}

function Pokud(podminka) {
    if (podminka == "ZNÁME PŘEDEVŠÍM PRO") {
        return predevsim_pro != "";
    } else if (podminka == "MÁ VERZE JMÉNO") {
        return ZjistitJmenoVerze(JMENOVERZE) != "";
    } else {
        ShoditFatalniVyjimku("Neznámá direktiva {{POKUD " podminka "}}!");
    }
}

function RidiciRadek(text,   i, s) {
    s = text;
    if (sub(/^VYČLENIT SEM PODLE ID:/, "", s) && s !~ /^$|\}/) {
        if ("id/" s in FRAGMENTY) {
            VypsatOdkazNaKapitolu(FRAGMENTY["id/" s], 1);
        }
        return 0;
    }

    s = text;
    if (sub(/^VYČLENIT SEM PODLE ŠTÍTKU:/, "", s) && s !~ /^$|\}/) {
        for (i = 1; i <= pocet; ++i) {
            if (index(FRAGMENTY[i "/stitky"], "{" s "}")) {VypsatOdkazNaKapitolu(i, 1)}
        }
        return 0;
    }

    switch (text) {
        case "VYPSAT ZBYTEK PO VYČLENĚNÍ":
            for (i = 1; i <= pocet; ++i) {
                if (!vycleneno[i]) {VypsatOdkazNaKapitolu(i, 1)}
            }
            return 0;

        case "VYPSAT ZBYTEK KAPITOL":
            for (i = 1; i <= pocet; ++i) {
                if (!vycleneno[i] && FRAGMENTY[i "/adr"] == "kapitoly") {VypsatOdkazNaKapitolu(i, 1)}
            }
            return 0;

        case "VYPSAT ZBYTEK DODATKŮ":
            for (i = 1; i <= pocet; ++i) {
                if (!vycleneno[i] && FRAGMENTY[i "/adr"] == "dodatky") {VypsatOdkazNaKapitolu(i, 1)}
            }
            return 0;

        case "VYPSAT PRÉMIOVÉ KAPITOLY":
            system("sed -E 's/^[^\t]*\t/<div>/;s/(\t.*)?$/<\\/div>/' \"${SOUBORY_PREKLADU}/prémiové-kapitoly.tsv\"");
            return 0;

        default:
            return RidiciRadekSpolecnaObsluha(text);
    }
}

function PrelozitVystup(radek) {
    #gsub(/\{\{JMÉNO VERZE\}\}/, OdzvlastnitKNahrade(JMENOVERZE), radek);
    gsub(/\{\{DATUM SESTAVENÍ\}\}/, datum, radek);
    gsub(/\{\{DATUMSESTAVENÍ\}\}/, DATUMSESTAVENI, radek);
    gsub(/\{\{JMÉNO VERZE\}\}/, OdzvlastnitKNahrade(ZjistitJmenoVerze(JMENOVERZE)), radek);
    gsub(/\{\{OZNAČENÍ VERZE\}\}/, OdzvlastnitKNahrade(ZjistitOznaceniVerze(JMENOVERZE)), radek);
    gsub(/\{\{OZNAČENÍ VERZE S INICIÁLAMI\}\}/, OdzvlastnitKNahrade(ZjistitOznaceniVerze(JMENOVERZE, 1)), radek);
    gsub(/\{\{PŘEDEVŠÍM PRO\}\}/, OdzvlastnitKNahrade(predevsim_pro), radek);

    return radek;
}

function Konec() {
    return 0;
}
# ============================================================================

# Soukromé funkce a proměnné:
# ============================================================================

function VypsatOdkazNaKapitolu(i, vyclenit) {
    if (!(i in FRAGMENTY)) {ShoditFatalniVyjimku("Nemohu vypsat odkaz na kapitolu číslo " i "!")}

    print "<div><a href=\"" OmezitNazev(FRAGMENTY[i "/id"]) ".htm\"><span class=\"cislo\">" i \
        "</span> <span class=\"ikona\"><img src=\"obrazky/" OmezitNazev(FRAGMENTY[i "/ikkap"], 1) "\" alt=\"\"></span>" \
        "<span class=\"nazev\">" FRAGMENTY[i "/nazev"] "</span></a></div>";
    if (vyclenit) {vycleneno[i] = 1}
    return 0;
}

# ============================================================================
@include "skripty/plnění-šablon/hlavní.awk"
