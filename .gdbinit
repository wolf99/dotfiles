set history filename ~/.gdb_history
set history save on

define qquit
    set confirm off
    qquit
end
document qquit
Quit without asking for confirmation
end