namespace Laberit.TaskManager;

page 50300 "LAB User List"
{
    Caption = 'Usuarios';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "LAB Users Table";
    RefreshOnActivate = true;
    CardPageId = "LAB User Card";
    
    layout
    {
        area(Content)
        {
            repeater(Usuarios)
            {
                field("No."; Rec."No.") { }
                field(Name; Rec.Name) { }
                field(Email; Rec.Email) { }
                field(Tasks; Rec.Tasks) { }
            }
        }
    }
}