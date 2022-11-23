Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF8E7635771
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Nov 2022 10:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238100AbiKWJmo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Nov 2022 04:42:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238114AbiKWJl6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Nov 2022 04:41:58 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60043.outbound.protection.outlook.com [40.107.6.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2679AD06D6;
        Wed, 23 Nov 2022 01:40:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQLPYf0ZB6lbnlKH0t4PH1WSwn84bYPSN2eOUerGQhy6Ti35zmkcUo3IVnrxrf90FRT/KCNBlLs8hpHHAexYDR9ICDnkB9A4W7KiWYYGchiV8Er6yiWNWb3CoBrWBLrvaHZhvIeuA4l+Zt8ylWVA3D8tcMk8gWko+w309f6uKzfPPJYxqD+hNMMMnN/9nrHl/bP6e7n/g3NgmfV7wKim4Zejp5Ts7uqtptA+pUQgp/i+YUCDegtdO2y6fIs8m9qGwfrynL9EZ2mxbi5W4dJ203hD7xvlPCerg1Yh9IB2ZXt/EjKxuHvdXiuk81PBSMmimhTtKex/rOh1kXidJTWiOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMJa5GLMEkadvJokXwqVB2hGUlSJzyG6O58eLOIWxXE=;
 b=YwQc3MIAhnr7zdiu8AG13ZTJOovKpDCIGoM1BP202tlSC1277rjT18o7XPrLenz4YmlKiHWNB489RpWl649gZqanEgBNjHLoDRDEcka1LtLwt4lCkm8VH3sOy5M+WOL+6yf6Idhjl09MxoIDcqpWFdvRd60hUMw3RNGv+tNdSaqQASkNfVPc5u0Cb80paMhXvMgEPl9xq8kSfhzyOyNNQrDnBhfUSL5v9ZNXsO+dPVDx2FKhoC3pGSQwPfrYlIRDAkmqmUsaehtMZXsG5XFpV8wf1/X+cJX51+RkeUM/7II39KTHw3/uVp1qOAXdssufOLRku1ovX0P//RVC8TZePQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMJa5GLMEkadvJokXwqVB2hGUlSJzyG6O58eLOIWxXE=;
 b=RrJa/QLf1haG+u0qHP5yBxre26Bl/iZyyQq5hacP5kLgbIjh03OMplLIS3LXNDeDKPTsCQjm4Z+ts+3omigG8FUx+CQ8sSt9YfcOsYayFgBUnDR6KDjd2teE9ieYRtV1bVfg2jfHkFJUC5FPm3axqtZ99GzdDHkBtGJgFXSxb5o=
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AS4PR04MB9689.eurprd04.prod.outlook.com (2603:10a6:20b:4fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Wed, 23 Nov
 2022 09:39:57 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::9ded:65b7:9d51:d37a%8]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 09:39:57 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "lee@kernel.org" <lee@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>
Subject: RE: [PATCH 2/4] input: bbnsm_pwrkey: Add bbnsm power key support
Thread-Topic: [PATCH 2/4] input: bbnsm_pwrkey: Add bbnsm power key support
Thread-Index: AQHY/XWQ7kPrYj56Okmc6NwuZ1D1865LmniAgACmGBA=
Date:   Wed, 23 Nov 2022 09:39:57 +0000
Message-ID: <AS8PR04MB864238021EE2CA42BF800461870C9@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-3-ping.bai@nxp.com> <Y31cES4SiUlG4mKd@google.com>
In-Reply-To: <Y31cES4SiUlG4mKd@google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|AS4PR04MB9689:EE_
x-ms-office365-filtering-correlation-id: a16b9086-f3f4-4b3f-5a10-08dacd36af3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wDaw+h0ExrsXRN2RKUMbTQ5ptWmflupKyIxkVo+am/T3iBZNoJfn5oQ95G75lv45yeDgOm6gf/xqFFftcoPmx0BWSM5dL/zzpvEUCwlDumbyuNEIKoaUVug/vx/4eHBqL/1Q77jFDElaF92Ezk1g2OvMGQGMkpW+z6lQ+N755HVevpu9kek+d8AXcGBYE1D2isJu+efCWN+MENaQRHTQHX8Uj1kAQgDgwmwxf7RKu8x/xrVHQu8c+Ni+b/oC5oaH/+GuZonkcnHoIYcFIfMlcuzamH/obPV0OwdLgQzX4ckTIJ+5ivaoIeJckHEip5Ewnan3HJfmDzBco58TqQogRNcX6rCOdGxMauzGASaHodghjr5Dbe9i439AaJ2U+eifVAN90PC5alkQ79oHpYIL5VN4ChbQYTEdsPIxx8p7o+nlP0Dpyo/OkV0iG5ZrY4MA8MKmLZmv4cz2HpfYVo1NbOcwFhsXdOQ+wnOQixcGGnU+3pFTK0tgTuA25ECOv08PorhjmznstVIEaPFoKt2YyJgKpVM2TX8b0aZTVX3nGu2ZGZmTgt+raCNSZXXNJsqR5zqGTVVyo8554Q+y58gqnMM6iAKaF1RtUz4g1puSOjvsdjk/IvbCv8kxDUNu+LM6Hb1K8yG9qXqofKhyh+z77jwkkIu2cm7vBtGDnbkwoxa50U1lzAxmRGgK38kcq0qlajT5Xk7WE+s/yAQysj9wiA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199015)(66556008)(33656002)(66476007)(66446008)(76116006)(66946007)(64756008)(86362001)(8676002)(5660300002)(4326008)(9686003)(8936002)(41300700001)(7696005)(52536014)(6506007)(26005)(55016003)(71200400001)(38070700005)(54906003)(83380400001)(186003)(316002)(38100700002)(6916009)(122000001)(478600001)(7416002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?S1N5nc3drsS1vmPlihrN+rSgiynjSjSid3jTAaPArAtzLr1/YRTwO5L0/28B?=
 =?us-ascii?Q?6W9wm4ZqzHOdVIIWLv2h04gM0HMVDAs56g3ZY9rm4QVlH0POeav37RBJvT+N?=
 =?us-ascii?Q?d4w4f8lWr784XZOsE19qe8nxcqNRKPLc67R4ERNw89NvywCoYL7mwvCJnhd1?=
 =?us-ascii?Q?GzzfPTGCDWo/IYxTnk2Pr1jwA8vl6U9QSzPJSj1ZVGQGabl8rxO1Mslioc+I?=
 =?us-ascii?Q?3SPYIkMrGHrUepvjAJiN3LhMSMONB1FuhA5JAXrkd6GtRWzZzjxIW6JGwLmZ?=
 =?us-ascii?Q?v8M5fcCmDE6OsWTxAODNKooG2MlR37moxCpbmZRvmCS9SlOOxpGb8Qx6xqBR?=
 =?us-ascii?Q?lVs4qOfe8+ogZnq4Q/+r5qLzTUIqUIkMZ793vGAelcrHAVRxETednWlZPnTz?=
 =?us-ascii?Q?AV1/aS/tJZGO0Wbw4b25Zpa3IgB8l1Pbp6KJw8noMaZVaIwH4I5DADWTdKh8?=
 =?us-ascii?Q?HL5C+F1UQmK8i0jMbd8AjP+PXRuOWkMgYKC62ycPfm4pQqwmf598WRSZjp4F?=
 =?us-ascii?Q?YOelY+pNrG7+JQJV3usNvuOHgBW6VxUPUbZHhD1O7lItyy34kECAMXdCRGZd?=
 =?us-ascii?Q?zrFGkn24GkeZ6j49iKtgW77y1caoKcSdV03j15dOXyyYKUTKwZbvTKK44jwY?=
 =?us-ascii?Q?os1aB7KBxchLyb2zFI9pYQHbVutnXrun71Ekg78qvCviiJcTQvPtroJpXjLU?=
 =?us-ascii?Q?RYVVco082OXusVbIkmKPzdRiIkGDfplDAtOLhsywoFErDtGpfTkoWZXQG5fD?=
 =?us-ascii?Q?DMkbOrARZZb5ixBSeVQrmGL8UH6tmdhgeNMtjSwlF7KGiVqzJRBKVUkn+V6G?=
 =?us-ascii?Q?kQhMG6vtQU88wlE7OlricMaA3Xz+ajzgN28yBkdXqNQSIYPYjUhmphXzWdP9?=
 =?us-ascii?Q?qq2p4QnI1rc1Yfp2lEYDuXaBGDu4R7d/3rIBjxIdQ9WBnvKjKq8Lat0iDvlX?=
 =?us-ascii?Q?mL/vaQrmakSPJArb/iGjbMC2ofx7eAoNSqLcYrWMCuXpAZGyk865m1kbK8xS?=
 =?us-ascii?Q?vAI/sXTshA0bTB4MjsSBq76oaLWjptW/vSxoi2Qfye327dYpCipvAnEEHeRM?=
 =?us-ascii?Q?6vRE4qLK1bKI9Tse1FB45lelp5XwFV3WCmNSD7cnG9Ru2it4+pzYqevU9KqF?=
 =?us-ascii?Q?IPH57Qlrs4yXuikaYnx3K3FIcteUXPEF70xSpeZyRl/44O2VOuXVdjyS2Hnu?=
 =?us-ascii?Q?dzv/NFTUKmpJkWNhpLXPjbmVrCVhy+Po9rWqwTTdOgGxOLgl+tz3UR/yfRPB?=
 =?us-ascii?Q?BwsOzo3BRtXmcE+ASPIKEUWeCkQgxQZsWyH7h120QK1PdW64ym0heE1k4yKJ?=
 =?us-ascii?Q?c/qqHJT4/Xwdksqn3rUt83iwOV9N44rVf8T1teaPdSGbHIW0YkEX4BO1Fjsm?=
 =?us-ascii?Q?DOZhioBb6TPY1ctI7e6CbddXKEK/epEyJ7bnbwY+k/VatYFiJnkHatPDjI2Z?=
 =?us-ascii?Q?yHsfDDPZJ+LDlg12ojBpAu0GxNR7Pzq+LUgWBzJkZj1dtcNOYa1ErecXbAQG?=
 =?us-ascii?Q?lL1zrpQJ8xQ/Lz7RgehHfmd0LZL2HGP3ZIyGoSXl4IR7zWxUv992W5JHyllk?=
 =?us-ascii?Q?MfVOYO8dG6gWVEUWwL0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16b9086-f3f4-4b3f-5a10-08dacd36af3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2022 09:39:57.7839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: in0Lg0V7MyvEQ0NxBqNxYCqpiUv/NslKOwN3USZVlNMQFRzVWOmnF7W1mj6myVb4K1A/Uoe4VW57M9OTN7RHZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9689
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> Subject: Re: [PATCH 2/4] input: bbnsm_pwrkey: Add bbnsm power key
> support
>=20
> Hi Jacky,
>=20
> On Mon, Nov 21, 2022 at 02:51:42PM +0800, Jacky Bai wrote:
> > The ON/OFF logic inside the BBNSM allows for connecting directly into
> > a PMIC or other voltage regulator device. The module has an button
> > input signal and a wakeup request input signal. It also has two
> > interrupts (set_pwr_off_irq and set_pwr_on_irq) and an active-low PMIC
> > enable (pmic_en_b) output.
> >
> > Add the power key support for the ON/OFF button function found in
> > BBNSM module.
> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/input/keyboard/Kconfig        |  11 ++
> >  drivers/input/keyboard/Makefile       |   1 +
> >  drivers/input/keyboard/bbnsm_pwrkey.c | 196
> > ++++++++++++++++++++++++++
> >  3 files changed, 208 insertions(+)
> >  create mode 100644 drivers/input/keyboard/bbnsm_pwrkey.c
> >
> > diff --git a/drivers/input/keyboard/Kconfig
> > b/drivers/input/keyboard/Kconfig index 00292118b79b..8efcd95492b3
> > 100644
> > --- a/drivers/input/keyboard/Kconfig
> > +++ b/drivers/input/keyboard/Kconfig
> > @@ -456,6 +456,17 @@ config KEYBOARD_SNVS_PWRKEY
> >  	  To compile this driver as a module, choose M here; the
> >  	  module will be called snvs_pwrkey.
> >
> > +config KEYBOARD_BBNSM_PWRKEY
> > +	tristate "NXP BBNSM Power Key Driver"
> > +	depends on ARCH_MXC || COMPILE_TEST
> > +	depends on OF
> > +	help
> > +	  This is the bbnsm powerkey driver for the NXP i.MX application
> > +	  processors.
> > +
> > +	  To compile this driver as a module, choose M here; the
> > +	  module will be called bbnsm_pwrkey.
> > +
> >  config KEYBOARD_IMX
> >  	tristate "IMX keypad support"
> >  	depends on ARCH_MXC || COMPILE_TEST
> > diff --git a/drivers/input/keyboard/Makefile
> > b/drivers/input/keyboard/Makefile index 5f67196bb2c1..0bc101e004ae
> > 100644
> > --- a/drivers/input/keyboard/Makefile
> > +++ b/drivers/input/keyboard/Makefile
> > @@ -62,6 +62,7 @@ obj-$(CONFIG_KEYBOARD_QT2160)		+=3D
> qt2160.o
> >  obj-$(CONFIG_KEYBOARD_SAMSUNG)		+=3D samsung-keypad.o
> >  obj-$(CONFIG_KEYBOARD_SH_KEYSC)		+=3D sh_keysc.o
> >  obj-$(CONFIG_KEYBOARD_SNVS_PWRKEY)	+=3D snvs_pwrkey.o
> > +obj-$(CONFIG_KEYBOARD_BBNSM_PWRKEY)	+=3D bbnsm_pwrkey.o
> >  obj-$(CONFIG_KEYBOARD_SPEAR)		+=3D spear-keyboard.o
> >  obj-$(CONFIG_KEYBOARD_STMPE)		+=3D stmpe-keypad.o
> >  obj-$(CONFIG_KEYBOARD_STOWAWAY)		+=3D stowaway.o
> > diff --git a/drivers/input/keyboard/bbnsm_pwrkey.c
> > b/drivers/input/keyboard/bbnsm_pwrkey.c
> > new file mode 100644
> > index 000000000000..288ee6844000
> > --- /dev/null
> > +++ b/drivers/input/keyboard/bbnsm_pwrkey.c

...

> > +
> > +static void bbnsm_pwrkey_check_for_events(struct timer_list *t) {
> > +	struct bbnsm_pwrkey *bbnsm =3D from_timer(bbnsm, t, check_timer);
> > +	struct input_dev *input =3D bbnsm->input;
> > +	u32 state;
> > +
> > +	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &state);
>=20
> Can this fail?

Should no chance to fail. Any more tips?

>=20
> > +
> > +	state =3D state & BBNSM_BTN_PRESSED ? 1 : 0;
> > +
> > +	/* only report new event if status changed */
> > +	if (state ^ bbnsm->keystate) {
> > +		bbnsm->keystate =3D state;
> > +		input_event(input, EV_KEY, bbnsm->keycode, state);
> > +		input_sync(input);
> > +		pm_relax(bbnsm->input->dev.parent);
> > +	}
> > +
> > +	/* repeat check if pressed long */
> > +	if (state) {
> > +		mod_timer(&bbnsm->check_timer,
> > +			  jiffies + msecs_to_jiffies(REPEAT_INTERVAL));
> > +	}
>=20
> So interrupt is only generated once when key is pressed, but not on relea=
se?
>=20

Yes, at lease from my test, this interrupt can only be triggered when press=
ed.

> > +}
> > +
> > +static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id) {
> > +	struct platform_device *pdev =3D dev_id;
> > +	struct bbnsm_pwrkey *bbnsm =3D platform_get_drvdata(pdev);
> > +	struct input_dev *input =3D bbnsm->input;
> > +	u32 event;
> > +
> > +	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &event);
> > +	if (event & BBNSM_BTN_OFF)
> > +		mod_timer(&bbnsm->check_timer, jiffies +
> msecs_to_jiffies(DEBOUNCE_TIME));
> > +	else
> > +		return IRQ_NONE;
> > +
> > +	pm_wakeup_event(input->dev.parent, 0);
> > +
> > +	/* clear PWR OFF */
> > +	regmap_write(bbnsm->regmap, BBNSM_EVENTS, BBNSM_BTN_OFF);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static void bbnsm_pwrkey_act(void *pdata) {
> > +	struct bbnsm_pwrkey *bbnsm =3D pdata;
> > +
> > +	del_timer_sync(&bbnsm->check_timer);
> > +}
> > +
> > +static int bbnsm_pwrkey_probe(struct platform_device *pdev) {
> > +	struct bbnsm_pwrkey *bbnsm;
> > +	struct input_dev *input;
> > +	struct device_node *np =3D pdev->dev.of_node;
> > +	int error;
> > +
> > +	bbnsm =3D devm_kzalloc(&pdev->dev, sizeof(*bbnsm), GFP_KERNEL);
> > +	if (!bbnsm)
> > +		return -ENOMEM;
> > +
> > +	bbnsm->regmap =3D
> syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "regmap");
> > +	if (IS_ERR(bbnsm->regmap)) {
> > +		dev_err(&pdev->dev, "bbnsm pwerkey get regmap failed\n");
> > +		return PTR_ERR(bbnsm->regmap);
> > +	}
> > +
> > +	if (of_property_read_u32(np, "linux,code", &bbnsm->keycode)) {
>=20
> Please use device_property_read_u32() here.

Ok, will fix in V2.

>=20
> > +		bbnsm->keycode =3D KEY_POWER;
> > +		dev_warn(&pdev->dev, "KEY_POWER without setting in dts\n");
> > +	}
> > +
> > +	bbnsm->irq =3D platform_get_irq(pdev, 0);
> > +	if (bbnsm->irq < 0)
> > +		return -EINVAL;
> > +
> > +	/* config the BBNSM power related register */
> > +	regmap_update_bits(bbnsm->regmap, BBNSM_CTRL, BBNSM_DP_EN,
> > +BBNSM_DP_EN);
> > +
> > +	/* clear the unexpected interrupt before driver ready */
> > +	regmap_write_bits(bbnsm->regmap, BBNSM_EVENTS,
> BBNSM_PWRKEY_EVENTS,
> > +BBNSM_PWRKEY_EVENTS);
> > +
> > +	timer_setup(&bbnsm->check_timer, bbnsm_pwrkey_check_for_events,
> 0);
> > +
> > +	input =3D devm_input_allocate_device(&pdev->dev);
> > +	if (!input) {
> > +		dev_err(&pdev->dev, "failed to allocate the input device\n");
> > +		error =3D -ENOMEM;
> > +		goto error_probe;
>=20
> Please return directly here and below, since there is not explicit cleanu=
p.
>=20

Thx, will fix in V2.

BR

> > +	}
> > +
> > +	input->name =3D pdev->name;
> > +	input->phys =3D "bbnsm-pwrkey/input0";
> > +	input->id.bustype =3D BUS_HOST;
> > +
> > +	input_set_capability(input, EV_KEY, bbnsm->keycode);
> > +
> > +	/* input customer action to cancel release timer */
> > +	error =3D devm_add_action(&pdev->dev, bbnsm_pwrkey_act, bbnsm);
> > +	if (error) {
> > +		dev_err(&pdev->dev, "failed to register remove action\n");
> > +		goto error_probe;
> > +	}
> > +
> > +	bbnsm->input =3D input;
> > +	platform_set_drvdata(pdev, bbnsm);
> > +
> > +	error =3D devm_request_irq(&pdev->dev, bbnsm->irq,
> bbnsm_pwrkey_interrupt,
> > +			       IRQF_SHARED, pdev->name, pdev);
> > +	if (error) {
> > +		dev_err(&pdev->dev, "interrupt not available.\n");
> > +		goto error_probe;
> > +	}
> > +
> > +	error =3D input_register_device(input);
> > +	if (error < 0) {
> > +		dev_err(&pdev->dev, "failed to register input device\n");
> > +		goto error_probe;
> > +	}
> > +
> > +	device_init_wakeup(&pdev->dev, true);
> > +	error =3D dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
> > +	if (error)
> > +		dev_err(&pdev->dev, "irq wake enable failed.\n");
> > +
> > +	return 0;
> > +
> > +error_probe:
> > +	return error;
> > +}
> > +
> > +static const struct of_device_id bbnsm_pwrkey_ids[] =3D {
> > +	{ .compatible =3D "nxp,bbnsm-pwrkey" },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, bbnsm_pwrkey_ids);
> > +
> > +static struct platform_driver bbnsm_pwrkey_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "bbnsm_pwrkey",
> > +		.of_match_table =3D bbnsm_pwrkey_ids,
> > +	},
> > +	.probe =3D bbnsm_pwrkey_probe,
> > +};
> > +module_platform_driver(bbnsm_pwrkey_driver);
> > +
> > +MODULE_AUTHOR("Jacky Bai <ping.bai@nxp.com>");
> > +MODULE_DESCRIPTION("NXP bbnsm power key Driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.37.1
> >
>=20
> Thanks.
>=20
> --
> Dmitry
