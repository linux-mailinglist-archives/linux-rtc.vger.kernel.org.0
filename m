Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5693DAE7E7
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2019 12:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbfIJKVh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Sep 2019 06:21:37 -0400
Received: from mail-eopbgr150044.outbound.protection.outlook.com ([40.107.15.44]:9092
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726231AbfIJKVg (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 10 Sep 2019 06:21:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsUQDQSPy6afKuK7nYcq5eUgkgyHY4TdZgHCsTgGdxkhhvf5uhez5BJC3SFvJ8G5qOjhMGkotOptd9S+/Hk1RYJpc7xZBldnEIi7/+PJM2M0zHNlVbDcV/NYLrYb1HGD7CQ9OUaOO8BV4nGslQs6MKaBqcyyNGL6OGGD33+BEkZTmcb5dGsA112bOa3oAq0Ab+3RKMx648oJvwQWoCDN3n4Y9ulmZks1SPFOXR2JZu/VAGrhLqLAo6cx83QX9Le55sLs/VpyS904eS18KYQM5n7o0UY0uiAlreWzz3QfooOMUvKTVleQ8ByF28F3zu7+1tuhJZe06EOQO1YXRLsXSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oSkNysn+HgO4b37sBIEVLHgCeN5ZXtc1gRaMsjTWLI=;
 b=DnX47s2E28seBnmrRHkf42KYMJSyGK0ymZk3cxBtUKAAR8UVBU6YHooUGyfW/HpQW/fjdub8ntxwMJ7b8tryn4dF/4WuuK9JvjLpmPdHBFaNnxGFT2ExrSnwHUWXAySYDevgxdesj9gspkDw+9vVg9zcfERXmQrKA61q7P9V4U1mTXaGLdwYCchmPpVGxqMIoE0bSP06cHzb1fh8CoJNyPPq+eC2QzTzcIHKqmGdflUM47CoGw6HcNVb4Hu+O2yxZsKFzaDoGFokeO+tx7JUD+dDFXkd3pAZndQvhFwflSkPgP/gPJkitrnRo39A3EA7HI46U/BS3z2JxwD93RlRFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oSkNysn+HgO4b37sBIEVLHgCeN5ZXtc1gRaMsjTWLI=;
 b=LyN9zyK/FUn4xNDZmPy5alCS2nJn3aCwn5zEU1851rF2h4sPBewD62oj+G2dNcnFdchNSB3mHBHWWpG3wthqMo06odag3JRAHTscW3TMJdK9XUGwnmRGi6zc7JbKRd2cJXzeQ29jZ7qFGCLv2qfnDe/E4iY/u4jqtfgaRYvSzMU=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4300.eurprd04.prod.outlook.com (52.135.131.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Tue, 10 Sep 2019 10:21:33 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa%5]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 10:21:33 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     'Rob Herring' <robh@kernel.org>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Leo Li <leoyang.li@nxp.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Martin Fuzzey <mfuzzey@parkeon.com>
Subject: RE: [EXT] Re: [v3,1/2] dt-bindings: rtc: pcf85263/pcf85363: add some
 properties
Thread-Topic: [EXT] Re: [v3,1/2] dt-bindings: rtc: pcf85263/pcf85363: add some
 properties
Thread-Index: AQHVYiDislXlKba5R0W8Eh4TiH+l96cZsgSAgACF2ACACoaiQA==
Date:   Tue, 10 Sep 2019 10:21:32 +0000
Message-ID: <DB7PR04MB4490F16B6EB5BBE4FE2472218FB60@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190903061853.19793-1-biwen.li@nxp.com>
 <2374870a-a728-b046-9ec6-bd7773411f50@flowbird.group>
 <20190903173604.GA18177@bogus>
In-Reply-To: <20190903173604.GA18177@bogus>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e52ad49-6db5-4bd5-8922-08d735d8a745
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4300;
x-ms-traffictypediagnostic: DB7PR04MB4300:|DB7PR04MB4300:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4300511548D5EFE26BDDBF318FB60@DB7PR04MB4300.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(81156014)(66066001)(8676002)(102836004)(486006)(44832011)(476003)(99286004)(71200400001)(76116006)(110136005)(7696005)(76176011)(316002)(54906003)(5660300002)(55016002)(53936002)(26005)(6436002)(9686003)(305945005)(7736002)(11346002)(6246003)(33656002)(71190400001)(478600001)(8936002)(14454004)(53546011)(6506007)(229853002)(25786009)(64756008)(66556008)(66476007)(66446008)(2906002)(74316002)(66946007)(4326008)(6116002)(256004)(3846002)(86362001)(52536014)(446003)(81166006)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4300;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Fg8K18l47oZPprONuqOt0aAURnNwOdpSmRtF+SvWSaHk2MS1NnaKxOpRAAs+ZC498ReOKJ75dHwubRnAywN/+I1lxQzlDGD85s6i0A+qi/MvhB/glVPjx7pzhyX+fGdMd5jBvUbgBDWtaoMC/u30uaim8PdCiItOUL2GCM5LYZtkZ1hfKFlDTmwwiPKNaCNArI8g6kJVB5TQ/nHiZ0S6lZQKU7ZOEwIBP/Ztb3Oz8270Wda5wiHRrxrU+5tB/Ms6B5xKLs8HugEFFlmo0stXkvJjO5r4pNGR+m4XA3MVShdxohozGD7lpg3gHmCgV5zO2fqK8n2s7uQORXNvLMJMx2OkFhsoc5VM0Mquhq5A5JDXKob8rqxJLF9IWTJkZlsVxwxS/hVryGSgICA+1HAuXnPs4JrxmiQBzs1E/+TeNgA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e52ad49-6db5-4bd5-8922-08d735d8a745
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 10:21:32.9975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EkQD8Um05LVooLdu1WZa1CB82GmdKweFWcecKxwLw9EYHY1TANTZQXrW+4v4QaLQ1lFZalhD53/xwjuCQIaneg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4300
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> Caution: EXT Email
>=20
> On Tue, Sep 03, 2019 at 11:37:01AM +0200, Martin Fuzzey wrote:
> > On 03/09/2019 08:18, Biwen Li wrote:
> > > diff --git a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > > b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > > index 94adc1cf93d9..588f688b30d1 100644
> > > --- a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > > +++ b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > > @@ -8,10 +8,39 @@ Required properties:
> > >   Optional properties:
> > >   - interrupts: IRQ line for the RTC (not implemented).
> > > +- interrupt-output-pin: The interrupt output pin must be
> > > +  "INTA" or "INTB", default value is "INTA"
> > > +
> >
> >
> > The hardware has 2 interrupt pins which can be mapped to various
> > interrupt sources (alarm1, alarm2, periodic, ...)
> >
> > Currently the driver only supports alarm1.
> >
> > It is even possible to use both pins for the same interrupt (eg if
> > INTA were wired to the SoC, INTB to a PMIC and both used for alarm...)
> >
> >
> > So maybe it would be better to have
> >
> > alarm1-interrupt-output-pin: The interrupt output pin used for the
> > alarm function. Must be "INTA", "INTB" or "BOTH"
>=20
> That's a property per source. 2 properties possible sources (either a mas=
k or list)
> would be my preference.
>=20
> Also, whatever you end up with needs a vendor prefix.
>=20
> >
> > Then, if and when other types of interrupts are supported by the
> > driver new properties could be added for them.
> >
> >
> >
> > > +- quartz-load-femtofarads: The internal capacitor to select for the =
quartz:
> > > +   PCF85263_QUARTZCAP_7pF          [0]
> > > +   PCF85263_QUARTZCAP_6pF          [1]
> > > +   PCF85263_QUARTZCAP_12p5pF       [2] DEFAULT
> > > +
> >
> >
> > The standard DT property "quartz-load-femtofarads" takes the real
> > physical value in femto Farads ie values should be 7000, 6000, 12500 wi=
thout
> defines.
>=20
> I believe I said this on the last version.
Yes, I will fix it in v4.
>=20
> >
> >
> > > +- nxp,quartz-drive-strength: Drive strength for the quartz:
> > > +   PCF85263_QUARTZDRIVE_100ko      [0] DEFAULT
> > > +   PCF85263_QUARTZDRIVE_60ko       [1]
> > > +   PCF85263_QUARTZDRIVE_500ko      [2]
> > > +
> >
> >
> > Not sure about this.
> >
> > Wouldn't it be better to either use a real impedence value in ohms
> > (like load property above, even though it is a vendor specific value)
> > rather than a define, or defines for "Low, Medium, High"?
> >
> >
> > Martin
> >
> >
