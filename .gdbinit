set history filename ~/.gdb_history
set history save on

define qquit
    set confirm off
    quit
end
document qquit
Quit without asking for confirmtion
end

