//
//  NewsPapers.swift
//  NärNyheter
//
//  Created by Dervis Kilic on 06/03/17.
//  Copyright © 2017 Dervis Kilic. All rights reserved.
//

import Foundation

class NewsPapers: NSObject {
    var favs = [String:Any]()
    var favArray: [Dictionary<String,Any>] = []
    let defaults = UserDefaults.standard

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
 
    
    init(name: String = "", link: String = "", logo: String = "", isFav: Bool = false){
        
        if let favorites = defaults.array(forKey: "favorites") as? [Dictionary<String, Any>] {
            favArray = favorites
            
            if isFav{
                favs = ["name": name,"link": link,"logo": logo]
                favArray.append(favs)
                
            }else{
            
                favArray = favArray.filter { ($0["name"] as! String) != (name)}
            }
        }
        
        UserDefaults.standard.set(favArray, forKey: "favorites")
        UserDefaults.standard.synchronize()
    }
    
    
    var newsPapers = ["Norrbotten": ["http://www.kuriren.nu/nyheter/#Norrbottens Kuriren","http://www.pt.se/nyheter/#Piteå-Tidningen","http://www.svt.se/nyheter/lokalt/norrbotten/#Svt Norrbotten","http://sverigesradio.se/norrbotten/#P4 Norrbotten","http://www.nsd.se/nyheter/#Norrländska Socialdemokraten"], "Västerbotten": ["http://www.vk.se/#Västerbottens-Kuriren","http://www.folkbladet.nu/#Folkbladet", "http://norran.se/#Norran","http://www.svt.se/nyheter/lokalt/vasterbotten/#Svt Västerbotten","http://sverigesradio.se/vasterbotten/#P4 Västerbotten"], "Västernorrland": ["http://www.allehanda.se/#Allehanda","http://www.st.nu/#Sundsvalls Tidning","http://www.svt.se/nyheter/lokalt/vasternorrland/#Svt Västernorrland","http://sverigesradio.se/vasternorrland/#P4 Västernorrland"], "Jämtland": ["http://www.ltz.se/#Länstidningen Östersund","http://jamtlandstidning.se/#Jämtlands Tidning","http://www.op.se/#Östersunds-Posten", "http://sverigesradio.se/jamtland#P4 Jämtland","http://www.svt.se/nyheter/lokalt/jamtland/#Svt Jämtland"],"Gävleborg": ["http://www.helahalsingland.se/#Hela Hälsingland","http://www.arbetarbladet.se/#Arbetarbladet","http://gastriklandstidning.se/kategori/nyheter/#Gästrikslans Tidning","http://www.gd.se/#Gefle Dagblad","http://www.svt.se/nyheter/lokalt/gavleborg/#Svt Gävleborg","http://sverigesradio.se/gavleborg/#P4 Gävleborg"], "Dalarna": ["http://www.dt.se/#Dalarnas Tidningar","http://www.dalademokraten.se/#Dalademokraten", "http://www.svt.se/nyheter/lokalt/dalarna/#Svt Dalarna","http://sverigesradio.se/dalarna/P4 Dalarna"], "Uppsala": ["http://mobil.unt.se/nyheter/#Upsala Nya Tidning","http://www.eposten.se/nyheter/#Enköpings-Posten","http://www.uppsalatidningen.se/start/#Uppsala Tidningen","http://www.uppsalanyheter.se/#Uppsalanyheter","http://www.svt.se/nyheter/lokalt/uppsala/#Svt Uppsala","http://sverigesradio.se/uppland/#P4 Uppland"], "Västmanland": ["http://www.vlt.se/#Vestmanlands Läns Tidning","http://vastmanlandsnyheter.se/kategori/nyheter/#Västmanlands Nyheter","http://www.salaallehanda.com/#Sala Allehanda","http://sverigesradio.se/vastmanland/#P4 Västmanland","http://www.svt.se/nyheter/lokalt/vastmanland/#Svt Västmanland"],"Örebro": ["http://www.na.se/#Nerikes Allehanda","http://www.orebroarn.se/#Örebroaren","http://orebrotribune.se/#Örebro Tribune","http://www.karlskogatidning.se/#Karlskoga Tidning","http://sverigesradio.se/orebro/#P4 Örebro","http://www.svt.se/nyheter/lokalt/orebro/#Svt Örebro"], "Värmland": ["http://nwt.se/#Nya Wermlands-Tidningen","http://www.vf.se/#Värmlands Folkblad","http://www.arvikanyheter.se/#Arvika Nyheter","http://nwt.se/filipstad/#Filipstads Tidning","http://nwt.se/kristinehamn/#Kristinehamns-Posten", "http://varmlandsbygden.se/#Värmlandsbygden","http://www.svt.se/nyheter/lokalt/varmland/#Svt Värmland","http://sverigesradio.se/varmland/#P4 Värmland"], "Västra Götaland": ["gp-logo#http://www.alingsaskuriren.se/#Alingsås Kuriren","gp-logo#http://www.alekuriren.se/#Alekuriren","gp-logo#http://www.bt.se/#Borås Tidning","gp-logo#http://www.gp.se/#Göteborgs Posten","gp-logo#http://www.expressen.se/gt/#Göteborgs-Tidningen","gp-logo#http://kungalvsposten.se/#Kungälvs Posten","gp-logo#http://www.molndalsposten.se/#Mölndals Posten","gp-logo#http://skaraborgsbygden.se/#Skaraborgsbygden","gp-logo#http://lokaltidningensto.se/#Lokaltidningen Stenungsund","gp-logo#http://www.ttela.se/#Trollhättans tidning","gp-logo#http://www.bohuslaningen.se/#Bohusläningen","gp-logo#http://www.ut.se/#Ulricehamns Tidnings","gp-logo#http://www.svt.se/nyheter/lokalt/vast/#Svt Väst","gp-logo#http://sverigesradio.se/goteborg/#P4 Göteborg","gp-logo#http://sverigesradio.se/vast/#P4 Väst"], "Östergötland": ["http://www.vimmerbytidning.se/#Vimmerby Tidning","http://www.corren.se/nyheter/#Östgöta Correspondenten","http://www.mvt.se/nyheter/#Motala Vadstena Tidning","http://www.folkbladet.se/nyheter/#Folkbladet","http://www.nt.se/nyheter/#Norrköpings Tidningar","http://sverigesradio.se/ostergotland/#P4 Östergötland","http://www.svt.se/nyheter/lokalt/ost/#Svt Öst"],"Södermanland": ["gp-logo#http://www.ekuriren.se/#Eskilstuna-Kuriren","gp-logo#http://www.ekuriren.se/nyheter/strangnas/#Strengnäs Tidning","gp-logo#http://www.kkuriren.se/#Katrineholms-Kuriren","gp-logo#http://sormlandsbygden.se/kategori/nyheter/#Sörmlandsbygden","gp-logo#http://www.sn.se/#Södermanlands Nyheter","gp-logo#http://www.svt.se/nyheter/lokalt/sormland/#Svt Sörmland","gp-logo#http://sverigesradio.se/sormland/#P4 Sörmland",], "Stockholm": ["gp-logo#http://www.nvp.se/#Nacka Värmdö Posten", "gp-logo#http://www.norrteljetidning.se/#Norrtelje Tidning", "gp-logo#http://www.nynashamnsposten.se/#Nynäshamns Posten", "gp-logo#http://www.lt.se/#Länstidningen","gp-logo#http://mobil.unt.se/nyheter/sigtuna/#Sigtunabygden","gp-logo#http://8sidor.se/#8 Sidor","gp-logo#http://www.aip.nu/#Aktuellt i Politiken","gp-logo#http://www.dagen.se/#Dagen","gp-logo#https://www.svd.se/#Svenska Dagbladet","gp-logo#http://www.stockholmsfria.se/#Stockholms Fria","gp-logo#https://mitti.se/#Mitti Stockholm","gp-logo#http://www.aftonbladet.se/#Aftonbladet","gp-logo#http://www.expressen.se/#Expressen","gp-logo#http://sverigesradio.se/stockholm/#P4 Stockholm","gp-logo#http://www.svt.se/nyheter/lokalt/stockholm/#Svt Stockholm"], "Kronoberg": ["http://www.smp.se/#Smålandsposten","http://www.vaxjobladet.se/#Växjöbladet","http://www.svt.se/nyheter/lokalt/smaland/#Svt Småland","http://sverigesradio.se/kronoberg/#P4 Kronoberg"], "Jönköping": ["http://www.jp.se/#önköpings-Posten", "http://www.tranas-posten.se/#Tranås-Posten","http://www.vn.se/#Värnamo Nyheter","http://www.svt.se/nyheter/lokalt/jonkoping/#Svt Jönköping","http://sverigesradio.se/jonkoping/#P4 Jönköping"],"Kalmar": ["http://mobil.sverigesradio.se/kalmar/#P4 Kalmar","http://mobil.svt.se/nyheter/lokalt/smaland/#Svt Småland","http://www.olandsbladet.se/#Ölandsbladet","http://www.barometern.se/#Barometern","http://www.ostrasmaland.se/#Östra Småland","http://www.vimmerbytidning.se/#Vimmerby Tidning","http://mobil.vt.se/nyheter/#Västerviks-Tidning"], "Gotland": ["http://www.svt.se/nyheter/lokalt/ost/#Svt Öst","http://sverigesradio.se/gotland/#P4 Gotland", "http://www.helagotland.se/start/#Hela Gotland"], "Skåne": ["http://www.nsk.se/#Norra Skåne","http://www.hd.se/#Helsingborgs Dagblad","http://www.kristianstadsbladet.se/#Kristianstadsbladet","http://lokaltidningen.se/#Lokaltidningen","http://www.expressen.se/kvallsposten/#Kvällsposten","http://www.skd.se/#Skånskan","http://www.sydsvenskan.se/#Sydsvenskan","http://www.trelleborgsallehanda.se/#Trelleborgs Allehanda","http://www.ystadsallehanda.se/#Ystads Allehand","http://sverigesradio.se/malmo/#P4 Malmöhus","http://www.svt.se/nyheter/lokalt/skane/#Svt Skåne"], "Blekinge": ["Bltlogo#http://www.blt.se/#Blekinge Läns Tidning","sydostran#http://www.sydostran.se/#Sydöstran","svt-logga#http://www.svt.se/nyheter/lokalt/blekinge/#Svt Blekinge","p4logo#http://sverigesradio.se/blekinge/#P4 Blekinge"],"Halland": ["http://www.svt.se/nyheter/lokalt/halland/#Svt Halland","http://sverigesradio.se/halland/#P4 Halland","http://www.hn.se/#Hallands Nyheter","http://www.hallandsposten.se/#Hallandsposten","http://norrahalland.se/#Norra Halland","http://www.laholmstidning.se/#Laholms Tidning"]]
    
}









