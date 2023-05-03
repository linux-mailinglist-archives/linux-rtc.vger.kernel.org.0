Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5D06F5750
	for <lists+linux-rtc@lfdr.de>; Wed,  3 May 2023 13:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjECLm4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 May 2023 07:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjECLmz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 May 2023 07:42:55 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2133.outbound.protection.outlook.com [40.107.113.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 430AB4C2E;
        Wed,  3 May 2023 04:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwy4BftcFv1EB/VO63qm7Sl/HAF4tH7K4KfP4d75U4KyEpByDjvtATV2RJQp9KT04DbMgT0tFM2sEtqsQ1U9CYZ+9srcyRayUkJDEzi9VMHLHJQl7spERT4rXMucX+vUI+PS7Tg2v/Q07+Nx2WuScAD4i4VS13HmWUaSMQ/n7cRZvh/P/40k62TxslVE8ee5Cs93CnUBY1P3Q4Kv7bmfEMkQM7FYlrExLfCAl/v+7nHlLU7EfFA2viVtZqQsdvThZZNUp6GAwyzkNBhUjdl+MJddGD4EumzbZYKrg9KdByajMn6EuRxfC2SQcqZj3slMJD9hVfZWX02tzfL00zJlUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vz7SydWAbSZMI67MfdqMaHWn8BTUL5jCB/aJ8gEPsUc=;
 b=OjJqOAap4UHdDzH34UTfeUQztH0NTowb085Mj+CB2wYP2bfSrgGSTaPF9q8avR66lHfp8kjnrMoIifkP9uq+eUTsADWV8gPHhNKNSm6sKE6BBXgx4zCrRVRvhfVmIhiM+sZoB3fEIPEQBaxFcrfCPt4CjuXJnxXB11I0FvzrOsjMOYF7M8rQ15dew+EBkJ6rhoqlHKillwUWoLtHd1z/0DfmCQcQnrcSXe5lSKBWP/j0MWKIxmxPkiYY79U+KVc7llugnv3zROQfXiLVLUn0iuUs9M7zlN53cWN737sRa0p87U0Hcxx4wbkVgU5ftvqBYsljrWOjv2ld9/NeMfRJQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vz7SydWAbSZMI67MfdqMaHWn8BTUL5jCB/aJ8gEPsUc=;
 b=M7sCOj5xJ+PoLyxKROnaAF5P7rs5uFtxUOG+FH/BlliwniziWxtxEBLltpohuEpgIGmjI130i9PxqR2gy9NNawODe6IW/+DUwAeCAcxfkRi5/U3UmV+pwy5Yh6oLuBzRYQvqrTQrSF8wJ3IIk1d5E2wnUcbypwPQfgbUuklT5bg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5733.jpnprd01.prod.outlook.com (2603:1096:604:c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 11:42:49 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6363.021; Wed, 3 May 2023
 11:42:49 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lee Jones <lee@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH RFC 5/6] rtc: isl1208: Add support for the built-in RTC on
 the PMIC RAA215300
Thread-Topic: [PATCH RFC 5/6] rtc: isl1208: Add support for the built-in RTC
 on the PMIC RAA215300
Thread-Index: AQHZfZvEwA8mJ7ir8k2FJwJvHmxWAa9IYLOAgAALNYA=
Date:   Wed, 3 May 2023 11:42:48 +0000
Message-ID: <OS0PR01MB5922EB0BCAEC3E890F1A432E866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-6-biju.das.jz@bp.renesas.com>
 <20230503105649cd039d9a@mail.local>
In-Reply-To: <20230503105649cd039d9a@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB5733:EE_
x-ms-office365-filtering-correlation-id: fdb46f08-419c-4053-a292-08db4bcb8549
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ErjeK2GPiXTYbYP+/1Sh80rkP4sKGhs/WYGBUKubDt2rv5myPgrtU6d8KWand/pGbR6K/y9nKLgToV/2UStenMJ7sNueAjSytVX6LR3uy3PdFojfBeKjzIwyHUUNnxhNZHc7tcLzTNJuUxRz0U8XZiNZ0bG9hxsl9cPS8LGVGlc4QBoB/we9BZ4fTGcK46oXhxnRT10pYsIo3SuPBuZK8m9fmkno59uhMa5hn9Play1Wp7P0vanKAmOscXY0OyC/rcu8EVk+VDT40snGBjAKCjnaSLOB9B452cTgCqhUNuny/wcFiZdkPTZRcQ7SOcbSDqMZaJksOfmHy5Ml6V9odk3CCgjsyUz2FJbWWJ+M6AUR87bPL9u2TS4cvDLBQWIHZVV/YHI2ZFBDqh/pdflTmCEMJGpEQR3w2KYxLYIOv2xDUcZW6VagCxvTOZP/FzqeaDWMDV8io6HTtYlozoxCSBde+gfh4XOVbhsyEIiDVipXGGi6g4m7Vx4sSQsSJhgV6kbo5S2I/qqKRMhYfbEAs/c2Jjekg+u05WbHov+8DXG+C3uOfG4Naewpzk+QedOZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199021)(86362001)(33656002)(54906003)(316002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(966005)(7696005)(478600001)(71200400001)(45080400002)(41300700001)(55016003)(8676002)(5660300002)(52536014)(8936002)(2906002)(38070700005)(38100700002)(122000001)(186003)(107886003)(9686003)(6506007)(26005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Mdvrflwnjluu5DbkrmcQz8Kpn4FCYJmahAz926gojJyCTIJO/phnVE1c43Wn?=
 =?us-ascii?Q?HuKtKU6oEcScP2vNfev5TN50xAE/QwSd1z7YDHV1Z7GxD/lh9gAHeZj3du5L?=
 =?us-ascii?Q?f9rC0KdFuocGipGnm4bnU0B4/4zrGaUaixZtt61N0UlNSm1IJvwL1ttrmaRK?=
 =?us-ascii?Q?J1ogQgqKxwdvKPuFZBS4xNKDYNXkM89PQ9mdgd4QzPx2/P4mcFxQxfosD9TP?=
 =?us-ascii?Q?47V/uUBIKcAeAbSKAk1NYwDZpEpjsNv4+c5Af0HtfLaw29vrAXtSiNKAstSN?=
 =?us-ascii?Q?/7jzxuzowx7ZFdbV7WDJVPyQxbN4jRCb6lSJaxVte30SOYtDb9ln/CZ7rC0Y?=
 =?us-ascii?Q?r50xvm1KlpHC3APdub5ECVHH7ZmmCF/PrcxCy25kPaU2GOHuzOEMwyRkgJk2?=
 =?us-ascii?Q?ajI21PHPVxrlfBHEz4kXAOvYicSIHiQ4feHOTwEY9LPAHOePSVZN9Mhi7mg4?=
 =?us-ascii?Q?demhYSUOs06dhUN9v0Pck2KAVbgWLq5bPmWxwg3fPqJtu6Ypt/hCu5uvfOUr?=
 =?us-ascii?Q?e3mDzv17SP+vImiTPDv00igAhvHPSj61TEfNVt2ZJ16wm96n6YVh5uOTaWuI?=
 =?us-ascii?Q?u10QP3+cwhmITQViw/U3vfLF/5CzHP6zv2okmevVILPfykSSIDvfjAGO1W9V?=
 =?us-ascii?Q?AyA5xiNd05UrzrsbK2p1E2ApmnD2rO7j65wKYGWqyzc1uxswYVpf4Mkmlm6c?=
 =?us-ascii?Q?RP5yi0bn+aDUiydFs/7cngz8LBLGhcI0NCPeFMdWVQXYx7ADnKl7sgnhONgM?=
 =?us-ascii?Q?t88RCvRHF3o/LEs7Pg58N3eAwr3x5RbN9tD77/NYBdzKk4VsZ+PpbzvZfc4y?=
 =?us-ascii?Q?9MtXXl+dU2HNxOCpZGh21x3/ZW5e7QJQJ9t1UOpQNiOU4NrowtHxdM6zc2s5?=
 =?us-ascii?Q?rTSCcK5HSsKcMxH8ODyEUKudQomAMf4UznZ/ZEuGZJpBbTDP4RvWXMjqYgRk?=
 =?us-ascii?Q?/26Meo97YhKb03RvagKPVSymDZAnfv8oBVwPA8a7MS8+xjogbtuCO2/4qjOk?=
 =?us-ascii?Q?fQNrpAsJBo3wWd/NQ30b9kdwkKwwbiR99S95lCJ4Rvl1CtKqsTpa+FQgeGq2?=
 =?us-ascii?Q?ZTuBPdZjizGniDTspReBiU0PT2N/T3n4Yudj39C3LQFdtd/TRdqIPGAK6CFG?=
 =?us-ascii?Q?NMGdE5BzJTECQsPLU/rNxjGbiOFKyfd2Mqq9F1+ZiBwJXXuyrkhew8Z9xDyU?=
 =?us-ascii?Q?ec2ww18jN2Q1gU7lo9AUBOELdAdEIIlo5Qv3jwZ3yRQypFDH4AhBBjgdrlq/?=
 =?us-ascii?Q?ohDQ/U3GGms79FmKnOiNf/5piKrO/uXGr1I16RJe9XxJncUwUqFAvhmdSrjD?=
 =?us-ascii?Q?y6gpFJNiV8n9L9iNUfZBdpWuZakYXrQHGAu5X5ix4I/msW4NZBsf+c8ZaelX?=
 =?us-ascii?Q?uRF5HD976BmxdnplvwGNCdtcQEgLNwYRDz7KjQpftie6NOwflNd6tK0M+H7C?=
 =?us-ascii?Q?nCy9rQw+2HhNGdZRA7Wj+RxojJVVOdtwhwa9y40OJTjoM9mZ0tknEoYUHTrB?=
 =?us-ascii?Q?g0VYyGOgKBvu591tVuZUZIfkN1vifRj7BU+2xl7uSJ8YAgtbPWedkvHl3qHK?=
 =?us-ascii?Q?8Dh3WAQ8H/XmMk6VooFF8YhH5Jrzpw74kD79fvBT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb46f08-419c-4053-a292-08db4bcb8549
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 11:42:48.9597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l29+kflHWjuawdOigErGUMpuq1kyP5GcMYNVPOZMh/SFvy8s7hvYCPH5LVhbUaSXb4c4onmNSedQXQCSzoiwIfE87pPy0Sbwu7Og7bsXkas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5733
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre Belloni,

Thanks for the feedback.

> Subject: Re: [PATCH RFC 5/6] rtc: isl1208: Add support for the built-in R=
TC
> on the PMIC RAA215300
>
> On 03/05/2023 09:46:07+0100, Biju Das wrote:
> > The built-in RTC found on PMIC RAA215300 is the same as ISL1208.
> > However, the external oscillator polarity is determined by the PMIC
> > version. For eg: the PMIC version has inverted polarity for the
> > external oscillator and the corresponding bit in RTC need to be
> > inverted(XTOSCB). This info needs to be shared from PMIC driver to RTC
> > driver, so that it can support all versions without any code changes.
> >
> > Add a new compatible renesas,raa215300-isl1208 to support RTC found on
> > PMIC RAA215300 and renesas,raa215300-pmic property to support
> > different versions.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  drivers/rtc/rtc-isl1208.c | 50
> > +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >
> > diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
> > index 73cc6aaf9b8b..f4ea19691ac1 100644
> > --- a/drivers/rtc/rtc-isl1208.c
> > +++ b/drivers/rtc/rtc-isl1208.c
> > @@ -74,6 +74,7 @@ enum isl1208_id {
> >     TYPE_ISL1209,
> >     TYPE_ISL1218,
> >     TYPE_ISL1219,
> > +   TYPE_RAA215300_ISL1208,
> >     ISL_LAST_ID
> >  };
> >
> > @@ -83,11 +84,13 @@ static const struct isl1208_config {
> >     unsigned int    nvmem_length;
> >     unsigned        has_tamper:1;
> >     unsigned        has_timestamp:1;
> > +   unsigned        has_pmic_parent:1;
> >  } isl1208_configs[] =3D {
> >     [TYPE_ISL1208] =3D { "isl1208", 2, false, false },
> >     [TYPE_ISL1209] =3D { "isl1209", 2, true,  false },
> >     [TYPE_ISL1218] =3D { "isl1218", 8, false, false },
> >     [TYPE_ISL1219] =3D { "isl1219", 2, true,  true },
> > +   [TYPE_RAA215300_ISL1208] =3D { "isl1208", 2, false, false, true },
> >  };
> >
> >  static const struct i2c_device_id isl1208_id[] =3D { @@ -104,6 +107,10
> > @@ static const __maybe_unused struct of_device_id isl1208_of_match[] =
=3D {
> >     { .compatible =3D "isil,isl1209", .data =3D &isl1208_configs[TYPE_I=
SL1209]
> },
> >     { .compatible =3D "isil,isl1218", .data =3D &isl1208_configs[TYPE_I=
SL1218]
> },
> >     { .compatible =3D "isil,isl1219", .data =3D
> > &isl1208_configs[TYPE_ISL1219] },
> > +   {
> > +           .compatible =3D "renesas,raa215300-isl1208",
> > +           .data =3D &isl1208_configs[TYPE_RAA215300_ISL1208]
> > +   },
> >     { }
> >  };
> >  MODULE_DEVICE_TABLE(of, isl1208_of_match); @@ -166,6 +173,43 @@
> > isl1208_i2c_validate_client(struct i2c_client *client)
> >     return 0;
> >  }
> >
> > +static bool isl1208_is_xtosc_polarity_inverted(struct i2c_client
> > +*client)
>
> I'd remove polarity from the name of this function

Agreed.

>
> > +{
> > +   struct device *dev =3D &client->dev;
> > +   struct i2c_client *pmic_dev;
> > +   unsigned int *pmic_version;
> > +   struct device_node *np;
> > +   bool ret =3D false;
> > +
> > +   np =3D of_parse_phandle(dev->of_node, "renesas,raa215300-pmic", 0);
> > +   if (np)
> > +           pmic_dev =3D of_find_i2c_device_by_node(np);
> > +
> > +   of_node_put(np);
> > +   if (!pmic_dev)
> > +           return ret;
> > +
> > +   pmic_version =3D dev_get_drvdata(&pmic_dev->dev);
> > +   /* External Oscillator polarity is inverted on revision 0x12 onward=
s
> > +*/
>
> s/polarity/bit/
>
> My understanding is that the bit meaning is inverted. It is still a on/of=
f
> bit.

Yes, that is correct bit is inverted.


PMIC version 0x11
-----------------
bit 0: Disable internal crystal oscillator
    1: Enable internal crystal oscillator

PMIC version 0x12
----------------
bit 0: Enable internal crystal oscillator
    1: Disable internal crystal oscillator

Cheers,
Biju

>
> > +   if (*pmic_version >=3D 0x12)
> > +           ret =3D true;
> > +
> > +   put_device(&pmic_dev->dev);
> > +
> > +   return ret;
> > +}
> > +
> > +static int
> > +isl1208_set_ext_osc_based_on_pmic_version(struct i2c_client *client,
> > +int rc) {
> > +   if (isl1208_is_xtosc_polarity_inverted(client))
> > +           rc &=3D ~ISL1208_REG_SR_XTOSCB;
> > +   else
> > +           rc |=3D ISL1208_REG_SR_XTOSCB;
> > +
> > +   return i2c_smbus_write_byte_data(client, ISL1208_REG_SR, rc); }
> > +
> >  static int
> >  isl1208_i2c_get_sr(struct i2c_client *client)  { @@ -845,6 +889,12 @@
> > isl1208_probe(struct i2c_client *client)
> >             return rc;
> >     }
> >
> > +   if (isl1208->config->has_pmic_parent) {
> > +           rc =3D isl1208_set_ext_osc_based_on_pmic_version(client, rc=
);
> > +           if (rc)
> > +                   return rc;
> > +   }
> > +
> >     if (rc & ISL1208_REG_SR_RTCF)
> >             dev_warn(&client->dev, "rtc power failure detected, "
> >                      "please set clock.\n");
> > --
> > 2.25.1
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.co/
> m%2F&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7C68856b4bc4f14d420556=
08db4
> bc51ccd%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638187082188797517%7=
CUn
> known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJX
> VCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DmzGMSc1wg7XjQ97oMyCzQZ6UEHbuViyvOErFef=
p8pF0
> %3D&reserved=3D0
