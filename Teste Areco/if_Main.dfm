﻿object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'Formul'#225'rio Principal'
  ClientHeight = 363
  ClientWidth = 801
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Pnl_Botoes: TPanel
    Left = 0
    Top = 0
    Width = 801
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    Color = 16441038
    ParentBackground = False
    TabOrder = 0
    object Lbl_Informação: TLabel
      Left = 5
      Top = 61
      Width = 287
      Height = 13
      Caption = 'Double clique no registro para visualizar os dados completos'
    end
    object BtnNovo: TButton
      Left = 5
      Top = 8
      Width = 90
      Height = 25
      Caption = 'Novo [F2]'
      TabOrder = 0
      OnClick = BtnNovoClick
    end
    object BtnEditar: TButton
      Left = 96
      Top = 8
      Width = 90
      Height = 25
      Caption = 'Editar [F3]'
      TabOrder = 1
      OnClick = BtnEditarClick
    end
    object BtnExcluir: TButton
      Left = 187
      Top = 8
      Width = 90
      Height = 25
      Caption = 'Excluir [F4]'
      TabOrder = 2
      OnClick = BtnExcluirClick
    end
  end
  object GrdProdutos: TDBGrid
    Left = 0
    Top = 81
    Width = 801
    Height = 282
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = GrdProdutosDblClick
    Columns = <
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'Descri'#231#227'o'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'Data Cadastro'
        Width = 150
        Visible = True
      end>
  end
end
