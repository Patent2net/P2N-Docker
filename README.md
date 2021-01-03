# P2N-Docker
 Makefile and installation scripts for Patent2Net (P2N) suite. This repository replaces the branch "docker-install" of P2N-V3 repo.

     _____      _             _     ___    _   _      _           _____   ___    _   _ 
    |  __ \    | |           | |   |__ \  | \ | |    | |      /  |  __ \ |__ \  | \ | | \
    | |__) |_ _| |_ ___ _ __ | |_     ) | |  \| | ___| |_    /   | |__) |   ) | |  \| |  \
    |  ___/ _` | __/ _ \ '_ \| __|   / /  | . ` |/ _ \ __|   |   |  ___/   / /  | . ` |   |
    | |  | (_| | ||  __/ | | | |_   / /_  | |\  |  __/ |_     \  | |      / /_  | |\  |  /
    |_|   \__,_|\__\___|_| |_|\__| |____| |_| \_|\___|\__|     \ |_|     |____| |_| \_| /       

What's new ?
-----
* [Patent2Netgit] (https://github.com/Patent2net/P2N-v3) comes now in *beta version 4* for a short time.
* Patent2Net now works in Docker. To install it simply download this repository and follow first the Readme.txt (that must be fixed, help needed) 
> In short,  click on the install.bat to build the docker image and install P2N on it.
* This repo comes also with two helpers in patent analysis: 
 1. [ElasticSearch] (https://www.elastic.co/) 
 2. [Kibana] (https://www.elastic.co/fr/kibana) servers. 
 > You can access a straightforward installation using the subdirectory install file in elastickibana directory. 
### Note 
 * ES is also upgraded with [Carrot2] (https://github.com/carrot2/carrot2) [ElasticSearch Plugin](https://github.com/carrot2/elasticsearch-carrot2)
 * Carrot2 [Document Clustering Service](https://carrot2.github.io/release/4.0.4/doc/rest-api-basics/) is also "ready to install" by uncommenting the good lines in DockerFile. But this is only is you know how to use it in order to replace the _ES-Kibana servers_.
 * Of course only the open source features are allowed but this installation is still open for every paid features offered by cited tools.

Features (P2N specific)
-----------------------
### Installation scripts
1. Batch Scripts (windows format easyly transposable for Mac and *Nix system) to install Patent2Net, Run P2N, stop it or Uninstall it.
2. Batch Scripts (windows format) to install ElasticSeach (ports 9200 and 9300) and Kibana servers (port 5601) and make them compatible with P2N.
### P2N special features
* Centos image with P2N automatically installed
* user p2n (no passwd)
* vsftpd pointing to p2n homedir for file interactions between your machine and P2N's using File Transport Protocol. [FileZilla] (https://filezilla-project.org/) is a good client. Use 127.0.0.1 address with user p2n
* RUN_P2N scripts starts a flask server to provide a standalone web server and serves P2N functions and files. See http://localhost:5000
* opens a bash shell (use P2N_Bash.bat scripts)
### P2N essential features covered
* Patent2Net interface you to [European Patent Organisation](https://www.epo.org/) worldwide database to gather patent documents set in answer to your requests 
* Patent2Net interface several software to build indicators and help analyse: [Datatable] (https://datatables.net/), [Pivot table] (https://pivottable.js.org/examples/)
* Patent2Net provides files compatible with two major open source projects in text analysis say [IRaMuTeQ] (iramuteq.org/) and document clustering (the already named Carrot2)[Carrot2] (https://github.com/carrot2/carrot2). But these programs have to be installed by your way. P2N provide data in compatible format for the distributions.
* Patent2Net build as well network files from patent Metadata. Assuming some trivial hypothesis that co-authors of a patent works together... Same for co-applicants: so networks analyses aims to help in exploring who works for who, who works with who... And so on. Same with the  [International Patent Classification] (https://www.wipo.int/classifications/ipc/en/) that provides language independent views on patent sets. This P2N version integrate inline interface to those networks (see the link in page data synthesis) but the interface with network is not friendly enought. We recommend the use of the exported files in gexf format compatible with the wondefull Open Graph Viz Platform [Gephi](https://gephi.org/) that you may install on your machine.
* Patent2Net, aside HTML5, exports also in several format: CSV, Excel, BibTex for [Zotero] (https://www.zotero.org/) import.
### Undocumented features
* some extra additional features comes also within the makefile... Help us to improve the docs and the projects

About
-----
[Patent2Net] (http://patent2netv2.vlab4u.info/dokuwiki/doku.php?id=page) is :
* elaborated and maintained (on a free base) by a [small international team] (http://patent2netv2.vlab4u.info/dokuwiki/doku.php?id=about_p2n:community;) of university professors and researchers.  
* an "open source" package and contributions are welcome
* available "[as it is] (http://patent2netv2.vlab4u.info/dokuwiki/doku.php?id=about_p2n:disclaimer)".

Patent2Net is a free package, dedicated to :
* promote the use of patent information in academic, nano and small firms, developing countries
* learn, study and practice how to collect, treat and communicate "textual bibliographic information", and automation process
* provide statistical analysis and representations of a set of patents
* learn skills in data-mining software, Data analysis, Textual data-mining, distance reading, knowledge discovery

The example [results](http://patent2netv2.vlab4u.info/) of statistical patents analysis can be exported to a website with the firefox browser.


