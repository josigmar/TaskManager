table 50302 "LAB Task Assignment"
{
    Caption = 'Asignación de tareas';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Task No."; Code[20])
        {
            Caption = 'Nº Tarea';
            ToolTip = 'Código de la tarea.';
            TableRelation = "LAB Tasks Table";
        }
        field(2; "User No."; Code[20])
        {
            Caption = 'Nº Usuario';
            ToolTip = 'Código del usuario asignado.';
            TableRelation = "LAB Users Table";

            trigger OnValidate()
            begin
                CalcFields(Name,Email,Tasks);
            end;
        }
        field(3; Name; Text[100])
        {
            Caption = 'Nombre';
            ToolTip = 'Nombre completo del usuario asignado.';
            FieldClass = FlowField;
            CalcFormula = lookup("LAB Users Table".Name where("No." = field("User No.")));
        }
        field(4; Email; Text[30])
        {
            Caption = 'Email';
            ToolTip = 'Dirección de correo electrónico del usuario asignado.';
            ExtendedDatatype = EMail;
            FieldClass = FlowField;
            CalcFormula = lookup("LAB Users Table".Email where("No." = field("User No.")));
        }
        field(5; Tasks; Integer)
        {
            Caption = 'Tareas asignadas';
            ToolTip = 'Nº de tareas activas asignadas al usuario asignado.';
            FieldClass = FlowField;
            CalcFormula = count("LAB Task Assignment" where("User No." = field("User No.")));
        }
    }
    
    keys
    {
        key(PK; "Task No.", "User No.")
        {
            Clustered = true;
        }
    }    
}