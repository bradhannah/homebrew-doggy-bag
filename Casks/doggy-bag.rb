cask "doggy-bag" do
  version "0.8.1"
  sha256 "e7046bcaeec7c1762d16fa2ac0f3c0e33dac0a05c55271e01ab31a0443c55e8a"

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
