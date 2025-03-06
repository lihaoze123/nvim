return {
    {
        "CRAG666/code_runner.nvim",
        opts = {
            filetype = {
                python = "python3 -u",
                rust = {
                    "cd $dir &&",
                    "rustc $fileName &&",
                    "$dir/$fileNameWithoutExt"
                },
                go = "go run $fileName"
            }
        }
    }
}
