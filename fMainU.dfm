object fMain: TfMain
  Left = 0
  Top = 0
  ClientHeight = 511
  ClientWidth = 1129
  Color = clBtnFace
  Constraints.MaxHeight = 550
  Constraints.MaxWidth = 1145
  Constraints.MinHeight = 550
  Constraints.MinWidth = 1145
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    1129
    511)
  PixelsPerInch = 96
  TextHeight = 13
  object spdBtnContUpd: TSpeedButton
    Left = 88
    Top = 185
    Width = 145
    Height = 47
    Caption = 'Update'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnCardUpdClick
  end
  object spdBtnCatUpd: TSpeedButton
    Left = 312
    Top = 255
    Width = 145
    Height = 47
    Caption = 'Categories'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnCatUpdClick
  end
  object spdBtnMemberUpdate: TSpeedButton
    Left = 646
    Top = 185
    Width = 145
    Height = 47
    Caption = 'Update'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnMemberUpdateClick
  end
  object spdBtnInv: TSpeedButton
    Left = 870
    Top = 255
    Width = 145
    Height = 47
    Caption = 'Invoice'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnInvClick
  end
  object spdBtnMemberReport: TSpeedButton
    Left = 646
    Top = 255
    Width = 145
    Height = 47
    Caption = 'Report'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
  end
  object Image1: TImage
    Left = 497
    Top = 333
    Width = 98
    Height = 194
    Anchors = [akLeft, akTop, akRight, akBottom]
    Picture.Data = {
      0A544A504547496D616765D7210000FFD8FFE000104A46494600010101006000
      600000FFE100904578696600004D4D002A000000080005011A00050000000100
      00004A011B000500000001000000520128000300000001000200000131000200
      0000110000005A87690004000000010000006C00000000000000600000000100
      000060000000017061696E742E6E657420342E302E3132000000019286000700
      00000A0000007E00000000554E49434F4445000054FFDB004300020101020101
      0202020202020202030503030303030604040305070607070706070708090B09
      08080A0807070A0D0A0A0B0C0C0C0C07090E0F0D0C0E0B0C0C0CFFDB00430102
      0202030303060303060C0807080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
      0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFF
      C000110800A5006403012200021101031101FFC4001F00000105010101010101
      00000000000000000102030405060708090A0BFFC400B5100002010303020403
      050504040000017D01020300041105122131410613516107227114328191A108
      2342B1C11552D1F02433627282090A161718191A25262728292A343536373839
      3A434445464748494A535455565758595A636465666768696A73747576777879
      7A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6
      B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EA
      F1F2F3F4F5F6F7F8F9FAFFC4001F010003010101010101010101000000000000
      0102030405060708090A0BFFC400B51100020102040403040705040400010277
      000102031104052131061241510761711322328108144291A1B1C109233352F0
      156272D10A162434E125F11718191A262728292A35363738393A434445464748
      494A535455565758595A636465666768696A737475767778797A828384858687
      88898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3
      C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8
      F9FAFFDA000C03010002110311003F00FD900682D8A69E16BE75FDACFF006B79
      3C19E39B2F873E17B88E3F156A76E6EAF2F1B05748B6E72F83C6F38C0CF4E0F3
      C54CA4A2AECA8C5C9D91F45EEA0366BE7AF8E3F1E75EF877FB07DE78AAC2E36E
      B7A0DADBC3A8B4D26255C3A24CDB8F466525831ECC0D71FA5FEDB1AB7C35FD8D
      BC3BE23F156A1A7FFC265AF409776B085F3185B3CB98DA455C73E56067B93F5A
      CFEB1052E57DAE69EC64D5CFADB3485C28E4E3EB5C268DFB4369B7DF02ADFC6D
      8592DEE21409046C0B3CECDE58894F7264E05703E03F0DDD7ED0FE3FD5F50D63
      56D524D1745905A9B582E5A18EE2E3AB2ED53C2202003D4E739AA75354912A9F
      567BC7980F4F9BE8694B62B3FC35E18B3F08591B7D3E37821639D8657931DB8D
      C4D5D9B504B778E369A3566FBAACC016ABBF723A8F0D9A5CD4D1BEE5DDB76B63
      86C647D6B85D77C2BE3C8E392E2C7C596B23C659D6D1B4E48524039DBBF2C54F
      BE0D272B0D2B9DA6EA42D8AE0FE0AFC7087E29C1046CAAB3C9E6E06E1BC344FE
      5C8AD8EE1B9C8EA2BD1653B63C0E98EF44649ABA0945C5D8A8149FBBFA8A28C6
      7F880FC68AD3989B0A3A57E687C6DF8AD6BA17C49F8A5E2876B36F1247AF7D92
      C7FE5A3431C6AB1A632324E501C7407D702BF4C08C0AF8A3E23FFC13D23D6BF6
      F8D23C43756B2DE781757964D46F6052CD1A5CA2336D938C61E439E7A824572E
      2212924A27461E4A32BB3E25F8AFFB6A78C759F87F79E1DB9935668EEADEE65B
      BD42566C5DB2216D8C3A30CA8500F4ED5E91FB357C55F0D6B7F0464B8F1B69AB
      71E22B2D396344BB57631A1DCBB882725B1B40E981802BEB0FDB57C15A0F883E
      33FC1BF055AE89A4A5BEADABF993C496918536F13465D1801F74C61F8E98AF0F
      FF0082A4FECBFA8FC3AF8C5E0FBCF86367347378E167D2E6D32C62DDE4B85186
      8D3A05218E7B0201AE3951925A743A63522CEBBC45F1221F00FEC15E11F1369B
      1DCDBE936FE29B1B80971B44823D8809650481993E6033C6477AF4FF00D9BFF6
      BFF047846FB5E4BFBE8F4DB4D5A53A9405B2C6666EA001CE48DA00F5522BAED0
      7F62BD3753FD8820F857E2093266B21E7DC29321B7B9CEF0C09E4ED6C0EDC0AF
      803F652F869FF08C7ED47ABE8FAB6B56FAF58784350305BB04DD13143F385CF4
      E401FF007D569372A6D3269A8C9389F6D7ED23FB52F8CB4AD223BCD0ECE5D0B4
      7B887CE59E4895EE4AF539DC70B907B026BC2F44F11EB5F16BE2D693A03EA10E
      B9AE4CB1EA773AB0BB9656D2A1F98180007602CC31819E8C7D2BBAFDA1FE3BB7
      C44F1AC3A1786F49B7D623D1E19351BE124AB1ABA4783B03104019C03F9578CF
      FC13D3E306972FC56F146AF790DAE9EBAB5CCB3247180163443F22AF600053D3
      A96CD73CA4E53D5E86B18A8C743EA66FDA9EFBE177C42B7D177497D63A4C29FD
      A8924C0ADBAB1C200CDCF987B2E4EEF4EE3BCF1D7ED66B7B60D6FE15D2F50BAB
      EBA8885BBBBB76B7B5B2270373EEC16EBD141E9D457C07F173E2C6A1A8FC53BE
      D53485F39F4AF139D56E603F2B3DBFD9FCB8E4DB91B9558B0F6393593F0ABF6A
      5F177ED9BF1FAC7C07A4EAD1E88B78658FED174CC21C2AEE650AB9DCE141C0E3
      A75AD95676E5464E946F767D45FB19585C78BBF6A9B9FEC9B8B9B8F0E780ECE5
      4BCBB2DFBBBBBEB939651DB8F98E3B0DBEB5F6BBC9B93A30E3F035C3FC02F821
      A2FECF3F0CEC7C37A2C65A384992EAE587EF6F666E5E573DC93F90C0E82BB579
      42B63D178AEDA30E58D99C9524A4EE88F6E68A4C13DF1F8D15A998E63C5723F1
      C7E2C5AFC0FF0084FAD78A2F63926834983CCF2D48CB3121475F722BAE7E95E7
      5FB527C176F8FDF0475AF0DC7379371708B35B9C655E48D83AA30E855B1839EC
      6B1C44A6A949D3DEDA1DD96C68CB154E3887685D5FD2E7C33A8FED1DA82FC5CF
      04F8FBC42D349A96817B756E16488B42D1DC215578D47DEDBB80E0F1B857DF9F
      0FFC73A7F8FBC3306BD3450C735BE633214E50E012413C8C8238AFCB7F17D89D
      27C6BAADBEA5A5EB9F64F00C70AEB7E4B08A1D11E590796C37336776C20E3B7A
      60D7BFF8A7F6834BAF84563A05A5C470E9F34A669260E034E8F82AD9231C1C8C
      7B57C9E0F32A946AB8576F6BEBDFA9FA8675C3D83C652855C04525CCD36BB23D
      F3E30FEDABA3F8734DD42C745B2BCBFD53E6863DC0471EF381F78F5C024FFC06
      BE0BF057C0BB3F86B717723FC40D15AF352B892EE5F35648E6591DB7302467E9
      F8D7BAE99E1BD37C4368B696B3ADCC8C03191902F38F518C63FAF4AF9EFE307C
      3C8FC3BF14EC6CFC411358E8F6D3196F668A2CB5DA0E76A31E9BB9271C902B93
      01C4DF5FC43A3CBD747D0F2715C3187A34A5523271715B5AED9D905D1F44D17C
      4975717D7935E49642082EB4991E48D1BE672B2920611B6F39E0E3AD78EFC2EF
      D997C79A0D8437DA1A586B11DC2B4823B7BE892600B1272ACC092338C0CD7D75
      E1FF000F783FC47E1AD22F6CF41B187C2FA85CA5BDC5BDD0585628937066CC63
      7316C83F39C6476AF9EFE2D69DA2F81BE38EB1A1F85E1BAD4ADE7093E99369F7
      6C9F640FF7A3E32A70C33CFF007ABD7AD8885283A9BABEB63C3CBF2BAF8AAFF5
      7B72CAD7F7B4BDB738DF1C7C36F1CB35DDE6BDE179ACE38E12AB25D44485C0C1
      E4762339CF158FFB21D96BDA67ED85E18F135DC76FA6E9BA55D872ABF2650A84
      3803800A9271E86BDBFC17FB35F8B758B096FBC51AD6A972B32858ECDA6FF541
      BA64F46FC07E35AFA2FC19862D47C8B8B54B5B8B760C6570588C1EAC4B007BE3
      8AF0E7C4B4FDAF2D15F3EC7D261784E938B75EA6ABA2FF0033F4B7C35AFDA788
      74986EEC665B88A601D483C115A05FCD6E98AF08FD8EB5D1FD8F369B3126E6DC
      EE8E418D8E9ED827DBBE2BDD87321FA62BEEB0D5955A6A6BA9F9EE6384FAB579
      52EC2900F6CD148231F5A2BA0E11C7914D5DCA78C6E20814EA6B9C1FE7402DCF
      96F52FD9BAC7E0EFC2AF8C579E2C923D6A4F89170FE7FD994EF584C6CA8BC8C8
      2A5D9B81C66BE26F83FE0BBCD12CAC6CEF8FDA9B4A1E5B4D740AAB648C0551C9
      CE075FD2BF543E34E956BAB7C3BD516EBCC686188C85554B6E2A090081CF5AFC
      B8F125D5F278825B769FEC7079AC1D9C619B9E40C7715F0FC5D4B960AA2E88FD
      5B813136A13A4F66F5FF00807D0FF0B1AEA594F97691CD0AB05F3A24DB8E79E4
      1EDD7A575DF187E08597C6EF03DFE96D2470DD345B524651BA3900E0838EDFE3
      5E61F01FE26C7E198E2B53752F97182586FCF9607383C75C7715EE5E1AF88F69
      A94325C2C90C9C13B061467BFD703AD7C76538EC151828C74975F33D3CE6962E
      9D7F6B05A2D99F36E83FB3A7C46D12C21D1354BC82CF47B7FDDBDD0395652703
      E53CF35EA1F03FE0BF876C2E75CB7D36D7FD234F9155EF8EDF2EE1CA06211BAF
      19C103A1AF64B8D5F49F1CE9125BDFC1697703E62686601E363D0657A1E6B322
      9F4DD02C16DED7EC76B6F0BED8A3810246B8E3000E07F88AFA1FAD51E56BA3ED
      E879588CD71988779AB4BD2DF91C9EACFAADB4B1C50DAC7E4636ACA992CA7078
      C704572DAB78656F2FB372D3BC9B488FCC52C8C78C641FC6BA8D5BC5EB75AD98
      6499566C6F0ABF71873CE323A1079E7AD6278C7C633368D24D1C8D0DC70A8D1A
      FCACDC6173FC24E3BF15F07889518566A37D5E9DD9EBE0FDB24B4B3367F6715B
      AF08F8FB4F86058FCB9AE364A85CAE738E70493EBD335F5D449B5F3EC2BF3E7E
      1D7C4CBAD03E2059B6ADA8358CD6B749B1E65DA5918F43D4647072077AFBEB44
      D55755D3ADE68A786E12441996360558E39C63DC1AFD7B8564DE13965BF99F0D
      C65879C31119CADAA2F96C5149BBD28AFA63E3475359739FA639A751401CCFC5
      8F0EDF78AFC07A969FA7DC1B5B8BE8CC7E62F5553D71EF8CD7E71FED3BF026E7
      E15789E6BCB8B8936D9DB191F7B7EED338C907A0C71C9EE0F7AFD3D9DB663B73
      5F107FC1737E2469FF000C3F636D61A1D3E3B9D7BC403EC56AC465BE620367BF
      4C0AF2B36C0D3C4506A67D470DE75530753D9A574CF89BC3DFB44E9B3DF9B7B3
      996659A5119955C150C39FCB3C7BE335EA9F07BE367F686B970B15F62CEDD119
      573C3B13C01F56619AFCE7F85DE15BCD3BC47A5DAC5F68B6F3AE064894EC5C2E
      5BB720919FA7E15F4FE88D3E917FE2696DE39A5550A2D2DD50EFDDB571C03EEC
      7D881D2BF1FCC32CA146ADA09CBAFE291FAD53CFE9CA92A5885BD91F575FFC63
      9F49D4596DA75F32688C8079B8FBBC16C7AF5A8B5EFDA2C4F670C0B32C5F6890
      31933C06FAF4C8E322BE43D57E205F7896094C332F9FA74E229B7CAA64895588
      76DA0E76ED3F4391DEB13C4FF1E0E8F0DAE9FA68B8D5219A3475CC81879AF270
      001CAE327AF4AE6C3E0AB4D3A516D77FBAE9932CD32A569BBB7E9FD6C7D8DE1C
      F8E01EE2EBFB4A655BCB360887716FDDB0520F1D41CF5ED9ACBF89DF1D0E8DA6
      DCEA1205FB2C100573B9195A3E08CAB1C3118E9918CFE7E13F0EB57B0B469351
      F111BED5A1B0F2CDE456C498C0DDB022A8397C6796271F2F15F427C49F867F0C
      BC5DE1FD3F4BB4BFB1FED0D623F36DAD7ECC628E501412AD8CED7503F3ED5EA6
      1785DD592AD55DB6FEBCAE78389E2CC3D3ACD51A775B5CF8FF00C3DFB74FFC2D
      7F1BEA96DE24B399744473FD9DE5CC63316308096E7827271F4AFD06FF008235
      FED1571E23D5B5FF0001C9AB5D6B5656B10D4F4D965937B409B82BA31CFF00B4
      318C0E057E67F897F61CD4347F8B5AA7D82EA2B6D2F4565B8B8B4670271016C9
      207F105DC0FD327D6BF46FFE0931F05BC2BFB3E7C45B35B7BE6BED4FC49A7BC3
      14DB82AC646D91900F7DA7DB23A77AFAACAEB430D8D549CDDA5B2FF8279F9B42
      B66396BC5429A6A37D579791FA360F1D05140E147D28AFD03E67E61CA4945141
      E941043767685E9F7ABF277FE0BE7F1161D67E2E7867C2C75358174DB2FB4CD1
      1E43176FD1B0148CD7EAF6A0728BE9B813F4AFC0FF00F82CE7891EEBF6D5F125
      D25E1BE104A9100093B30ABB554FA7CA3DB20FBD79B9A4DC68E9D4F5F25A7196
      22F23C9F5CF045D5E6A2D1C2B17D8EDC07822F28F992642E5B07D3807DFF001A
      EE3E0EFC48D6BC391DF7D9649A3D162B5F375233388E358C67E44C658BBB8C02
      071CE735CBF87FC716FAB58477178199AD5503956F96445E8BEF93B8FA13935B
      927825FE20C37B71A4DC2C72B462DCC21F6C65C0672588F4E71E9F9D7E5B8995
      EBFB1A8B7D9F99FA7E2302EBD1F694BA6B6F226F84BE15D0661E2AF165C5C5C9
      B5D42DFECFA75B89382AE76CADB88C12A1C1DC460053E99AF3EF875F0FDE6F1A
      E9FA6DADC4924927FA4191B256243B40E7BED573F95779E2AFEDD7D2F43D3E38
      CDBD8585B9B4B982294A9B850C7D382013823A7DDAA1F033E23E963E374735DC
      3E6594892DA98D40C85EC31EF8C7D6BD6CB70F29549CBACB7BEA925B23E6F158
      754B0EE73DFA7EACF5EF1E78A17C14FF00D97E1FD574FBE86E26860B236B0AE7
      0518B6E7E8DCF7ED8AD0F0E7C63D4FE1F6BD6FA06A8B24925C2337DA6250C416
      C72A578EA7F9566EA3A2F86F5CF09E97A878674F9A27136CBB89A2F24DB066F2
      F283B01B9BE6CF35CEFED47E2D8BFE169F8674DD26786EB55D3731E230504D0F
      979CB83D39000AECC46672A58CA5848AD249BFF863C485152A72A8F745AF8DDE
      24B7D37C57E17B697517D575C96E809679D36B18B82A1C7A00768CFE3D2BF433
      FE09FBFB0FF8A2CBC51A4FC4AF1A6AF6ED0F93F68D1F4BB43B82AB83B2494FDD
      FBA72157D464F18AFCB6F194B2DCFC40375347BAFA5DA237DBDB839DDD0FD01E
      2BF79FF64AD36F34AFD997C076BA80DB7B6FA15A24CB9CE088978AF4B0782A35
      F1CE5257E549AF5BBFF23A7FB7F1784C04F0945DA351EBDEDE5DAFD4F435E9DA
      8A0819F5A2BEC0F8DE5BB1F4138A2A39A35239CFE741443A9E3C91BB72827A8E
      D5F81FFF00051DF85535FF00ED23E3EB84B7BA68E69647B37991B7B2E5BE7C91
      9E70793D81C715FBD3285DACA1FE55E9926BCB3E38FECCFF000FFE2769F7F7FE
      28B5D3E1F3ADC5B4F7B2B88C2272002C781F788FC6BCDCD30B3AF4B960EC7A99
      4E32386ADCF2573F9D75FB778534D58DD265B69A33E5B0CB02AA3E5E4F4C9CE7
      D88F5AEDFE1C78C2E743F0E5C0936BC71BEE8D1700B4A4600CF5EB9FD6BED6F8
      E7FB217C21B0F1CDFE8BE19D7AD75CB74B766B99E395678EC64E81073D942E70
      4579F7ECD9FF0004A3D73F6A5D1351F10E90D6D0E8AD752DA5A4D23ECF31A223
      E7033D8657A1C93F8D7C3D374AB629E1A2AF25BF91FA43A98CA38358EA8AD4DD
      ACDF9F91F34F8FFE295C5B68AD35B4524771312BE74831B06E25F1B7B8C2F22B
      CCFE0BF896F6D3C789B9BECEF25D864DE7EEAB1FBDF5C807F035F787893FE082
      9F15F5CD537AA59C762EA44B14B7EA0F0463047A8FA77AF3BF8BFF00F04A2F13
      7C16F19DAE9B37D9E1D51AD7ED9098672EB3A0F94F383FC7C91D81FC2BD6AD46
      383A0E537CABBF9F43C38E2259955F634BDE9763BCF809AE5D69FE18D5B5AF11
      4BA5C7A7C12224B2CD3FCC8E5886564FEEFCA0E47A8AB9FB4AF80FC1BA86B563
      1E837566BE22D4ADE3944F10691AE558024A93F81C671CD68FC06FD95BC53F11
      BC133DD49A4CBAC5DE89786C2E5B4F2242E540399A1623770C3A7248AF53B4FD
      80BE2E7C54B88A3B2B3B6D22D963544BDD420104F07DDCED1CB76E831D3AD72E
      5B8AFAC28CA54FDF5B3B6EBC9F67F8763C9C761A785A8E954D2DBAEDEA8F00FD
      95BF670BCF8D9FB5ED8F81FCD8AF974D945D6A5710FEF22B58508CE5B0392140
      F766C7635FB81A4E9D1E93A7C36B0AED86DE358D07A00302BC53F620FD87F43F
      D8E3C17710DBC9FDA9E24D6089355D5245C3DC375DABE883B0AF7351815F5796
      E0E5462E753E296FE5E47838CC47B495A3B21AC3068A77228AF4CE3177547701
      5E2656EE2B0F58F1F5BE9B06E586E2672380ABF283DB27B5711E25F1E5D5DE9A
      B79F6955F2DCC8A8D2F92B16DC83B8A863D33D78E3B56719B6ED1FBFA194AB45
      68B567677BAED9E9D2AC371750432C9F711DF0D27D07535F923FF05FEFDB03C5
      365F16F43F87FA5DC5D43E1BB7812FA416D2656F1F9CB4800C80390013DB38EF
      5ED7E34FDBE5FE3CF8DEFEC34BD661D2BC29A648D6C8D692FF00A46AB2025598
      B60158F8380319EB5C278DE1F00F8DAD9ACF52D36D75136F1B29385DC8380464
      608CF4FF00BEABE333AE27A54E6F0F4E0E4BAB5FA1F799270DD7B2C4D4693DD2
      FF0033E21F847F18AEAD3C37AB69B6F258DBFF006A4864FB5C92B2B00D82DC63
      B6081DF8AFD0EFF822378AF5AF0D6A5E29D2A3B8BBD4B415B786E1A304B24329
      2C06DDC404C8C93FDEFC2BE67F18784FE14E8165716F1F876D639D8E7890B145
      6248C73D46400475AFA6BFE092BA25D6B5AF789354D19AEF4BF0AC368960A8A3
      0B34D90C08DD9CED1BF9EDBEB938669C678BFAC4135CDBE96FF33DCE2CC76261
      957D56BB564D35AFE87D99F1DFF6CCF0EFECF7E02D67C41E22B3D52CEC74681A
      57925882C521006143E71924803DCD7E4FFC47FF0082B55D7ED4FF0016E2D4EE
      EDED746D1EC619A0D3248A221EDD5DB812B12739DA39E99F4CD7D75FF059DD53
      4DD0BF626D6B4CD5750BCBEB8D72EEDAC2D6372BE5891E40C19B03EE8553C77A
      FC7DF05FC22B8D424822D375CB2F2E42D104119666438DA08C7B1EB5EE713463
      5693C3CDD933E6B82AAD5A5596329C6ED69FE67E8D7FC1333F6CBD47C1FF00B4
      BDE68770D1DD7877C593BB5D3640DB3E301D3FBDF77A0EC6BF4CB45FDA37C2DA
      BB32A5D5C42637F2F0F6EF827D8804639AFC61FD983E04E97E0BBBFB56B57975
      36A16E36A334C231177F947519CF5CD7DB5F0CFE222F8634DB4B35BDB9B8B28F
      E51234C25950679219B248F519E9D3D2BCAE1FCDA8D08AC1CAF65B367B1C5D94
      E271B5E598C12BB5AC579763ED7B9F8D1A05A3AABDD4A379E0FD9E42BF9E2B33
      55FDA3BC3FA4CED1B2EA136D38DD1DB9DA7F135E23AABEBDAFE95FE8F716F716
      BB7240DEE4A9E8411FE15E53E31F879AA6A8F26D4D42E2DE3215DADE5DA0B1C8
      C3062ABF2F5EA4F4AFB7949EC8FCDA327D4FA235FF00F8285F82F40D49AD64B7
      D41E48FEF80F10287D08DFD7A1FC68AF8BEEBE0D69F7570D26A1A86BAB727191
      098C2018E319393F5A2B9F9EB791D3CB1EC7DD5A85ADD5AB6D5BBBA9BE4C7908
      15A3E38E323773EEDDEBC7BF6B0F82DE2CF89FFB3FF8A345F0FDDD9F87757D72
      CE482D3CBB4DC5589C132CCB9D9B972011D3777AF611AAADBBF9967638F313F7
      A4464B161D8F638F5CD67F896EACB544F306BD0C7342B97884FB563CE0FDD53D
      7D9B35EB4E2A517167834AA4A33525D0FC8DF0EFFC136BF680F04CEB69A5E8FA
      5FFA24599C417C8CD30504F183FC471D483F9D755E15FD983E3978E2F4D941E1
      A9ACE65063924966454DC7EF1CE7F0AFD36D335683C391C971F6CB76499BE699
      50A15E9F789273EBD056B5CEA935EFEFD75A84DBEC5DB0DBC5B9BEA5BD2BC17C
      3B859A3EAD71963E9BBE8CF86FF674FF00823C5D5F6B09AD7C52D6E3912DE4F3
      0E9F63BC2CB8FE19242061071C2E7A7515F697818785BC03A07F6178752CE1B3
      B11E5C76F64B855038E8B924F1CB1E4F5AE66EBE235E69705D4365A85D5E5E5E
      3EE0D2460C702719CB6D033927826B43C35AD43E22B097FB42FBCABCB605E224
      ECDBEE106377E39EB5EBE132BA38685A8C4F9ECC336C463657C449B3CF3F6D8F
      D941BF6C9F8057DE1166BAD1D649D6F2CEF1641335BCE84E0F27710724119E07
      4C57E776BDFF000487F8C1F0B7538EF2C6DED759B7B3937A4B697614B050587C
      870F838E4807935FA952F89750D3AF2D74DB7D4A3BCFB63162A238E3083BE79C
      F7A6F893C4F2F84ADA49AE12CD6453B44625F35DC7A63802A71994D2AFAD4D0E
      8CAF3EC4E0D72D27A1F900D7FE38F0F5C4D6379E1FD786A10130C89E536E0F9C
      004919E3AFE35EC1F0A24F899AA788ED65D3F41D436C8A23916E50A284FEF723
      27A7515F73E95F11219AE17168B02DDCA4B3B6D8E4DFE8768C9FC4D4B7FE25B6
      D0A598DB9FB398499AE5DADA5618F6008EDCE7918AF1A3C2787E753BB763E825
      C738C749D3D15CC8F0DFC4ED7346D074FB3BA0F0CD05AAC2B0EC1F3B0C673C93
      8CFA806AFC7E2CD42191750BAF2AE960248B78DB11A3F3CED24673DF3EF581AE
      78B35ABAD0E49D6DEDF4FB328B22CCEB29CA9270598636E78EA47519AF13F1CF
      C6498682B35B48DA92DA4A2068CB1F939EA0E7713D7A718EF5EDB8A8249743E6
      39DD46E5DCF5CD77E336971EA522CFA8436B37578EDE0478D49E7A9268AF942D
      7C61AB6B0AD3AE81BD5988065DAADFAF3452E629739FA76FF112DB559ECE28E4
      B8B88EF17225B320C6800C9DF919009C8E33F853B5DF26EED7EC96334FA78CEE
      66886C91F3FC21986D1F89ACDD3F55B3F0DD92FDA1ACEDF4B651924C515B463B
      ED50C0907DC135F3E7ED331EB1F126E213FDA16F7167A53CB2DA268FA7297F3C
      8021215E4C3153C925A307D700E7A67A2D4F3E9AE6764CF61F13F85758BC68D7
      4ED42DE639DCF05D481C803B92849CFE18AB5A57C4C96C12E2D6E11AE2EA37DB
      E4DB1454933CE01C13C7A9C57CE763E23F1CF87F43BAD3F54BE9B4DB7BCB711A
      85B286078C90393E4BE17E62FF00C64E02639C9AC5F08FED3BF103C2F05E45AB
      788349BC8E29BC8826B0B69662F12E060AB246AA4E3A87908F5E398A72BBD0D2
      A51D2F7B9F4378ABC2DA569FAA4B776D6F716F7178026E6732B4638C90589E7F
      0E2B9D8FC511E95ABE9F0DAEAF70A04FE53930F9AC71D78E18F7E727E95F37BF
      8E3C63F123C55F6769F5016B2485A3B9F2C92884E08E49C2F638E7DFB577DA66
      81AB7C36F06FD8ED6CCD8C4124996EEE258E18A33F78317273B89FEF293CF4AF
      415F92ECE49D93B23E8AD420B7B9D61758B3B1D363B85511CD711C68B2C91673
      8676DB8C9FD6BCEFE2EF8FB41B87375711DE3CAD2045CC8ACB18DDCF1B8E3EBD
      EBE39F18FC7CF8CD2788ECEC45E68D7CAD302D15AC06E62F2DB0406C855E338E
      9CD7AE78674ABCF105931D6105A5F654CA90C2CC5CECE38C6D41CF4159F2B6ED
      234D23AC1DCEA2FF00E2C58A78A2C6492E1EDEC565CF9705AE645C0EECA4939E
      0F418CD6C7F696BDE36D2D9ED6EADB43B18EE0496B77725AE24B9DA776D2A421
      418E32491CF4AE2F51D222F0D411AF9735C0122B43E5C4CCEADD30DB4617F1AD
      4BBF114D61A60B67B079AD636F3D99E652A4E47472DB571C64638AB7149D8CE3
      27B9E17F10FC6FE3AF885E22D5A35D5A692C6E2E4DADCDB5B13B2061C12C073B
      4E370073C719AE31340F14693AB9826B368E1B725919222FE7609E7DBD7AF19A
      E97E23F8FB45BBF13DEAD9D8DC5AAEB4EF0468972FE4CB27569C1C2AF6C67919
      AF20F1F6B33F842CEDEF2D75CBC9A26F9DA23742788B0CF0BB71CD79588B7358
      F728BBC394DDD6FC4BE2CB2D4A45B86863918EEDA48C81DBD3B515E72BF1A2EB
      5A92496382CD42B6C3B815248C73F3027F5A2B151474FBBD8FD1EBCF8B179A03
      6891C492336A96D0CA5DA63FBA322EE200C60E33F5AD4D1FE285F49E2DBAB5B8
      86D6786DE1567243079493B7939ED8CF4A28AF71C54A3A9F354F49BB1C9FC4A7
      BAD646A1677B3472C17C81F6A4654228CE179639FF003C5795F85BC731D878AB
      50D27FB3E35D374D0F886DE4301902296C1700B0C91CE0D14567184633564744
      A4DC353E84F867A3C3E23D0BFB7955AD13ECE2510248C587C8081E613D07D2B5
      3E1A78974DF1DDFEB166DA1DAC2FA7CAA1A7924F3A49CB7524903D0514574C76
      395EAD265ED6742B0D220BAD4A2B3844BE5AAED031DBD7AD79EF8E3559A4B7FB
      55D4925D2CB2AA41036D10DB6067206393C752734515CF06DA5736E55CC7847C
      4CF175C687AC45712334D6F1CDE6436B19114713E092D9C1249C75CD5AB5F1BD
      DF883C2D3EA11BCD656BE49496DE394B492B480FCDE6B64AE31D140A28A55B62
      B955CF1CFDAC7C5B27817C29616370B36B92AB47247737B39F323DC8C48C2050
      47CBD0D78C6B5F16EF751F0845A7C36F6B636F16EDA208D5493EE71934515E55
      6F8AC7BF855EE9F3C7C47F8C5AB683E2A9ACED5A38E2B70106D5C6E23B9FAD14
      514D107FFFD9}
  end
  object spdBtnExit: TSpeedButton
    Left = 462
    Top = 90
    Width = 145
    Height = 47
    Caption = 'Shutdown'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnExitClick
  end
  object spdBtnSubs: TSpeedButton
    Left = 870
    Top = 185
    Width = 145
    Height = 47
    Caption = 'Subs/Items'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnSubsClick
  end
  object spdBtnContactReport: TSpeedButton
    Left = 88
    Top = 255
    Width = 145
    Height = 47
    Caption = 'Report'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnCardReportClick
  end
  object spdBtnCardComm: TSpeedButton
    Left = 312
    Top = 185
    Width = 145
    Height = 47
    Caption = 'Communication'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = [seBorder]
    OnClick = spdBtnCardCommClick
    OnMouseEnter = spdBtnCardCommMouseEnter
    OnMouseLeave = spdBtnCardCommMouseLeave
  end
  object lblSelectHelp: TLabel
    Left = 479
    Top = 185
    Width = 105
    Height = 64
    Alignment = taCenter
    Caption = 'Select recipient Category/ies and then modify selection'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
    WordWrap = True
  end
  object Edit1: TEdit
    Left = 232
    Top = 32
    Width = 593
    Height = 41
    TabStop = False
    Alignment = taCenter
    BevelEdges = []
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Text = 'Membership Management'
  end
  object Edit2: TEdit
    Left = 192
    Top = 96
    Width = 177
    Height = 41
    TabStop = False
    Alignment = taCenter
    BevelEdges = []
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    TabOrder = 1
    Text = 'CONTACTS'
  end
  object Edit4: TEdit
    Left = 720
    Top = 96
    Width = 201
    Height = 41
    TabStop = False
    Alignment = taCenter
    BevelEdges = []
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    TabOrder = 2
    Text = 'MEMBERSHIP'
  end
  object Edit5: TEdit
    Left = 166
    Top = 456
    Width = 241
    Height = 25
    TabStop = False
    Alignment = taCenter
    BevelEdges = []
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Text = 'System by Erik the Viking'
  end
  object Edit6: TEdit
    Left = 664
    Top = 456
    Width = 241
    Height = 25
    TabStop = False
    Alignment = taCenter
    BevelEdges = []
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Text = 'Eric March 0418 418 995'
  end
end
