object f_Main: Tf_Main
  Left = 271
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Servidor REST'
  ClientHeight = 44
  ClientWidth = 482
  Color = 16441038
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 201
    Top = 11
    Width = 26
    Height = 13
    Caption = 'Porta'
  end
  object ButtonStart: TButton
    Left = 9
    Top = 8
    Width = 90
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = ButtonStartClick
  end
  object ButtonStop: TButton
    Left = 101
    Top = 8
    Width = 90
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = ButtonStopClick
  end
  object EditPort: TEdit
    Left = 234
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '8080'
  end
  object ButtonOpenBrowser: TButton
    Left = 364
    Top = 8
    Width = 107
    Height = 25
    Caption = 'Abrir Navegador'
    TabOrder = 3
    OnClick = ButtonOpenBrowserClick
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 504
    Top = 8
  end
end
