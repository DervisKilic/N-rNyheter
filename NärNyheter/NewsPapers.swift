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
    
    
    var newsPapers = ["Norrbotten": ["gp-logo#kuriren.nu/nyheter#Norrbottens-Kuriren","gp-logo#pt.se/nyheter/#Piteå-Tidningen","gp-logo#svt.se/nyheter/lokalt/norrbotten/#Svt Norrbotten","gp-logo#sverigesradio.se/norrbotten/#P4 Norrbotten","gp-logo#nsd.se/nyheter/#Norrländska Socialdemokraten"], "Västerbotten": ["vk.se/#Västerbottens-Kuriren","folkbladet.nu/#Folkbladet", "http://norran.se/#Norran","svt.se/nyheter/lokalt/vasterbotten/#Svt Västerbotten","http://sverigesradio.se/vasterbotten/#P4 Västerbotten"], "Västernorrland": ["allehanda.se/#Allehanda","st.nu/#Sundsvalls Tidning","svt.se/nyheter/lokalt/vasternorrland/#Svt Västernorrland","http://sverigesradio.se/vasternorrland/#P4 Västernorrland"], "Jämtland": ["ltz.se/#Länstidningen Östersund","http://jamtlandstidning.se/#Jämtlands Tidning","op.se/#Östersunds-Posten", "http://sverigesradio.se/jamtland#P4 Jämtland","svt.se/nyheter/lokalt/jamtland/#Svt Jämtland"],"Gävleborg": ["helahalsingland.se/#Hela Hälsingland","arbetarbladet.se/#Arbetarbladet","http://gastriklandstidning.se/kategori/nyheter/#Gästrikslans Tidning","gd.se/#Gefle Dagblad","svt.se/nyheter/lokalt/gavleborg/#Svt Gävleborg","http://sverigesradio.se/gavleborg/#P4 Gävleborg"], "Dalarna": ["dt.se/#Dalarnas Tidningar","dalademokraten.se/#Dalademokraten", "svt.se/nyheter/lokalt/dalarna/#Svt Dalarna","http://sverigesradio.se/dalarna/P4 Dalarna"], "Uppsala": ["http://mobil.unt.se/nyheter/#Upsala Nya Tidning","eposten.se/nyheter/#Enköpings-Posten","uppsalatidningen.se/start/#Uppsala Tidningen","uppsalanyheter.se/#Uppsalanyheter","svt.se/nyheter/lokalt/uppsala/#Svt Uppsala","http://sverigesradio.se/uppland/#P4 Uppland"], "Västmanland": ["vlt.se/#Vestmanlands Läns Tidning","http://vastmanlandsnyheter.se/kategori/nyheter/#Västmanlands Nyheter","salaallehanda.com/#Sala Allehanda","http://sverigesradio.se/vastmanland/#P4 Västmanland","svt.se/nyheter/lokalt/vastmanland/#Svt Västmanland"],"Örebro": ["na.se/#Nerikes Allehanda","orebroarn.se/#Örebroaren","http://orebrotribune.se/#Örebro Tribune","karlskogatidning.se/#Karlskoga Tidning","http://sverigesradio.se/orebro/#P4 Örebro","svt.se/nyheter/lokalt/orebro/#Svt Örebro"], "Värmland": ["http://nwt.se/#Nya Wermlands-Tidningen","vf.se/#Värmlands Folkblad","arvikanyheter.se/#Arvika Nyheter","http://nwt.se/filipstad/#Filipstads Tidning","http://nwt.se/kristinehamn/#Kristinehamns-Posten", "http://varmlandsbygden.se/#Värmlandsbygden","svt.se/nyheter/lokalt/varmland/#Svt Värmland","http://sverigesradio.se/varmland/#P4 Värmland"], "Västra Götaland": ["gp-logo#alingsaskuriren.se/#Alingsås Kuriren","gp-logo#alekuriren.se/#Alekuriren","gp-logo#bt.se/#Borås Tidning","gp-logo#gp.se/#Göteborgs Posten","gp-logo#expressen.se/gt/#Göteborgs-Tidningen","gp-logo#http://kungalvsposten.se/#Kungälvs Posten","gp-logo#molndalsposten.se/#Mölndals Posten","gp-logo#http://skaraborgsbygden.se/#Skaraborgsbygden","gp-logo#http://lokaltidningensto.se/#Lokaltidningen Stenungsund","gp-logo#ttela.se/#Trollhättans tidning","gp-logo#bohuslaningen.se/#Bohusläningen","gp-logo#ut.se/#Ulricehamns Tidnings","gp-logo#svt.se/nyheter/lokalt/vast/#Svt Väst","gp-logo#http://sverigesradio.se/goteborg/#P4 Göteborg","gp-logo#http://sverigesradio.se/vast/#P4 Väst"], "Östergötland": ["vimmerbytidning.se/#Vimmerby Tidning","corren.se/nyheter/#Östgöta Correspondenten","mvt.se/nyheter/#Motala Vadstena Tidning","folkbladet.se/nyheter/#Folkbladet","nt.se/nyheter/#Norrköpings Tidningar","http://sverigesradio.se/ostergotland/#P4 Östergötland","svt.se/nyheter/lokalt/ost/#Svt Öst"],"Södermanland": ["gp-logo#ekuriren.se/#Eskilstuna-Kuriren","gp-logo#ekuriren.se/nyheter/strangnas/#Strengnäs Tidning","gp-logo#kkuriren.se/#Katrineholms-Kuriren","gp-logo#http://sormlandsbygden.se/kategori/nyheter/#Sörmlandsbygden","gp-logo#sn.se/#Södermanlands Nyheter","gp-logo#svt.se/nyheter/lokalt/sormland/#Svt Sörmland","gp-logo#http://sverigesradio.se/sormland/#P4 Sörmland",], "Stockholm": ["gp-logo#nvp.se/#Nacka Värmdö Posten", "gp-logo#norrteljetidning.se/#Norrtelje Tidning", "gp-logo#nynashamnsposten.se/#Nynäshamns Posten", "gp-logo#lt.se/#Länstidningen","gp-logo#http://mobil.unt.se/nyheter/sigtuna/#Sigtunabygden","gp-logo#http://8sidor.se/#8 Sidor","gp-logo#aip.nu/#Aktuellt i Politiken","gp-logo#dagen.se/#Dagen","gp-logo#https://www.svd.se/#Svenska Dagbladet","gp-logo#stockholmsfria.se/#Stockholms Fria","gp-logo#https://mitti.se/#Mitti Stockholm","gp-logo#aftonbladet.se/#Aftonbladet","gp-logo#expressen.se/#Expressen","gp-logo#http://sverigesradio.se/stockholm/#P4 Stockholm","gp-logo#svt.se/nyheter/lokalt/stockholm/#Svt Stockholm"], "Kronoberg": ["smp.se/#Smålandsposten","vaxjobladet.se/#Växjöbladet","svt.se/nyheter/lokalt/smaland/#Svt Småland","http://sverigesradio.se/kronoberg/#P4 Kronoberg"], "Jönköping": ["jp.se/#önköpings-Posten", "tranas-posten.se/#Tranås-Posten","vn.se/#Värnamo Nyheter","svt.se/nyheter/lokalt/jonkoping/#Svt Jönköping","http://sverigesradio.se/jonkoping/#P4 Jönköping"],"Kalmar": ["http://mobil.sverigesradio.se/kalmar/#P4 Kalmar","http://mobil.svt.se/nyheter/lokalt/smaland/#Svt Småland","olandsbladet.se/#Ölandsbladet","barometern.se/#Barometern","ostrasmaland.se/#Östra Småland","vimmerbytidning.se/#Vimmerby Tidning","http://mobil.vt.se/nyheter/#Västerviks-Tidning"], "Gotland": ["svt.se/nyheter/lokalt/ost/#Svt Öst","http://sverigesradio.se/gotland/#P4 Gotland", "helagotland.se/start/#Hela Gotland"], "Skåne": ["nsk.se/#Norra Skåne","hd.se/#Helsingborgs Dagblad","kristianstadsbladet.se/#Kristianstadsbladet","http://lokaltidningen.se/#Lokaltidningen","expressen.se/kvallsposten/#Kvällsposten","skd.se/#Skånskan","sydsvenskan.se/#Sydsvenskan","trelleborgsallehanda.se/#Trelleborgs Allehanda","ystadsallehanda.se/#Ystads Allehand","http://sverigesradio.se/malmo/#P4 Malmöhus","svt.se/nyheter/lokalt/skane/#Svt Skåne"], "Blekinge": ["Bltlogo#blt.se/#Blekinge Läns Tidning","sydostran#sydostran.se/#Sydöstran","svt-logga#svt.se/nyheter/lokalt/blekinge/#Svt Blekinge","p4logo#http://sverigesradio.se/blekinge/#P4 Blekinge"],"Halland": ["svt.se/nyheter/lokalt/halland/#Svt Halland","http://sverigesradio.se/halland/#P4 Halland","hn.se/#Hallands Nyheter","hallandsposten.se/#Hallandsposten","http://norrahalland.se/#Norra Halland","laholmstidning.se/#Laholms Tidning"]]
    
}









