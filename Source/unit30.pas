unit Unit30;
// Project: SmatterPlot
// unit31 = Fit Model form

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Math;

type

  { TForm30 }

  TForm30 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox3: TComboBox;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit2: TEdit;
    Edit20: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure HideSearchBoxes();
    procedure ShowSearchBoxes();


  private

  public

  end;

var
  Form30: TForm30;

implementation
uses
  Unit1;

{$R *.lfm}

{ TForm30 }





procedure TForm30.Button1Click(Sender: TObject);
var
  i: integer;
  j: longint;
  m: longint;
  maxints: longint;
  lastrow: longint;
  lastdataset: longint;
  pointcount: longint;
  pointtot: longint;
  Xpointstart: double;
  Xpointend: double;
  themodel: String;
  Xval: double;
  Yval: double;
  YvalFit: double;
  YvalSum: double;
  YvalFitSum: double;
  Xave: double;
  Yave: double;
  Xsum: double;
  Ysum: double;
  rsum1: double;
  rsum2: double;
  rsum3: double;
  rsquared: double;
  npoints: longint;
  a1: double;
  a2: double;
  a3: double;
  a4: double;
  a5: double;
  a1r: double;
  a2r: double;
  a3r: double;
  a4r: double;
  a5r: double;
  a1min: double;
  a2min: double;
  a3min: double;
  a4min: double;
  a5min: double;
  a1max: double;
  a2max: double;
  a3max: double;
  a4max: double;
  a5max: double;
  swap: double;
  newRes: double;
  bestRes: double;



begin
  // Click Fit Model Button
  Randomize;
  lastrow:= Form1.StringGrid1.RowCount;
  lastdataset:= 0;
  if lastrow <= 2 then
  begin
     If Form1.StringGrid1.RowCount = 0 then
     begin
        Form1.StringGrid1.RowCount:=1;
        lastrow:=1;
     end;
     Form1.StringGrid1.Cells[0,0]:= '0';
     Form1.StringGrid1.Cells[1,0]:= '1';
     Form1.StringGrid1.Cells[2,0]:= ComboBox1.Caption;
     Form1.StringGrid1.Cells[xcol, 0]:= 'x';
     Form1.StringGrid1.Cells[ycol, 0]:= 'y';

  end;
  if lastrow > 2 then
  begin
     for j:= 1 to lastrow-1 do
     begin
        if Strtoint(Form1.StringGrid1.Cells[1,j]) > lastdataset then
           lastdataset:= Strtoint(Form1.StringGrid1.Cells[1,j]);
     end;
  end;


  pointtot:= StrtoInt(Form30.Edit9.Caption);
  Xpointstart:= StrtoFloat(Form30.Edit7.Caption);
  Xpointend:= StrtoFloat(Form30.Edit8.Caption);

  a1:= StrtoFloat(Form30.Edit2.Caption);
  a2:= StrtoFloat(Form30.Edit3.Caption);
  a3:= StrtoFloat(Form30.Edit4.Caption);
  a4:= StrtoFloat(Form30.Edit5.Caption);
  a5:= StrtoFloat(Form30.Edit6.Caption);




