Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87CC878AB98
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Aug 2023 12:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbjH1Kcy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 28 Aug 2023 06:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231576AbjH1Kcn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 28 Aug 2023 06:32:43 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2101.outbound.protection.outlook.com [40.107.114.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE2CDCF5;
        Mon, 28 Aug 2023 03:32:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ygkg/JC9JzolLMvlYIqhKIUXtt9C/mXUjriQTsnhnfuUNxFo7+gFXRNK6bTDbRJJZJyvvEspFRFtZauckbZLJhzagQosjOjnEzxo75xWa7UhVsXqC/EoLiSlmrg9+L785uTH5V602xfgxCcv8Z0p5rvnUI1tNolxszOMjztJv1tpt4ZlnBx8UrBX0aLtST0TdPNg+wrxH//AyZo6TBa1+OeIbgDzAuFTjEFOVqxzq4MYViyyQxBeQKVfYxQciqCUjxJZI9al9BroG1f+WrxgFcLK+KE97vgoCV4JppwuyyM7jie5FdsS13gxyrltLQXnyp4vRVdFWcKqCOIqMXMI6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFzpJW4pRUUUcoNQSca+JJ9/OBqfbGUdo2MRjD3w004=;
 b=C2eaO2NLfBxyBrJpDXUJu5QbHq4waCEiPAwINTUmPKaBhhTnjB9djBk0bFEbPyglhoMV+ie1NyPCOfzShswIJ+hrX/hpsXekoEVYoRrslLwnsJSppHb2hV2SgLX0aWzFdtZesBqMkvAAKSU5yLjzUGEklEFvWb51iWMS7K8KALVgUi6UHVo4VQbtY8WrJcW5sfjduyGRbM0M413uySIOA+2mBXnLzbTHDMJ/5mKZOwtQf4MIVhdHTVhFczbkAytegGK7ozMcXDgt7KKAiUHVxT/lRlS9W8Mlzu/T0UWcIAgf8vF0wkl6z9ml4SI5ioyidw6W6/MbEr2hQklsBpGZjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFzpJW4pRUUUcoNQSca+JJ9/OBqfbGUdo2MRjD3w004=;
 b=pKyoG9FpKj2+B2YxpBNxJ35/vprWUEDTpE4mwupKwv0sh8f1DgQaoN9ID3VGRXfF5zwqFbvRMXyGq52rGj8e0L1NlPRt8sZGgnYU/xDF502s2lDeua6f9GBQccsp1USlPPH+RcSWOWwf4zOPUnPcnuo0oRWff7yWcC977iJ2EsM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10050.jpnprd01.prod.outlook.com (2603:1096:400:1e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 10:31:31 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 10:31:30 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] rtc: pcf2127: Simplify probe()
Thread-Topic: [PATCH] rtc: pcf2127: Simplify probe()
Thread-Index: AQHZ2ZU0uWju5NKSBUWw4J9eZlZvLq//fA0AgAAFUBA=
Date:   Mon, 28 Aug 2023 10:31:29 +0000
Message-ID: <OS0PR01MB5922185A4E6E8567572A758D86E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230828095116.36922-1-biju.das.jz@bp.renesas.com>
 <20230828100836fa0fad9c@mail.local>
In-Reply-To: <20230828100836fa0fad9c@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB10050:EE_
x-ms-office365-filtering-correlation-id: a79a9010-1cb9-46a8-6145-08dba7b1f12d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g/pB6BzpT27TzXsmZxntbA95mvmJiCcK92W3pN6nCAmQp73c0iRj3JSqY4baKSXt+ThWVel9DnewH0WWVK0ud/mbxQ1cabiKaMVnrEt5olSNnqWOgI4SWtTcnIXEsdJHXXqdTxJHPPFMitMI5FtPUQ4EK704xmKx8tU8sZdhg5FPvgzaL9I3E4eCQFNE0xDUdsmP2pXentDTmYst2CXsY+bg2t9bKl7lCa1iR3Y7YOPB2Ro6i4nzFJp8sJuRKuVM6aWkr3MRZDIGB+GNlcoO4lE2tuuN7DcwwXpmerGoDPq7iU5PVZevM4gRU2mfT9ODaxF1bZ371KFlVoEBij7b9tkPz/QX2deA6Cakdqb6RqQo/aKoiJ2/Mbed/S1pz8zweIzIgGjJucJJb09NZrbzN/Uw0larCk6CVqXAVKFv7BhqMJArBYz+pS2hsrRMrSBXsK87kxTFlsopjBHkhEoRYPfTJKiXa3+YZtd6WQkPHk/27/SCXYBcxadxUUkV3SvTxsE4/CTQDJh3R7myImx2V7vOakJgcpmtH1XYyQBgQYu5iY6q9/tS2RSAwq30JQwDvumjYU4AAokpbfV2jdPz5HGsx9x5uClvJAQrEhg+I9YTQuc3RGOq0+mhRuOqSAzx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(396003)(376002)(346002)(186009)(451199024)(1800799009)(6506007)(7696005)(71200400001)(86362001)(33656002)(122000001)(38070700005)(55016003)(41300700001)(38100700002)(83380400001)(26005)(478600001)(9686003)(76116006)(66946007)(8676002)(5660300002)(2906002)(4326008)(66476007)(8936002)(66446008)(66556008)(6916009)(52536014)(54906003)(316002)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WrD/b1KX4X7vmn1QOga0RTq2jgr3US2T41W6DHW2s5kZy7a/NHAyU1b7qfJZ?=
 =?us-ascii?Q?SQMTbM4OIvMd911zdUgogZQicfhAvbjf3AaCsJG1tFahNz4HkBkFNdpXoiUi?=
 =?us-ascii?Q?GKIEAA0PhwQfdx6p61BWuG61rbKacn/GYIkn+UCa6dtTSh7voDp48iOG+w4r?=
 =?us-ascii?Q?YS6Iasv+670pyu7NLEIfniT8QE2uaj9egdIEG3/dFbitKXqeLzDDN434/BQW?=
 =?us-ascii?Q?gnLxL2vJblReJwt1tg6USXtm2GDYmfSGNiFFPA/8IpudrEETeXrLRtijiObm?=
 =?us-ascii?Q?X+tm+7x+xcqD/O+/v651EXLapbWrszw0UCqwamrg8IStnHl6TZoDXm1O1YhD?=
 =?us-ascii?Q?ROK8LvlGZ++cney0YAIbLAKAiqeHzi81PwC3gl+wOE1rfw17/Huiz2FYd+kS?=
 =?us-ascii?Q?4azRhaow4+YUUfoUdy/MmdKRZiF9J0AXtmuwr6hv4xqgSRGhU3OcM3aVU9GT?=
 =?us-ascii?Q?1V3+ysRAp9jVTjekdQyoKF61Tj1LHpA+ATm4CSRVGSiMfv49UmnwZJfPLhHL?=
 =?us-ascii?Q?QlssdhhLaCtdvZRktSMHGq8tLC37mZq3kcGmGqWm9KPLY7xcBZ//btNFB3A1?=
 =?us-ascii?Q?tQ5WVcNYbutfWibkO3XxMLFVi2696wZoljxjl/sBwA/ejRVfZOFRyqjyMgpd?=
 =?us-ascii?Q?qFsCFNmWMVOdS34TJ7mNqnSfcHH13sOFs0f73ZrhiQM2EhcB3ob/BRbj+wYi?=
 =?us-ascii?Q?SJASWJN1mk40e0DBAiN82SyAr4xrV9+1glC+6OxFzAZ54WYfaEehFRDCvYh5?=
 =?us-ascii?Q?wLewDjw++WlfNXdEU/mriazoSXAYmDcyqEIuk9kIEh8+cOS8frvQpSAZhggT?=
 =?us-ascii?Q?PByI/9ONYSJ2DCFUid094Xh+VruYZoZDN27rlEVDi2e+dtVRS8NF/zLxiUdr?=
 =?us-ascii?Q?+geZhjkhcKk5xFtWjCggKdBX1qjbz1KPsMK2lOH2znMHp4w66KFJAB3b08ni?=
 =?us-ascii?Q?SmqKv5JycAjyrIs7YCMbM/dOTnxeQnbbhHoQzbuHfSBx0f69gaShRbqshorH?=
 =?us-ascii?Q?bg2sJRJbEIDXoQnhSbl0nufBDTBDhYr5kTXOfE4a8Wm2io/KhQk9SH91kjea?=
 =?us-ascii?Q?BipKCfFaMuuUVamA6v9o9pgwAgJlY3vJ/Dw3RTbGF31sb7PqNLxT0q6RAWTo?=
 =?us-ascii?Q?yvqo//UNxAKjFExB9mDP0ozcqvMPqA6izMoiQff7eu5xamaNKdnZQ8QTxX4U?=
 =?us-ascii?Q?M9WkSKSxa2A95dWFlZ7UMcc9deduDurzEHMu/R9sdbQbABWYVsGCxDYVNPev?=
 =?us-ascii?Q?O2XWxQWwztTJBnm8E+uwPz0mAfXIb7PJ8uZWGNmg7wXB8xIXFUQILYuu9KDj?=
 =?us-ascii?Q?ruERaLPkwdVUQj/COdeLP5ufHen7z98YoClcTAazaHeooKCpkAbTP1/d6Tag?=
 =?us-ascii?Q?HqmHYtR2Wi/OohZmZGBKOZfUzviSkihl4oUBmj1DRkqQkQwAFMcELHv/y60M?=
 =?us-ascii?Q?uOyJgihy9mWCwgW/zr0v9wRqOojqGtIeB60i4KIUANZyv83nqSVeDDbDbPXW?=
 =?us-ascii?Q?JaLTMs95IXmaG5MiquMdQBtodVwo8b+IwdTKIC2Ukqf4KNTBFWG5SYzyOk+G?=
 =?us-ascii?Q?7jZ/kQjECYj4rWI993UbOZhfTH/tu84p7ggfDSkV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79a9010-1cb9-46a8-6145-08dba7b1f12d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 10:31:30.0297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2zgLnJiB17lt/J5fzmIQrzhzasumpxDijXhs8XVfVlriseqXH+HSwvlu4+c9Py7KQ0htM2CBTPAhaARuSnyWW3DOPhJ4r2wcK6C1fwENVEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10050
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre Belloni,

Thanks for the feedback.

> Subject: Re: [PATCH] rtc: pcf2127: Simplify probe()
>=20
> On 28/08/2023 10:51:16+0100, Biju Das wrote:
> > Make similar OF and ID table for I2C and simpilfy probe() by replacing
> > of_device_get_match_data() and id lookup for retrieving match data by
> > i2c_get_match_data().
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > Note:
> >  * This patch is only compile tested.
>=20
> I would really prefer those kind of patches to be actually tested.

I agree, users of this driver can test this patch and add their
Tested by tag. It is similar to the change done for rtc-isl1208.c
driver and similar OF/ID match tables tested on that driver.

Cheers,
Biju

 Else,
> I'm going to end up with 60 patches that may or may not break probing.
>=20
> > ---
> >  drivers/rtc/rtc-pcf2127.c | 33 ++++++++++++---------------------
> >  1 file changed, 12 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> > index 9c04c4e1a49c..ec3968e3b8ac 100644
> > --- a/drivers/rtc/rtc-pcf2127.c
> > +++ b/drivers/rtc/rtc-pcf2127.c
> > @@ -1349,15 +1349,6 @@ static const struct regmap_bus
> > pcf2127_i2c_regmap =3D {
> >
> >  static struct i2c_driver pcf2127_i2c_driver;
> >
> > -static const struct i2c_device_id pcf2127_i2c_id[] =3D {
> > -	{ "pcf2127", PCF2127 },
> > -	{ "pcf2129", PCF2129 },
> > -	{ "pca2129", PCF2129 },
> > -	{ "pcf2131", PCF2131 },
> > -	{ }
> > -};
> > -MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);
> > -
> >  static int pcf2127_i2c_probe(struct i2c_client *client)  {
> >  	struct regmap *regmap;
> > @@ -1370,18 +1361,9 @@ static int pcf2127_i2c_probe(struct i2c_client
> *client)
> >  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> >  		return -ENODEV;
> >
> > -	if (client->dev.of_node) {
> > -		variant =3D of_device_get_match_data(&client->dev);
> > -		if (!variant)
> > -			return -ENODEV;
> > -	} else {
> > -		enum pcf21xx_type type =3D
> > -			i2c_match_id(pcf2127_i2c_id, client)->driver_data;
> > -
> > -		if (type >=3D PCF21XX_LAST_ID)
> > -			return -ENODEV;
> > -		variant =3D &pcf21xx_cfg[type];
> > -	}
> > +	variant =3D i2c_get_match_data(client);
> > +	if (!variant)
> > +		return -ENODEV;
> >
> >  	config.max_register =3D variant->max_register,
> >
> > @@ -1396,6 +1378,15 @@ static int pcf2127_i2c_probe(struct i2c_client
> *client)
> >  	return pcf2127_probe(&client->dev, regmap, client->irq, variant);  }
> >
> > +static const struct i2c_device_id pcf2127_i2c_id[] =3D {
> > +	{ "pcf2127", (kernel_ulong_t)&pcf21xx_cfg[PCF2127] },
> > +	{ "pcf2129", (kernel_ulong_t)&pcf21xx_cfg[PCF2129] },
> > +	{ "pca2129", (kernel_ulong_t)&pcf21xx_cfg[PCF2129] },
> > +	{ "pcf2131", (kernel_ulong_t)&pcf21xx_cfg[PCF2131] },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);
> > +
> >  static struct i2c_driver pcf2127_i2c_driver =3D {
> >  	.driver		=3D {
> >  		.name	=3D "rtc-pcf2127-i2c",
> > --
> > 2.25.1
> >
