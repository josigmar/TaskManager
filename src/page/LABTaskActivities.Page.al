namespace Laberit.TaskManager;

page 50306 "LAB Task Activities"
{
    Caption = 'Actividades';
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "LAB Task Cue";
    
    layout
    {
        area(Content)
        {
            cuegroup(Stop)
            {
                Caption = 'Tareas pausadas';

                field(Completed; Rec.Completed)
                {
                    Style = Favorable;
                }
                field(NotAllocated; Rec.NotAllocated)
                {
                    StyleExpr = ColorTask;
                }
            }
            cuegroup(Ongoing)
            {
                Caption = 'Tareas en curso';

                field(Allocated; Rec.Allocated)
                {
                    Style = Favorable;
                }
                field(InProgress; Rec.InProgress)
                {
                    Style = Favorable;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert()
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        if Rec.NotAllocated = 0 then
            ColorTask := 'Favorable'
        else 
            if Rec.NotAllocated <= 2 then
                ColorTask := 'Ambiguous'
            else 
                ColorTask := 'Unfavorable';
    end;

    var
        ColorTask: text[30];
}