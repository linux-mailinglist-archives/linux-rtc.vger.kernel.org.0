Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 367368F2AF
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Aug 2019 20:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731497AbfHOSB1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Aug 2019 14:01:27 -0400
Received: from mail-eopbgr60067.outbound.protection.outlook.com ([40.107.6.67]:48807
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731202AbfHOSB1 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 15 Aug 2019 14:01:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASkoJLDWNBOFufa6j6pGmoEgfAOTKLXDzmIELrf/1PAiCpCD5wo5LejUFBuvvcf5ZYZC+WJfZmdwIiNQ43AHyZfVImxBcwxVbpA2lECYBXN49sfDGcKPG+xF1fHMNpxCB2ns9jAGKDC+90lxkd+Fxl0i8jZsaGzKHVnxoGg2ZapyK7Fh6zX72Zno/Um1w8zjuq+XbekT3uqHUHlhqcwAHUAWpu5x/CHJmEu+899FuIiY62aAjgkcPkybKVAhOJQP+ZGjAUozxQ4PVJE3l6RnhYTQURuwXuI6Pi6yfcR8bpYR7JCVAoP6/8zuAM5KL8nCxr3A3xBDM/SCAXmq8oK6pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzXqH8RlVMsCCYXoyu4N9nEXihNXMsDqpJxyQHqH73I=;
 b=k/MfkF89Mvx3p0rUSjgMhm1kVKg7ggy9mwKv9usAukvYkSkHJTDRz78qkkZdHHsc+TY/eqJ6NzlXRtWkv4DnQ+M84sgSbQDkLSyhbs0QT6Pxceg4f1QFKa305g1i2kOviEI9+LJjn6TjxiS0BXIzqiH/1FN5zmDEGa2wlClGU+mSd+bq/HEA4xM435AU5ZggZwKE9ZCil6dQB5O4yIVGSgd/LigLz+T+5mleS7Tl2gRib5GI3WZOJAhZj6zvJtuIjPCm42gesXZ0mo4BP2WierYdD7bqj6rCtp2hhjVE2I2xAKElx4I3h478UUV+/8DidE1c8ApNpwebcdc0dcuRYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzXqH8RlVMsCCYXoyu4N9nEXihNXMsDqpJxyQHqH73I=;
 b=FnhFzFzSaN24WvYeiBfSw9zUVZJgappe+kt/n0KGQC5DBtUZ6JLAKoZy9Qv6b0VTnCHuQojISkg8ddf9TDhQmcUjmUj8lQ6f2bI/tj6UdDZwJtGjKHFjzvdaQb6kLMyfZc9VOMAy2cvDjrhUph3qmLKrQ5Xha6qxyIu8evnGtIA=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (20.179.235.152) by
 VE1PR04MB6368.eurprd04.prod.outlook.com (10.255.118.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Thu, 15 Aug 2019 18:01:22 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::3c54:f415:644a:15f9]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::3c54:f415:644a:15f9%6]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 18:01:22 +0000
From:   Leo Li <leoyang.li@nxp.com>
To:     Biwen Li <biwen.li@nxp.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: rtc: pcf85363/pcf85263: fix error that failed to run hwclock -w
Thread-Topic: rtc: pcf85363/pcf85263: fix error that failed to run hwclock -w
Thread-Index: AQHVUoSffVMVL9pU8EWFzlDe9z+sGab6+TgAgAChtoCAAOVX4A==
Date:   Thu, 15 Aug 2019 18:01:22 +0000
Message-ID: <VE1PR04MB66873BEBB6EBCC1C04D0AC238FAC0@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20190814093249.40065-1-biwen.li@nxp.com>
 <VE1PR04MB66875AF7A38BF43351970EB08FAD0@VE1PR04MB6687.eurprd04.prod.outlook.com>
 <DB7PR04MB449054F05411CBDC935605F28FAC0@DB7PR04MB4490.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB449054F05411CBDC935605F28FAC0@DB7PR04MB4490.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leoyang.li@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d4d1ded-c852-481a-4885-08d721aa954d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VE1PR04MB6368;
