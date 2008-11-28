
(* ************************************************************
 KEYNOTE: MOZILLA PUBLIC LICENSE STATEMENT.
 -----------------------------------------------------------
 The contents of this file are subject to the Mozilla Public
 License Version 1.1 (the "License"); you may not use this file
 except in compliance with the License. You may obtain a copy of
 the License at http://www.mozilla.org/MPL/

 Software distributed under the License is distributed on an "AS
 IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
 implied. See the License for the specific language governing
 rights and limitations under the License.

 The Original Code is KeyNote 1.0.

 The Initial Developer of the Original Code is Marek Jedlinski
 <eristic@lodz.pdi.net> (Poland).
 Portions created by Marek Jedlinski are
 Copyright (C) 2000, 2001. All Rights Reserved.
 -----------------------------------------------------------
 Contributor(s):
 -----------------------------------------------------------
 History:
 -----------------------------------------------------------
 Released: 30 June 2001
 -----------------------------------------------------------
 URLs:

 - for OpenSource development:
 http://keynote.sourceforge.net

 - original author's software site:
 http://www.lodz.pdi.net/~eristic/free/index.html
 http://go.to/generalfrenetics

 Email addresses (at least one should be valid)
 <eristic@lodz.pdi.net>
 <cicho@polbox.com>
 <cicho@tenbit.pl>

************************************************************ *)

unit kn_Glossary;

interface

uses
  Windows, Messages, SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, kn_ExpTermDef,
  kn_ExpandObj, kn_Info, Placemnt, ExtCtrls;

type
  TForm_Glossary = class(TForm)
    FormPlacement: TFormPlacement;
    Panel1: TPanel;
    Button_OK: TButton;
    Button_Cancel: TButton;
    Button_New: TButton;
    Button_Edit: TButton;
    Button_Del: TButton;
    Panel2: TPanel;
    LV: TListView;
    Button_Help: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Button_NewClick(Sender: TObject);
    procedure Button_EditClick(Sender: TObject);
    procedure Button_OKClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button_DelClick(Sender: TObject);
    procedure Button_HelpClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    OK_Click : boolean;
    procedure EditTerm( const NewTerm : boolean );
    procedure DeleteTerm;
    procedure UpdateCount;
  end;


implementation

{$R *.DFM}


procedure TForm_Glossary.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {
  case key of
    27 : if ( Shift = [] ) then
    begin
      key := 0;
      ModalResult := mrCancel;
    end;
  end;
  }
end; // KeyDown

procedure TForm_Glossary.FormCreate(Sender: TObject);
var
  item : TListItem;
  i : integer;
  name, value : string;
begin

  OK_Click := false;

  with FormPlacement do
  begin
    UseRegistry := _FORMPOS_USE_REGISTRY;
    IniFileName := _FORMPOS_INIFILENAME;
  end;

  GlossaryList.BeginUpdate;
  try
    if ( GlossaryList.Count > 0 ) then
    begin
      for i := 0 to pred( GlossaryList.Count ) do
      begin
        name := GlossaryList.Names[i];
        value := GlossaryList.Values[name];
        item := LV.Items.Add;
        item.caption := name;
        item.subitems.add( value );
      end;
    end;
  finally
    GlossaryList.EndUpdate;
    UpdateCount;
  end;

end; // CREATE

procedure TForm_Glossary.EditTerm( const NewTerm : boolean );
var
  Form_Term : TForm_TermDef;
  namestr, valuestr : string;
  item, dupItem : TListItem;
  i : integer;
