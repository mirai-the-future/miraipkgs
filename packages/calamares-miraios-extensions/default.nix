{ 
  stdenv,
  fetchFromGitHub,
  lib,
  ...
}: 
stdenv.mkDerivation (finalAttrs: {
  pname = "calamares-miraios-extensions";
  version = "1.0.0";
  src = fetchFromGitHub {
    owner = "mirai-the-future";
    repo = "calamares-miraios-extensions";
    rev = "01afedc97d75decdfe319db527feacd6edca0f56";
    hash = "sha256-E6BZYBCf8czC1d7rnE9M0QvBNh3G33omhkE3Rbivkvs=";
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