//------------------------------------------- Optimization
  // First, check if we only need to compute the average
  themodel:= ComboBox1.Caption;
  Case themodel of
    'Average':
    begin
      Ysum:= 0;
      pointcount:= 0;
      for i:=1 to lastrow-1 do
           begin
             if Form30.Combobox3.Caption = Form1.StringGrid1.Cells[2,i] then
             begin
                Xval:= StrtoFloat(Form1.StringGrid1.Cells[xcol,i]);
                if (Xval> Xpointstart) and (Xval < Xpointend) then
                begin
                     Yval:= StrtoFloat(Form1.StringGrid1.Cells[ycol,i]);
                     Ysum:= Ysum + Yval;
                     pointcount:= pointcount+1;
                end;
             end;
           end;
      a1:= Ysum/pointcount;
      a2:= 0;
      a3:= 0;
      a4:= 0;
      a5:= 0;
      //ShowMessage(floattostr(a1));
    end;

    // Next, check if equation is solvable with linear least squares

    'Linear', 'Exponential','Logarhithmic(Natural)', 'Logarhithmic(Base10)',
    'Power Law', 'Power Law for Viscosity', 'Arrhenius Equation':
                  // Use Linear Least Squares
    begin
        Xave:= 0;
        Yave:= 0;
        Xsum:= 0;
        Ysum:= 0;
        pointcount:= 0;
        for i:=1 to lastrow-1 do
             begin
               if Form30.Combobox3.Caption = Form1.StringGrid1.Cells[2,i] then
               begin
                  Xval:= StrtoFloat(Form1.StringGrid1.Cells[xcol,i]);
                  if (Xval> Xpointstart) and (Xval < Xpointend) then
                  begin
                       Yval:= StrtoFloat(Form1.StringGrid1.Cells[ycol,i]);
                       if themodel = 'Exponential' then
                       begin
                          if Yval>0 then
                             Yval:= LN(Yval);
                       end;
                       if themodel = 'Logarhithmic(Natural)' then
                       begin
                          if Xval>0 then
                             Xval:= LN(Xval);
                       end;
                       if themodel = 'Logarhithmic(Base10)' then
                       begin
                          if Xval>0 then
                             Xval:= Log10(Xval)
                                    else Xval:=0;
                       end;
                       if themodel = 'Power Law' then
                       begin
                         if Yval>0 then
                             Yval:= LN(Yval)
                                    else Yval:=0;
                         if Xval>0 then
                             Xval:= LN(Xval)
                                    else Xval:=0;
                       end;

                       if themodel = 'Power Law for Viscosity' then
                       begin
                          if Yval>0 then
                              Yval:= LN(Yval)
                                     else Yval:=0;
                          if Xval>0 then
                              Xval:= LN(Xval)
                                     else Xval:=0;
                       end;
                       if themodel = 'Arrhenius Equation' then
                       begin
                          if Yval>0 then
                              Yval:= LN(Yval)
                                     else Yval:=0;
                          if Xval>0 then
                              Xval:= 1/Xval
                                     else Xval:=0;
                       end;

                       Xsum:= Xsum + Xval;
                       Ysum:= Ysum + Yval;
                       pointcount:= pointcount + 1;
                  end;
               end;
             end;

        Xave:= Xsum / (pointcount);
        Yave:= Ysum / (pointcount);
        rsum1:= 0;
        rsum2:= 0;
        rsum3:= 0;

        for i:=1 to lastrow-1 do
             begin
               if Form30.Combobox3.Caption = Form1.StringGrid1.Cells[2,i] then
               begin
                  Xval:= StrtoFloat(Form1.StringGrid1.Cells[xcol,i]);
                  if (Xval> Xpointstart) and (Xval < Xpointend) then
                  begin
                       Yval:= StrtoFloat(Form1.StringGrid1.Cells[ycol,i]);
                       rsum1:= rsum1 + (Xval - Xave) * (Yval - Yave);
                       rsum2:= rsum2 + (Xval - Xave) ** 2;
                       rsum3:= rsum3 + (Yval - Yave) ** 2;
                  end;
               end;
             end;
        //ShowMessage(floattostr(Ysum));
        a2:= rsum1 / rsum2;
        a1:= Yave - a2 * Xave;
        a3:= 0;
        a4:= 0;
        a5:= 0;
        Case themodel of
        'Exponential':
            a1:=Exp(a1);
        'Logarhithmic(Natural)':
        begin
            swap:= a2;
            a2:= Exp(a1 / a2);
            a1:= swap;
        end;
        'Logarhithmic(Base10)':
        begin
            swap:= a2;
            a2:= Power(10, (a1 / a2));
            a1:= swap;
        end;
        'Power Law':
            a1:= Exp(a1);

        'Power Law for Viscosity':
        begin
            a1:= Exp(a1);
            a2:= a2+1;
        end;

        'Arrhenius Equation':
        begin
             a1:= Exp(a1);
             a2:= -a2;
        end;

        end;

        ShowMessage('This used linear least squares fitting');
        //rsquared:= (sum1) ^ 2 / (sum2 * sum3);
    end;





  else
  begin            // Use RandomSearch
           m:=0;
           newRes:=0.0;
           bestRes:=0.0;
           maxints:= StrtoInt(Form30.Edit10.Caption);
           a1min:= StrtoFloat(Form30.Edit11.Caption);
           a2min:= StrtoFloat(Form30.Edit12.Caption);
           a3min:= StrtoFloat(Form30.Edit13.Caption);
           a4min:= StrtoFloat(Form30.Edit14.Caption);
           a5min:= StrtoFloat(Form30.Edit15.Caption);
           a1max:= StrtoFloat(Form30.Edit16.Caption);
           a2max:= StrtoFloat(Form30.Edit17.Caption);
           a3max:= StrtoFloat(Form30.Edit18.Caption);
           a4max:= StrtoFloat(Form30.Edit19.Caption);
           a5max:= StrtoFloat(Form30.Edit20.Caption);

           ShowMessage('Starting RandomSearch');
           while (m < maxints) do
           begin
             if Form30.CheckBox1.Checked = True then
                a1r:= a1min+ (a1max-a1min)*Random;
             if Form30.CheckBox2.Checked = True then
                a2r:= a2min+ (a2max-a2min)*Random;
             if Form30.CheckBox3.Checked = True then
                a3r:= a3min+ (a3max-a3min)*Random;
             if Form30.CheckBox4.Checked = True then
                a4r:= a4min+ (a4max-a4min)*Random;
             if Form30.CheckBox5.Checked = True then
                a5r:= a5min+ (a5max-a5min)*Random;


             newRes:= 0.0;
             for i:=1 to lastrow-1 do
             begin
               if Form30.Combobox3.Caption = Form1.StringGrid1.Cells[2,i] then
               begin
                  Xval:= StrtoFloat(Form1.StringGrid1.Cells[xcol,i]);
                  if (Xval> Xpointstart) and (Xval < Xpointend) then
                  begin
                       Yval:= StrtoFloat(Form1.StringGrid1.Cells[ycol,i]);
                       Case ComboBox1.Caption of
                          'Average':
                              YvalFit:= a1r;
                          'Linear':
                              YvalFit:= a1r+a2r*Xval;
                          'Quadratic':
                              YvalFit:= a1r+a2r*Xval+a3r*IntPower(Xval,2);
                          'Cubic':
                              YvalFit:= a1r+a2r*Xval+a3r*IntPower(Xval,2) +a4r*IntPower(Xval,3);
                          'Polynomial (4th power)':
                              YvalFit:= a1r+a2r*Xval+a3r*IntPower(Xval,2) +a4r*IntPower(Xval,3)+a5r*IntPower(Xval,4);
                          'Exponential':
                              YvalFit:= a1r*Exp(a2r*Xval);
                          'Logarhithmic(Natural)':
                              YvalFit:= a1r*LN(a2r*Xval);
                          'Logarhithmic(Base10)':
                              YvalFit:= a1r*Log10(a2r*Xval);
                          'Power Law':
                              YvalFit:= a1r*Power(Xval, a2r);
                          'Power Law for Viscosity':
                              YvalFit:= a1r*Power(Xval, (a2r-1));
                          'Arrhenius Equation':
                              YvalFit:= a1r*Exp(-a2r/Xval);
                          'Bingham Model for Viscosity':
                              YvalFit:= a1r+a2r/Xval;

                          'Briant Model for Viscosity':
                              YvalFit:= a3r*Power((1+a1r/(a3r*a2r*Xval)),a2r);

                          'Carreau-Yasuda Model for Viscosity':
                              YvalFit:= a5r+(a1r-a5r)*Power(Power((1+(a2r*Xval)),a3r),(a4r-1)/a3r);

                          'Casson Model for Viscosity':
                              YvalFit:= ((sqrt(a2r)-sqrt(a1r*Xval))**2)/Xval;

                          'Gauss Distribution':
                              YvalFit:= a4r+a3r/Sqrt(2*3.14159265)/a1r*Exp((-1/2/(a1r)**2)*(Xval-a2r)**2);

                          'Gompertz Sigmoid':
                              YvalFit:= a4r+a1r*exp(-a2r*exp(-a3r*Xval));

                          'Hershel-Bulkley Model for Viscosity':
                              YvalFit:= (a2r+a1r*Power(Xval, a3r))/Xval;

                       end;
                       newRes:= newRes+(YvalFit-Yval)**2;
                       ShowMessage(floattostr(newRes));

                  end;
               end;
             end;

             // if the fit is better then reassign parameters to new values
             if (m=0) then
             begin
                bestRes:= newRes;
             end
             else
             begin
                 if (newRes < bestRes) then
                 begin
                     bestRes:= newRes;
                     a1:= a1r;
                     a2:= a2r;
                     a3:= a3r;
                     a4:= a4r;
                     a5:= a5r;

                 end;
             end;

             m:=m+1;
             ShowMessage(InttoStr(m));

           end;
           ShowMessage('This used random search fitting');
   end;
  end;
  //ShowMessage('Optimization complete');
