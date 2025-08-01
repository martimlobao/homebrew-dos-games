cask "jumpstart-1st-grade" do
    version "1.0.0"
    sha256 "4d75893036b6836f4c0605ddfdf4828a5e2c7ea123a2465bd3cc113b80b2a471"

    url "https://github.com/martimlobao/homebrew-dos-games/releases/download/jumpstart-1st-grade-v#{version}/jumpstart-1st-grade.app.zip"
    name "JumpStart 1st Grade"
    desc "Windows first grade educational game from 1995"
    homepage "https://github.com/martimlobao/homebrew-dos-games"

    app "JumpStart 1st Grade.app"

    zap trash: "~/Library/Application Support/JumpStart 1st Grade"
  end
