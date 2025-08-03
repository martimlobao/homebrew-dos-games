cask "mission-think" do
    version "1.0.1"
    sha256 "ff267aceb377d4693bbde6cbd034f7d8c3cc22e00988d9b51642e5df61a7c0ca"

    url "https://github.com/martimlobao/homebrew-dos-games/releases/download/mission-think-v#{version}/mission-think.app.zip"
    name "Mission T.H.I.N.K."
    desc "Windows educational game from 1997"
    homepage "https://github.com/martimlobao/homebrew-dos-games"

    app "Mission T.H.I.N.K..app"

    zap trash: "~/Library/Application Support/Mission T.H.I.N.K."
  end