//------------------------------------------- End Optimization






           // now compute r-squared
           //ShowMessage('Now compute rsquared value');
           YvalSum:= 0;
           YvalFitSum:=0;
           npoints:=0;

           for i:=1 to lastrow-1 do
             begin
               if Form30.Combobox3.Caption = Form1.StringGrid1.Cells[2,i] then
               begin
                  Xval:= StrtoFloat(Form1.StringGrid1.Cells[xcol,i]);
                  if (Xval> Xpointstart) and (Xval < Xpointend) then
                  begin

                    Yval:= StrtoFloat(Form1.StringGrid1.Cells[ycol,i]);

                    Case ComboBox1.Caption of
                          'Average':
                              YvalFit:= a1;
                          'Linear':
                              YvalFit:= a1+a2*Xval;
                          'Quadratic':
                              YvalFit:= a1+a2*Xval+a3*IntPower(Xval,2);
                          'Cubic':
                              YvalFit:= a1+a2*Xval+a3*IntPower(Xval,2) +a4*IntPower(Xval,3);
                          'Polynomial (4th power)':
                              YvalFit:= a1+a2*Xval+a3*IntPower(Xval,2) +a4*IntPower(Xval,3)+a5*IntPower(Xval,4);
                          'Exponential':
                              YvalFit:= a1*Exp(a2*Xval);
                          'Logarhithmic(Natural)':
                            begin
                              if Xval<0 then Xval:=0.00001;
                              if a2<0 then a2:=0.00001;
                              YvalFit:= a1*LN(a2*Xval);
                            end;

                          'Logarhithmic(Base10)':
                            begin
                              if Xval<0 then Xval:=0.00001;
                              if a2<0 then a2:=0.00001;
                              YvalFit:= a1*Log10(a2*Xval);
                            end;
                          'Power Law':
                            begin
                              if Xval<0 then Xval:=0.00001;
                              if a2<0 then a2:=0.00001;
                              YvalFit:= a1*Power(Xval, a2);
                            end;
                          'Power Law for Viscosity':
                            begin
                              if Xval<0 then Xval:=0.00001;
                              if a2<0 then a2:=0.00001;
                              YvalFit:= a1*Power(Xval, (a2-1));
                            end;
                          'Arrhenius Equation':
                          begin
                            if Xval<0 then Xval:=0.00001;
                            if a2<0 then a2:=0.00001;
                            YvalFit:= a1*Exp(-a2/Xval);
                          end;


                       end;
                    YvalSum:= YvalSum+Yval;
                    YvalFitSum:= YvalFitSum +YvalFit;
                    npoints:=npoints+1;
                  end;
               end;
             end;

           rsum1:=0;
           rsum2:=0;
           rsum3:=0;
           for i:=1 to lastrow-1 do
             begin
               if Form30.Combobox3.Caption = Form1.StringGrid1.Cells[2,i] then
               begin
                  Xval:= StrtoFloat(Form1.StringGrid1.Cells[xcol,i]);
                  if (Xval> Xpointstart) and (Xval < Xpointend) then
                  begin
                    Yval:= StrtoFloat(Form1.StringGrid1.Cells[ycol,i]);

                    Case ComboBox1.Caption of
                          'Average':
                              YvalFit:= a1;
                          'Linear':
                              YvalFit:= a1+a2*Xval;
                          'Quadratic':
                              YvalFit:= a1+a2*Xval+a3*IntPower(Xval,2);
                          'Cubic':
                              YvalFit:= a1+a2*Xval+a3*IntPower(Xval,2) +a4*IntPower(Xval,3);
                          'Polynomial (4th power)':
                              YvalFit:= a1+a2*Xval+a3*IntPower(Xval,2) +a4*IntPower(Xval,3)+a5*IntPower(Xval,4);
                          'Exponential':
                              YvalFit:= a1*Exp(a2*Xval);
                          'Logarhithmic(Natural)':
                            begin
                              if Xval<0 then Xval:=0.00001;
                              if a2<0 then a2:=0.00001;
                              YvalFit:= a1*LN(a2*Xval);
                            end;
                          'Logarhithmic(Base10)':
                            begin
                              if Xval<0 then Xval:=0.00001;
                              if a2<0 then a2:=0.00001;
                              YvalFit:= a1*Log10(a2*Xval);
                            end;
                          'Power Law':
                            begin
                              if Xval<0 then Xval:=0.00001;
                              if a2<0 then a2:=0.00001;
                              YvalFit:= a1*Power(Xval, a2);
                            end;
                           'Power Law for Viscosity':
                            begin
                              if Xval<0 then Xval:=0.00001;
                              if a2<0 then a2:=0.00001;
                              YvalFit:= a1*Power(Xval, (a2-1));
                            end;
                          'Arrhenius Equation':
                          begin
                            if Xval<0 then Xval:=0.00001;
                            if a2<0 then a2:=0.00001;
                            YvalFit:= a1*Exp(-a2/Xval);
                          end;



                       end;
                    rsum1:= rsum1+ (Yval-YvalSum/npoints)*(YvalFit-YvalFitSum/npoints);
                    rsum2:= rsum2+ (Yval-YvalSum/npoints)**2;
                    rsum3:= rsum3+ (YvalFit-YvalFitSum/npoints)**2;
                    //rsum1:= rsum1+ (YvalFit-Yval)**2;
                    //rsum2:= rsum2+ (Yval-YvalSum/npoints)**2;
                  end;
               end;
             end;
           rsquared:=rsum1/sqrt(rsum2*rsum3);








           // export results to new dataset in Grid
           a1r:= a1;
           a2r:= a2;
           a3r:= a3;
           a4r:= a4;
           a5r:= a5;
           Form1.StringGrid1.RowCount:= Form1.StringGrid1.RowCount+pointtot;
           for i:= 0 to pointtot-1 do
           begin

                 Xval:= Xpointstart + (Xpointend-Xpointstart)*i/pointtot;
                 Case ComboBox1.Caption of
                    'Average':
                        YvalFit:= a1;
                    'Linear':
                        YvalFit:= a1+a2*Xval;
                    'Quadratic':
                        YvalFit:= a1+a2*Xval+a3*IntPower(Xval,2);
                    'Cubic':
                        YvalFit:= a1+a2*Xval+a3*IntPower(Xval,2) +a4*IntPower(Xval,3);
                    'Polynomial (4th power)':
                        YvalFit:= a1+a2*Xval+a3*IntPower(Xval,2) +a4*IntPower(Xval,3)+a5*IntPower(Xval,4);
                    'Exponential':
                        YvalFit:= a1*Exp(a2*Xval);
                    'Logarhithmic(Natural)':
                      begin
                        if Xval<0 then Xval:=0.00001;
                        if a2<0 then a2:=0.00001;
                        YvalFit:= a1*LN(a2*Xval);
                      end;
                    'Logarhithmic(Base10)':
                      begin
                        if Xval<0 then Xval:=0.00001;
                        if a2<0 then a2:=0.00001;
                        YvalFit:= a1*Log10(a2*Xval);
                      end;
                    'Power Law':
                      begin
                        if Xval<0 then Xval:=0.00001;
                        if a2<0 then a2:=0.00001;
                        YvalFit:= a1*Power(Xval, a2);
                      end;
                    'Power Law for Viscosity':
                      begin
                        if Xval<0 then Xval:=0.00001;
                        if a2<0 then a2:=0.00001;
                        YvalFit:= a1*Power(Xval, (a2-1));
                      end;
                    'Arrhenius Equation':
                    begin
                      if Xval<0 then Xval:=0.00001;
                      if a2<0 then a2:=0.00001;
                      YvalFit:= a1*Exp(-a2/Xval);
                    end;


                 end;


                 Form1.StringGrid1.Cells[xcol, lastrow+i]:= FloattoStr(Xval);
                 Form1.StringGrid1.Cells[ycol, lastrow+i]:= FloattoStr(YvalFit);
                 Form1.StringGrid1.Cells[0, lastrow+i]:= InttoStr(i+1);
                 Form1.StringGrid1.Cells[1, lastrow+i]:= InttoStr(lastdataset+1);
                 Form1.StringGrid1.Cells[2, lastrow+i]:= ComboBox1.Caption+InttoStr(lastdataset+1);

           end;
           Form30.Edit2.Caption:= floattostr(a1);
           Form30.Edit3.Caption:= floattostr(a2);
           Form30.Edit4.Caption:= floattostr(a3);
           Form30.Edit5.Caption:= floattostr(a4);
           Form30.Edit6.Caption:= floattostr(a5);

           Form30.Memo1.Lines.add(ComboBox1.Caption + InttoStr(lastdataset+1));
           Form30.Memo1.Lines.add('a1=' +floattostr(a1));
           Form30.Memo1.Lines.add('a2=' +floattostr(a2));
           Form30.Memo1.Lines.add('a3=' +floattostr(a3));
           Form30.Memo1.Lines.add('a4=' +floattostr(a4));
           Form30.Memo1.Lines.add('a5=' +floattostr(a5));
           Form30.Memo1.Lines.add('r-squared= ' + floattostr(rsquared));



  Form1.RebuildChart();

