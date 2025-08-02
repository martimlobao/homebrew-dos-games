cask "orlys-draw-a-story" do
    version "1.0.0"
    sha256 "XXX"

    url "https://github.com/martimlobao/homebrew-dos-games/releases/download/orlys-draw-a-story-v#{version}/orlys-draw-a-story.app.zip"
    name "Orly's Draw-A-Story"
    desc "Windows drawing and storytelling game by Broderbund from 1997"
    homepage "https://github.com/martimlobao/homebrew-dos-games"

    app "Orly's Draw-A-Story.app"

    zap trash: "~/Library/Application Support/Orly's Draw-A-Story"
  end
