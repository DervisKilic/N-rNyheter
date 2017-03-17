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

    var newsPapers = ["Norrbotten": ["NBKuriren#kuriren.nu/nyheter/#Norrbottens-Kuriren","PTlogo#pt.se#Piteå-Tidningen","svt-logga#svt.se/nyheter/lokalt#Svt Norrbotten","p4logo#sverigesradio.se/norrbotten/#P4 Norrbotten","gp-logo#nsd.se/nyheter/#Norrländska Socialdemokraten"], "Västerbotten": ["PTlogo#vk.se/#Västerbottens-Kuriren","PTlogo#folkbladet.nu/#Folkbladet", "PTlogo#norran.se/#Norran","PTlogo#svt-logga#svt.se/nyheter/lokalt#Svt Västerbotten","p4logo#sverigesradio.se/vasterbotten/#P4 Västerbotten"], "PTlogo#Västernorrland": ["PTlogo#allehanda.se/#Allehanda","PTlogo#st.nu/#Sundsvalls Tidning","PTlogo#svt-logga#svt.se/nyheter/lokalt#Svt Västernorrland","p4logo#sverigesradio.se/vasternorrland/#P4 Västernorrland"], "Jämtland": ["PTlogo#ltz.se/#Länstidningen Östersund","PTlogo#jamtlandstidning.se/#Jämtlands Tidning","PTlogo#op.se/#Östersunds-Posten", "p4logo#sverigesradio.se/jamtland#P4 Jämtland","svt-logga#svt.se/nyheter/lokalt#Svt Jämtland"],"Gävleborg": ["PTlogo#helahalsingland.se/#Hela Hälsingland","PTlogo#arbetarbladet.se/#Arbetarbladet","PTlogo#gastriklandstidning.se/kategori/nyheter/#Gästrikslans Tidning","gd.se/#Gefle Dagblad","svt-logga#svt.se/nyheter/lokalt#Svt Gävleborg","p4logo#sverigesradio.se/gavleborg/#P4 Gävleborg"], "Dalarna": ["PTlogo#dt.se/#Dalarnas Tidningar","PTlogo#dalademokraten.se/#Dalademokraten", "svt-logga#svt.se/nyheter/lokalt#Svt Dalarna","p4logo#sverigesradio.se/dalarna/P4 Dalarna"], "Uppsala": ["PTlogo#mobil.unt.se/nyheter/#Upsala Nya Tidning","PTlogo#eposten.se/nyheter/#Enköpings-Posten","PTlogo#uppsalatidningen.se/start/#Uppsala Tidningen","PTlogo#uppsalanyheter.se/#Uppsalanyheter","svt-logga#svt.se/nyheter/lokalt#Svt Uppsala","p4logo#sverigesradio.se/uppland/#P4 Uppland"], "Västmanland": ["PTlogo#vlt.se/#Vestmanlands Läns Tidning","PTlogo#vastmanlandsnyheter.se/kategori/nyheter/#Västmanlands Nyheter","PTlogo#salaallehanda.com/#Sala Allehanda","p4logo#sverigesradio.se/vastmanland/#P4 Västmanland","svt-logga#svt.se/nyheter/lokalt#Svt Västmanland"],"Örebro": ["PTlogo#na.se/#Nerikes Allehanda","PTlogo#orebroarn.se/#Örebroaren","PTlogo#orebrotribune.se/#Örebro Tribune","PTlogo#karlskogatidning.se/#Karlskoga Tidning","p4logo#sverigesradio.se/orebro/#P4 Örebro","svt-logga#svt.se/nyheter/lokalt#Svt Örebro"], "Värmland": ["PTlogo#nwt.se/#Nya Wermlands-Tidningen","PTlogo#vf.se/#Värmlands Folkblad","PTlogo#arvikanyheter.se/#Arvika Nyheter","PTlogo#nwt.se/filipstad/#Filipstads Tidning","PTlogo#nwt.se/kristinehamn/#Kristinehamns-Posten", "PTlogo#varmlandsbygden.se/#Värmlandsbygden","svt-logga#svt.se/nyheter/lokalt#Svt Värmland","p4logo#sverigesradio.se/varmland/#P4 Värmland"], "Västra Götaland": ["gp-logo#alingsaskuriren.se/#Alingsås Kuriren","gp-logo#alekuriren.se/#Alekuriren","gp-logo#bt.se/#Borås Tidning","gp-logo#gp.se/#Göteborgs Posten","gp-logo#expressen.se/gt/#Göteborgs-Tidningen","gp-logo#kungalvsposten.se/#Kungälvs Posten","gp-logo#site:molndalsposten.se/nyheter/#Mölndals Posten","gp-logo#skaraborgsbygden.se/#Skaraborgsbygden","gp-logo#lokaltidningensto.se/#Lokaltidningen Stenungsund","gp-logo#ttela.se/#Trollhättans tidning","gp-logo#bohuslaningen.se/#Bohusläningen","gp-logo#ut.se/#Ulricehamns Tidnings","svt-logga#svt.se/nyheter/lokalt#Svt Väst","p4logo#sverigesradio.se/goteborg/#P4 Göteborg","p4logo#sverigesradio.se/vast/#P4 Väst"], "Östergötland": ["PTlogo#vimmerbytidning.se/#Vimmerby Tidning","PTlogo#corren.se/nyheter/#Östgöta Correspondenten","PTlogo#mvt.se/nyheter/#Motala Vadstena Tidning","PTlogo#folkbladet.se/nyheter/#Folkbladet","PTlogo#nt.se/nyheter/#Norrköpings Tidningar","p4logo#sverigesradio.se/ostergotland/#P4 Östergötland","svt-logga#svt.se/nyheter/lokalt#Svt Öst"],"Södermanland": ["gp-logo#ekuriren.se/#Eskilstuna-Kuriren","gp-logo#ekuriren.se/nyheter/strangnas/#Strengnäs Tidning","gp-logo#kkuriren.se/#Katrineholms-Kuriren","gp-logo#sormlandsbygden.se/kategori/nyheter/#Sörmlandsbygden","gp-logo#sn.se/#Södermanlands Nyheter","svt-logga#svt.se/nyheter/lokalt#Svt Sörmland","p4logo#sverigesradio.se/sormland/#P4 Sörmland",], "Stockholm": ["gp-logo#nvp.se/#Nacka Värmdö Posten", "gp-logo#norrteljetidning.se/#Norrtelje Tidning", "gp-logo#nynashamnsposten.se/#Nynäshamns Posten", "gp-logo#lt.se/#Länstidningen","gp-logo#mobil.unt.se/nyheter/sigtuna/#Sigtunabygden","gp-logo#8sidor.se/#8 Sidor","gp-logo#aip.nu/#Aktuellt i Politiken","gp-logo#dagen.se/#Dagen","gp-logo#www.svd.se/#Svenska Dagbladet","gp-logo#stockholmsfria.se/#Stockholms Fria","gp-logo#mitti.se/#Mitti Stockholm","gp-logo#aftonbladet.se/#Aftonbladet","gp-logo#expressen.se/#Expressen","p4logo#sverigesradio.se/stockholm/#P4 Stockholm","svt-logga#svt.se/nyheter/lokalt#Svt Stockholm"], "Kronoberg": ["PTlogo#smp.se/#Smålandsposten","PTlogo#vaxjobladet.se/#Växjöbladet","PTlogo#svt-logga#svt.se/nyheter/lokalt#Svt Småland","p4logo#sverigesradio.se/kronoberg/#P4 Kronoberg"], "Jönköping": ["PTlogo#jp.se/#önköpings-Posten", "PTlogo#tranas-posten.se/#Tranås-Posten","PTlogo#vn.se/#Värnamo Nyheter","svt-logga#svt.se/nyheter/lokalt#Svt Jönköping","p4logo#sverigesradio.se/jonkoping/#P4 Jönköping"],"Kalmar": ["p4logo#sverigesradio.se/kalmar/#P4 Kalmar","svt-logga#svt.se/nyheter/lokalt#Svt Småland","PTlogo#olandsbladet.se/#Ölandsbladet","PTlogo#barometern.se/#Barometern","PTlogo#ostrasmaland.se/#Östra Småland","PTlogo#vimmerbytidning.se/#Vimmerby Tidning","PTlogo#mobil.vt.se/nyheter/#Västerviks-Tidning"], "Gotland": ["svt-logga#svt.se/nyheter/lokalt#Svt Öst","p4logo#sverigesradio.se/gotland/#P4 Gotland", "PTlogo#helagotland.se/start/#Hela Gotland"], "Skåne": ["p4logo#nsk.se/#Norra Skåne","p4logo#hd.se/#Helsingborgs Dagblad","p4logo#kristianstadsbladet.se/#Kristianstadsbladet","p4logo#lokaltidningen.se/#Lokaltidningen","p4logo#expressen.se/kvallsposten/#Kvällsposten","p4logo#skd.se/#Skånskan","p4logo#sydsvenskan.se/#Sydsvenskan","p4logo#trelleborgsallehanda.se/#Trelleborgs Allehanda","p4logo#ystadsallehanda.se/#Ystads Allehand","p4logo#sverigesradio.se/malmo/#P4 Malmöhus","svt-logga#svt.se/nyheter/lokalt#Svt Skåne"], "Blekinge": ["Bltlogo#blt.se/#Blekinge Läns Tidning","sydostran#sydostran.se/#Sydöstran","svt-logga#svt.se/nyheter/lokalt#Svt Blekinge","p4logo#sverigesradio.se/blekinge/#P4 Blekinge"],"Halland": ["svt-logga#svt.se/nyheter/lokalt#Svt Halland","p4logo#sverigesradio.se/halland/#P4 Halland","PTlogo#hn.se/#Hallands Nyheter","PTlogo#hallandsposten.se/#Hallandsposten","PTlogo#norrahalland.se/#Norra Halland","PTlogo#laholmstidning.se/#Laholms Tidning"]]
    
}









