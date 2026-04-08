page 50301 "LAB User Card"
{
    Caption = 'Usuario';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "LAB Users Table";
    DelayedInsert = true;
    
    layout
    {
        area(Content)
        {
            group("Datos de usuario")
            {
                field("No."; Rec."No.") 
                {
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field(Name; Rec.Name) { }
                field(Email; Rec.Email) { }
                field(Tasks; Rec.Tasks) { }
            }
        }
    }
}