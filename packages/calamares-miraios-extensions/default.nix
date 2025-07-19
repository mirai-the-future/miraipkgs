{
  stdenv,
  fetchFromGitHub,
  lib,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "calamares-miraios-extensions";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "mirai-the-future";
    repo = "calamares-miraios-extensions";
    hash = "01afedc97d75decdfe319db527feacd6edca0f56";
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
  }
})