end;








procedure TForm30.HideSearchBoxes();
begin
  Form30.Edit11.Visible:= false;
  Form30.Edit12.Visible:= false;
  Form30.Edit13.Visible:= false;
  Form30.Edit14.Visible:= false;
  Form30.Edit15.Visible:= false;
  Form30.Edit16.Visible:= false;
  Form30.Edit17.Visible:= false;
  Form30.Edit18.Visible:= false;
  Form30.Edit19.Visible:= false;
  Form30.Edit20.Visible:= false;

  Form30.Label15.Visible:= false;
  Form30.Edit10.Visible:= false;
  Form30.Label2.Visible:= false;
  Form30.Label16.Visible:= false;
  Form30.Label17.Visible:= false;
end;

procedure TForm30.ShowSearchBoxes();
begin
  Form30.Edit11.Visible:= true;
  Form30.Edit12.Visible:= true;
  Form30.Edit13.Visible:= true;
  Form30.Edit14.Visible:= true;
  Form30.Edit15.Visible:= true;
  Form30.Edit16.Visible:= true;
  Form30.Edit17.Visible:= true;
  Form30.Edit18.Visible:= true;
  Form30.Edit19.Visible:= true;
  Form30.Edit20.Visible:= true;

  Form30.Label15.Visible:= true;
  Form30.Edit10.Visible:= true;
  Form30.Label2.Visible:= true;
  Form30.Label16.Visible:= true;
  Form30.Label17.Visible:= true;

  Form30.Edit11.Caption:='0.001';
  Form30.Edit12.Caption:='0.001';
  Form30.Edit13.Caption:='0.001';
  Form30.Edit14.Caption:='0.001';
  Form30.Edit15.Caption:='0.001';
  Form30.Edit16.Caption:='10';
  Form30.Edit17.Caption:='10';
  Form30.Edit18.Caption:='10';
  Form30.Edit19.Caption:='10';
  Form30.Edit20.Caption:='10';

