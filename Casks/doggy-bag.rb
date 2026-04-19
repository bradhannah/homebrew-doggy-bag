cask "doggy-bag" do
  version "0.11.0"
  sha256 "174419431c914dc7f830737ab70210781d27b07c2c9afe18d6a1fd551c9f7104"

  url "https://github.com/bradhannah/doggy-bag/releases/download/v#{version}/DoggyBag_v#{version}_aarch64.dmg"
  name "Doggy Bag"
  desc "Desktop budgeting app for tracking monthly costs"
  homepage "https://github.com/bradhannah/doggy-bag"

  depends_on arch: :arm64

  app "Doggy Bag.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Doggy Bag.app"],
                   sudo: false
  end

  caveats <<~EOS
    This app is not signed with an Apple Developer certificate.
    If macOS says the app is "damaged", run:
      xattr -cr "/Applications/Doggy Bag.app"
  EOS

  zap trash: [
    "~/Library/Application Support/com.bradhannah.doggybag",
    "~/Library/Preferences/com.bradhannah.doggybag.plist",
    "~/Library/Saved Application State/com.bradhannah.doggybag.savedState",
  ]
end
