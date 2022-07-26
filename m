Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11C605816CD
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Jul 2022 17:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbiGZPyh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Jul 2022 11:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233328AbiGZPyQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Jul 2022 11:54:16 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2093.outbound.protection.outlook.com [40.107.114.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32748120A6;
        Tue, 26 Jul 2022 08:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSIPSLrDk4r25he7KT3CKuH6WGO918rq1HwX902o8wkNn5w7QwA53HxPIS66r8iK9blH8cCUlNwRoe6vwR/a11v9GZ+XMVfy7t2dgq/VIXSv8fxEi0JI+iv1OcT+Rou7Hv4nEQIHRCaufyQwxMIvDETfR9zCynK+LY9ErNbhSxcnJWCVg8y4tikpMBEwpnIQil4q2MRO76rycdmtP+Lw0yJ/MquQq7DVqOrTnynl8cqpeHImeOCgLOyTtWNQPdzI0+BgqOq4QCNxwQ5ZWsP6OeOA/73Jwov24ghbWm8jEJUt2M7uXEiy2y9Bcg0RloJU/wyQT6zxkYJ+cdAz2Qd/qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjvBMO/JMwO96KFPlYWD3whEyPUY8lPROr06h25ZD8w=;
 b=FlPc1yn1k5seE7xzlTqKbABIOb+OR+FfPq7yl9RoVvszOLEdL77iSPsiLVSSW5gITMBNnZzxtiAFGrsunvns0MWxtgHPJaL5Dxp1WPgVG8ksmSaB7bmTkMbK43/NBAcK5sOlAnTR9zkc8vkXblkYEH7dzrr3g1t/IajVr5aw48orKPyScy9h/3xWq7MWTwaRYjdxYWm0rNvdhdtxpM/wXwnJiAs3ELq9BjfJlLA/+JKswRdFtnal23X+g1OaISORmZTLW6pRw6xqdvYRnXqN45WXewYt/ZW2JACcbB6sHxaZqPxdUaX1BM79mb2FvzKoidKzBKcQHezagZ1hbP2wpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjvBMO/JMwO96KFPlYWD3whEyPUY8lPROr06h25ZD8w=;
 b=PLVRmK/RkXKA7eKnlOxpDZ7I47spIPoEK8N7aoJJ+Qq1PzBTZWWoxGYqpIR4XHjhSMs4WTGQxzxnkBNzZecGrDGPuijpCNvKAqNXDra3oLClcZJneUoUk/A2D7oVhBm2G0cQxAkRSCtgnL6kFNnXbcTGi6aYE8sRtxjK3deZXuw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB7329.jpnprd01.prod.outlook.com (2603:1096:400:c6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 15:54:12 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%6]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 15:54:12 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Michel Pollet <michel.pollet@bp.renesas.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] rtc: rzn1: Fix RTC_RD_TIME: Invalid argument
Thread-Topic: [PATCH] rtc: rzn1: Fix RTC_RD_TIME: Invalid argument
Thread-Index: AQHYkTELtkmLFBBFakeeifR+dm5oyq2Q55kAgAACDWA=
Date:   Tue, 26 Jul 2022 15:54:12 +0000
Message-ID: <OS0PR01MB592289F8FF9AEA9A1401BA8E86949@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220706120756.777378-1-biju.das.jz@bp.renesas.com>
 <YuAJLk8UIA0omk3N@mail.local>
