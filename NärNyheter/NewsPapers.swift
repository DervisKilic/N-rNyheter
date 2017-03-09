//
//  NewsPapers.swift
//  NärNyheter
//
//  Created by Dervis Kilic on 06/03/17.
//  Copyright © 2017 Dervis Kilic. All rights reserved.
//

import Foundation

class NewsPapers: NSObject {
    /*
     Norrbotten
     Västerbotten
     Västernorrland
     Jämtland
     Gävleborg
     Dalarna
     Uppsala
     Västmanland
     Örebro
     Värmland
     Västra Götaland
     Östergötland
     Södermanland
     Stockholm
     Kronoberg
     Jönköping
     Kalmar
     Gotland
     Skåne
     Blekinge
     Halland
    */
   var newsPapers = ["Norrbotten": ["http://www.kuriren.nu/nyheter/#Norrbottens Kuriren","http://www.pt.se/nyheter/#Piteå-Tidningen","http://www.svt.se/nyheter/lokalt/norrbotten/#Svt Norrbotten","http://sverigesradio.se/norrbotten/#P4 Norrbotten","http://www.nsd.se/nyheter/#Norrländska Socialdemokraten"], "Västerbotten": ["http://www.vk.se/#Västerbottens-Kuriren","http://www.folkbladet.nu/#Folkbladet", "http://norran.se/#Norran","http://www.svt.se/nyheter/lokalt/vasterbotten/#Svt Västerbotten","http://sverigesradio.se/vasterbotten/#P4 Västerbotten"], "Västernorrland": ["http://www.allehanda.se/#Allehanda","http://www.st.nu/#Sundsvalls Tidning","http://www.svt.se/nyheter/lokalt/vasternorrland/#Svt Västernorrland","http://sverigesradio.se/vasternorrland/#P4 Västernorrland"], "Jämtland": ["http://www.ltz.se/#Länstidningen Östersund","http://jamtlandstidning.se/#Jämtlands Tidning","http://www.op.se/#Östersunds-Posten", "http://sverigesradio.se/jamtland#P4 Jämtland","http://www.svt.se/nyheter/lokalt/jamtland/#Svt Jämtland"],"Gävleborg": ["http://www.helahalsingland.se/#Hela Hälsingland","http://www.arbetarbladet.se/#Arbetarbladet","http://gastriklandstidning.se/kategori/nyheter/#Gästrikslans Tidning","http://www.gd.se/#Gefle Dagblad","http://www.svt.se/nyheter/lokalt/gavleborg/#Svt Gävleborg","http://sverigesradio.se/gavleborg/#P4 Gävleborg"], "Dalarna": ["http://www.dt.se/#Dalarnas Tidningar","http://www.dalademokraten.se/#Dalademokraten", "http://www.svt.se/nyheter/lokalt/dalarna/#Svt Dalarna","http://sverigesradio.se/dalarna/P4 Dalarna"], "Uppsala": ["http://www.unt.se/nyheter/#Upsala Nya Tidning","http://www.eposten.se/nyheter/#Enköpings-Posten","http://www.uppsalatidningen.se/start/#Uppsala Tidningen","http://www.uppsalanyheter.se/#Uppsalanyheter","http://www.svt.se/nyheter/lokalt/uppsala/#Svt Uppsala","http://sverigesradio.se/uppland/#P4 Uppland"], "Västmanland": ["http://www.vlt.se/#Vestmanlands Läns Tidning","http://vastmanlandsnyheter.se/kategori/nyheter/#Västmanlands Nyheter","http://www.salaallehanda.com/#Sala Allehanda","http://sverigesradio.se/vastmanland/#P4 Västmanland","http://www.svt.se/nyheter/lokalt/vastmanland/#Svt Västmanland"],"Örebro": ["http://www.na.se/#Nerikes Allehanda","http://www.orebroarn.se/#Örebroaren","http://orebrotribune.se/#Örebro Tribune","http://www.karlskogatidning.se/#Karlskoga Tidning","http://sverigesradio.se/orebro/#P4 Örebro","http://www.svt.se/nyheter/lokalt/orebro/#Svt Örebro"], "Värmland": ["http://nwt.se/#Nya Wermlands-Tidningen","http://www.vf.se/#Värmlands Folkblad","http://www.arvikanyheter.se/#Arvika Nyheter","http://nwt.se/filipstad/#Filipstads Tidning","http://nwt.se/kristinehamn/#Kristinehamns-Posten", "http://varmlandsbygden.se/#Värmlandsbygden","http://www.svt.se/nyheter/lokalt/varmland/#Svt Värmland","http://sverigesradio.se/varmland/#P4 Värmland"], "Västra Götaland": ["http://www.alingsaskuriren.se/#Alingsås Kuriren","http://www.alekuriren.se/#Alekuriren","http://www.bt.se/#Borås Tidning","http://www.gp.se/#Göteborgs Posten","http://www.expressen.se/gt/#Göteborgs-Tidningen","http://kungalvsposten.se/#Kungälvs Posten","http://www.molndalsposten.se/#Mölndals Posten","http://skaraborgsbygden.se/#Skaraborgsbygden","http://lokaltidningensto.se/#Lokaltidningen Stenungsund","http://www.ttela.se/#Trollhättans tidning","http://www.bohuslaningen.se/#Bohusläningen","http://www.ut.se/#Ulricehamns Tidnings","http://www.svt.se/nyheter/lokalt/vast/#Svt Väst","http://sverigesradio.se/goteborg/#P4 Göteborg","http://sverigesradio.se/vast/#P4 Väst"], "Östergötland": ["http://www.vimmerbytidning.se/#Vimmerby Tidning","http://www.corren.se/nyheter/#Östgöta Correspondenten","http://www.mvt.se/nyheter/#Motala Vadstena Tidning","http://www.folkbladet.se/nyheter/#Folkbladet","http://www.nt.se/nyheter/#Norrköpings Tidningar","http://sverigesradio.se/ostergotland/#P4 Östergötland","http://www.svt.se/nyheter/lokalt/ost/#Svt Öst"],"Södermanland": ["http://www.ekuriren.se/#Eskilstuna-Kuriren","http://www.ekuriren.se/nyheter/strangnas/#Strengnäs Tidning","http://www.kkuriren.se/#Katrineholms-Kuriren","http://sormlandsbygden.se/kategori/nyheter/#Sörmlandsbygden","http://www.sn.se/#Södermanlands Nyheter","http://www.svt.se/nyheter/lokalt/sormland/#Svt Sörmland","http://sverigesradio.se/sormland/#P4 Sörmland",], "Stockholm": ["http://www.lt.nu/#Lidingö Tidning","http://www.nvp.se/#Nacka Värmdö Posten", "http://www.norrteljetidning.se/#Norrtelje Tidning", "http://www.nynashamnsposten.se/#Nynäshamns Posten", "http://www.lt.se/#Länstidningen","http://www.unt.se/sigtunabygden/#Sigtunabygden","http://8sidor.se/#8 Sidor","http://www.aip.nu/#Aktuellt i Politiken","http://www.dagen.se/#Dagen","https://www.svd.se/#Svenska Dagbladet","http://www.stockholmsfria.se/#Stockholms Fria","https://mitti.se/#Mitti Stockholm","http://www.aftonbladet.se/#Aftonbladet","http://www.expressen.se/#Expressen","http://sverigesradio.se/stockholm/#P4 Stockholm","http://www.svt.se/nyheter/lokalt/stockholm/#Svt Stockholm"], "Kronoberg": ["http://www.smp.se/#Smålandsposten","http://www.vaxjobladet.se/#Växjöbladet","http://www.svt.se/nyheter/lokalt/smaland/#Svt Småland","http://sverigesradio.se/kronoberg/#P4 Kronoberg"], "Jönköping": ["http://www.jp.se/#önköpings-Posten", "http://www.tranas-posten.se/#Tranås-Posten","http://www.vn.se/#Värnamo Nyheter","http://www.svt.se/nyheter/lokalt/jonkoping/#Svt Jönköping","http://sverigesradio.se/jonkoping/#P4 Jönköping"],"Kalmar": ["http://mobil.sverigesradio.se/kalmar/#P4 Kalmar","http://mobil.svt.se/nyheter/lokalt/smaland/#Svt Småland","http://www.olandsbladet.se/#Ölandsbladet","http://www.barometern.se/#Barometern","http://www.ostrasmaland.se/#Östra Småland","http://www.vimmerbytidning.se/#Vimmerby Tidning","http://mobil.vt.se/nyheter/#Västerviks-Tidning"], "Gotland": ["http://www.svt.se/nyheter/lokalt/ost/","http://sverigesradio.se/gotland/", "http://www.helagotland.se/start/"], "Skåne": ["http://www.nsk.se/","http://www.hd.se/","http://www.kristianstadsbladet.se/","http://lokaltidningen.se/","http://www.expressen.se/kvallsposten/","http://www.skd.se/","http://www.sydsvenskan.se/","http://www.trelleborgsallehanda.se/","http://www.ystadsallehanda.se/","http://sverigesradio.se/malmo/","http://www.svt.se/nyheter/lokalt/skane/"], "Blekinge": ["http://www.blt.se/","http://www.sydostran.se/","http://www.svt.se/nyheter/lokalt/blekinge/","http://sverigesradio.se/blekinge/"],"Halland": ["http://www.svt.se/nyheter/lokalt/halland/","http://sverigesradio.se/halland/","http://www.hn.se/","http://www.hallandsposten.se/","http://norrahalland.se/","http://www.laholmstidning.se/"]]
}









