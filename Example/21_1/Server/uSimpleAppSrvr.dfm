object fmMain: TfmMain
  Left = 266
  Top = 211
  Width = 385
  Height = 171
  Caption = 'Simple Remote Server'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 377
    Height = 105
    Align = alTop
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 105
    Width = 377
    Height = 39
    Align = alClient
    TabOrder = 1
    object bbClose: TBitBtn
      Left = 288
      Top = 6
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkClose
    end
  end
end
