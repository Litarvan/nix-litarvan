{ buildPythonPackage, fetchPypi, lib }:

buildPythonPackage rec {
  pname = "anime-downloader";
  version = "3.6.3";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "1513ab3decfd585d790573370dbe863e7de8676548124d94b3aa5743f1b6b1e1";
  };

  meta = with lib; {
    description = "Download your favorite animes";
    homepage = "https://github.com/vn-ki/anime-downloader";
    #maintainers = [ maintainers.litarvan ];
    license = [ licenses.unlicense ];
  };
}
