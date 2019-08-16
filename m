Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6838F920
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Aug 2019 04:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbfHPClR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Aug 2019 22:41:17 -0400
Received: from mail-eopbgr50074.outbound.protection.outlook.com ([40.107.5.74]:47702
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726364AbfHPClR (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 15 Aug 2019 22:41:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgwTPGQVFl/o7nRFkK71chaF09MR1AxfslqNQKum4mZ6Yj3Fjy2opAQRt2gprRAL0XP5ZZ9hzr1k67YJpGC6LbKumhnkU5xKDDLjkWBJx9ELulp196thARUIgp0lFwtoQ6gprBlivwItOicpfYDXYzcJv4kB4D8RfKg2DC9Dz70mKxBx1uMsQVH/zUCb3tOGJOkBQiv7/6m7kAjtD2p3qIqOKKN83DpIfFl+qkXTXX7T+qLU0n1T1jcWHx9vp9o5A9ABuQdVvWCUcJw1hm6yb5oNMpfKwNa+TBuzZuUBfdQ8x/QzMyytJXxBOqQTKI2Nz7m96QAWMKtHgZauMFXA6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Puv7TYY8J9/CNzrNexjAb88fOoAnunaxYWSGdNu7lTo=;
 b=Wbtq0EJnkXPIt5tqqEXgQrGTSpH3KDAwVZsu13dOciFNycXExl/rhwkjDrV0y6g8gQvdIxCUuQsEbndPX9Zojm38a+ExCDDxbol2wczWO7U2Q6rvNIekouM2Dssnx5UNwCBr5GiA/r8NYM7pHpYX2ZbhMWck9W9KcCPHDKWKrxs4dboCo1taf/J27iYQoNZgIzZ7CVrmdVNhCZxrzQjA1mjNgmC6Yiq1HL1oZglX2E3Z6SL+46FL/qJofVDta3x3jAUA3lI/KNOAzNW4lcpKbIQVtqntL80xS+WQP76lgriI3lRL4nkVNSPVITwAbqTI5c75SwFVtngD3bSMoiFyHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Puv7TYY8J9/CNzrNexjAb88fOoAnunaxYWSGdNu7lTo=;
 b=rwFhthuN6TZ36ItY7JmdJ9D6N4i2UXndvSxv9v9ZnajS5V2TJq9Hq9dGe3FgLh+gk3Qab8neSPEFYtu/c3MfYtf5OEVuP+cdIzrsQDWZB60Wp0FQ0bSBtrgm8Y2wBxzS6TWaQLQy+Wj69B8L+qHCsJHvKz+Bj6AwcHNM7NJgimU=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB5452.eurprd04.prod.outlook.com (20.178.105.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 16 Aug 2019 02:40:33 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::ccc8:8:c071:8283]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::ccc8:8:c071:8283%5]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 02:40:33 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Leo Li <leoyang.li@nxp.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: rtc: pcf85363/pcf85263: fix error that failed to run hwclock -w
Thread-Topic: rtc: pcf85363/pcf85263: fix error that failed to run hwclock -w
Thread-Index: AQHVUoSfyAMvxeFinU6CH649Ec3dZ6b6+iOAgAB7elCAAQw+AIAAkJ+A
Date:   Fri, 16 Aug 2019 02:40:33 +0000
Message-ID: <DB7PR04MB4490F6D6161EC3F5B5FF7C738FAF0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190814093249.40065-1-biwen.li@nxp.com>
 <VE1PR04MB66875AF7A38BF43351970EB08FAD0@VE1PR04MB6687.eurprd04.prod.outlook.com>
 <DB7PR04MB449054F05411CBDC935605F28FAC0@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <VE1PR04MB66873BEBB6EBCC1C04D0AC238FAC0@VE1PR04MB6687.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB66873BEBB6EBCC1C04D0AC238FAC0@VE1PR04MB6687.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9dfebbf9-70b3-47db-20e2-08d721f31c6d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB5452;
x-ms-traffictypediagnostic: DB7PR04MB5452:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB545267B04718ADFD8B14FED38FAF0@DB7PR04MB5452.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(189003)(199004)(81156014)(8936002)(81166006)(5660300002)(229853002)(8676002)(26005)(86362001)(186003)(99286004)(316002)(54906003)(478600001)(11346002)(6506007)(52536014)(7696005)(44832011)(76176011)(446003)(486006)(476003)(110136005)(33656002)(14454004)(2906002)(2501003)(2201001)(966005)(4326008)(3846002)(74316002)(6116002)(6436002)(256004)(102836004)(9686003)(25786009)(14444005)(6306002)(66556008)(66476007)(76116006)(55016002)(64756008)(66446008)(53936002)(6246003)(66066001)(71190400001)(66946007)(71200400001)(7736002)(305945005);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB5452;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: u2I0K1o6IdUnifhRgdA51/0xxylVlEs6CnkO4Chf61mNdRI7hEWFEYWwmRdTkwCBYXDROPsXP6xA+wx6yDzvp4sP8Ri22IMwvdMFSWob0b81dnHw26r+OL7nluatkXXGPw7M0m1Q2P5N3UuZTYPB2Y3NWc2T6pLU914LCzmsUqYxoaZOeFDSIbB4+a0F31oizUmmkoulJ5TplQIY3pJIZvwt+fj0s7NJJh36TyIr2WM7PJ/c2fQyAhhkYaXs1t86KTjGJpOvNruoFxgwQWYxZ5WSrWiOYvPhkv8AltIbm7LNiP2tQglc/wH2+G2Kc0mAtl6ALq10izRTYr+7BCa3cKkV2TyjWvp5yxuC5pmGbKpdWAWp1EoswmK+cf58Q1KFL9jxjNx2omBtJ82pjmgizqT0SNko0giPpqmobjpJxcs=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dfebbf9-70b3-47db-20e2-08d721f31c6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 02:40:33.2638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4lhcLij194+YUAjS54R1brO7aXeumGsmzorUZkUJNJk8G2iXRz/mt+fHAHUEjISrcj5oGEpwQIYd2l/0mI2w/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5452
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> > > > Subject: rtc: pcf85363/pcf85263: fix error that failed to run
> > > > hwclock -w
> > > >
> > > > Issue:
> > > >     # hwclock -w
> > > >     hwclock: RTC_SET_TIME: Invalid argument
> > > >
> > > > The patch fixes error when run command hwclock -w with rtc
> > > > pcf85363/pcf85263
> > >
> > > Can you explain a little bit more in the commit message on how the
> > changes fix
> > > the above issue?   It is not that clear just from the code.
> > 1. Relative patch: https://lkml.org/lkml/2019/4/3/55 , this patch will
> > always check for unwritable registers, it will compare reg with
> > max_register in regmap_writeable.
> >
> > 2. In drivers/rtc/rtc-pcf85363.c, CTRL_STOP_EN is 0x2e, but DT_100THS
> > is 0, max_regiter is 0x2f, then reg will be equal to 0x30, '0x30 <
> > 0x2f' is false,so regmap_writeable will return false.
>=20
> From you description, it looks like the problem is actually that the buf[=
] was
> written to a wrong place.  If that's the case, we should say that in the =
commit
> message.
Yes, you are right, I will add this into commit message in v2. Thanks.
>=20
> >
> > >
> > > >
> > > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > > ---
> > > >  drivers/rtc/rtc-pcf85363.c | 7 ++++++-
> > > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/rtc/rtc-pcf85363.c
> > > > b/drivers/rtc/rtc-pcf85363.c index a075e77617dc..3450d615974d
> > > > 100644
> > > > --- a/drivers/rtc/rtc-pcf85363.c
> > > > +++ b/drivers/rtc/rtc-pcf85363.c
> > > > @@ -166,7 +166,12 @@ static int pcf85363_rtc_set_time(struct
> > > > device *dev, struct rtc_time *tm)
> > > >  	buf[DT_YEARS] =3D bin2bcd(tm->tm_year % 100);
> > > >
> > > >  	ret =3D regmap_bulk_write(pcf85363->regmap, CTRL_STOP_EN,
> > > > -				tmp, sizeof(tmp));
> > > > +				tmp, 2);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	ret =3D regmap_bulk_write(pcf85363->regmap, DT_100THS,
> > > > +				buf, sizeof(tmp) - 2);
> > > >  	if (ret)
> > > >  		return ret;
> > > >
> > > > --
> > > > 2.17.1

