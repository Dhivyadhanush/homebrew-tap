cask "s-info" do
  version "1.1.0"
  sha256 "17cc2ee55d3c8533f6dace27a6a876fb540c2f9ac8b8cc22aeba3cb3c972e4b8"

  url "https://github.com/Dhivyadhanush/s-info/releases/download/v#{version}/S-Info.zip"
  name "S-Info"
  desc "Menu bar Docker and server monitor with 30-day history and apt upgrades"
  homepage "https://github.com/Dhivyadhanush/s-info"

  depends_on macos: :sonoma

  app "S-Info.app"

  uninstall quit: "dev.dhanuz.s-info"

  zap trash: [
    "~/Library/Application Support/S-Info",
    "~/Library/LaunchAgents/dev.dhanuz.s-info.plist",
    "~/Library/Preferences/dev.dhanuz.s-info.plist",
  ]
end
