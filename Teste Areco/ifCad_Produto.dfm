object fCad_Produto: TfCad_Produto
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Cadastro/Edi'#231#227'o de Produto [ESC] para sair'
  ClientHeight = 228
  ClientWidth = 487
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Pnl_Principal: TPanel
    Left = 0
    Top = 0
    Width = 487
    Height = 228
    Align = alClient
    Color = 16441038
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 11
      Height = 13
      Caption = 'ID'
    end
    object Label2: TLabel
      Left = 8
      Top = 77
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label3: TLabel
      Left = 234
      Top = 48
      Width = 70
      Height = 13
      Caption = 'Data Cadastro'
    end
    object Label4: TLabel
      Left = 8
      Top = 104
      Width = 68
      Height = 13
      Caption = 'Vl. Unit'#225'rio R$'
    end
    object Label5: TLabel
      Left = 8
      Top = 131
      Width = 58
      Height = 13
      Caption = 'Observa'#231#227'o'
    end
    object Ed_Descricao: TEdit
      Left = 80
      Top = 74
      Width = 361
      Height = 21
      TabOrder = 2
      Text = 'Ed_Descricao'
    end
    object Pnl_Botoes: TPanel
      Left = 1
      Top = 1
      Width = 485
      Height = 40
      Align = alTop
      BevelOuter = bvNone
      Color = 16441038
      ParentBackground = False
      TabOrder = 5
      object BtnGravar: TButton
        Left = 7
        Top = 6
        Width = 90
        Height = 25
        Caption = 'Gravar [F10]'
        TabOrder = 0
        OnClick = BtnGravarClick
      end
      object BtnCancelar: TButton
        Left = 100
        Top = 6
        Width = 90
        Height = 25
        Caption = 'Cancelar [F9]'
        TabOrder = 1
        OnClick = BtnCancelarClick
      end
    end
    object Ed_ID: TEdit
      Left = 80
      Top = 48
      Width = 81
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      Text = 'Ed_ID'
    end
    object Ed_DataCadastro: TEdit
      Left = 318
      Top = 48
      Width = 123
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      Text = 'Ed_ID'
    end
    object Ed_ValorUnitario: TEdit
      Left = 80
      Top = 101
      Width = 81
      Height = 21
      TabOrder = 3
      Text = 'Ed_Descricao'
    end
    object Mm_Observacao: TMemo
      Left = 80
      Top = 128
      Width = 361
      Height = 89
      ScrollBars = ssVertical
      TabOrder = 4
    end
  end
end
