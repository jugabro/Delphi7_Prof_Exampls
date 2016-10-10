object fmMain: TfmMain
  Left = 192
  Top = 107
  Width = 407
  Height = 120
  Caption = 'Value of Pi'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 168
    Top = 16
    Width = 60
    Height = 13
    Caption = 'Built-in value'
  end
  object Label2: TLabel
    Left = 168
    Top = 40
    Width = 77
    Height = 13
    Caption = 'Computed value'
  end
  object laBuiltIn: TLabel
    Left = 256
    Top = 16
    Width = 48
    Height = 13
    Caption = '00000000'
  end
  object laValue: TLabel
    Left = 256
    Top = 40
    Width = 48
    Height = 13
    Caption = '00000000'
  end
  object laIterNum: TLabel
    Left = 168
    Top = 64
    Width = 48
    Height = 13
    Caption = '00000000'
  end
  object cbCalculate: TCheckBox
    Left = 24
    Top = 40
    Width = 97
    Height = 17
    Caption = 'Compute Pi'
    TabOrder = 0
    OnClick = cbCalculateClick
  end
end
