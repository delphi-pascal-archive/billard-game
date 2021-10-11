object Form1: TForm1
  Left = 30
  Top = 10
  Width = 758
  Height = 527
  Caption = 'Billiard'
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnMouseDown = FormMouseDown
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object MediaPlayer1: TMediaPlayer
    Left = 416
    Top = 216
    Width = 253
    Height = 30
    Enabled = False
    Visible = False
    TabOrder = 0
  end
  object MediaPlayer2: TMediaPlayer
    Left = 416
    Top = 280
    Width = 253
    Height = 30
    Enabled = False
    Visible = False
    TabOrder = 1
  end
  object MediaPlayer3: TMediaPlayer
    Left = 416
    Top = 352
    Width = 253
    Height = 30
    Visible = False
    TabOrder = 2
  end
  object MediaPlayer4: TMediaPlayer
    Left = 416
    Top = 416
    Width = 253
    Height = 30
    Enabled = False
    Visible = False
    TabOrder = 3
  end
end