In-Reply-To: <YuAJLk8UIA0omk3N@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac66c31a-344d-4a99-c3e1-08da6f1f1597
x-ms-traffictypediagnostic: TYWPR01MB7329:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lGg/mWI8cvq/8yXZccrciOt6LH1F2F85iHPeUGDt45uistlP6rzbrhmjYX2MmI4uEdeFzbTQVgokiWQAqT0okQm74+Ql3xOFhiI1JnEvgvt/IDfiMZfH7EB2LTAMLYtMRimjEPdFgIcxgvvVJ0/tP3JmhvA0l+cMb9A6dfgqLAPLpiC6i7GLbB8bm+lWuv7OXaNX3mCHw/rbnJBvI0Hb1yTP6pjsTFO9VAwmYBaww33yut8CK7mwAt1W4FXThNlVcyQ+RGNcW+qNvxcYEdIpQ4fjwq15W+qUc0bQlGMvlG97Z53eNMzq4K3DLMbDuUD40LjW+DIMq9OkEhp17LEInC2AF5MhsLeK+vUCzzPeL2BQMaXOnj8yuZ817/KyqIrKJEF0YdKRo6ig/sF2iNb0N2CvGd0BrOJNvG4QP3jik9a0QZNbYbQaZwmS8xjjK1DHoiMRWnl+ucHCgPnE6KD1wfrMT3bsMEk/v28csBxeUwN/ZU5HVnAgRXMYaQ8I4MZwUUqLTG3/51xqg3+iT5mqgT9kxWEgErTsFMNcFOtf4qlM9bosaN7/Zvrlwx2aPYvGqGK1hOnq6u8bxdVJreObws+NZWb89WC+9Dg04Oij1XTcTXi/Ju9lNAteWtqCmMx+OjF4NCCKodsZ+Pb1z2fb+QNQ0F27om9E9jQGGi7iZIXyYTj6WSy7gK3gGSc3DvhR31+/JTxuNyHQ++0USNHqFpg32J7bcP6moxPDxnNHD73eqJX7zZAe2IY2ZM3PAGBcUIRKvFh4tDRHN9H2MOTpwQb1eBgXKcpS18Yc/tfTy2zlkIPTVfHDYj/gv/FQOMgi
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(6506007)(41300700001)(7696005)(9686003)(26005)(107886003)(5660300002)(8936002)(52536014)(66476007)(66446008)(4326008)(8676002)(64756008)(33656002)(55016003)(86362001)(478600001)(2906002)(4001150100001)(71200400001)(38100700002)(38070700005)(186003)(83380400001)(66946007)(76116006)(66556008)(316002)(54906003)(6916009)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O2qHPPjcosCOfVUPGQTA85XdKBKEbR8eP64c8y/Y2d2YvnGyYWndYW/PiFCO?=
 =?us-ascii?Q?qoyvZw3PH16qGsgqYcBs/IrCB4CZS70X1U1PkN7fyuxsDYd9mrbcK3dFG1fk?=
 =?us-ascii?Q?ogUm/iDpXbcUC0UbqWgwqqpRrk3tonO87NI+1XVZp+bYo1xlGuAd2OnGajL5?=
 =?us-ascii?Q?B67VkGRBgLg1dfSOcWWuXla1GKQeN8pLsnmy1qTaeDJ5YzQorvWvVvSrp/CJ?=
 =?us-ascii?Q?x/X7PJ7y7L4GgoS5CzS9xgn9zNXDAALaQpWOo8KVjZshYkGkC1q6wdOqp7Oj?=
 =?us-ascii?Q?2xOkLjwrQtMKctw8Z3Mt3dTQA9rc14Ig87o6G1ELP5P2268jRRIMraIjnchg?=
 =?us-ascii?Q?qcVZatTIpGiEZLdC/LCDKhqiQdgLd8MqUSe4FnqvXVye9K/2NCXnT1WRPv9U?=
 =?us-ascii?Q?OT5l8Oe2P6BwaeT3B0LRWcc9Y3qiYHKERejyIVKXDvFz/czp+hf7hfVwrevP?=
 =?us-ascii?Q?vY3F5mOOcKYq6BdDMvNbZ2WWn95rGAZNGA8Unz4kghR6HYcmjLKri0rfoOcn?=
 =?us-ascii?Q?wBk7maxvwSdWJqsaGzgOaM9KreEs3pi7PVD7sJRuIRr1+o3cYJRVi0YRqpfY?=
 =?us-ascii?Q?/pRsmNl160r4cH2780o+iAC1z38BP6kDRAj4FNzbHiSyRBXIGkfYmxv0VVDT?=
 =?us-ascii?Q?z7wrxgTqNTOR7Lii7iq+WQdJN64qe9gSsENE/GIeO6x1gcwZPmNgTAes97FR?=
 =?us-ascii?Q?467fTGCqyOyC729SnGpA953/aEvU++02IL9/I5+Q2xRgJK8P2oBkKjCIReL1?=
 =?us-ascii?Q?sozwPGZNy9fi6JvPKvcRTV5VMOcAPH1saveXZH5HrdGqKZ95UTyoBbPOtLgN?=
 =?us-ascii?Q?7e4bJOQtxzPCiyJ6s9hUkq1jkPPZT6uoQedmo/vwzfMfbr9NqJHXUV8sCnOg?=
 =?us-ascii?Q?4Capn4uoTBfavt8Mwc87ocDZbtlBDJ2e8HE7rd4KTtEQAZRBpWCQy+UU/12w?=
 =?us-ascii?Q?UaHqRwaY/V3wUwy9NvJJxAKZbaegrJ4+tJluFnYG1ZwPHu4RZ9pafQQmEWf/?=
 =?us-ascii?Q?x2YS6Od8NnjULpdxMgSzV4JTHRSRdsPaIVdL9mS+Aq2kpVgurqcVwDBQfPUW?=
 =?us-ascii?Q?rSKtbkE6Hsm44D2LXgLO4I9RPLff0mqKRj562ms72OoNz4aD5pZLQcJDJdOn?=
 =?us-ascii?Q?u+Cw5GEwA0X6v5Iy0bYrwHNepibBE71dlwW2dxFzU6QSCjtOlXDuE3dNkNFs?=
 =?us-ascii?Q?owZS9iq9hsbIV2VFA098pTb8F4dj280wJ8fYzngDgH6o6zPpaMVYyJDtyDFq?=
 =?us-ascii?Q?ki8ZoL1eKMxRkqd0hMcGdM5hIb7yVKLg7aKVUZuqhDdvmA6M8Bdfveil9FeH?=
 =?us-ascii?Q?jAQkS4QqmMfC2XJXjBERctNo9zv5Tmwz1IpSqAz6mu2dhsFll0jjIV4U+m1R?=
 =?us-ascii?Q?fM3u+mbuAJ31T5KpP2aoZUfFzQczzUAXVlLQKiEDoa/EeSOkZ8R6RBYQyDtp?=
 =?us-ascii?Q?a1ARNXvwwKDJ0djYoq2aE9hlxMX6BxhvZ/oBwze1o40XB9+Z1N2FZqRO/l7Q?=
 =?us-ascii?Q?/0funV/dU5QrhxKJK/iU0muWu+G5tvLh4MuQUHJj1ELdaW3ocUfL3fFCXG49?=
 =?us-ascii?Q?nuJCXA7Z0Ew7GUu1BK92gdr5tzRcIg14pGKC8zvUNqvcALX8XtNum5ci8YHe?=
 =?us-ascii?Q?Mw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac66c31a-344d-4a99-c3e1-08da6f1f1597
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 15:54:12.3127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ijr1eZ3n3cMOFjHe/iSXECXWWVJAzNX4qSuFU16JOFhKOBToMRQJ4s5Us6gdWGNjR/PfFW9JVdFYnLs4f40PytMAy4sLY/EoAUzrIJnA7n4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7329
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre Belloni,

