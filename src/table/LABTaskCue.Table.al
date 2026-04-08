table 50303 "LAB Task Cue"
{
    Caption = 'Actividades en cola';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; NotAllocated; Integer)
        {
            Caption = 'Tareas no asignadas';
            ToolTip = 'Número de tareas que aún no han sido asignadas a ningún usuario.';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("LAB Tasks Table" where(Status = const(NotAllocated)));
        }
        field(2; Allocated; Integer)
        {
            Caption = 'Tareas asignadas';
            ToolTip = 'Número de tareas que ya han sido asignadas a uno o más usuarios.';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("LAB Tasks Table" where(Status = const(Allocated)));
        }
        field(3; InProgress; Integer)
        {
            Caption = 'Tareas en progreso';
            ToolTip = 'Número de tareas que han sido iniciadas pero aún no se han completado.';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("LAB Tasks Table" where(Status = const(InProgress)));
        }
        field(4; Completed; Integer)
        {
            Caption = 'Tareas completadas';
            ToolTip = 'Número de tareas que ya han sido completadas.';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("LAB Tasks Table" where(Status = const(Completed)));
        }
        field(5; "Primary Key"; Code[10])
        {
            Caption = 'Clave principal';
            DataClassification = SystemMetadata;
        }
    }
    
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}