Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5451B78B088
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Aug 2023 14:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbjH1MgP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 28 Aug 2023 08:36:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbjH1Mf6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 28 Aug 2023 08:35:58 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2109.outbound.protection.outlook.com [40.107.114.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690DC12A;
        Mon, 28 Aug 2023 05:35:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RL1HsTRDRnvtVBO9v6nW7irxK/0hl1Lpik9xJqWUD9d4EyoxR4FIz8Ryx9OQyxTefimU4Wr5cOBgNQHzrVZ8c0k5wZAByc0TfVYe2uwPfqRNore33ULwXnvVHI1dvSdUIXrFh3F6iMuYW0mAhDkr4xQen0AuDNdvN1fvmSY1i+eFXsisGd0NdChdh610+jmkgYCSR0TGccfMX0v/GwwN+637WJZrUTWS96xzz1YAvQ5+tv0i0WBge4hZ3+qT5dYLxRb+WS9vgTNF95vnlJDddJC+OI4izy7Og/v5NC9aoWNLXBkVL6tK6qNk9bghetTUJHAlfgrNlSxcNRwjsZjPZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHy4TXTLYVr9WJNrMOOemmGWN77PaWRuQoINFjQ6GE4=;
 b=K6QCNVv9cu+RaEE8ay41JCPxOM4dvDA42XVSHejxuKpnAIoe1saWNd1rFGk+ZSFEohB13xNxCOTTAXHe2wS9NU2NO7sFMlfFwJvFujMWmqTC+s45XSx1uRAcAual67eLFGTfY0p4Em3vtoPHoqyTmXQryrQ8BYlFlVVbPEFKTRAT7kKHq3u5a6yGbzt1r5BP91v/ec94ZATJOcYX9WQJH6M/of80mJOO5nuMLt1H0AjB8HurVqvHyEKekkIdBM4qhF9acMOXd+xXOvHbYtsq9HpECtHypCZJaD3hpVxfphR8rxB6jjVGymM+6tELUhZMZdA2RM1IZsey91m5ixg0Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHy4TXTLYVr9WJNrMOOemmGWN77PaWRuQoINFjQ6GE4=;
 b=hQFRxQ1KpYpbEDriPVWtECq6rcVTjqeggUhbAgU34jgxfYuuVVjP1n2vie2AW+tojWZS9Qg8EOZH8ZRexVTqCxP8shVOqxouCqes0ZRYyNZXfGnnhIzsgMS/cMWlmjqmnwx7b4Wu+YIacM7dqJpokfHh1GpMnAaBq0Y69JoDXgU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB7776.jpnprd01.prod.outlook.com (2603:1096:400:181::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 12:35:51 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 12:35:51 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] rtc: rx8581: Simplify probe()
Thread-Topic: [PATCH] rtc: rx8581: Simplify probe()
Thread-Index: AQHZ2Y8/T0LpnfLVhkybcrGS59XMjq//otOAgAACDQA=
Date:   Mon, 28 Aug 2023 12:35:51 +0000
Message-ID: <OS0PR01MB5922E9E910FB14DE330034B286E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230828090828.26897-1-biju.das.jz@bp.renesas.com>
 <2023082812271359f2dadd@mail.local>
In-Reply-To: <2023082812271359f2dadd@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB7776:EE_
x-ms-office365-filtering-correlation-id: ad9b50fe-f9be-43e9-af8f-08dba7c35073
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mMeAe+Gu9IRPcAJwtZzVtRWBVq6+NhCP5lT/Gs5B10jjm9SE13uR1/1OJQrBw+/ONN0V4N1G0M57UadczYhnDlQYhg5Lo+um9bYa0WcMFsJfFoEgpF4Rr4sD8i0msjELmtFBu90S/GXpvNdz7q6quup3kzjzqRgqTrHxNZJ7K1RepQ3qciUlCknmofNkMw7vIFDYmonxWq2yk/cyZUQeYqsoJ5W7sGKJnYR6dtqx+z58tdoLrUBCUfgraOvRNa3eQgevvsPsn7+LnLFiNABKzs/xmbhZBFQSMHfFMlIoOCh/K3PW2tKw+GFYbn4/CsNxMe7QSq1jqEv+jd5xQ6ZPTna4AvvQuMjV2CehaIMCSmO4kGuNmQpW7BZjiRWbK0DUCyF/m6Cmx1aZ/sAFuCHfz+A56o87rXaarIcQiZoNH8DhPfgwPgb/WU/Y2O1yNzMRi8oPXs43hlfXJ4uHnPfE1PrFFiUus+KtSGRxpVgLcNwOVhctH9Ze7OazXR4mdwdVVOhIwuBi4LDbqY1fwtdC4rtut/1Dwu09S142qPKNDtvRgGKQwGWBnahrZT4FE/m9ml9h3lttuOqkXNEigbRGrP+f0s1tuSGhoFWeaY6zFnY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(39860400002)(396003)(186009)(1800799009)(451199024)(41300700001)(122000001)(45080400002)(38100700002)(86362001)(83380400001)(478600001)(38070700005)(966005)(71200400001)(26005)(9686003)(7696005)(6506007)(55016003)(76116006)(66946007)(66476007)(54906003)(6916009)(2906002)(64756008)(33656002)(66446008)(66556008)(316002)(5660300002)(8676002)(8936002)(4326008)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PsNyHo7p2oAKuGeOVU543H9p3nWJkwV/0DItITfuKvQeL///I535hN3CbOST?=
 =?us-ascii?Q?Ch6P01BZXpgI3Xp3ATtD9VEJmSHwwwv/tGBoYfLUvcmGyR/aOtvVfVFVam58?=
 =?us-ascii?Q?Ng7i5U3qo8OhoYp2H+Gv6QHLpMsAQaWaxEYK9LMSN4kt8m9XVSnt0zcl85HT?=
 =?us-ascii?Q?whmXl83z3kNqJ0xRX9ZNpZhNr59NXYsNDv6+oUI2L8jGGfsCY+GFlrpZF3KK?=
 =?us-ascii?Q?nM6G3oE5fJsAfELupBQVy76+Of0KQJpPlUgDLtZfD1YNmiK+mAdjcaIdhMcz?=
 =?us-ascii?Q?Lt2dJOvnmMSVAUo7tpqc2P85MfywBC1Sxc8bHVkvVrd6l45xIsLV4bYCejnQ?=
 =?us-ascii?Q?x4o5zxBpVaeggUeN9J5/yKE2ZmgmKeX80smO/XOk0B3syAZvXAbbxFZViWVs?=
 =?us-ascii?Q?MD/FH9s+1Jrs8LJmXHlTJBjxS2QuwXE2d45aRkQS9BtUSwkxoO/Puy/ZP8dJ?=
 =?us-ascii?Q?wHGeoH9yo58xzyCZW8mQLakhB+sCie1sbXNSXEsXtvmXMYylrGv1ATMpgTyt?=
 =?us-ascii?Q?h630BtW010c6+Ok0RWMF6tA9RtOxJzGlrtRh5v181rbp2JdXlg9S60L+usvX?=
 =?us-ascii?Q?PRo74MIgCYfmLtGxDZIYys/O5zzFrC0EEgFOC0nuQGZbsGxCsjBwtuJjyEkp?=
 =?us-ascii?Q?40ml2xk1rAgI/MsvwnwX6kzv2PzSbxupjdoNor/hT+FlEHUvZNJDtK302zSX?=
 =?us-ascii?Q?jJDnO7o2IMx7Hq4uXT0kY/Hjr/3qDE7JJPZfDSgLie4t/cvuPc2c7CuFoTTp?=
 =?us-ascii?Q?LlbcU7KeH3tNiRsgz0NvGRbtB+JrXmORbE+FBjBiOqNkYk+002VF4tJ6gui3?=
 =?us-ascii?Q?1QO6/IiE/0oboxN0UMKXGL5zf5StBNN/zI4LHe44pvmCYcd5AxoAXLL3KzeS?=
 =?us-ascii?Q?N8B/5ROj4kN4inI1TH9ZhLBRKdeJGeGSuln6Ywj3R3ouxbEuFl+AFP+T0vnd?=
 =?us-ascii?Q?iohFA5ZxiRdHZf/KEwznKjO5WyZWFriGoYd0IXHVkFb9kMpLAXC9FaMgkmKu?=
 =?us-ascii?Q?nDVTL04pM9YyYsKFHcuQWJ8AFaQQt2i6aJ2a+aURjcb4zSXctogTZqEjLfuL?=
 =?us-ascii?Q?3WbYspzlmbJIP/hmXupclTLCAzipUXvRYtgB96Y4pO3Q88q0b4A4osPpvWG5?=
 =?us-ascii?Q?9sZL1pjTLu5D6K0WoHvcRS/2uxeZCxuN7JleJtrcQt/J+g6CJZ3iK9qtuEdv?=
 =?us-ascii?Q?71IOzOlc9xkZwmNy9uIK3bNPBCfURhf5p/mZtSVtWUXMqHOftZfGWKDHn4wx?=
 =?us-ascii?Q?Mw8VzBZmgMa3qiLHcqT+0nu6Oj2wQ7Tjy1x0RVlM2dl1GeemDZcgZEKu+HCb?=
 =?us-ascii?Q?LTQ1TeSVNwHzAWDod9Uyy0dAoH/BSrkQvOyuvAipqOdnbbE1QfXGkWFct+la?=
 =?us-ascii?Q?ox8QtK1htqHsHCVfcuMSSPpqP0UEW5sDdJnJkmb7sXaYklOvtAu7os2mG4kz?=
 =?us-ascii?Q?kMunj0y7ouKQj6YUNfIwJ+RLUDychyqHYzy+WX1WV2QBRwLHOM9f8/LpTTSA?=
 =?us-ascii?Q?3IXCODl/r+CZWa6B0w/n22ESSHbJX8zSi5DUCc0o45vPbjDGC5RU3+ekqfci?=
 =?us-ascii?Q?AM1KE7PBy9AUIJW+StVBWSr7vsXCnSJqcquErO2zWF7iRF9y2eyDucAnTRIV?=
 =?us-ascii?Q?nw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9b50fe-f9be-43e9-af8f-08dba7c35073
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 12:35:51.3121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wM6BktvuqGL9Zq5PjMISJ1ocUIfycPrO7FYIeqaVHFjeXaFg0mEiK+6vXh1AtOn/CnztnjYYmMYMh1ecPS0NiCoIQfSOIpBUbxLh5Om4Un4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7776
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre Belloni,

> Subject: Re: [PATCH] rtc: rx8581: Simplify probe()
>
> On 28/08/2023 10:08:28+0100, Biju Das wrote:
> > Make similar OF and ID table and simplify probe() by replacing
> > of_device_get_match_data()->i2c_get_match_data().
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > Note:
> >  * This patch is only compile tested.
>
> As you have access to a rx8571, please actually test.

You are right. I have RZ/G2E board that has this RTC.
I will test the same and confirm.

Cheers,
Biju

>
> > ---
> >  drivers/rtc/rtc-rx8581.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-rx8581.c b/drivers/rtc/rtc-rx8581.c index
> > 48efd61a114d..68dd8b9b52f9 100644
> > --- a/drivers/rtc/rtc-rx8581.c
> > +++ b/drivers/rtc/rtc-rx8581.c
> > @@ -250,8 +250,7 @@ static const struct rx85x1_config rx8571_config =3D
> > {  static int rx8581_probe(struct i2c_client *client)  {
> >     struct rx8581 *rx8581;
> > -   const struct rx85x1_config *config =3D &rx8581_config;
> > -   const void *data =3D of_device_get_match_data(&client->dev);
> > +   const struct rx85x1_config *config =3D i2c_get_match_data(client);
> >     static struct nvmem_config nvmem_cfg[] =3D {
> >             {
> >                     .name =3D "rx85x1-",
> > @@ -273,9 +272,6 @@ static int rx8581_probe(struct i2c_client *client)
> >
> >     dev_dbg(&client->dev, "%s\n", __func__);
> >
> > -   if (data)
> > -           config =3D data;
> > -
> >     rx8581 =3D devm_kzalloc(&client->dev, sizeof(struct rx8581),
> GFP_KERNEL);
> >     if (!rx8581)
> >             return -ENOMEM;
> > @@ -307,7 +303,7 @@ static int rx8581_probe(struct i2c_client *client)
> > }
> >
> >  static const struct i2c_device_id rx8581_id[] =3D {
> > -   { "rx8581", 0 },
> > +   { "rx8581", (kernel_ulong_t)&rx8581_config },
> >     { }
> >  };
> >  MODULE_DEVICE_TABLE(i2c, rx8581_id);
> > --
> > 2.25.1
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.c/
> om%2F&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7Cce5fb3bf24764820b82=
e08d
> ba7c22022%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638288224433894702=
%7
> CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wi
> LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dckmh5KF7OTtDO4LRU9QPmuBmt8XOO4Q2i8=
wFPE
> yRqKs%3D&reserved=3D0
