object DMOtr_ServerContainer: TDMOtr_ServerContainer
  OldCreateOrder = False
  Height = 94
  Width = 415
  object DSServerPrincipal: TDSServer
    Left = 176
    Top = 19
  end
  object DSAuthenticationManager: TDSAuthenticationManager
    OnUserAuthenticate = DSAuthenticationManagerUserAuthenticate
    OnUserAuthorize = DSAuthenticationManagerUserAuthorize
    Roles = <>
    Left = 56
    Top = 21
  end
  object DSServerClass: TDSServerClass
    OnGetClass = DSServerClassGetClass
    Server = DSServerPrincipal
    LifeCycle = 'Invocation'
    Left = 280
    Top = 19
  end
end
