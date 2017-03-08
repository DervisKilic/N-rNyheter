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
   var newsPapers = ["Norrbotten": ["http://www.kuriren.nu/nyheter/","http://www.pt.se/nyheter/","http://www.svt.se/nyheter/lokalt/norrbotten/","http://sverigesradio.se/norrbotten/","http://www.nsd.se/nyheter/"], "Västerbotten": ["http://www.vk.se/","http://www.folkbladet.nu/", "http://norran.se/","http://www.svt.se/nyheter/lokalt/vasterbotten/","http://sverigesradio.se/vasterbotten/"], "Västernorrland": ["http://www.allehanda.se/","http://www.st.nu/","http://www.svt.se/nyheter/lokalt/vasternorrland/","http://sverigesradio.se/vasterbotten/"], "Jämtland": ["http://www.ltz.se/","http://jamtlandstidning.se/","http://www.op.se/", "http://sverigesradio.se/jamtland","http://www.svt.se/nyheter/lokalt/jamtland/"],"Gävleborg": ["http://www.helahalsingland.se/","http://www.arbetarbladet.se/","http://gastriklandstidning.se/kategori/nyheter/","http://www.gd.se/","http://www.helahalsingland.se/","http://www.svt.se/nyheter/lokalt/gavleborg/","http://sverigesradio.se/gavleborg/"], "Dalarna": ["http://www.dt.se/","http://www.dalademokraten.se/", "http://www.svt.se/nyheter/lokalt/dalarna/","http://sverigesradio.se/dalarna/"], "Uppsala": ["http://www.unt.se/nyheter/","http://www.uppsalatidningen.se/start/","http://www.uppsalanyheter.se/","http://www.svt.se/nyheter/lokalt/uppsala/","http://sverigesradio.se/uppland/"], "Västmanland": ["http://www.vlt.se/","http://vastmanlandsnyheter.se/kategori/nyheter/","http://sverigesradio.se/vastmanland/","http://www.svt.se/nyheter/lokalt/vastmanland/"],"Örebro": ["http://www.na.se/","http://www.orebroarn.se/","http://orebrotribune.se/","http://sverigesradio.se/orebro/","http://www.svt.se/nyheter/lokalt/orebro/"], "Värmland": ["http://nwt.se/","http://www.vf.se/", "http://varmlandsbygden.se/","http://www.svt.se/nyheter/lokalt/varmland/","http://sverigesradio.se/varmland/"], "Västra Götaland": ["http://www.alingsaskuriren.se/","http://www.alekuriren.se/","http://www.bt.se/","http://www.gp.se/","http://www.expressen.se/gt/","http://kungalvsposten.se/","http://www.molndalsposten.se/","http://skaraborgsbygden.se/","http://lokaltidningensto.se/","http://www.ttela.se/","http://www.bohuslaningen.se/","http://www.ut.se/","http://www.svt.se/nyheter/lokalt/vast/","http://sverigesradio.se/goteborg/","http://sverigesradio.se/vast/"], "Östergötland": ["http://www.vimmerbytidning.se/","http://www.corren.se/nyheter/","http://www.mvt.se/nyheter/","http://www.folkbladet.se/nyheter/","http://www.nt.se/nyheter/","http://sverigesradio.se/ostergotland/","http://www.svt.se/nyheter/lokalt/ost/"],"Södermanland": ["http://www.ekuriren.se/","http://www.kkuriren.se/","http://sormlandsbygden.se/kategori/nyheter/","http://www.sn.se/","http://www.svt.se/nyheter/lokalt/sormland/","http://sverigesradio.se/sormland/",], "Stockholm": ["http://www.lt.nu/","http://www.nvp.se/", "2http://www.norrteljetidning.se/", "http://www.nynashamnsposten.se/", "http://www.lt.se/","http://www.unt.se/sigtunabygden/","http://8sidor.se/","http://www.aip.nu/","http://www.dagen.se/","http://blogg.sydsvenskan.se/city/","http://www.stockholmsfria.se/","https://mitti.se/omrade/taby/","https://mitti.se/","https://www.svd.se/","http://www.aftonbladet.se/","http://www.expressen.se/","http://sverigesradio.se/stockholm/","http://www.svt.se/nyheter/lokalt/stockholm/"], "Kronoberg": ["http://www.smp.se/","http://www.vaxjobladet.se/","http://www.svt.se/nyheter/lokalt/smaland/","http://sverigesradio.se/kronoberg/"], "Jönköping": ["http://www.jp.se/", "http://www.tranas-posten.se/","http://www.vn.se/","http://www.svt.se/nyheter/lokalt/jonkoping/","http://sverigesradio.se/jonkoping/"],"Kalmar": ["http://sverigesradio.se/kalmar/","http://www.svt.se/nyheter/lokalt/smaland/","http://www.olandsbladet.se/","http://www.barometern.se/","http://www.ostrasmaland.se/","http://www.vimmerbytidning.se/","http://www.vt.se/nyheter/"], "Gotland": ["http://www.svt.se/nyheter/lokalt/ost/","http://sverigesradio.se/gotland/", "http://www.helagotland.se/start/"], "Skåne": ["http://www.nsk.se/","http://www.hd.se/","http://www.kristianstadsbladet.se/","http://lokaltidningen.se/","http://www.expressen.se/kvallsposten/","http://www.skd.se/","http://www.sydsvenskan.se/","http://www.trelleborgsallehanda.se/","http://www.ystadsallehanda.se/","http://sverigesradio.se/malmo/","http://www.svt.se/nyheter/lokalt/skane/"], "Blekinge": ["http://www.blt.se/","http://www.sydostran.se/","http://www.svt.se/nyheter/lokalt/blekinge/","http://sverigesradio.se/blekinge/"],"Halland": ["http://www.svt.se/nyheter/lokalt/halland/","http://sverigesradio.se/halland/","http://www.hn.se/","http://www.hallandsposten.se/","http://norrahalland.se/","http://www.laholmstidning.se/"]]
}









