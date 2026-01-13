cask "doggy-bag" do
  version "0.4.1"
  sha256 "e2daf5af2e5366eeb99f84217004567f4d39e05174054e04d92108b4368da512"

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
