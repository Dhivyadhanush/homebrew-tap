class Ritual < Formula
  desc "Self-hosted health reminders delivered through ntfy"
  homepage "https://github.com/Dhivyadhanush/ritual"
  url "https://github.com/Dhivyadhanush/ritual/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "a47beeefbce91fb1f81d7f5b5a3188efcd3271d449f99c6cdd135087df7188d3"
  license :cannot_represent
  head "https://github.com/Dhivyadhanush/ritual.git", branch: "main"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    libexec.install ".env.example"

    (bin/"ritual").write <<~SH
      #!/bin/bash
      set -euo pipefail

      env_file="${RITUAL_ENV_FILE:-#{etc}/ritual.env}"
      if [ -f "$env_file" ]; then
        set -a
        # shellcheck disable=SC1090
        . "$env_file"
        set +a
      fi

      if [ "${1:-}" = "hash-password" ]; then
        shift
        exec "#{formula_opt_bin("node")}/node" "#{libexec}/scripts/hash-password.mjs" "$@"
      fi

      export HOST="${HOST:-127.0.0.1}"
      export DATA_DIR="${DATA_DIR:-#{var}/ritual}"
      exec "#{formula_opt_bin("node")}/node" "#{libexec}/server.js" "$@"
    SH
  end

  post_install_steps do
    mkdir_p "ritual", base: :var
    mkdir_p "log", base: :var
    unless_path_exists "ritual.env", base: :etc do
      copy ".env.example", "ritual.env", source_base: :libexec, target_base: :etc
    end
  end

  service do
    run [opt_bin/"ritual"]
    working_dir var/"ritual"
    environment_variables RITUAL_ENV_FILE: etc/"ritual.env", DATA_DIR: var/"ritual", HOST: "127.0.0.1"
    keep_alive true
    log_path var/"log/ritual.log"
    error_log_path var/"log/ritual.error.log"
  end

  def caveats
    <<~EOS
      Configure Ritual before starting it:

        ritual hash-password "your password"
        edit #{etc}/ritual.env

      Then start the background service:

        brew services start ritual

      Dashboard: http://127.0.0.1:4322
    EOS
  end

  test do
    assert_match "scrypt:", shell_output("#{bin}/ritual hash-password test-password")
  end
end
