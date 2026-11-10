cask "s-info" do
  version "1.0.2"
  sha256 "d0e29ef61c261d056b6db992ebce8246e46831912bb69dc30a6b32c9399743c5"

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
