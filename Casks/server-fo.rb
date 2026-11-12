cask "server-fo" do
  version "1.3.1"
  sha256 "3c1c1aed8bb9fc3d793a085f254bf4c11d9ca688c2f1d14ac08b89af2cb341d3"

  url "https://github.com/Dhivyadhanush/server-fo/releases/download/v#{version}/Server-Fo.zip"
  name "Server-Fo"
  desc "Menu bar Docker and server monitor with 30-day history and apt upgrades"
  homepage "https://github.com/Dhivyadhanush/server-fo"

  depends_on macos: :sonoma

  app "Server-Fo.app"

  # Ad-hoc signed, so Gatekeeper cannot verify it. macOS 27 refuses to run a
  # quarantined copy (the "Not Opened" dialog offers to move it to the Trash),
  # so clear the download flag the same way --no-quarantine would.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/Server-Fo.app"]
  end

  uninstall quit: "dev.dhanuz.server-fo"

  zap trash: [
    "~/Library/Application Support/Server-Fo",
    "~/Library/LaunchAgents/dev.dhanuz.server-fo.plist",
    "~/Library/Preferences/dev.dhanuz.server-fo.plist",
  ]
end
