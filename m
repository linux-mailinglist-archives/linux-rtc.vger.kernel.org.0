Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D55368E384
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Aug 2019 06:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbfHOEUq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Aug 2019 00:20:46 -0400
Received: from mail-eopbgr30047.outbound.protection.outlook.com ([40.107.3.47]:4608
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725880AbfHOEUq (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 15 Aug 2019 00:20:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRxBIOqC1115thJLJrGYfo/3+jg1REOP5nQfgis2SCg1k0ZadZ5STEIi/nXIX41MtwbPQb8Q5EkHqm0JWyJ+GMxDvkBWMRGK5YbV+cBg5jxYUmD+qPkiLslOA9TTUDhA9ya6jIV3l3OkRrYsdVMIF2pQo1QEpClxMtzaGXCJMwC0v8IvqhlQ91NeBdycN8qbgEkp4SmAzExVOR67dVf6R9McxPco+JE29aGCHjafSzlpMs+CZiA7hYGGc6en/3jixt5ZCCP/1wtQ6d4dAfKY6ITGA7TPSET8qHklFNF26RN57XNIvkZkboQMdORFalHVrFeHNX2tTdODPGripKlKyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7YBoZUo+Dy/sbGTrQdgxIQ8HSZ4piQBNLT8/HB5sJY=;
 b=oU8I/nF4naCNATHSpA+REdKGkDYZA2vOKCi0jO15hNc0bqFA4fau5/CNNW9Ab4kKsfdjgIHlQMIJSTi2w7TUeNP48WQJb5zcho1eQbm9agwvuqGLE9m0l/7XudkyrR1jFKeK0UeDPAcUtz8Yk8NNTCN8puRbuX52s0NBPx+rlccCf10Mn3C2BQ/z9Shh9ZzifpN0T/Kt3R6KTW8aF5QLn9D2S+G4M0K32BwwW5vtRSm65s3VubvPM+hFIHq5C9FL2Cy/Ie27rRKl+DpyRTxUAFmQ9afXXoUkJ7zICGRZ1QePEekesekpJgeYxW3RTzddYX/a9QHAVPq63K1Wzi7d/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7YBoZUo+Dy/sbGTrQdgxIQ8HSZ4piQBNLT8/HB5sJY=;
 b=nqO3JFv1eF1bo4gaqt5X1xVQvWJWBKkL53/apmoH1qJTHzBgTL5Rb5NvduOtf0dz71EUbSqVi1MTDBFS6mBh6tyuGnoWQ+1h6xpp39c6ZtziIU+SYC9dYzbPjFQM4t5n83M9fZM2GUVsQVMaL9Zlrg9PTElnGfTpLbqZT8nbLeg=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4665.eurprd04.prod.outlook.com (52.135.139.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Thu, 15 Aug 2019 04:20:42 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::ccc8:8:c071:8283]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::ccc8:8:c071:8283%5]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 04:20:42 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        Leo Li <leoyang.li@nxp.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: rtc: pcf85363/pcf85263: fix error that failed to run
 hwclock -w
Thread-Topic: [EXT] Re: rtc: pcf85363/pcf85263: fix error that failed to run
 hwclock -w
Thread-Index: AQHVUoSfyAMvxeFinU6CH649Ec3dZ6b6a68AgAEvbGA=
Date:   Thu, 15 Aug 2019 04:20:42 +0000
Message-ID: <DB7PR04MB4490882B1235995B82AA67CB8FAC0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190814093249.40065-1-biwen.li@nxp.com>
 <20190814100930.GI3600@piout.net>
In-Reply-To: <20190814100930.GI3600@piout.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 667dddcf-d96b-4006-8ac0-08d72137efe7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4665;
x-ms-traffictypediagnostic: DB7PR04MB4665:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4665193AC13C103B3B284CC28FAC0@DB7PR04MB4665.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(346002)(396003)(366004)(39860400002)(376002)(199004)(189003)(8936002)(478600001)(14444005)(74316002)(81166006)(52536014)(99286004)(4326008)(81156014)(305945005)(25786009)(14454004)(33656002)(256004)(45080400002)(966005)(5660300002)(66066001)(2906002)(11346002)(186003)(486006)(26005)(7736002)(53936002)(6116002)(6436002)(8676002)(71190400001)(6246003)(476003)(9686003)(102836004)(446003)(316002)(44832011)(55016002)(71200400001)(6306002)(6506007)(76116006)(86362001)(66476007)(64756008)(6916009)(229853002)(66446008)(66556008)(66946007)(7696005)(76176011)(54906003)(3846002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4665;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZYBPZAieoMZNc+rRih2JbWJ5ZncKVVt1gUwj32hRphnIaiQ+PdSXzv+Wdb0WETnkfl8Iu4aLkDXQ0cJmwxBSv9Vd5CEq+KffSUKisJR6X4L1v7LnZrKjM92Wn2c74HYFuU7RaPf5ouOBBDCa4mOzYrci1vZZ2WYIs2mNJhkZ4eURjwjQrT5KqHYgazRyo7azPtGXySsr022L4AzLimxNxn9V/R3/uGjvpTfTnbBbJcqQI9h+VjS321PY6J+e83iQ07TE+k8xacAczG7txmw5JBaIjhZPYHXKz8R5hyieN+VDueIy0XtxyGpkl3XArnLHLIecf/HT5UhQLYsCMyRFy/Zv9yx6o/QGdDM6CBMB/lfhDNYWH8WokpyZDM7/fN1AvCp5oqvSWIbGdWMbdWyOaUaVWja0jER8cY7DyAX7f5w=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 667dddcf-d96b-4006-8ac0-08d72137efe7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 04:20:42.7071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vRSbzjzeCLg5ekTZawI5CdmQ6CeHAhzgX36M8C85mbbDIs4dk2xVQKpJAxtV6j5+iSplIgFppba3qAuJL3C6tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4665
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> Caution: EXT Email
>=20
> Hi,
>=20
> On 14/08/2019 17:32:49+0800, Biwen Li wrote:
> > Issue:
> >     # hwclock -w
> >     hwclock: RTC_SET_TIME: Invalid argument
> >
> > The patch fixes error when run command hwclock -w with rtc
> > pcf85363/pcf85263
> >
>=20
> Could you describe a bit more the issue and what causes it?
1. Relative patch: https://lkml.org/lkml/2019/4/3/55 , this patch will alwa=
ys check for unwritable registers, it will compare reg with max_register in=
 regmap_writeable.

2. In drivers/rtc/rtc-pcf85363.c, CTRL_STOP_EN is 0x2e, but DT_100THS is 0,=
 max_regiter is 0x2f, then reg will be equal to 0x30, '0x30 < 0x2f' is fals=
e,so regmap_writeable will return false.
>=20
> IIRC I wrote that code and it works on my pcf85363.
>=20
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> >  drivers/rtc/rtc-pcf85363.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
> > index a075e77617dc..3450d615974d 100644
> > --- a/drivers/rtc/rtc-pcf85363.c
> > +++ b/drivers/rtc/rtc-pcf85363.c
> > @@ -166,7 +166,12 @@ static int pcf85363_rtc_set_time(struct device *de=
v,
> struct rtc_time *tm)
> >       buf[DT_YEARS] =3D bin2bcd(tm->tm_year % 100);
> >
> >       ret =3D regmap_bulk_write(pcf85363->regmap, CTRL_STOP_EN,
> > -                             tmp, sizeof(tmp));
> > +                             tmp, 2);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D regmap_bulk_write(pcf85363->regmap, DT_100THS,
> > +                             buf, sizeof(tmp) - 2);
> >       if (ret)
> >               return ret;
> >
> > --
> > 2.17.1
> >
>=20
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl=
in.
> com&amp;data=3D02%7C01%7Cbiwen.li%40nxp.com%7C8ef8fda7d05a48ef707
> 308d7209f8029%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
> 7013741730886353&amp;sdata=3DePC651YZUzvL5ocjXAZqKT0tIZpJM01LgRNSa
> 7i7wLE%3D&amp;reserved=3D0