x-ms-traffictypediagnostic: VE1PR04MB6368:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB63688545F48280D4DEC9D4B78FAC0@VE1PR04MB6368.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(189003)(199004)(13464003)(26005)(5660300002)(316002)(110136005)(6306002)(14444005)(229853002)(256004)(53546011)(305945005)(186003)(86362001)(6506007)(7736002)(478600001)(52536014)(66066001)(102836004)(53936002)(9686003)(54906003)(6436002)(64756008)(55016002)(81166006)(66476007)(66446008)(2906002)(8936002)(81156014)(14454004)(33656002)(2201001)(6246003)(66946007)(3846002)(76116006)(66556008)(99286004)(966005)(7696005)(76176011)(74316002)(486006)(476003)(4326008)(446003)(25786009)(6116002)(8676002)(71200400001)(71190400001)(2501003)(11346002);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6368;H:VE1PR04MB6687.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IUebzMTH7M+Mg/GvT44VNqxHkYSvDa9H5T7JdHKYF11vDoIOsX4aJuuiBs42N2DaagbovLqXdAzthWsZWL1lDphLdRb8WErt+LxHVQJa3gx90IafQcsKm9zmXCeUp58nIS4mNoL92hBiuRGsxVZpMwbnQxf+xnXvKI/ekbMnGD8OFNFbihTcDATw3sKUUnnvw+eIkqka2sb6IZoio0AuwCGiuQSkmTYeBFigYsrHmOm4VDrEH12NFwBLmdfA5jQMwafLW44krnU3Aw5f2TiTJNhxJkBgwRrj+Ca4OTgYsbaSb6zQqisbuUPvRq2v8QDiXK37v0CS5nOl1QiJcssJkdLgOgtMuTx0zyielMqOVV89efXpAAOj91/O/Qn3mFEm3YhSgo83TUBVzxaIT0StsykZaALnckTU0Q1N0Yef6Ww=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4d1ded-c852-481a-4885-08d721aa954d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 18:01:22.8361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hlYVC5bSg9cJH/MRBsYFovNKh1SAyNRbg0Lr+Y+hAqO/1lQD6VproLbYixZ70ijxb/LB9hGz1QPc5HzmB0FP1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6368
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



> -----Original Message-----
> From: Biwen Li
> Sent: Wednesday, August 14, 2019 11:15 PM
> To: Leo Li <leoyang.li@nxp.com>; a.zummo@towertech.it;
> alexandre.belloni@bootlin.com
> Cc: linux-rtc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: RE: rtc: pcf85363/pcf85263: fix error that failed to run hwclock=
 -w
>=20
> > > Subject: rtc: pcf85363/pcf85263: fix error that failed to run
> > > hwclock -w
> > >
> > > Issue:
> > >     # hwclock -w
> > >     hwclock: RTC_SET_TIME: Invalid argument
> > >
> > > The patch fixes error when run command hwclock -w with rtc
> > > pcf85363/pcf85263
> >
> > Can you explain a little bit more in the commit message on how the
> changes fix
> > the above issue?   It is not that clear just from the code.
> 1. Relative patch: https://lkml.org/lkml/2019/4/3/55 , this patch will al=
ways
> check for unwritable registers, it will compare reg with max_register in
> regmap_writeable.
>=20
> 2. In drivers/rtc/rtc-pcf85363.c, CTRL_STOP_EN is 0x2e, but DT_100THS is =
0,
> max_regiter is 0x2f, then reg will be equal to 0x30, '0x30 < 0x2f' is fal=
se,so
> regmap_writeable will return false.

From you description, it looks like the problem is actually that the buf[] =
was written to a wrong place.  If that's the case, we should say that in th=
e commit message.

>=20
> >
> > >
> > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > ---
> > >  drivers/rtc/rtc-pcf85363.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
> > > index a075e77617dc..3450d615974d 100644
> > > --- a/drivers/rtc/rtc-pcf85363.c
> > > +++ b/drivers/rtc/rtc-pcf85363.c
> > > @@ -166,7 +166,12 @@ static int pcf85363_rtc_set_time(struct device
> > > *dev, struct rtc_time *tm)
> > >  	buf[DT_YEARS] =3D bin2bcd(tm->tm_year % 100);
> > >
> > >  	ret =3D regmap_bulk_write(pcf85363->regmap, CTRL_STOP_EN,
> > > -				tmp, sizeof(tmp));
> > > +				tmp, 2);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret =3D regmap_bulk_write(pcf85363->regmap, DT_100THS,
> > > +				buf, sizeof(tmp) - 2);
> > >  	if (ret)
> > >  		return ret;
> > >
> > > --
> > > 2.17.1

