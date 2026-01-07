cask "doggy-bag" do
  version "0.2.2"
  sha256 "42422a33fd339f63d8392b6154151d02cee9560f7897ab70d93541c459db83b3"

  url "https://github.com/bradhannah/BudgetForFun/releases/download/v#{version}/DoggyBag_v#{version}_aarch64.dmg"
  name "Doggy Bag"
  desc "Desktop budgeting app for tracking monthly costs"
  homepage "https://github.com/bradhannah/BudgetForFun"

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
