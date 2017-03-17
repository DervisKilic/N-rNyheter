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
    
    
    var newsPapers = ["Norrbotten": ["NBKuriren#kuriren.nu/nyheter/#Norrbottens-Kuriren","PTlogo#pt.se/nyheter/#Piteå-Tidningen","svt-logga#svt.se/nyheter/lokalt#Svt Norrbotten","p4logo#sverigesradio.se/norrbotten/#P4 Norrbotten","gp-logo#nsd.se/nyheter/#Norrländska Socialdemokraten"], "Västerbotten": ["vk.se/#Västerbottens-Kuriren","folkbladet.nu/#Folkbladet", "norran.se/#Norran","svt-logga#svt.se/nyheter/lokalt#Svt Västerbotten","p4logo#sverigesradio.se/vasterbotten/#P4 Västerbotten"], "Västernorrland": ["allehanda.se/#Allehanda","st.nu/#Sundsvalls Tidning","svt-logga#svt.se/nyheter/lokalt#Svt Västernorrland","p4logo#sverigesradio.se/vasternorrland/#P4 Västernorrland"], "Jämtland": ["ltz.se/#Länstidningen Östersund","jamtlandstidning.se/#Jämtlands Tidning","op.se/#Östersunds-Posten", "p4logo#sverigesradio.se/jamtland#P4 Jämtland","svt-logga#svt.se/nyheter/lokalt#Svt Jämtland"],"Gävleborg": ["helahalsingland.se/#Hela Hälsingland","arbetarbladet.se/#Arbetarbladet","gastriklandstidning.se/kategori/nyheter/#Gästrikslans Tidning","gd.se/#Gefle Dagblad","svt-logga#svt.se/nyheter/lokalt#Svt Gävleborg","p4logo#sverigesradio.se/gavleborg/#P4 Gävleborg"], "Dalarna": ["dt.se/#Dalarnas Tidningar","dalademokraten.se/#Dalademokraten", "svt-logga#svt.se/nyheter/lokalt#Svt Dalarna","p4logo#sverigesradio.se/dalarna/P4 Dalarna"], "Uppsala": ["mobil.unt.se/nyheter/#Upsala Nya Tidning","eposten.se/nyheter/#Enköpings-Posten","uppsalatidningen.se/start/#Uppsala Tidningen","uppsalanyheter.se/#Uppsalanyheter","svt-logga#svt.se/nyheter/lokalt#Svt Uppsala","p4logo#sverigesradio.se/uppland/#P4 Uppland"], "Västmanland": ["vlt.se/#Vestmanlands Läns Tidning","vastmanlandsnyheter.se/kategori/nyheter/#Västmanlands Nyheter","salaallehanda.com/#Sala Allehanda","p4logo#sverigesradio.se/vastmanland/#P4 Västmanland","svt-logga#svt.se/nyheter/lokalt#Svt Västmanland"],"Örebro": ["na.se/#Nerikes Allehanda","orebroarn.se/#Örebroaren","orebrotribune.se/#Örebro Tribune","karlskogatidning.se/#Karlskoga Tidning","p4logo#sverigesradio.se/orebro/#P4 Örebro","svt-logga#svt.se/nyheter/lokalt#Svt Örebro"], "Värmland": ["nwt.se/#Nya Wermlands-Tidningen","vf.se/#Värmlands Folkblad","arvikanyheter.se/#Arvika Nyheter","nwt.se/filipstad/#Filipstads Tidning","nwt.se/kristinehamn/#Kristinehamns-Posten", "varmlandsbygden.se/#Värmlandsbygden","svt-logga#svt.se/nyheter/lokalt#Svt Värmland","p4logo#sverigesradio.se/varmland/#P4 Värmland"], "Västra Götaland": ["gp-logo#alingsaskuriren.se/#Alingsås Kuriren","gp-logo#alekuriren.se/#Alekuriren","gp-logo#bt.se/#Borås Tidning","gp-logo#gp.se/#Göteborgs Posten","gp-logo#expressen.se/gt/#Göteborgs-Tidningen","gp-logo#kungalvsposten.se/#Kungälvs Posten","gp-logo#site:molndalsposten.se/nyheter/#Mölndals Posten","gp-logo#skaraborgsbygden.se/#Skaraborgsbygden","gp-logo#lokaltidningensto.se/#Lokaltidningen Stenungsund","gp-logo#ttela.se/#Trollhättans tidning","gp-logo#bohuslaningen.se/#Bohusläningen","gp-logo#ut.se/#Ulricehamns Tidnings","svt-logga#svt.se/nyheter/lokalt#Svt Väst","p4logo#sverigesradio.se/goteborg/#P4 Göteborg","p4logo#sverigesradio.se/vast/#P4 Väst"], "Östergötland": ["vimmerbytidning.se/#Vimmerby Tidning","corren.se/nyheter/#Östgöta Correspondenten","mvt.se/nyheter/#Motala Vadstena Tidning","folkbladet.se/nyheter/#Folkbladet","nt.se/nyheter/#Norrköpings Tidningar","p4logo#sverigesradio.se/ostergotland/#P4 Östergötland","svt-logga#svt.se/nyheter/lokalt#Svt Öst"],"Södermanland": ["gp-logo#ekuriren.se/#Eskilstuna-Kuriren","gp-logo#ekuriren.se/nyheter/strangnas/#Strengnäs Tidning","gp-logo#kkuriren.se/#Katrineholms-Kuriren","gp-logo#sormlandsbygden.se/kategori/nyheter/#Sörmlandsbygden","gp-logo#sn.se/#Södermanlands Nyheter","svt-logga#svt.se/nyheter/lokalt#Svt Sörmland","p4logo#sverigesradio.se/sormland/#P4 Sörmland",], "Stockholm": ["gp-logo#nvp.se/#Nacka Värmdö Posten", "gp-logo#norrteljetidning.se/#Norrtelje Tidning", "gp-logo#nynashamnsposten.se/#Nynäshamns Posten", "gp-logo#lt.se/#Länstidningen","gp-logo#mobil.unt.se/nyheter/sigtuna/#Sigtunabygden","gp-logo#8sidor.se/#8 Sidor","gp-logo#aip.nu/#Aktuellt i Politiken","gp-logo#dagen.se/#Dagen","gp-logo#www.svd.se/#Svenska Dagbladet","gp-logo#stockholmsfria.se/#Stockholms Fria","gp-logo#mitti.se/#Mitti Stockholm","gp-logo#aftonbladet.se/#Aftonbladet","gp-logo#expressen.se/#Expressen","p4logo#sverigesradio.se/stockholm/#P4 Stockholm","svt-logga#svt.se/nyheter/lokalt#Svt Stockholm"], "Kronoberg": ["smp.se/#Smålandsposten","vaxjobladet.se/#Växjöbladet","svt-logga#svt.se/nyheter/lokalt#Svt Småland","p4logo#sverigesradio.se/kronoberg/#P4 Kronoberg"], "Jönköping": ["jp.se/#önköpings-Posten", "tranas-posten.se/#Tranås-Posten","vn.se/#Värnamo Nyheter","svt-logga#svt.se/nyheter/lokalt#Svt Jönköping","p4logo#sverigesradio.se/jonkoping/#P4 Jönköping"],"Kalmar": ["p4logo#sverigesradio.se/kalmar/#P4 Kalmar","svt-logga#svt.se/nyheter/lokalt#Svt Småland","olandsbladet.se/#Ölandsbladet","barometern.se/#Barometern","ostrasmaland.se/#Östra Småland","vimmerbytidning.se/#Vimmerby Tidning","mobil.vt.se/nyheter/#Västerviks-Tidning"], "Gotland": ["svt-logga#svt.se/nyheter/lokalt#Svt Öst","p4logo#sverigesradio.se/gotland/#P4 Gotland", "helagotland.se/start/#Hela Gotland"], "Skåne": ["nsk.se/#Norra Skåne","hd.se/#Helsingborgs Dagblad","kristianstadsbladet.se/#Kristianstadsbladet","lokaltidningen.se/#Lokaltidningen","expressen.se/kvallsposten/#Kvällsposten","skd.se/#Skånskan","sydsvenskan.se/#Sydsvenskan","trelleborgsallehanda.se/#Trelleborgs Allehanda","ystadsallehanda.se/#Ystads Allehand","p4logo#sverigesradio.se/malmo/#P4 Malmöhus","svt-logga#svt.se/nyheter/lokalt#Svt Skåne"], "Blekinge": ["Bltlogo#blt.se/#Blekinge Läns Tidning","sydostran#sydostran.se/#Sydöstran","svt-logga#svt.se/nyheter/lokalt#Svt Blekinge","p4logo#sverigesradio.se/blekinge/#P4 Blekinge"],"Halland": ["svt-logga#svt.se/nyheter/lokalt#Svt Halland","p4logo#sverigesradio.se/halland/#P4 Halland","hn.se/#Hallands Nyheter","hallandsposten.se/#Hallandsposten","norrahalland.se/#Norra Halland","laholmstidning.se/#Laholms Tidning"]]
    
}









