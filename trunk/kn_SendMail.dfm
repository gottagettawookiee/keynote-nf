�
 TFORM_MAIL 0^  TPF0
TForm_Mail	Form_MailLeft�TopHelpContext�BorderStylebsDialogCaptionSend note via E-mailClientHeight<ClientWidth�Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
KeyPreview	OldCreateOrder	PositionpoScreenCenter
OnActivateFormActivateOnClose	FormCloseOnCloseQueryFormCloseQueryOnCreate
FormCreate	OnKeyDownFormKeyDownPixelsPerInch`
TextHeight TLabelLabel_StatusLeftTopWidth0HeightCaptionReady.Font.CharsetDEFAULT_CHARSET
Font.ColorclHighlightFont.Height�	Font.NameCourier New
Font.StylefsBold 
ParentFont  TButton	Button_OKLeftTopWidthKHeightHintAccept settings and send noteCaption&E-mail noteDefault	TabOrder OnClickButton_OKClick  TButtonButton_CancelLeftbTopWidthKHeightHint&Close dialog box without sending emailCaptionCancelTabOrderOnClickButton_CancelClick  TPageControlPagesLeftTopWidth�Height� 
ActivePageTab_SendTabOrder 	TTabSheetTab_SendCaptionMessage settingsExplicitLeftExplicitTop 	TGroupBoxGroupBox_SourceLeftTop Width HeightmCaption What to send? TabOrder  TRadioButton
RB_CurrentLeftTopWidth� HeightHint Email only currently active noteCaption&Current noteChecked	TabOrder TabStop	  TRadioButtonRB_AllLeftTop(Width� HeightHint&Email ALL notes in currently open fileCaption
&All notesTabOrder  TRadioButtonRB_FileLeftTop<Width� HeightHintEmail the whole KeyNote fileCaption)&Whole file (recipient must have KeyNote)TabOrder  	TCheckBoxCheckBox_ExcludeHiddenNodesLeftTopSWidth� HeightHintDon't export nodes hiddenCaptionExclude &hidden nodesTabOrder   	TGroupBox	GroupBox1LeftTop Width� HeightmCaption Format TabOrder TLabelLabel7Left
TopFWidth4HeightCaption
C&odepage:FocusControlCombo_Charset  TRadioButtonRB_PlainTextLeft
TopWidthqHeightHint%Send note text without RTF formattingCaptionAs &plain text (inline)Checked	TabOrder TabStop	  TRadioButtonRB_RTFLeft
Top(Width� HeightHint"Send formatted text as an RTF fileCaptionAs &RTF (attachment)TabOrder  	TComboBoxCombo_CharsetLeftFTopAWidth~HeightHint)Codepage (KeyNote performs NO conversion)
ItemHeightTabOrderItems.Strings
ISO-8859-1
ISO-8859-2
ISO-8859-5
ISO-8859-9Windows-1250Windows-1251Windows-1253    	TGroupBox	GroupBox2LeftTopsWidth�HeighteCaption Message information TabOrder TLabelLabel1LeftTopWidthHeightCaption&To:FocusControlCombo_TO  TLabelLabel2LeftTopKWidth'HeightCaption	&Subject:FocusControlEdit_Subject  TLabelLabel3LeftTop2WidthHeightCaption&Cc:FocusControlCombo_CC  	TComboBoxCombo_TOLeft<TopWidth�HeightHint.Enter recipient's address, or select from list
ItemHeightTabOrder   TEditEdit_SubjectLeft<TopFWidth�HeightHint+Enter the Subject line for the mail messageTabOrder  	TComboBoxCombo_CCLeft<Top-Width�HeightHint1Enter additional address(es), or select from list
ItemHeightTabOrder    	TTabSheetTab_SMTPCaptionSMTP server settingsExplicitHeight�  	TGroupBox	GroupBox3LeftTop Width�Height� TabOrder  TLabelLabel4LeftTopWidthAHeightCaption&SMTP server:FocusControlEdit_SMTPServer  TLabelLabel5LeftcTopWidthHeightCaption&Port:FocusControl	Edit_Port  TLabelLabel6LeftTopFWidthzHeightCaption&From (your email address):FocusControl	Edit_From  TLabelLabel8LeftTopsWidth|HeightCaption&Text to place before notesFocusControlEdit_FirstLine  TEditEdit_SMTPServerLeftTop#Width2HeightHint2Name of email server used for dispatching messages	MaxLengthTabOrder   TEdit	Edit_PortLeftcTop#Width3HeightHint(Mail server port number (or type "smtp")	MaxLengthTabOrder  TEdit	Edit_FromLeftTopUWidth2HeightHint%Your email address (The "From" field)	MaxLengthTabOrder  	TCheckBoxCheckBox_LogLeftTop� Width� HeightHint,Keep a log of communication with SMTP serverCaption&Log exchange with SMTP serverTabOrder  TEditEdit_FirstLineLeftTop� Width2HeightHint6Optional text to be placed in the message before notes	MaxLengthTabOrder     TButtonButton_HelpLeft� TopWidthKHeightCaption&HelpTabOrderOnClickButton_HelpClick  TSmtpCliSmtpCliTag 	LocalAddr0.0.0.0PortsmtpAuthTypesmtpAuthNoneCharSet
iso-8859-1ContentTypesmtpPlainText
OwnHeaders	OnDisplaySmtpCliDisplayOnHeaderLineSmtpCliHeaderLineOnRequestDoneSmtpCliRequestDoneLeft�Top  TGFLogGFLogActive	MaxLines	DateStamp	TimeStamp	UniqueFileNameAppendToFile	
ShowErrors	DeactivateOnError	Separator----- LOG SESSION ENDS -----Left�Top   