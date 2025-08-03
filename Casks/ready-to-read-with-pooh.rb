cask "ready-to-read-with-pooh" do
    version "1.0.3"
    sha256 "b05ac7b0cd8c812f4b4d28880c356875bdda65f964e215fa7e69c98baff86b4a"

    url "https://github.com/martimlobao/homebrew-dos-games/releases/download/ready-to-read-with-pooh-v#{version}/ready-to-read-with-pooh.app.zip"
    name "Ready to Read with Pooh"
    desc "Windows reading game by Disney from 1997"
    homepage "https://github.com/martimlobao/homebrew-dos-games"

    app "Ready to Read with Pooh.app"

    zap trash: "~/Library/Application Support/Ready to Read with Pooh"
  end
