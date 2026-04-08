page 50304 "LAB Task List Part"
{
    Caption = 'Usuarios asignados';
    PageType = ListPart;
    UsageCategory = None;
    ApplicationArea = All;
    SourceTable = "LAB Task Assignment";
    
    layout
    {
        area(Content)
        {
            repeater(Usuarios)
            {
                field("User No."; Rec."User No.") { }
                field(Name; Rec.Name) { }
                field(Email; Rec.Email) { }
                field(Tasks; Rec.Tasks) { }
            }
        }
    }
}