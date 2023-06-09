Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B267072939D
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Jun 2023 10:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbjFIIsc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Jun 2023 04:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238904AbjFIIsF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Jun 2023 04:48:05 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2121.outbound.protection.outlook.com [40.107.114.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18DCA11A;
        Fri,  9 Jun 2023 01:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYWnJ9bz/TSAdCYHCvRhCoB41n6FNOYAd+L7JvokkNLVFcz1qsVCTGQ4/2V7RMqeairbYZVF0KW0IVkLZIKdk4psB8RJy+r0d6WZfsXvvmWLjJOdvLZyN8ghdTdZpzGAMQ0ungb8PQ7b+VSz3ZD7YRvWvALhra88hlwAlLttNlWFMYjOrLkv7QH37jPX226uy3FGXLRSgGQOxAAUcubwhWt3wSRnmdy+kirWOnfySMVNVOE9H38rW2MpC8odW7Y5PTvAEO+WrDYa/9hXS0lZ0L+X2Av89j0Qu7v2ROsSQOa+Ig+AIgK+MbljbunIh8/OSL3e1tcja4/6uj913fnbrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YN4QNxbgteaYFVTuZnhav1CLUq6K73HRSVvMiS/5cpo=;
 b=m+qEgyUsYw/2SuAHVn9vF/7y2L+BgdVfRezzjCYW8Bm/Ma6aXCVfwoYtZOdQFKdOmBWiBiftKZsLz+9Se1+UKnzJY6m6eDn1Xte0CBdfPWCStKFT4kZHl3wptb5tFeUKQZfAxDo5nnOWeowzEYr/umlnqtZfVqIB81/GopeSCs6WXzGjBBduJOA9fgCWtQ66+CsXX+N1q9zoJDExKuUbF8dn/OtHPs3Eyv+K0/x86qNtvGWbUeQ56exde2s0bJvf28q37yHXTNvUD1TNmGg02vC6owICA7QGX5lzbFonZi8Nn+iriF11So0ohSY5ObXkZSKNDYnoqNmad4q2BQifSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YN4QNxbgteaYFVTuZnhav1CLUq6K73HRSVvMiS/5cpo=;
 b=Ydrd+5BkHCqq2f28h4ZZ+E3RS6AA30ge/SDIeiJonPqmcE8iDBGpo9MR9HjxE7aXXDc2WjskIn0t44erX0oPgoj3W+EPvXVGN3YuzGoBsa7FvDKhtk5t88BmUKx5PU9yzxh6Yms+koFtZn1QGglbIWDbbq8qX2GVc7YwmE1sTcg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB5917.jpnprd01.prod.outlook.com (2603:1096:400:47::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Fri, 9 Jun
 2023 08:47:59 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.039; Fri, 9 Jun 2023
 08:47:59 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Trent Piepho <tpiepho@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 10/11] rtc: isl1208: Add isl1208_set_xtoscb()
Thread-Topic: [PATCH v6 10/11] rtc: isl1208: Add isl1208_set_xtoscb()
Thread-Index: AQHZlV4MVXWpErMMb0mrBYKh7WoGga+CKEwAgAAA4SA=
Date:   Fri, 9 Jun 2023 08:47:59 +0000
Message-ID: <OS0PR01MB5922E8749E708671F453E90F8651A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230602142426.438375-1-biju.das.jz@bp.renesas.com>
 <20230602142426.438375-11-biju.das.jz@bp.renesas.com>
 <5820492.tdWV9SEqCh@zen.local>
In-Reply-To: <5820492.tdWV9SEqCh@zen.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB5917:EE_
x-ms-office365-filtering-correlation-id: 33ff325d-4afd-4840-3701-08db68c63a20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JxSKjjFnScoKm7ItDEHEsNV+fx0EV2HTvXhOSBlBPnX5oeRKxRJNEbozZTTfAiBTR3j/SoxXXAuwvDMWrBpykUAJ/qPETXiXz7ZM4d1suB/ODjUAzIWOonyftCOVza+36+ArO1IRm93vDJcR2PaUEvGQAaTmHs5WDZ0bV6lABjRPOys52KxCGkwNwz2ER6o2NCzWHd4Tycp4yP3zv6qmY1iriZJVC05xA1w6+KYHNoTa2q2y5DeJ3VJkI6szAu7w9Y/V4IecXf4iYuxNCnOxpNYFp0rsRZmBbJmpm9J1hBnni351TDhwkhEOT728dq8mo48irWNxg2b8VDh36q9R1scacrGwVSSQcekhYmrPGnF1fg4hKCVaq22AFdKTfhWkLcpcHJVBLYr7yApcCtRqCBAmCG+dJIThIB/+4DubAycsXHjEocvSyyFGzv08V0jsxwuCuvXJUO3WurfNZ/JFxhv1l2UXUCOE/f98Y00FZ1OXh3FSeMRa/W289i69K587qvsv+jOGk1AUf7OKyQ5Rq/8h2XGzgh1pJtx+WkKj+zgFwguLzX5eeIch89oRMgfVxpqb4TZokEhTmpa1xR8s/tD7xpmIabMnKwHVhHTHTbyy4V94B0QujduRHi5R2ToTHVcetpOyVfYRCqCkDjGqQQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199021)(6506007)(186003)(478600001)(26005)(9686003)(53546011)(83380400001)(966005)(5660300002)(7696005)(55016003)(8676002)(316002)(8936002)(41300700001)(38070700005)(38100700002)(71200400001)(33656002)(66476007)(66446008)(122000001)(110136005)(86362001)(54906003)(2906002)(64756008)(52536014)(66556008)(4326008)(76116006)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ya9k74YUR3ZpZj0gTW2lolpuvpWLmuY98yOJ2sSy+rL9NuCzefvFlomj2ebx?=
 =?us-ascii?Q?DqyLn4zvdCBHnRfUNWiFvOhlGsA6bwUns+YPFzpsx/1H8lAxPiaD0v1U/FYI?=
 =?us-ascii?Q?8vc3S4+DCYPq8/qcvwpoN3HwFR76Y5kNwVlxnEs0H/hBsgdyJv+8hy9oMti3?=
 =?us-ascii?Q?Ww8JskrCZuw4YPr9QKhMbmbc56ayyYXTjGtO4Ethq49wzKCW4317ESvVra1H?=
 =?us-ascii?Q?umo9G56blRrputFvntzLD+U9I6Gv9ytKyrcFRMmiUrq9U2LpN8gXQvZbfQPW?=
 =?us-ascii?Q?EYBzxnPABKGH3XN1Q/d5Bz3uSNjchKQ0G0l+zLN2lDW3PXVhGGn+KP7eMG8+?=
 =?us-ascii?Q?D5zC1BVlH7+XFPgPSsbKLECbseJCXH/zoGZQfC8KvZVtCd7CqU8YLv+ebwGc?=
 =?us-ascii?Q?3N89KXYc+oJ+8r9Z2H7gDONZZOBhbv/zKWjk0Z+tg806KS1x3RZEr911TBZq?=
 =?us-ascii?Q?AEqsKsJ2TNV0bSYvStWqDxxSd9E3XgBYqgDOYVPYsjgGFnBHFAXCnbXZFVhK?=
 =?us-ascii?Q?MST61l/jteooBwEtwfaPbRvA/opcXHyEz45+kEBU/bZVoS6kty82VUsglbYB?=
 =?us-ascii?Q?9KHoWw8hQPvILhhAh8fy12t9+bRBXrIU453e+9Ufs5zzg7wyFlsmP5y9txEA?=
 =?us-ascii?Q?/+kXRbhbmsQA/7qryMqa+2nGUSebSHDLI+IjSBrPXz0D0vz0L9dhq3rcPF33?=
 =?us-ascii?Q?CjOsR0fJX6dVnBT3xqPxk+LziJVtE7IhgKFfad43Kc4C3BYPq+JIuOG/yKs8?=
 =?us-ascii?Q?ZTkuHYnf93t2ctK+R80pt5+wpbxcEqiUeIFruHafuZORI+DkjUsVXGda72il?=
 =?us-ascii?Q?acJ7wLhlPvcFGEc37nraeF9CBvopEIFXLeheewnEox6WAAhGXiydV9geFCQn?=
 =?us-ascii?Q?AQCpnLnoYQKESAz9DW0WG2G4HH/Fmc11fE6CCAy1eufa8LG4WmSw0i3ZXFGO?=
 =?us-ascii?Q?2D9YNdowIQXvcZ/ntk4Fvjj2zoHiL78W5/gvPvA3fs9MzX/Yo/iWkrmXJQg2?=
 =?us-ascii?Q?HlarkhRhZGmIG4Vl/0+qyikirs4DBBaisvbROFOQDv26zGbSGXU5w/kIBvKv?=
 =?us-ascii?Q?RLS2XK32HGgA280J86HfBlHM4wKQyRHJcDF7N+Ggkk7Pl7PIwMBXxTLYnUNj?=
 =?us-ascii?Q?YNYYb6TeZGp4jo4y5yf5K5WEI1Ab+Bx3A50VZbJwSyV0vbFmtFeOsw3sCiXd?=
 =?us-ascii?Q?v+35WRmc67mym3dtmtMVsXQokqVwuGOLfjmX/EdUFapak5JMH/559dW2FKf/?=
 =?us-ascii?Q?p8DsIkLKMAWJ30gqqVPGkxYiWaFWJKge2+TgdcwtmFpVQOyVq0Bq0pegNT/c?=
 =?us-ascii?Q?DulyNcXpxkpPbBejVuXrMlPIUT1P2Lfp8eUY8tWXgoX/BFUPVfBqMwiyhtsX?=
 =?us-ascii?Q?jlVWRRWXwgJSdf4b0dsJ83JqginMwIJHj3rhNB9bS3Ug8l4ut0VlxMiyYPk3?=
 =?us-ascii?Q?EbICpakvH/myHijBwh1b2tcqS6qPt7sl1Z1oR9njDM1QgZzE6YH1DdNYhMpD?=
 =?us-ascii?Q?j2aVXIO7S6mKt19ftsIOtEowLYDyTE+6ZwadYMWw9ymH6LAWZllF2CbJi5fC?=
 =?us-ascii?Q?zRixaIJ2P2rQgFyUo/H92b4H8geC/MRqta/QI4Kq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ff325d-4afd-4840-3701-08db68c63a20
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 08:47:59.0609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GF3zQfHFO9vz4WrORxmCLkYEGZEt216hAS6o63HB6dS4o7UcRspGauC1DRzzKtF1dcBbGTWc2WWdlr0Ozqanq4630fMiRi91/Ju8mJMVk2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5917
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Trent Piepho,

