unit Vosmi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Ch1: TLabel;
    Panel3: TPanel;
    C: TBitBtn;
    Plus: TBitBtn;
    Minus: TBitBtn;
    Umnogit: TBitBtn;
    Razdelit: TBitBtn;
    UdalitSm: TBitBtn;
    Label1: TLabel;
    Seven: TBitBtn;
    Four: TBitBtn;
    Five: TBitBtn;
    Six: TBitBtn;
    One: TBitBtn;
    Two: TBitBtn;
    Three: TBitBtn;
    Zero: TBitBtn;
    Ravno: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure CClick(Sender: TObject);
{    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);}
    procedure ZeroClick(Sender: TObject);
    procedure OneClick(Sender: TObject);
    procedure TwoClick(Sender: TObject);
    procedure ThreeClick(Sender: TObject);
    procedure FourClick(Sender: TObject);
    procedure FiveClick(Sender: TObject);
    procedure SixClick(Sender: TObject);
    procedure SevenClick(Sender: TObject);
    procedure UdalitSmClick(Sender: TObject);
    procedure RazdelitClick(Sender: TObject);
    procedure UmnogitClick(Sender: TObject);
    procedure MinusClick(Sender: TObject);
    procedure PlusClick(Sender: TObject);
    procedure RavnoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CClickExecute;
    procedure RavnoClickExecute;
    procedure UdalitSmClickExecute;
    procedure CifrClickExecute(Cifr :char);
    procedure ZeroClickExecute;
    procedure ZnakClickExecute(pZnak: char);
  end;

var
  Form1: TForm1;
  a,b,m,kol : real;
  k,Znak,koda,kodb :string;
  l,Ravn:integer;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Znak:='';
  Panel1.Caption:='';
  Panel2.Caption:='';
  Panel3.Caption:='';
  Ch1.Caption:='0';
end;
procedure TForm1.CClickExecute;
begin
  Ch1.Caption:='0';
  Znak:='';
end;

procedure TForm1.CClick(Sender: TObject);
begin
  CClickExecute;
end;

{procedure TForm1.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  Str(Msg.CharCode, s);
  ShowMessage(s+'-'+chr(Msg.CharCode));
  Ch1.Caption:=ch1.Caption+chr(Msg.CharCode);
  Handled:=true;
  if Msg.CharCode = 1 then begin
      Ch1.Caption:='F2';
      Handled:=true;
  end;
end; }

procedure TForm1.ZeroClickExecute;
begin
  if Ravn>0 then begin
    Ch1.Caption:='0';
    Ravn:=0;
  end;
  if Znak='' then begin
    if (Length(Ch1.Caption)<9) and (Ch1.Caption<>'0') then Ch1.Caption:=Ch1.Caption+'0'
       else MessageBeep(mb_IconHand);
  end else begin
       k:=Ch1.Caption;
       if pos('/',k)>0 then begin
          MessageBeep(mb_IconHand);
        end else if pos('-',k)>0 then begin
              Ch1.Caption:='0';
            end else if pos('+',k)>0 then begin
                  Ch1.Caption:='0'
                end else if pos('*',k)>0 then begin
                      Ch1.Caption:='0'
                    end else if (Length(Ch1.Caption)<9) and (Ch1.Caption<>'0') then Ch1.Caption:=Ch1.Caption+'0'
                               else MessageBeep(mb_IconHand);
      end;
  Form1.ActiveControl:=Ravno;
end;

procedure TForm1.ZeroClick(Sender: TObject);
begin
  ZeroClickExecute;
end;

procedure TForm1.CifrClickExecute(Cifr :char);
begin
  if Ravn>0 then begin
    Ch1.Caption:='0';
    Ravn:=0;
  end;
  if Znak='' then begin
    if Length(Ch1.Caption)<9 then begin
      if Ch1.Caption='0' then Ch1.Caption:=Cifr
        else Ch1.Caption:=Ch1.Caption+Cifr end
      else MessageBeep(mb_IconHand);
   end else begin
       k:=Ch1.Caption;
       if pos('/',k)>0 then begin
         Ch1.Caption:=Cifr
        end else if pos('-',k)>0 then begin
              Ch1.Caption:=Cifr
            end else if pos('+',k)>0 then begin
                  Ch1.Caption:=Cifr
                end else if pos('*',k)>0 then begin
                      Ch1.Caption:=Cifr
                    end else if (Length(Ch1.Caption)<9) and (Ch1.Caption<>'0') then Ch1.Caption:=Ch1.Caption+Cifr
                               else MessageBeep(mb_IconHand);
      end;
  Form1.ActiveControl:=Ravno;
end;

procedure TForm1.OneClick(Sender: TObject);
begin
  CifrClickExecute('1');
end;

