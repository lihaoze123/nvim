require('competitest').setup({
    template_file = "/home/chumeng/Documents/CPP/.template.cpp",

    testcases_directory = "./.testcases",

    compile_command = {
        cpp= { exec = 'g++', args = {'$(FNAME)', '-o', '$(FNOEXT)', '-std=c++23', '-fsanitize=undefined', '-g'} },
    },

    received_contests_directory = "/home/chumeng/Documents/CPP/.contest/$(CONTEST)"

})