Thanks for the feedback.

> Subject: Re: [PATCH v6 10/11] rtc: isl1208: Add isl1208_set_xtoscb()
>=20
> On Friday, June 2, 2023 7:24:25 AM PDT Biju Das wrote:
> >
> > +static int isl1208_set_xtoscb(struct i2c_client *client, int sr, int
> xtosb_val) +{
> > +	if (xtosb_val)
> > +		sr &=3D ~ISL1208_REG_SR_XTOSCB;
> > +	else
> > +		sr |=3D ISL1208_REG_SR_XTOSCB;
> > +
> > +	return i2c_smbus_write_byte_data(client, ISL1208_REG_SR, sr); }
>=20
> Since the contents of this register are preserved by battery power, it
> will normally already have the correct value.

Agreed. What about the cold boot and environment where there is no RTC supp=
ort in
bootloader?

>=20
> Setting it this way adds an extra I2C transaction to every driver init to
> set the register to the value it's already at.

[3]
> It would be better to check if the bit is not set correctly, and then
> only set it and write to the register if it is not.

Agreed.

>=20
> You can do that like this:
>=20
> /* Strangely, xtosb_val of 0 means to set the bit and 1 means to clear
> it!

OK, But as per HW manual, see [1],

0 means :- Enable internal crystal oscillator
1 means :- Disable internal crystal oscillator

<snippet>
CRYSTAL OSCILLATOR ENABLE BIT (XTOSCB)

This bit enables/disables the internal crystal oscillator. When=20
the XTOSCB is set to "1", the oscillator is disabled, and the X1=20
pin allows for an external 32kHz signal to drive the RTC. The=20
XTOSCB bit is set to "0" on power-up.

</snippet>

[1] https://www.renesas.com/us/en/document/dst/isl1208-datasheet

>  * Hopefully, that is really what you want to do.  Seems backward of what
>  * I would expect.
>  */

