cask "jumpstart-1st-grade" do
    version "1.0.1"
    sha256 "24406ab01e32c02ebfc00fb7c362cb9770ff6beedcfc42d6a031e569e5341a6a"

    url "https://github.com/martimlobao/homebrew-dos-games/releases/download/jumpstart-1st-grade-v#{version}/jumpstart-1st-grade.app.zip"
    name "JumpStart 1st Grade"
    desc "Windows first grade educational game from 1995"
    homepage "https://github.com/martimlobao/homebrew-dos-games"

    app "JumpStart 1st Grade.app"

    zap trash: "~/Library/Application Support/JumpStart 1st Grade"
  end
