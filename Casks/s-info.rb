cask "s-info" do
  version "1.0.0"
  sha256 "ce477caf208581e2ce8cfb46f97a500df5c1cfcce40859682797343eac20b036"

  url "https://github.com/Dhivyadhanush/s-info/releases/download/v#{version}/S-Info.zip"
  name "S-Info"
  desc "Menu bar Docker and server monitor with 30-day history and apt upgrades"
  homepage "https://github.com/Dhivyadhanush/s-info"

  depends_on macos: ">= :sonoma"

  app "S-Info.app"

  # The build is ad-hoc signed, not notarised, so remove the quarantine flag
  # that a browser download would otherwise leave behind.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/S-Info.app"]
  end

  uninstall quit: "dev.dhanuz.s-info"

  zap trash: [
    "~/Library/Application Support/S-Info",
    "~/Library/LaunchAgents/dev.dhanuz.s-info.plist",
    "~/Library/Preferences/dev.dhanuz.s-info.plist",
  ]
end