Agreed.

> static int isl1208_set_xtoscb(struct i2c_client *client, int sr, int
> xtosb_val) {
>         /* Do nothing if bit is already set to desired value */
>         if (!(st & ISL1208_REG_SR_XTOSCB) =3D=3D xtosb_val)
>                 return 0;

It is (st & ISL1208_REG_SR_XTOSCB) =3D=3D xtosb_val) right??

BIT(2) =3D 0  and xtosb_val =3D0  --> return 0
BIT(2) =3D 1  and xtosb_val =3D1  --> return 0

BIT(2) =3D 0  and xtosb_val =3D 1  --> sr ^=3D ISL1208_REG_SR_XTOSCB
BIT(2) =3D 1  and xtosb_val =3D0  -->  sr ^=3D ISL1208_REG_SR_XTOSCB

>         sr ^=3D ISL1208_REG_SR_XTOSCB;
>         return i2c_smbus_write_byte_data(client, ISL1208_REG_SR, sr); }
>=20
>=20
> >  static int
> >  isl1208_probe(struct i2c_client *client)  {
> > -	int rc =3D 0;
> >  	struct isl1208_state *isl1208;
> >  	int evdet_irq =3D -1;
> > +	int xtosb_val =3D 1;
>=20
> So you assume XTOSCB should be unset by default?  Prior behavior of the
> driver was to preserve this bit.  Maybe it was set the bootloader to the
> correct value?  This would break such a setup.

Cold boot, reset value is '0'. We should not assume any bootloader
settings. Currently I don't have bootloader support for RTC in my environme=
nt
and depending on dt settings parse the details to find it is connected to
external crystal or Clock source.

Normally u-boot device tree is based on kernel device tree.

As you said above[3],=20

Parse the details from kernel and see, if there is mismatch and then only o=
verride.


>=20
> > +	rc =3D isl1208_clk_present(client, "xin");
> > +	if (rc < 0)
> > +		return rc;
> > +
> > +	if (!rc) {
> > +		rc =3D isl1208_clk_present(client, "clkin");
>=20
> Why do you support two names for the same clock?  I don't see this
> discussed in any of the threads.

Please see [2].
+      Use xin, if connected to an external crystal.
+      Use clkin, if connected to an external clock signal.

[2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2023060214=
2426.438375-7-biju.das.jz@bp.renesas.com/

Cheers,
Biju

