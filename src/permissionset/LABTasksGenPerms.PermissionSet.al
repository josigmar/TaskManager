namespace Laberit.TaskManager;

permissionset 50300 "LAB Tasks GenPerms"
{
    Assignable = true;
    Permissions = tabledata "LAB Task Assignment"=RIMD,
        tabledata "LAB Task Cue"=RIMD,
        tabledata "LAB Tasks Table"=RIMD,
        tabledata "LAB Users Table"=RIMD,
        table "LAB Task Assignment"=X,
        table "LAB Task Cue"=X,
        table "LAB Tasks Table"=X,
        table "LAB Users Table"=X,
        page "LAB Task Card"=X,
        page "LAB Task List"=X,
        page "LAB Task List Part"=X,
        page "LAB Tasks Role Center"=X,
        page "LAB User Card"=X,
        page "LAB User List"=X;
}