Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70DD26F80C4
	for <lists+linux-rtc@lfdr.de>; Fri,  5 May 2023 12:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbjEEKbq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 May 2023 06:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjEEKbp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 May 2023 06:31:45 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2091.outbound.protection.outlook.com [40.107.8.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B681943D
        for <linux-rtc@vger.kernel.org>; Fri,  5 May 2023 03:31:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vt3QI8B2IrsKEupRhzubK8ERq7ejLDvrTQChD/i0KfnZNujp4hIJ7eIjwXvWg0XTt8QKUcxVvhumN6yg5ZzH1deUVB+bWnOoci/WgfwA+7HtD7pMIT5ZCpabK3E4pO8Myqd4/9rxv9yYqahQKG7sznnr6QNo25PWVA6N13r6lsZWyLETSh2/M4Zb5vXP+ud8aqiQwGxDVvidx5YcKsyfmZIWMqViDBYCDAFDhzzZH+7y0ZYcQ+rKABhytEsyjIPbI7JVLaAB/rueH0rPROtYdhcF9qYrnTstVCjjU5Ayzeb3LsUO5K6rS2eLgRYjtw4hiRF6z2LM5vIH+SQFABRy+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqkGO4F/yjxQTrtoUN2/NKyageTctzM8MaUbGdYkx1k=;
 b=lmt1LIBX6iNPPVCDOtPWGMDct8k5xBsePrJuZIXRfUlalWCkAiJyRUBMd8TzuyB0C4zyFPWgy8TEnqlz8ZIRp3A1AoHmaLH8eiXFfOmwTSg++t2t9vWt2ujV2AWNz/GrDHHTSaRxW4KPHueT7XTdyvXLLl+Zp2oPm2rg0eOM6tQMWMzGqInkacSf11iC5aa02/heGr/1rR+jtQtHPZJIxudxi4urLVTfHAnNXvV0espiNzcKfL5GC10t2mqdDEHbNNXbSio62dH/lhT8mrxg5sx0HnDoAonzmGcf6A4Ogsc5K4efczZC67a6ezmf5X8N3EPFBmbb/GHwgfLoujMvZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sigmatek.at; dmarc=pass action=none header.from=sigmatek.at;
 dkim=pass header.d=sigmatek.at; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigmatek.at;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqkGO4F/yjxQTrtoUN2/NKyageTctzM8MaUbGdYkx1k=;
 b=XH4WM1MizWlunwqxPPwdCj791DoQ1Qy4FODPyn5elBw7njWYzrkQIhbuhGAU2u0GGT6nnPb3ZzJWbn0KhBHoP2tu7wLgERxFcy8va/EFkexp7Zt+RhsZyM3M1T4OIh7unVGKGTDWeiDItdLDSIyE1DhVE3tFWWAiDYE3Muzt3YA=
Received: from VE1PR08MB4909.eurprd08.prod.outlook.com (2603:10a6:802:a8::22)
 by AS8PR08MB6024.eurprd08.prod.outlook.com (2603:10a6:20b:23d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 10:31:38 +0000
Received: from VE1PR08MB4909.eurprd08.prod.outlook.com
 ([fe80::89fb:34bc:72e9:6c15]) by VE1PR08MB4909.eurprd08.prod.outlook.com
 ([fe80::89fb:34bc:72e9:6c15%5]) with mapi id 15.20.6363.021; Fri, 5 May 2023
 10:31:38 +0000
From:   Johannes Kirchmair <johannes.kirchmair@sigmatek.at>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: RE: [PATCH] disable clkout for rv3028 by default
Thread-Topic: [PATCH] disable clkout for rv3028 by default
Thread-Index: AQHZfmL7h3TOTk0UxU+ulzPqWNNx4q9J1GwAgAGASZA=
Date:   Fri, 5 May 2023 10:31:38 +0000
Message-ID: <VE1PR08MB490947C09283BAFF269E26BD92729@VE1PR08MB4909.eurprd08.prod.outlook.com>
References: <20230504083217.2371933-1-johannes.kirchmair@sigmatek.at>
 <202305040912507451f5a2@mail.local>
In-Reply-To: <202305040912507451f5a2@mail.local>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sigmatek.at;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR08MB4909:EE_|AS8PR08MB6024:EE_
x-ms-office365-filtering-correlation-id: 2c998c66-1f48-4b76-2605-08db4d53e8c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HHw+Z9FqwID0GSgwavMBLK9K1gwbIaydph7LyCDQD3aicpjL2F7cEU1iNkCint0a7HXSesk/sDGzA4U13iQo497zHQk3hwwwcxmJqC4W9kKkPplfMU3mJsQgGRu0P7oZKudmCsBnC3Rigkv0kB/ky+tzQ4X/IIh8Dwt6PTsxxl3IiEasAKB/tfwurFEYdLJHvlVjyEFS2yKfFuaGp0KcYSWmqBkvovjr7R4scosAdkR+w8pcU47MLgq/Ysd8suJ1SpDz73JDOp0334wxxaRtPcs05dU74yOB/nsCi1O9Xf4aH7xyZFvsd2r3y4gayGiyOCtyXLXCFoIAYF0KnATIWqkcOyAO00Y9m6Vf87P9SppmgjPUhcoQAFWlDLG/lrxY+R9X3SO10ESk5M3+SrDNgxpzVXnWrn4P5E6uxs3RERlAq5Jh9O7hnW+AGhmsppChLMfzR0xqzFVCk4/uM89/eRr6+S93odc/9yygetbwsN4uSTAKl5j8W+GZ18AAxdYuWCKV+RM395UX4yxsK4HFfpS9lUd8YTAU+iRPhfZfaxzvbS9jlxk4KfxqueDjbFUPRtl49+7RQsDNWK9JLak5J2nYCwY/JzxI5c5Pc1PyizU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4909.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(366004)(346002)(136003)(376002)(451199021)(7696005)(966005)(76116006)(478600001)(66946007)(66556008)(66446008)(66476007)(64756008)(6916009)(4326008)(71200400001)(316002)(33656002)(86362001)(83380400001)(53546011)(6506007)(26005)(9686003)(8936002)(52536014)(8676002)(5660300002)(44832011)(2906002)(41300700001)(55016003)(38070700005)(186003)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MRz59DWkaP/l91kXZOXH1TdXSyjqPAmFZ+ma7fUHMZC4uq5yigUXw7QHRbjm?=
 =?us-ascii?Q?tc1/bijxnB31uePKX54oQSuHyfst0P0j9YGpHXYrsrcYtVlYkyk3qkr+xCL9?=
 =?us-ascii?Q?2HX0Rm+aCvVlMES56q9pu4XmDP/5pMnPQeicF+rwM6EMv0E4bSDtJSZvvixH?=
 =?us-ascii?Q?4GblmKl6Ha2CKWYviKfqkEsTxu5yDYos3RmXLnGJ9YPCdPh8QIYbW/KvezHT?=
 =?us-ascii?Q?BGMV35mNPA8INa42fSC0mjCkCHCuDBxI6hI5nBUyAe3fwKAruqZSGJpGvmSs?=
 =?us-ascii?Q?VGvEMm2Avd3zaXfRSP11p0hbjpXJcvhb+aIB2x0v338jQ2CJjwm2WyJTAYcx?=
 =?us-ascii?Q?aNJR1Nr7TX5mDao88Vdb8+R6fBKxGCjYWRKusYor56Ar0mIZD2IigZz1HImO?=
 =?us-ascii?Q?gLWICqVNlMTvFpN6iVZ4125PpVpjK2eaimAi8/YorGX4fjpEWYHl716au9cL?=
 =?us-ascii?Q?QLHa9YFhoKbHF2f3Gct8c7XzUjvOXXyMYKDK3kZk2N4uwze6bo8/C5GPlwWd?=
 =?us-ascii?Q?quCcdkeSy05wotRujL9LRkKsobI0TVsJen0MW6JjlqUqGQainkeB6nNYHBkj?=
 =?us-ascii?Q?M8Tk+dFWPW8ur8vT1EEnIepSrj+4a2ZT0ulTPIGmnhcKrDkLJAFJJE6P8xTC?=
 =?us-ascii?Q?lnHwnxj7lwGRI5SmzEz/otYSltKx8prCPyCecHIsewbtAbdqbzJOmIwXcz5R?=
 =?us-ascii?Q?FSD5qrD1tBokOJ6AFX2gFqGnRR0UAKskVRb6NyBqaOh9Ns0H07bbtdi8Uj7d?=
 =?us-ascii?Q?CBAzKJuY04WHwJg0KOLt7X6JldK0gvQ7QUEGa7u0pn+C9xLulJ059K3jt0Kd?=
 =?us-ascii?Q?0Bkvuj2i0RrbWnrHR6GmCx0mLIvCbCb8S5+CNeE3qR4fkLFVujWYqIBG+70g?=
 =?us-ascii?Q?w6krT1zH8MeGFZE2uTdjnhTy1hK5Cq+SMv/G64lcqBB79ncpWS5Emg52h05M?=
 =?us-ascii?Q?qwVPp0Ok/TYTEmveJPr2obb6UZwDmnR5+9wyJN8ZSLY80iRShMUwZetrZg6S?=
 =?us-ascii?Q?SymqEqqcXDEplXmySyY7hvzFbWOsA2HEuHVRgG6XjIQpDuXFSN3JkFXAWD1w?=
 =?us-ascii?Q?xGbND8V4GK16N+UNem3ZjS72bwJdJvk9E4rLDno6G3CykmkfVALi7eYKVrJO?=
 =?us-ascii?Q?7ngusOZvyjwFMly7fuXgKiN0C9Dz0HQruhiDLWa2HBR+cig7Bt/tPLH928Ns?=
 =?us-ascii?Q?nf+mskJWAu5oMvdFXr0bYaDgdwVLB6yetEir3DXX1O9b2uEkupyxrXYdJ29P?=
 =?us-ascii?Q?6pTAUvRJB2KA+LKrv2ZiCseeePnmEy2QMeYow25+9Uiw2yJizYrHPeGimX9G?=
 =?us-ascii?Q?QRUd1cRQIOgF0pjgOiwEfu3WU9CDEpignY4wVYmIxV1uUX/WhBF7kjaUFIuv?=
 =?us-ascii?Q?s9N6/WjTwFNI4UvJt2H1UGlup13ztLV2H1KQshJxaysZy9EbwjPVSY7kWBlB?=
 =?us-ascii?Q?kmi2/vaiDJX2YRADqH7EiCdkpBfylU6INgioaqiNev57IlPLKZ46+t5TeH9U?=
 =?us-ascii?Q?ol2HiynGZ7Rz9FHrw7tnjeXESaoRYgc7g5QqKndROVvuBttLwAFq/RfbcCFO?=
 =?us-ascii?Q?NAhThbeXT6MayEHUAcc/3EbPgbLCbi+LuFLw30NDBaP3p1Sbo4CsHCjv7iMz?=
 =?us-ascii?Q?PQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sigmatek.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4909.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c998c66-1f48-4b76-2605-08db4d53e8c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 10:31:38.5755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcb1d87a-d2bc-486e-a62b-9ac9c746bc1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nFRorw7VmmOdbV9xlhMDbmFNq/YNcHwxRVSbCqgXKpuvu0TFjscKRT7vbiSTvO/qZ0SqC2NbbZ+9M9HgF5JbMbNgGb1Nww+dH7IHHMm27vs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6024
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Alex,

> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: Donnerstag, 4. Mai 2023 11:13
> To: Johannes Kirchmair <johannes.kirchmair@sigmatek.at>
> Cc: linux-rtc@vger.kernel.org
> Subject: Re: [PATCH] disable clkout for rv3028 by default
>=20
> CAUTION: External E-Mail !
>=20
> On 04/05/2023 10:32:17+0200, Johannes Kirchmair wrote:
> > The rv3028 chip is kind of strange.
> > The chip has two inputs one for the buffer battery
> > (V_backup) and one for the main power supply (V_dd).
> > By default a clk out of the chip is enabled, drawing a big amount of
> > current, draining the buffer battery of our board in 3 days.
> > There is a mode that would shut down the clk out if powered from
> > V_backup, but that would have to be configured as well. In our
> > application the battery is connected via V_dd. So disabling the clk by
> > default is the way to go for us.
> >
>=20
> You can't do that, this introduces a glitch in the clock output and will
> break existing users. The clock should be disabled automatically by the
> CCF when there are no users. Is your kernel built without
> CONFIG_COMMON_CLK
Now I am a little confused.
I tested on an x86 board where the clock was not disabled by the kernel.=20
Than I tested on an arm imx8 board where it was disabled by default.

In both cases I used an 5.15 kernel.

Difference between x86 and arm is, that in x86 we probe from user space aft=
er boot process and on the arm board the rtc is probed while booting.=20

Do you know at what point the clock is disabled? Is it part of registering =
the clock?

Best regards Johannes

>=20
> > Signed-off-by: Johannes Kirchmair <johannes.kirchmair@sigmatek.at>
> > ---
> >  drivers/rtc/rtc-rv3028.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
> > index 12c807306893..9e2aaa7a533e 100644
> > --- a/drivers/rtc/rtc-rv3028.c
> > +++ b/drivers/rtc/rtc-rv3028.c
> > @@ -787,7 +787,7 @@ static const struct regmap_config regmap_config =3D=
 {
> >  static int rv3028_probe(struct i2c_client *client)
> >  {
> >       struct rv3028_data *rv3028;
> > -     int ret, status;
> > +     int ret, status, buf;
> >       u32 ohms;
> >       struct nvmem_config nvmem_cfg =3D {
> >               .name =3D "rv3028_nvram",
> > @@ -826,6 +826,16 @@ static int rv3028_probe(struct i2c_client *client)
> >       if (status & RV3028_STATUS_AF)
> >               dev_warn(&client->dev, "An alarm may have been missed.\n"=
);
> >
> > +     ret =3D regmap_read(rv3028->regmap, RV3028_CLKOUT, &buf);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (buf !=3D RV3028_CLKOUT_FD_MASK) {
> > +             ret =3D rv3028_update_cfg(rv3028, RV3028_CLKOUT, 0xff,
> RV3028_CLKOUT_FD_MASK); // disable clk out
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
> >       rv3028->rtc =3D devm_rtc_allocate_device(&client->dev);
> >       if (IS_ERR(rv3028->rtc))
> >               return PTR_ERR(rv3028->rtc);
> > --
> > 2.25.1
> >
>=20
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
