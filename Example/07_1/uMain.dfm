object MainForm: TMainForm
  Left = 225
  Top = 141
  Width = 499
  Height = 435
  Caption = 'DemoList'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  PixelsPerInch = 96
  TextHeight = 13
  object ListBtn: TBitBtn
    Left = 8
    Top = 8
    Width = 113
    Height = 25
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1087#1080#1089#1086#1082
    TabOrder = 0
    OnClick = ListBtnClick
  end
  object ClearBtn: TBitBtn
    Left = 128
    Top = 8
    Width = 113
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077
    TabOrder = 1
    OnClick = ClearBtnClick
  end
  object DelBtn: TBitBtn
    Left = 248
    Top = 8
    Width = 113
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
    TabOrder = 2
    OnClick = DelBtnClick
  end
  object SortBtn: TBitBtn
    Left = 368
    Top = 8
    Width = 113
    Height = 25
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 3
    OnClick = SortBtnClick
  end
end
