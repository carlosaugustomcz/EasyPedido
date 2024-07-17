object Dm: TDm
  OnCreate = DataModuleCreate
  Height = 309
  Width = 442
  object Conn: TFDConnection
    Params.Strings = (
      'Database=D:\EasyPedido\FontesServidor\DB\banco.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    BeforeConnect = ConnBeforeConnect
    Left = 72
    Top = 40
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 264
    Top = 48
  end
end
