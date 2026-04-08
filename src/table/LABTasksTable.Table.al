table 50301 "LAB Tasks Table"
{
    Caption = 'Tareas';
    DataClassification = CustomerContent;
    DataCaptionFields = "No.", Name;
    LookupPageId = "LAB Task List";
    DrillDownPageId = "LAB Task List";
    
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Nº.';
            ToolTip = 'Código de la tarea.';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Nombre';
            ToolTip = 'Nombre de la tarea.';
        }
        field(3; "Duration"; Duration)
        {
            Caption = 'Duración estimada';
            ToolTip = 'Tiempo estimado para completar la tarea expresado en horas.';

            trigger OnValidate()
            begin
                if (Rec.Status <> Rec.Status::NotAllocated) and (Rec.Duration <> 0) then
                    Rec.Ending := CurrentDateTime() + Rec.Duration
                else
                    Rec.Ending := 0DT;
            end;
        }
        field(4; "Total Assig.Users"; Integer)
        {
            Caption = 'Usuarios asignados';
            ToolTip = 'Nº de usuarios asignados actualmente a la tarea.';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("LAB Task Assignment" where("Task No." = field("No.")));
        }
        field(5; Status; Enum "LAB Status Enum")
        {
            Caption = 'Estado';
            ToolTip = 'Estado en el que se encuentra la tarea.';

            trigger OnValidate()
            begin
                if (Rec.Status <> Status::NotAllocated) and (Rec.Duration <> 0) then
                    Rec.Ending := CurrentDateTime() + Rec.Duration
                else
                    Rec.Ending := 0DT;
            end;
        }
        field(6; Ending; DateTime)
        {
            Caption = 'Fecha de finalización';
            ToolTip = 'Fecha en la que está prevista que la tarea sea completada.';
            Editable = false;
        }
    }
    
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }    
}