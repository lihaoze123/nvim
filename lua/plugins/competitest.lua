return {
    {
        "lihaoze123/competitest.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim"
        },
        opts = {
            template_file = ".template.cpp",
            testcases_directory = "./.testcases",
            compile_command = {
                cpp = { exec = 'g++', args = { '$(FNAME)', '-o', '$(FNOEXT)', '-std=c++23', '-fsanitize=undefined', '-g' } }
            },
            received_contests_directory = "./.contest/$(CONTEST)",
        }
    }
}