procedure TForm1.TwoClick(Sender: TObject);
begin
  CifrClickExecute('2');
end;

procedure TForm1.ThreeClick(Sender: TObject);
begin
  CifrClickExecute('3');
end;

procedure TForm1.FourClick(Sender: TObject);
begin
  CifrClickExecute('4');
end;

procedure TForm1.FiveClick(Sender: TObject);
begin
   CifrClickExecute('5');
end;

procedure TForm1.SixClick(Sender: TObject);
begin
  CifrClickExecute('6');
end;

procedure TForm1.SevenClick(Sender: TObject);
begin
  CifrClickExecute('7');
end;

procedure TForm1.UdalitSmClickExecute;
begin
  k:=Ch1.Caption;
  if pos('/',k)>0 then begin
    Znak:='';
    delete(k,Length(Ch1.Caption),1);
  end else if pos('-',k)>0 then begin
        Znak:='';
        delete(k,Length(Ch1.Caption),1);
      end else if pos('+',k)>0 then begin
          Znak:='';
          delete(k,Length(Ch1.Caption),1);
          end else if pos('*',k)>0 then begin
              Znak:='';
              delete(k,Length(Ch1.Caption),1);
              end else if Length(k)=1 then k:='0'
                         else delete(k,Length(Ch1.Caption),1);
  Ch1.Caption:=k;
end;

procedure TForm1.UdalitSmClick(Sender: TObject);
begin
  UdalitSmClickExecute;
end;

procedure TForm1.ZnakClickExecute(pZnak: char);
begin
  if Ravn>0 then Ravn:=0;
    If Znak='' then begin
      a:=StrToFloat(Ch1.Caption);
      Znak:=pZnak;
      Ch1.Caption:=Ch1.Caption+pZnak;
    end else begin
      Znak:=pZnak;
      k:=Ch1.Caption;
      delete(k,Length(Ch1.Caption),1);
      a:=StrToFloat(k);
      Ch1.Caption:=k+pZnak;
    end;
  Form1.ActiveControl:=Ravno;
end;

procedure TForm1.RazdelitClick(Sender: TObject);
begin
  ZnakClickExecute('/');
end;

procedure TForm1.UmnogitClick(Sender: TObject);
begin
  ZnakClickExecute('*');
end;

procedure TForm1.MinusClick(Sender: TObject);
begin
  ZnakClickExecute('-');
end;

procedure TForm1.PlusClick(Sender: TObject);
begin
  ZnakClickExecute('+');
end;

procedure TForm1.RavnoClickExecute;
var
  i,x1,x2:integer;
  o,t:real;
  n, z:string;
begin
  koda:=FloatToStr(a);
  a:=0;
    for i:=1 to Length(koda) do begin
      n:=copy(koda,i,1);
      t:=StrToFloat(n);
      o:=Length(koda)-i;
      a:=a+t*exp(o*ln(8));
    end;
  if ((pos('/',Ch1.Caption)>0) or (pos('*',Ch1.Caption)>0) or (pos('+',Ch1.Caption)>0) or (pos('-',Ch1.Caption)>0)) then begin
    MessageBeep(mb_IconHand);
    Exit;
  end else begin
    Ravn:=1;
    b:=StrToFloat(Ch1.Caption);
    koda:=FloatToStr(b);
    b:=0;
    for i:=1 to Length(koda) do begin
      n:=copy(koda,i,1);
      t:=StrToFloat(n);
      o:=Length(koda)-i;
      b:=b+t*exp(o*ln(8));
    end;
  end;
  if Znak='+' then m:=a+b;
  if Znak='-' then m:=a-b;
  if Znak='*' then m:=a*b;
  if Znak='/' then m:=a/b;
  if Frac(m)<>0 then begin
    m:=Int(m);
  end;
  n:=FloatToStr(m);
  x2:=StrToInt(n);
  n:='';
  while x2>7  do begin
    x1:=x2 mod 8;
    n:=n+FloatToStr(x1);
    x2:=x2 div 8;
  end;
  n:=n+FloatToStr(x2);
  z:='';
  Ch1.Caption:='';
  for i:=length(n) downto 1 do begin
    x1:=length(n)-i;
    Ch1.Caption:= Ch1.Caption+n[i];
   end;
  Znak:='';
end;

procedure TForm1.RavnoClick(Sender: TObject);
begin
  RavnoClickExecute;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Ord(key) of
    27:  CClickExecute;
    13:  RavnoClickExecute;
    8:   UdalitSmClickExecute;
    48:  ZeroClickExecute;
    49..55: CifrClickExecute(key);
    43: ZnakClickExecute(key);
    45: ZnakClickExecute(key);
    42: ZnakClickExecute(key);
    47: ZnakClickExecute(key);
  end;
end;

end.
