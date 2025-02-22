cask "choosy" do
  if MacOS.version <= :el_capitan
    version "1.1"
    sha256 "c6530d4e0dddbf47c6a8999bda8f3a5ef1857f4481b9325e56cfe00f05b2022c"

    prefpane "Choosy.prefPane"
  elsif MacOS.version <= :high_sierra
    version "1.3"
    sha256 "cb1f40df11ac1b52354f4b81367462d2646a6d023c64bafe5022fcec52f796cd"

    prefpane "Choosy.prefPane"
  elsif MacOS.version <= :mojave
    version "2.1"
    sha256 "758da621d3a92358885333b767d64b024197a8147a339b1a0d14e938673452f9"

    pkg "Choosy.pkg"
  else
    version "2.3"
    sha256 "b4fd6073b43ba7ce8697c6b3f400f2abec9196e10c6488d52970ed989ddb2a76"

    pkg "Choosy.pkg"
  end

  url "https://downloads.choosyosx.com/choosy_#{version}.zip"
  name "Choosy"
  desc "Open links in any browser"
  homepage "https://www.choosyosx.com/"

  livecheck do
    url "https://www.choosyosx.com/sparkle/feed"
    strategy :sparkle
  end

  depends_on macos: ">= :big_sur"

  uninstall pkgutil: "com.choosyosx.Choosy",
            quit:    "com.choosyosx.Choosy"

  zap trash: [
    "~/Library/Application Support/Choosy",
    "~/Library/Preferences/com.choosyosx.ChoosyPrefPane.plist",
  ]
end
