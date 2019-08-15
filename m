Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA3C8E371
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Aug 2019 06:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbfHOEO4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Aug 2019 00:14:56 -0400
Received: from mail-eopbgr10074.outbound.protection.outlook.com ([40.107.1.74]:61861
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725875AbfHOEO4 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 15 Aug 2019 00:14:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlvaQqA20oGFE+Q4Z6MSyap5QL1/LIeYS8bFadts/q54LaWsFzB7qqDTMn+OCg2SnMsKopEUbsb9i6d7jbETK6DjkojMSFpFbkzM1Q66fjdxnc24j9Jv9oClK4dAyfTfX7CH05RilrNXIrjiaGAM814NbT0emVbvi4kTH5k8J2qzigw9oy7xs0pl+g4LhP0STX04weFiizCt8OSGw1OrS1GfeL0MmYKR+08AEmLXjSqUEdgEdjMRzVVGhQCSR7HZv/VuNxscTJBZkTiEkXKy9S5wcCwn/i0WIbNGBpQJmjFhNOCCg+rCKMPwuB8V/zJzZejKVx9hsLGczzFi91FGEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ff2QWEEgVH5vAIeKiVGTpQ4IpNUEcdfesUwKiVCrUNw=;
 b=ks9A8y63OjmQoTVuOsG4evm0jgR6+DJKSjmL5k0qkM/CLImUYMnEm1mqbVZqzvsKKMT5a7MOi6UhASrM8ZX0NkZOktqfnnJWomzHpK+3z81u0d8DugY9S1bob+4rLh7DRs4aOz1Eu9iiBCvenBGR/cvN/REcaMnoXLfX9DY5q+rAcFzV8QXWd59XJ3845p4ZPP3uw5WckLqJDolHBF5Lm7N103YH6KgJe09yYlQWvbgOKOPwOiiRjFmJrjAw5bu2tqeJXJb9gBWacqZtC90hRXtGx5MZt6XVOkYdmYqXj1yxp2fLJsEIqyRgvyqqx2AvUYiG9icNnBkY8XWe++WhcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ff2QWEEgVH5vAIeKiVGTpQ4IpNUEcdfesUwKiVCrUNw=;
 b=WTmKoUilDkwpr0ox0DXLLOBv3HFjJVRjio3yauxnrLjqQ/iJKIL1SWU7ksuw+0Vy032DkA6SprUAdyHrt5hw8sxrIy+ATvzSRGn+ydfSD/0aKE/wyVK9QL6cbRG+LkqppqvskDH3UAUumcYnECcjtsDGXeKdWajLyCu8s+UrHCo=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4665.eurprd04.prod.outlook.com (52.135.139.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Thu, 15 Aug 2019 04:14:51 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::ccc8:8:c071:8283]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::ccc8:8:c071:8283%5]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 04:14:51 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Leo Li <leoyang.li@nxp.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: rtc: pcf85363/pcf85263: fix error that failed to run hwclock -w
Thread-Topic: rtc: pcf85363/pcf85263: fix error that failed to run hwclock -w
Thread-Index: AQHVUoSfyAMvxeFinU6CH649Ec3dZ6b6+iOAgAB7elA=
Date:   Thu, 15 Aug 2019 04:14:51 +0000
Message-ID: <DB7PR04MB449054F05411CBDC935605F28FAC0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190814093249.40065-1-biwen.li@nxp.com>
 <VE1PR04MB66875AF7A38BF43351970EB08FAD0@VE1PR04MB6687.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB66875AF7A38BF43351970EB08FAD0@VE1PR04MB6687.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 873857c3-037c-49f6-b264-08d721371eaf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4665;
x-ms-traffictypediagnostic: DB7PR04MB4665:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB466554D4BB7E8DD340CBB0BE8FAC0@DB7PR04MB4665.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(199004)(189003)(71190400001)(6436002)(8676002)(55016002)(44832011)(102836004)(9686003)(6246003)(476003)(316002)(446003)(2906002)(66066001)(11346002)(7736002)(6116002)(53936002)(486006)(186003)(26005)(66446008)(229853002)(66946007)(66556008)(64756008)(54906003)(76176011)(3846002)(7696005)(6506007)(76116006)(6306002)(71200400001)(110136005)(2201001)(66476007)(86362001)(2501003)(4326008)(99286004)(81156014)(74316002)(14444005)(478600001)(8936002)(52536014)(81166006)(256004)(5660300002)(966005)(14454004)(33656002)(25786009)(305945005);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4665;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QXtHl3N3pS9XsgY+yPJS9MdKAWUHFU6rdOkg9aGDVliXwDBPmSEVvP4ynhmZD5N710NW36EKve314/dQmfg/2hr+7C5LasOGY8n+lxFL+DJpVLcZnY4xuk657v5unSrRZZxIEnkjabdl6elrGL6akJPcw8t16YPXCaJ6MyXxQAQc/9hEhkJuHygJiroBgyxEjDMttWuOVWKzZ7V01xJR/Dbt4NTGEqFC/lLDxu9R7Eid/qvqmtNHIqmA9LYqshsjA8Bsmps5rKgum87Ju3BBCQy/L9pyUsthYmJ6IVLGPZi77DtgdAK0uRE2OUgO3cYpsyv4ps3e7hf+07Q0hXJb7jAUV6XOvrPl+tsIekt/CeCNBRQJcKr+TfRaE+pC2rdKAJcPVaE+kAi5IYOzvv9ByATaxg0/mv4sWvU19vnca0A=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 873857c3-037c-49f6-b264-08d721371eaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 04:14:51.7533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IxqPlZ+9Rs4JdP4/lG0mF9Us/ehwhq7cBd4srARqZQjPEF4leMOSXsB8TLm7ekg6Y+wXUw2JjhE6CI9IilfRZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4665
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> > Subject: rtc: pcf85363/pcf85263: fix error that failed to run hwclock
> > -w
> >
> > Issue:
> >     # hwclock -w
> >     hwclock: RTC_SET_TIME: Invalid argument
> >
> > The patch fixes error when run command hwclock -w with rtc
> > pcf85363/pcf85263
>=20
> Can you explain a little bit more in the commit message on how the change=
s fix
> the above issue?   It is not that clear just from the code.
1. Relative patch: https://lkml.org/lkml/2019/4/3/55 , this patch will alwa=
ys
check for unwritable registers, it will compare reg with max_register in re=
gmap_writeable.

2. In drivers/rtc/rtc-pcf85363.c, CTRL_STOP_EN is 0x2e, but DT_100THS is 0,=
 max_regiter is 0x2f,
then reg will be equal to 0x30, '0x30 < 0x2f' is false,so regmap_writeable =
will return false.

>=20
> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> >  drivers/rtc/rtc-pcf85363.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
> > index a075e77617dc..3450d615974d 100644
> > --- a/drivers/rtc/rtc-pcf85363.c
> > +++ b/drivers/rtc/rtc-pcf85363.c
> > @@ -166,7 +166,12 @@ static int pcf85363_rtc_set_time(struct device
> > *dev, struct rtc_time *tm)
> >  	buf[DT_YEARS] =3D bin2bcd(tm->tm_year % 100);
> >
> >  	ret =3D regmap_bulk_write(pcf85363->regmap, CTRL_STOP_EN,
> > -				tmp, sizeof(tmp));
> > +				tmp, 2);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D regmap_bulk_write(pcf85363->regmap, DT_100THS,
> > +				buf, sizeof(tmp) - 2);
> >  	if (ret)
> >  		return ret;
> >
> > --
> > 2.17.1

