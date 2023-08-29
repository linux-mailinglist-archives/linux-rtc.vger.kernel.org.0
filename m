Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C63F578C46E
	for <lists+linux-rtc@lfdr.de>; Tue, 29 Aug 2023 14:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235534AbjH2MpF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 29 Aug 2023 08:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235531AbjH2MpA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 29 Aug 2023 08:45:00 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3030110E;
        Tue, 29 Aug 2023 05:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYFJm0I+LV+/GGxp+y6XV5xSqmDQlAG+EJbIHosbXhqT4IE4ZSDaGpylg7dHhsBcrJNSPGbTuKwTAPknNUkYJmTGUJgMCmma3SYrJ0LkcnPr7paWomBkkAdu8OcCTZ0WJdXiOJmcHQCJx1ku55VNiZUGmY4OP47l3iTP1EQjQe2rEeXatY5EV41QE3x74ca+O4iV5QfFjv8WZ5Ml0SEbYhfZZk71i2FEPNlPak9OLO7K/hTlPHi6R8P77tX/Hbal1f8sT076cqOfyjhhlloQ2zB3UXdho4BpILrz5pRQIfjVTRIXWnZHSvKVdQon+mAtf3HKMwKM4QrBW995LuHIcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ex2Y1tut1IxY23B41uSLzOl2Q3YMgCQm45NjN4kFLTE=;
 b=ZCVKBNXFc552PxGbCsfXq5YiDTrhNZb9MVRB8EfywM45/LF6bZjdijWQkeTjxQFMNUTTw+ol/wjI9M1Mm3zbYKF047QUwV3DoRp63AqcF8aXCcrxXsjnSRB3GMdIuRoilhJBXuILy/v+84wGhficnvz2tpYJljN/QIhepneNPaneyL5UBaFgRAFrJQCfXrM1vsYlsF9NHy94l0yWmLau8fBN5CO/3LWsY3mk18sJna6oIuPw4SHlpSDj1olPJC8FViUt48ALWp516yRATd0KOZybRof7BAFrnKw5XsGAJmQPqqo3DhUUTFuXGx+QXJQICe8HMlt9vivt0RDZWrbSAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ex2Y1tut1IxY23B41uSLzOl2Q3YMgCQm45NjN4kFLTE=;
 b=qY9Uj3JopoG4UnQl9ce7mUOfsgfMR5B7QY2abAC8bHyWmBG6oKhLLBT+opafF1jTPkVFW7ul8PSjMsrw4lmr0QMgKq6g3bSHU/vt84900ihVw5BR+PCQHtWNxPRSr+Hi0KLuuys53RZnGkTzjpxsFWatEtZcv0Smp5WJTSMgZVg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5409.jpnprd01.prod.outlook.com (2603:1096:604:ab::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 12:44:52 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.015; Tue, 29 Aug 2023
 12:44:47 +0000
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
Thread-Index: AQHZ2Y8/T0LpnfLVhkybcrGS59XMjq//otOAgAACDQCAAZT1EA==
Date:   Tue, 29 Aug 2023 12:44:47 +0000
Message-ID: <OS0PR01MB5922F55D18824F155228259086E7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230828090828.26897-1-biju.das.jz@bp.renesas.com>
 <2023082812271359f2dadd@mail.local>
 <OS0PR01MB5922E9E910FB14DE330034B286E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922E9E910FB14DE330034B286E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5409:EE_
x-ms-office365-filtering-correlation-id: 0451bce2-fbc3-42c3-a23b-08dba88dba9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UhogFk4PzpXrQnW1QK63ldlqN9zzIkirB9Ecfsq+C/okiEYs3pH9Q605V8oS+VQn4GSGXg0sy/7oFVOxmVCm26vfAeZEVHOLzCKWAmCRcO1IRSuWV0WTw2vVgjfER7v4Eqtrh3cSByfKK6W4QJtGj+eiJL8cAPHUm6SFgvWpCTBwURss7TSrWMMqANw1kSwSrYiugE0baaSCQ3LOpYj/xGtKJ4BZTXNJLr5gJFufooH1D1ogyS66hFNjdz7+qdRIxuzpTk8glk5KWSLuUcVkotpu0rtsEuMvAPqAToMbaFgOkFEd6Q8pEZEcYcelq1evEUV3TedG1x8f54lKB9s/lYZMALjQHZTwLPhf8DA3l5DY/XZKskRjKgDTKSoluiXE93jHt0f383W3Uf6UOxwtgBlNMPt6C58kz0Jp9HiLJLmZN0No5jUhVfCXWGbKCybvtvHzD7i5goDZXT6MNDbkmT22hm0KcTv2P2jVZVDicGfMoHv5IjMW4D1Uzmo/ISuATnA5e0ugXF5YjdMfMcZg5uf66LMTmA/znEitCBNx7aNOAJVKHzVeQL+Su+632ZtzBnU4pWaUJeKcnMbm617gxgS/0vud1zrycy0CYzLMWDJ9dZmnQo8sVRa33Uh4Fx7M
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(376002)(136003)(346002)(396003)(1800799009)(451199024)(186009)(9686003)(38100700002)(38070700005)(316002)(6916009)(41300700001)(4326008)(33656002)(2906002)(83380400001)(86362001)(52536014)(5660300002)(8676002)(55016003)(8936002)(45080400002)(71200400001)(6506007)(7696005)(966005)(66446008)(66476007)(66556008)(64756008)(54906003)(76116006)(122000001)(66946007)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?geXPIJ4w2AiNy/W48HuxNYpJNdd2P6RRz8BCqjAE7xcknAEQWeTuDjMlQdkx?=
 =?us-ascii?Q?01W6RE4WyEIh+IWln/OMQJy9uZ9ZYmn4YZrKhlPyoypX9QldzYl+C4/VWocr?=
 =?us-ascii?Q?K5QjDEJWbWZpbdeRk8voJgq2W+JpkkX+MPSbnj3rNIz4dApzKgIUbzHJUyUR?=
 =?us-ascii?Q?+rytORvwlUXpwqhamBrXfDE3lcadFGiRAR5Uz9ihcv7hxdg7QXAFeQ7KBltE?=
 =?us-ascii?Q?0orqrPD5pNTsD7II9jHYpg5K076+IJ3yoH2jg115LalY/HNoOK3l/iZv/Aob?=
 =?us-ascii?Q?pWUhsKq9cPqiG8ZsGOpAAg0Fcf7Z2sGDUKOiUGgVGyRjAszSWNRx7/KasQJz?=
 =?us-ascii?Q?2tt2eBtNhguvVGgfJYqt1q2nkrjJaNL07hwAYmlgpMnbVH45fS+YGX4PH4og?=
 =?us-ascii?Q?oWBCnftQWtsrwvaSKmPqllJPnyvNp/10LEVeLrmtFJpgQBi98fWBptMTSKGi?=
 =?us-ascii?Q?y1YYrHW8OwfBybODoXlXll9LvwBFfMfjJFhVWUkdLrVyRXBFB7bMIIsdB3GU?=
 =?us-ascii?Q?baqRjIi0Q4xXrd3Ztf4S/31f5PFNHGHBUTa97VhmOvyJkURSYu09ZM9GVnmx?=
 =?us-ascii?Q?SoJjLCrdURMhp9+CWgGUMIKzPiWrn4ULMN5M41RzGr0ue9TZ0R3S8RmTLrxW?=
 =?us-ascii?Q?xEXGE/9HWccY0L/fZ9AVivZem65sPYR77UOr7IaU1CoFcxcR/duKUNrX32e9?=
 =?us-ascii?Q?XdOa+aLBY6M+UfI80g+k7+DvumAqlkRg13ycEbfw9j8Mt0zKE9ZC2bfrMO8y?=
 =?us-ascii?Q?FBZs2TbuYH+TYEwkKRJbk0M1z1c+zUpCMDMWKs39B/c3lR6tR1XKTFSeFt41?=
 =?us-ascii?Q?PQ7K8VJE3wwb3h5HwCkhSGtkQTRLaBSgkQdZHGDY+cuIwtyh07igmDZZaf7V?=
 =?us-ascii?Q?w5yh9rC8/N+Td5dCv7hqb+SD85s9ivwEXt1uRe8J6O5R6wtvPu65WAjFQzuF?=
 =?us-ascii?Q?twFB7Xp0lJ3lIzAJjJQ5hLZG11unOW7/PoFkn59j0ZbtxeRAqEIrKDRbMzhx?=
 =?us-ascii?Q?aFBYu+mtpWDh12RkLd6seIEtYbn3HGegeKDhVGA/o+igv2cEQadfZE6t8Bh6?=
 =?us-ascii?Q?8V/Mv44Wmh/GgJWxQWTQmQSesPijI01g9q2SjPbVudeklgBkp+L1RIDynoEW?=
 =?us-ascii?Q?K8W5LCg2WYP//QqtBABawxNsjlvl+s7szHRNOcBDDWlCsYTKVtP+uG7RCmM0?=
 =?us-ascii?Q?2uP4SRHLGyZm7+TQpGGeHyvWCvsOpZw3hfYUr2of6QQrpTzbFdpaMT9lh4ie?=
 =?us-ascii?Q?aZ1uKpjM2hFsvtxVI0L4qBxgfPUcCQku5zlhwHXxCiM2qNmf/RmhVcMKZJOl?=
 =?us-ascii?Q?zyxkBOotJvJMjzudvAbvyW5Gsmx/URrfAwCnjUz5U5cW8qBUjV+wot62weL/?=
 =?us-ascii?Q?d41mHtsHo0KFrkxFTZiBcxwp7fii67vrwsNzgXgNqFkmZLdt/qjiUUXfnY2d?=
 =?us-ascii?Q?5wiowT+yO5r15FShu7OQxHR+IgAuvYl8SBwIkrulqoUfJZ7TdpbcvaF6ZFpi?=
 =?us-ascii?Q?HDeHOzJtj/G8raE+exAmAJ+AxG5eSerccPW50Q8I4PCvpJ6Wrt6oMdB5EbJi?=
 =?us-ascii?Q?6QjWb95xSolUCbsRRIo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0451bce2-fbc3-42c3-a23b-08dba88dba9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 12:44:47.7827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfDft4g4fth7cnLI0tsskQ82McTQInqL9z8ExWG2y1UwbaFBNxaOMACr4YfnKkyaG2Umyc7DGtx0cnezDpNJfQ2geyRk3GLWBL2N4cvs6YA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5409
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre Belloni,

> Subject: RE: [PATCH] rtc: rx8581: Simplify probe()
>=20
> Hi Alexandre Belloni,
>=20
> > Subject: Re: [PATCH] rtc: rx8581: Simplify probe()
> >
> > On 28/08/2023 10:08:28+0100, Biju Das wrote:
> > > Make similar OF and ID table and simplify probe() by replacing
> > > of_device_get_match_data()->i2c_get_match_data().
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > Note:
> > >  * This patch is only compile tested.
> >
> > As you have access to a rx8571, please actually test.
>=20
> You are right. I have RZ/G2E board that has this RTC.
> I will test the same and confirm.

I have tested this patch on RZ/G2E platform and confirm it works ok.

Cheers,
Biju

>=20
> >
> > > ---
> > >  drivers/rtc/rtc-rx8581.c | 8 ++------
> > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/rtc/rtc-rx8581.c b/drivers/rtc/rtc-rx8581.c
> > > index
> > > 48efd61a114d..68dd8b9b52f9 100644
> > > --- a/drivers/rtc/rtc-rx8581.c
> > > +++ b/drivers/rtc/rtc-rx8581.c
> > > @@ -250,8 +250,7 @@ static const struct rx85x1_config rx8571_config
> > > =3D {  static int rx8581_probe(struct i2c_client *client)  {
> > >  	struct rx8581 *rx8581;
> > > -	const struct rx85x1_config *config =3D &rx8581_config;
> > > -	const void *data =3D of_device_get_match_data(&client->dev);
> > > +	const struct rx85x1_config *config =3D i2c_get_match_data(client);
> > >  	static struct nvmem_config nvmem_cfg[] =3D {
> > >  		{
> > >  			.name =3D "rx85x1-",
> > > @@ -273,9 +272,6 @@ static int rx8581_probe(struct i2c_client
> > > *client)
> > >
> > >  	dev_dbg(&client->dev, "%s\n", __func__);
> > >
> > > -	if (data)
> > > -		config =3D data;
> > > -
> > >  	rx8581 =3D devm_kzalloc(&client->dev, sizeof(struct rx8581),
> > GFP_KERNEL);
> > >  	if (!rx8581)
> > >  		return -ENOMEM;
> > > @@ -307,7 +303,7 @@ static int rx8581_probe(struct i2c_client
> > > *client) }
> > >
> > >  static const struct i2c_device_id rx8581_id[] =3D {
> > > -	{ "rx8581", 0 },
> > > +	{ "rx8581", (kernel_ulong_t)&rx8581_config },
> > >  	{ }
> > >  };
> > >  MODULE_DEVICE_TABLE(i2c, rx8581_id);
> > > --
> > > 2.25.1
> > >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and Kernel
> > engineering
> > https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fboo=
t
> > lin.c
> > om%2F&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7Cce5fb3bf24764820b=
8
> > 2e08d
> > ba7c22022%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638288224433894
> > 702%7
> > CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1
> > haWwi
> > LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dckmh5KF7OTtDO4LRU9QPmuBmt8XOO4Q2=
i
> > 8wFPE
> > yRqKs%3D&reserved=3D0
