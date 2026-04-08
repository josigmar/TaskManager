table 50300 "LAB Users Table"
{
    Caption = 'Usuarios';
    DataClassification = CustomerContent;
    DataCaptionFields = "No.", Name;
    LookupPageId = "LAB User List";
    DrillDownPageId = "LAB User List";
    
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Nº.';
            ToolTip = 'Código de usuario.';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Nombre';
            ToolTip = 'Nombre completo del usuario.';
        }
        field(3; Email; Text[30])
        {
            Caption = 'Email';
            ToolTip = 'Dirección de correo electrónico del usuario.';
            ExtendedDatatype = EMail;
        }
        field(4; Tasks; Integer)
        {
            Caption = 'Tareas asignadas';
            ToolTip = 'Nº de tareas activas asignadas al usuario.';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("LAB Task Assignment" where("User No." = field("No.")));
        }
    }
    
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }  

    fieldgroups
    {
        fieldgroup(Dropdown; "No.",Name,Email,Tasks) { }
    }  
}