begin

  item := nil;

  if NewTerm then
  begin
    namestr := '';
    valuestr := '';
  end
  else
  begin
    item := LV.Selected;

    if (( not assigned( item )) or
        ( LV.Items.Count = 0 )) then
    begin
      messagedlg( 'No item selected.', mtInformation, [mbOK], 0 );
      exit;
    end;

    namestr := item.caption;
    valuestr := item.subitems[0];

  end;


  Form_Term := TForm_TermDef.Create( self );
  try
    with Form_Term do
    begin
      Edit_Term.Text := namestr;
      Edit_Exp.Text := valuestr;
    end;
    if ( Form_Term.ShowModal = mrOK ) then
    begin
      with Form_Term do
      begin
        namestr := Edit_Term.Text;
        valuestr := Edit_Exp.Text;
      end;
      if (( namestr = '' ) or ( valuestr = '' )) then
      begin
        messagedlg( 'Shortcut term and its expanded definition cannot be blank.', mtError, [mbOK], 0 );
        exit;
      end;

      dupItem := nil;
      if NewTerm then
      begin
        if ( LV.Items.Count > 0 ) then
        begin
          for i := 0 to pred( LV.Items.Count ) do
          begin
            if ( LV.Items[i].Caption = namestr ) then
            begin
              dupItem := LV.Items[i];
              break;
            end;
          end;
        end;
        if assigned( dupItem ) then
        begin
          if ( messagedlg( Format(
              'Glossary term already exists: "%s" -> "%s". OK to redefine term as "%s"?',
              [namestr,dupItem.subitems[0] ,valuestr] ),
              mtConfirmation, [mbYes,mbNo], 0 ) <> mrYes ) then
          exit;
          item := dupItem;
        end;
      end;

      try
        if ( item = nil ) then
          item := LV.Items.Add;
        item.caption := namestr;
        item.subitems.Clear;
        item.subitems.Add( valuestr );
        LV.Selected := item;
      except
        on E : Exception do
          messagedlg( E.Message, mtError, [mbOK], 0 );
      end;

    end;
  finally
    Form_Term.Free;
  end;

  LV.SetFocus;
  UpdateCount;

end; // EditTerm

procedure TForm_Glossary.DeleteTerm;
var
  item : TListItem;
begin
  item := LV.Selected;

  if ( not assigned( item )) then
  begin
    messagedlg( 'No item selected.', mtInformation, [mbOK], 0 );
    exit;
  end;

  LV.Items.Delete( LV.Items.IndexOf( item ));
  UpdateCount;

end; // DeleteTerm

procedure TForm_Glossary.Button_NewClick(Sender: TObject);
begin
  EditTerm( true );
end;

procedure TForm_Glossary.Button_EditClick(Sender: TObject);
begin
  EditTerm( false );
end;

procedure TForm_Glossary.Button_OKClick(Sender: TObject);
begin
  OK_Click := true;
end;

procedure TForm_Glossary.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  i : integer;
  item : TListItem;
begin
  if OK_Click then
  begin
    try
      try
        GlossaryList.Sorted := false;
        GlossaryList.Clear;

        for i := 0 to pred( LV.Items.Count ) do
        begin
          item := LV.Items[i];
          GlossaryList.Add( Format( '%s=%s', [item.caption, item.subitems[0]] ));
        end;

      finally
        GlossaryList.Sorted := true;
      end;
      GlossaryList.SaveToFile( Glossary_FN );
    except
      on E : Exception do
        messagedlg( 'Error saving Glossary list: ' +
          E.Message, mtError, [mbOK], 0 );
    end;

  end;
end;

procedure TForm_Glossary.Button_DelClick(Sender: TObject);
begin
  DeleteTerm;
  LV.SetFocus;
end;

procedure TForm_Glossary.UpdateCount;
begin
  Caption := Format( 'Glossary terms: %d', [LV.Items.Count] );
end; // UpdateCount


procedure TForm_Glossary.Button_HelpClick(Sender: TObject);
begin
  Application.HelpCommand( HELP_CONTEXT, self.HelpContext );
end;

procedure TForm_Glossary.FormActivate(Sender: TObject);
begin
  OnActivate := nil;
  try
    if ( LV.Items.Count > 0 ) then
    begin
      LV.Selected := LV.Items[0];
      LV.ItemFocused := LV.Selected;
    end;
  except
  end;
end;

end.