> Subject: Re: [PATCH] rtc: rzn1: Fix RTC_RD_TIME: Invalid argument
>=20
> Hello,
>=20
> On 06/07/2022 13:07:56+0100, Biju Das wrote:
> > This patch fixes the issue RTC_RD_TIME: Invalid argument with the
> > below use case.
> >
> > Steps to reproduce:
> > ------------------
> > date -s "2022-12-31 23:59:55";hwclock -w hwclock; sleep 10; hwclock
> >
> > Original result:
> > ---------------
> > Sat Dec 31 23:59:55 UTC 2022
> > Sat Dec 31 23:59:56 2022  0.000000 seconds
> > hwclock: RTC_RD_TIME: Invalid argument
> >
> > Result after the fix:
> > --------------------
> > Sat Dec 31 23:59:55 UTC 2022
> > Sat Dec 31 23:59:56 2022  0.000000 seconds Sun Jan  1 00:00:06 2023
> > 0.000000 seconds
> >
> > Fixes: deeb4b5393e1 ("rtc: rzn1: Add new RTC driver")
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > This patch fix is based on [1]
> > [1]
> > ---
> >  drivers/rtc/rtc-rzn1.c | 47
> > ++++++++++++++++++++++++++++--------------
> >  1 file changed, 32 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c index
> > ac788799c8e3..0f99b4fd3c4b 100644
> > --- a/drivers/rtc/rtc-rzn1.c
> > +++ b/drivers/rtc/rtc-rzn1.c
> > @@ -88,6 +88,35 @@ static unsigned int rzn1_rtc_tm_to_wday(struct
> rtc_time *tm)
> >  	return (days + 4) % 7;
> >  }
> >
> > +static void bcd2tm(struct rtc_time *tm) {
> > +	tm->tm_sec =3D bcd2bin(tm->tm_sec);
> > +	tm->tm_min =3D bcd2bin(tm->tm_min);
> > +	tm->tm_hour =3D bcd2bin(tm->tm_hour);
> > +	tm->tm_wday =3D bcd2bin(tm->tm_wday);
> > +	tm->tm_mday =3D bcd2bin(tm->tm_mday);
> > +	tm->tm_mon =3D bcd2bin(tm->tm_mon) - 1;
>=20
> I guess this is the actual fix, I'm not sure creating the bcd2tm and
> tm2bcd functions is useful, it obfuscates more than it helps.

>=20
>=20
> > +	/* epoch =3D=3D 1900 */
> > +	tm->tm_year =3D bcd2bin(tm->tm_year) + 100;
>=20
> Is it really the epoch of the RTC?

I guess so When I debugged last time, With the current code,
HW registers are entering into a wrong state where day =3D32, when it reach=
es 23:59:59
and month and year are not propagated to next level.

With the patch I submitted, it never entered to this wrong state.

>=20
> > +}
> > +
> > +static int tm2bcd(struct rtc_time *tm) {
> > +	if (rtc_valid_tm(tm) !=3D 0)
> > +		return -EINVAL;
> > +
>=20
> This will never fail, I'm not sure why you need to check here.

Currently I don't have a board to recheck this.

Cheers,
Biju

>=20
> > +	tm->tm_sec =3D bin2bcd(tm->tm_sec);
> > +	tm->tm_min =3D bin2bcd(tm->tm_min);
> > +	tm->tm_hour =3D bin2bcd(tm->tm_hour);
> > +	tm->tm_wday =3D bin2bcd(rzn1_rtc_tm_to_wday(tm));
> > +	tm->tm_mday =3D bin2bcd(tm->tm_mday);
> > +	tm->tm_mon =3D bin2bcd(tm->tm_mon + 1);
> > +	/* epoch =3D=3D 1900 */
> > +	tm->tm_year =3D bin2bcd(tm->tm_year - 100);
> > +
> > +	return 0;
> > +}
> > +
> >  static int rzn1_rtc_read_time(struct device *dev, struct rtc_time
> > *tm)  {
> >  	struct rzn1_rtc *rtc =3D dev_get_drvdata(dev); @@ -106,14 +135,7 @@
> > static int rzn1_rtc_read_time(struct device *dev, struct rtc_time *tm)
> >  	if (tm->tm_sec !=3D secs)
> >  		rzn1_rtc_get_time_snapshot(rtc, tm);
> >
> > -	tm->tm_sec =3D bcd2bin(tm->tm_sec);
> > -	tm->tm_min =3D bcd2bin(tm->tm_min);
> > -	tm->tm_hour =3D bcd2bin(tm->tm_hour);
> > -	tm->tm_wday =3D bcd2bin(tm->tm_wday);
> > -	tm->tm_mday =3D bcd2bin(tm->tm_mday);
> > -	tm->tm_mon =3D bcd2bin(tm->tm_mon);
> > -	tm->tm_year =3D bcd2bin(tm->tm_year);
> > -
> > +	bcd2tm(tm);
> >  	return 0;
> >  }
> >
> > @@ -123,13 +145,8 @@ static int rzn1_rtc_set_time(struct device *dev,
> struct rtc_time *tm)
> >  	u32 val;
> >  	int ret;
> >
> > -	tm->tm_sec =3D bin2bcd(tm->tm_sec);
> > -	tm->tm_min =3D bin2bcd(tm->tm_min);
> > -	tm->tm_hour =3D bin2bcd(tm->tm_hour);
> > -	tm->tm_wday =3D bin2bcd(rzn1_rtc_tm_to_wday(tm));
> > -	tm->tm_mday =3D bin2bcd(tm->tm_mday);
> > -	tm->tm_mon =3D bin2bcd(tm->tm_mon);
> > -	tm->tm_year =3D bin2bcd(tm->tm_year);
> > +	if (tm2bcd(tm) < 0)
> > +		return -EINVAL;
> >
> >  	val =3D readl(rtc->base + RZN1_RTC_CTL2);
> >  	if (!(val & RZN1_RTC_CTL2_STOPPED)) {
> > --
> > 2.25.1
> >
>=20
> --