end;



procedure TForm30.ComboBox1Change(Sender: TObject);
begin
      // changed ComboBox1 for type of equation
    Case ComboBox1.Caption of
       'Average':
         begin
             Form30.Edit2.Caption:='1';
             Form30.Edit3.Caption:='0';
             Form30.Edit4.Caption:='0';
             Form30.Edit5.Caption:='0';
             Form30.Edit6.Caption:='0';
             Form30.Checkbox1.Checked:=true;
             Form30.Checkbox2.Checked:=false;
             Form30.Checkbox3.Checked:=false;
             Form30.Checkbox4.Checked:=false;
             Form30.Checkbox5.Checked:=false;

         end;
       'Linear':
         begin
             Form30.Edit2.Caption:='1';
             Form30.Edit3.Caption:='1';
             Form30.Edit4.Caption:='0';
             Form30.Edit5.Caption:='0';
             Form30.Edit6.Caption:='0';
             Form30.Edit2.Visible:=true;
             Form30.Edit3.Visible:=true;
             Form30.Edit4.Visible:=false;
             Form30.Edit5.Visible:=false;
             Form30.Edit6.Visible:=false;
             Form30.Checkbox1.Checked:=true;
             Form30.Checkbox2.Checked:=true;
             Form30.Checkbox3.Checked:=false;
             Form30.Checkbox4.Checked:=false;
             Form30.Checkbox5.Checked:=false;
             Form30.Checkbox1.Visible:=true;
             Form30.Checkbox2.Visible:=true;
             Form30.Checkbox3.Visible:=false;
             Form30.Checkbox4.Visible:=false;
             Form30.Checkbox5.Visible:=false;
             Form30.Memo1.Clear;
             Form30.Memo1.Lines.Add('Linear Model');
             Form30.Memo1.Lines.Add('y=a1+a2*x');
             Form30.Memo1.Lines.Add('a1: intercept');
             Form30.Memo1.Lines.Add('a2: slope');
             Form30.Memo1.Lines.Add('Solved Using Linear Least Squares');
             Form30.Image1.Picture.LoadFromFile('linear.png');
             HideSearchBoxes();

         end;
       'Quadratic':
         begin
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='1';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
           Form30.Edit2.Visible:=true;
           Form30.Edit3.Visible:=true;
           Form30.Edit4.Visible:=true;
           Form30.Edit5.Visible:=false;
           Form30.Edit6.Visible:=false;
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
           Form30.Checkbox3.Checked:=true;
           Form30.Checkbox4.Checked:=false;
           Form30.Checkbox5.Checked:=false;
           Form30.Checkbox1.Visible:=true;
           Form30.Checkbox2.Visible:=true;
           Form30.Checkbox3.Visible:=true;
           Form30.Checkbox4.Visible:=false;
           Form30.Checkbox5.Visible:=false;
           Form30.Memo1.Clear;
           Form30.Memo1.Lines.Add('Quadratic Model');
           Form30.Memo1.Lines.Add('y=a1+a2*x+a3*x^2');
           Form30.Image1.Picture.LoadFromFile('quadratic.png');
           ShowSearchBoxes();
         end;
       'Cubic':
         begin
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='1';
           Form30.Edit5.Caption:='1';
           Form30.Edit6.Caption:='0';
           Form30.Edit2.Visible:=true;
           Form30.Edit3.Visible:=true;
           Form30.Edit4.Visible:=true;
           Form30.Edit5.Visible:=true;
           Form30.Edit6.Visible:=false;
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
           Form30.Checkbox3.Checked:=true;
           Form30.Checkbox4.Checked:=true;
           Form30.Checkbox5.Checked:=false;
           Form30.Checkbox1.Visible:=true;
           Form30.Checkbox2.Visible:=true;
           Form30.Checkbox3.Visible:=true;
           Form30.Checkbox4.Visible:=true;
           Form30.Checkbox5.Visible:=false;
           Form30.Memo1.Clear;
           Form30.Memo1.Lines.Add('Cubic Model');
           Form30.Memo1.Lines.Add('y=a1+a2*x+a3*x^2+a4*x^3');
           Form30.Image1.Picture.LoadFromFile('cubic.png');
           ShowSearchBoxes();

         end;
       'Polynomial (4th power)':
         begin
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='1';
           Form30.Edit5.Caption:='1';
           Form30.Edit6.Caption:='1';
           Form30.Edit2.Visible:=true;
           Form30.Edit3.Visible:=true;
           Form30.Edit4.Visible:=true;
           Form30.Edit5.Visible:=true;
           Form30.Edit6.Visible:=true;
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
           Form30.Checkbox3.Checked:=true;
           Form30.Checkbox4.Checked:=true;
           Form30.Checkbox5.Checked:=true;
           Form30.Checkbox1.Visible:=true;
           Form30.Checkbox2.Visible:=true;
           Form30.Checkbox3.Visible:=true;
           Form30.Checkbox4.Visible:=true;
           Form30.Checkbox5.Visible:=true;
           Form30.Memo1.Clear;
           Form30.Memo1.Lines.Add('Polynomial (4th power) Model');
           Form30.Memo1.Lines.Add('y=a1+a2*x+a3*x^2+a4*x^3+a5*x^4');
           Form30.Image1.Picture.LoadFromFile('linear.png');
           ShowSearchBoxes();

         end;
       'Exponential':
         begin
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='0';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
           Form30.Edit2.Visible:=true;
           Form30.Edit3.Visible:=true;
           Form30.Edit4.Visible:=false;
           Form30.Edit5.Visible:=false;
           Form30.Edit6.Visible:=false;
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
           Form30.Checkbox3.Checked:=false;
           Form30.Checkbox4.Checked:=false;
           Form30.Checkbox5.Checked:=false;
           Form30.Checkbox1.Visible:=true;
           Form30.Checkbox2.Visible:=true;
           Form30.Checkbox3.Visible:=false;
           Form30.Checkbox4.Visible:=false;
           Form30.Checkbox5.Visible:=false;
           Form30.Memo1.Clear;
           Form30.Memo1.Lines.Add('Exponential Model');
           Form30.Memo1.Lines.Add('y=a1*exp(a2*x)');
           Form30.Image1.Picture.LoadFromFile('exponential.png');
           HideSearchBoxes();

         end;
       'Logarhithmic(Natural)':
         begin
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='0';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
           Form30.Edit2.Visible:=true;
           Form30.Edit3.Visible:=true;
           Form30.Edit4.Visible:=false;
           Form30.Edit5.Visible:=false;
           Form30.Edit6.Visible:=false;
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
           Form30.Checkbox3.Checked:=false;
           Form30.Checkbox4.Checked:=false;
           Form30.Checkbox5.Checked:=false;
           Form30.Checkbox1.Visible:=true;
           Form30.Checkbox2.Visible:=true;
           Form30.Checkbox3.Visible:=false;
           Form30.Checkbox4.Visible:=false;
           Form30.Checkbox5.Visible:=false;
           Form30.Memo1.Clear;
           Form30.Memo1.Lines.Add('Logarhithmic(Natural)');
           Form30.Memo1.Lines.Add('y=a1*LN(a2*x)');
           Form30.Image1.Picture.LoadFromFile('log.png');
           HideSearchBoxes();

         end;
       'Logarhithmic(Base10)':
         begin
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='0';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
           Form30.Edit2.Visible:=true;
           Form30.Edit3.Visible:=true;
           Form30.Edit4.Visible:=false;
           Form30.Edit5.Visible:=false;
           Form30.Edit6.Visible:=false;
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
           Form30.Checkbox3.Checked:=false;
           Form30.Checkbox4.Checked:=false;
           Form30.Checkbox5.Checked:=false;
           Form30.Checkbox1.Visible:=true;
           Form30.Checkbox2.Visible:=true;
           Form30.Checkbox3.Visible:=false;
           Form30.Checkbox4.Visible:=false;
           Form30.Checkbox5.Visible:=false;
           Form30.Memo1.Clear;
           Form30.Memo1.Lines.Add('Logarhithmic(Base10)');
           Form30.Memo1.Lines.Add('y=a1*Log10(a2*x)');
           Form30.Image1.Picture.LoadFromFile('log.png');
           HideSearchBoxes();

         end;
       'Power Law':
         begin
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='0';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
           Form30.Edit2.Visible:=true;
           Form30.Edit3.Visible:=true;
           Form30.Edit4.Visible:=false;
           Form30.Edit5.Visible:=false;
           Form30.Edit6.Visible:=false;
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
           Form30.Checkbox3.Checked:=false;
           Form30.Checkbox4.Checked:=false;
           Form30.Checkbox5.Checked:=false;
           Form30.Checkbox1.Visible:=true;
           Form30.Checkbox2.Visible:=true;
           Form30.Checkbox3.Visible:=false;
           Form30.Checkbox4.Visible:=false;
           Form30.Checkbox5.Visible:=false;
           Form30.Memo1.Clear;
           Form30.Memo1.Lines.Add('Power Law');
           Form30.Memo1.Lines.Add('y=a1*x^a2');
           Form30.Image1.Picture.LoadFromFile('exponential.png');
           HideSearchBoxes();

         end;
         'Arrhenius Equation':
         begin
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='0';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
           Form30.Edit2.Visible:=true;
           Form30.Edit3.Visible:=true;
           Form30.Edit4.Visible:=false;
           Form30.Edit5.Visible:=false;
           Form30.Edit6.Visible:=false;
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
           Form30.Checkbox3.Checked:=false;
           Form30.Checkbox4.Checked:=false;
           Form30.Checkbox5.Checked:=false;
           Form30.Checkbox1.Visible:=true;
           Form30.Checkbox2.Visible:=true;
           Form30.Checkbox3.Visible:=false;
           Form30.Checkbox4.Visible:=false;
           Form30.Checkbox5.Visible:=false;
           Form30.Memo1.Clear;
           Form30.Memo1.Lines.Add('Arrhenius Equation');
           Form30.Memo1.Lines.Add('y=a1*exp(-a2/x)');
           Form30.Image1.Picture.LoadFromFile('arrhenius.png');
           HideSearchBoxes();

         end;
         'Power Law for Viscosity':
         begin
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='0';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
           Form30.Edit2.Visible:=true;
           Form30.Edit3.Visible:=true;
           Form30.Edit4.Visible:=false;
           Form30.Edit5.Visible:=false;
           Form30.Edit6.Visible:=false;
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
           Form30.Checkbox3.Checked:=false;
           Form30.Checkbox4.Checked:=false;
           Form30.Checkbox5.Checked:=false;
           Form30.Checkbox1.Visible:=true;
           Form30.Checkbox2.Visible:=true;
           Form30.Checkbox3.Visible:=false;
           Form30.Checkbox4.Visible:=false;
           Form30.Checkbox5.Visible:=false;
           Form30.Memo1.Clear;
           Form30.Memo1.Lines.Add('Power Law for Viscosity');
           Form30.Memo1.Lines.Add('y=a1*x^(a2-1)');
           Form30.Memo1.Lines.Add('a1: plastic viscosity, K');
           Form30.Memo1.Lines.Add('a2: power law index, n');
           Form30.Image1.Picture.LoadFromFile('power law for viscosity.png');
           HideSearchBoxes();

         end;
         'Bingham Model for Viscosity':
         begin
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='0';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
           Form30.Edit2.Visible:=true;
           Form30.Edit3.Visible:=true;
           Form30.Edit4.Visible:=false;
           Form30.Edit5.Visible:=false;
           Form30.Edit6.Visible:=false;
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
           Form30.Checkbox3.Checked:=false;
           Form30.Checkbox4.Checked:=false;
           Form30.Checkbox5.Checked:=false;
           Form30.Checkbox1.Visible:=true;
           Form30.Checkbox2.Visible:=true;
           Form30.Checkbox3.Visible:=false;
           Form30.Checkbox4.Visible:=false;
           Form30.Checkbox5.Visible:=false;
           Form30.Memo1.Clear;
           Form30.Memo1.Lines.Add('Bingham Model for Viscosity');
           Form30.Memo1.Lines.Add('y=a1+a2/x');
           Form30.Memo1.Lines.Add('a1: plastic viscosity');
           Form30.Memo1.Lines.Add('a2: yield stress');
           Form30.Image1.Picture.LoadFromFile('bingham.png');
           ShowSearchBoxes();

         end;
         'Casson Model for Viscosity':
         begin
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='0';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
           Form30.Edit2.Visible:=true;
           Form30.Edit3.Visible:=true;
           Form30.Edit4.Visible:=false;
           Form30.Edit5.Visible:=false;
           Form30.Edit6.Visible:=false;
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
           Form30.Checkbox3.Checked:=false;
           Form30.Checkbox4.Checked:=false;
           Form30.Checkbox5.Checked:=false;
           Form30.Checkbox1.Visible:=true;
           Form30.Checkbox2.Visible:=true;
           Form30.Checkbox3.Visible:=false;
           Form30.Checkbox4.Visible:=false;
           Form30.Checkbox5.Visible:=false;
           Form30.Memo1.Clear;
           Form30.Memo1.Lines.Add('Casson Model for Viscosity');
           Form30.Memo1.Lines.Add('y=((sqr(a2)-sqr(a1*x))^2)/x');
           Form30.Memo1.Lines.Add('a1: plastic viscosity');
           Form30.Memo1.Lines.Add('a2: yield stress');
           Form30.Image1.Picture.LoadFromFile('bingham.png');
           ShowSearchBoxes();

         end;
         'Carreau-Yasuda Model for Viscosity':
         begin
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='1';
           Form30.Edit5.Caption:='1';
           Form30.Edit6.Caption:='1';
           Form30.Edit2.Visible:=true;
           Form30.Edit3.Visible:=true;
           Form30.Edit4.Visible:=true;
           Form30.Edit5.Visible:=false;
           Form30.Edit6.Visible:=false;
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
           Form30.Checkbox3.Checked:=true;
           Form30.Checkbox4.Checked:=true;
           Form30.Checkbox5.Checked:=true;
           Form30.Checkbox1.Visible:=true;
           Form30.Checkbox2.Visible:=true;
           Form30.Checkbox3.Visible:=true;
           Form30.Checkbox4.Visible:=true;
           Form30.Checkbox5.Visible:=true;
           Form30.Memo1.Clear;
           Form30.Memo1.Lines.Add('Carreau-Yasuda Model for Viscosity');
           Form30.Memo1.Lines.Add('y= a5+(a1-a5)*(1+(a2*x))^(a3))^((a4-1)/a3)');
           Form30.Memo1.Lines.Add('a1: zero shear viscosity');
           Form30.Memo1.Lines.Add('a2: transition index');
           Form30.Memo1.Lines.Add('a3: consistency');
           Form30.Memo1.Lines.Add('a4: shear thinning index');
           Form30.Memo1.Lines.Add('a5: infinite shear viscosity');
           Form30.Image1.Picture.LoadFromFile('carreau.png');
           ShowSearchBoxes();

         end;
         'Herschel-Bulkley Model for Viscosity':
         begin
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='1';
           Form30.Edit5.Caption:='1';
           Form30.Edit6.Caption:='0';
           Form30.Edit2.Visible:=true;
           Form30.Edit3.Visible:=true;
           Form30.Edit4.Visible:=true;
           Form30.Edit5.Visible:=true;
           Form30.Edit6.Visible:=false;
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
           Form30.Checkbox3.Checked:=true;
           Form30.Checkbox4.Checked:=true;
           Form30.Checkbox5.Checked:=false;
           Form30.Checkbox1.Visible:=true;
           Form30.Checkbox2.Visible:=true;
           Form30.Checkbox3.Visible:=true;
           Form30.Checkbox4.Visible:=true;
           Form30.Checkbox5.Visible:=false;
           Form30.Memo1.Clear;
           Form30.Memo1.Lines.Add('Herschel-Bulkley Model for Viscosity');
           Form30.Memo1.Lines.Add('y=(a2+a1*x^a3)/x');
           Form30.Memo1.Lines.Add('a1: plastic viscosity');
           Form30.Memo1.Lines.Add('a2: yield stress');
           Form30.Memo1.Lines.Add('a3: power law index');
           Form30.Image1.Picture.LoadFromFile('bingham.png');
           ShowSearchBoxes();

         end;
         'Briant Model for Viscosity':
         begin
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='1';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
           Form30.Edit2.Visible:=true;
           Form30.Edit3.Visible:=true;
           Form30.Edit4.Visible:=true;
           Form30.Edit5.Visible:=false;
           Form30.Edit6.Visible:=false;
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
           Form30.Checkbox3.Checked:=true;
           Form30.Checkbox4.Checked:=false;
           Form30.Checkbox5.Checked:=false;
           Form30.Checkbox1.Visible:=true;
           Form30.Checkbox2.Visible:=true;
           Form30.Checkbox3.Visible:=true;
           Form30.Checkbox4.Visible:=false;
           Form30.Checkbox5.Visible:=false;
           Form30.Memo1.Clear;
           Form30.Memo1.Lines.Add('Briant Model for Viscosity');
           Form30.Memo1.Lines.Add('y=a3*(1+a1/(a3*a2*x))^a2');
           Form30.Image1.Picture.LoadFromFile('bingham.png');
           ShowSearchBoxes();

         end;
         'Gompertz Sigmoid':
         begin
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='1';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
           Form30.Edit2.Visible:=true;
           Form30.Edit3.Visible:=true;
           Form30.Edit4.Visible:=true;
           Form30.Edit5.Visible:=false;
           Form30.Edit6.Visible:=false;
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
           Form30.Checkbox3.Checked:=true;
           Form30.Checkbox4.Checked:=false;
           Form30.Checkbox5.Checked:=false;
           Form30.Checkbox1.Visible:=true;
           Form30.Checkbox2.Visible:=true;
           Form30.Checkbox3.Visible:=true;
           Form30.Checkbox4.Visible:=false;
           Form30.Checkbox5.Visible:=false;
           Form30.Memo1.Clear;
           Form30.Memo1.Lines.Add('Gompertz Sigmoid');
           Form30.Memo1.Lines.Add('y=(a4+a1*exp(-a2*exp(-a3*x)))');
           Form30.Memo1.Lines.Add('a1: final plateau');
           Form30.Memo1.Lines.Add('a2: transition position');
           Form30.Memo1.Lines.Add('a3: transition speed');
           Form30.Memo1.Lines.Add('a4: initial plateau');
           Form30.Image1.Picture.LoadFromFile('sigmoid.png');
           ShowSearchBoxes();

         end;
         'Gauss Distribution':
         begin
           Form30.Edit2.Caption:='1';
           Form30.Edit3.Caption:='1';
           Form30.Edit4.Caption:='1';
           Form30.Edit5.Caption:='0';
           Form30.Edit6.Caption:='0';
           Form30.Edit2.Visible:=true;
           Form30.Edit3.Visible:=true;
           Form30.Edit4.Visible:=true;
           Form30.Edit5.Visible:=false;
           Form30.Edit6.Visible:=false;
           Form30.Checkbox1.Checked:=true;
           Form30.Checkbox2.Checked:=true;
           Form30.Checkbox3.Checked:=true;
           Form30.Checkbox4.Checked:=false;
           Form30.Checkbox5.Checked:=false;
           Form30.Checkbox1.Visible:=true;
           Form30.Checkbox2.Visible:=true;
           Form30.Checkbox3.Visible:=true;
           Form30.Checkbox4.Visible:=false;
           Form30.Checkbox5.Visible:=false;
           Form30.Memo1.Clear;
           Form30.Memo1.Lines.Add('Gauss Distribution');
           Form30.Memo1.Lines.Add('y=a4+a3/Sqr(2*3.14159265)/a1*Exp((-1/2/(a1)^2)*(x-a2)^2)');
           Form30.Memo1.Lines.Add('a1: standard deviation');
           Form30.Memo1.Lines.Add('a2: mean');
           Form30.Memo1.Lines.Add('a3: y scale factor');
           Form30.Memo1.Lines.Add('a4: y baseline');
           Form30.Image1.Picture.LoadFromFile('gauss.png');
           ShowSearchBoxes();

         end;

    end;
end;

end.

