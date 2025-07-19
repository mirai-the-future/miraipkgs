{ 
  stdenv,
  fetchFromGitHub,
  lib
}: 
stdenv.mkDerivation (finalAttrs: {
  pname = "calamares-miraios-extensions";
  version = "1.0.0";
  src = fetchFromGitHub {
    owner = "mirai-the-future";
    repo = "calamares-miraios-extensions";
    rev = "4e944fcafcfb257f42a7125e7f8f76399795e28d";
    hash = "sha256-3K6QdG5i0HocI2vTXtLTfEkLBx1HPzQsBFx2dT1T5sI=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/{lib,share}/calamares
    cp -r modules $out/lib/calamares/
    cp -r config/* $out/share/calamares/
    cp -r branding $out/share/calamares/
    runHook postInstall
  '';

  meta = with lib; {
    description = "Calamares modules for MiraiOS";
    homepage = "https://github.com/mirai-the-future/calamares-miraios-extensions";
    license = with licenses; [
      gpl3Plus
      bsd2
      cc-by-40
      cc-by-sa-40
      cc0
    ];
    maintainers = with maintainers; [ jerezoff ];
    platforms = platforms.linux;
  };
}) 