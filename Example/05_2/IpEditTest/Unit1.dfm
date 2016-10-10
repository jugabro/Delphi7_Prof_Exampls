object Form1: TForm1
  Left = 420
  Top = 223
  Width = 279
  Height = 211
  Caption = 'DemoCustomComponent'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object IPEdit1: TIPEdit
    Left = 7
    Top = 150
    Width = 170
    Height = 21
    TabOrder = 0
    TabStop = True
    IPString = '0.0.0.0'
  end
  object Button1: TButton
    Left = 8
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Set'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 96
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Get'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 184
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '192'
  end
  object Edit2: TEdit
    Left = 8
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '168'
  end
  object Edit3: TEdit
    Left = 8
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 6
    Text = '0'
  end
  object Edit4: TEdit
    Left = 8
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 7
    Text = '0'
  end
end
