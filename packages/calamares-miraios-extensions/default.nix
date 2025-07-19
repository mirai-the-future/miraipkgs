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
    rev = "b3988aae0ab7c27a3a042474e73063ecb8b3062e";
    hash = "sha256-mQeEHB3/w+f3lY7hoRX1l/r5YlgACDaeWngCLDMeBnQ=";
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