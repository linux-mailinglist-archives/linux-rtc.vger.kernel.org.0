Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 611E067FC6F
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Jan 2023 03:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjA2CtA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 28 Jan 2023 21:49:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjA2Cs7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 28 Jan 2023 21:48:59 -0500
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2047.outbound.protection.outlook.com [40.107.13.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D28479EE7;
        Sat, 28 Jan 2023 18:48:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxRJ0Au2qvYue37prGl2SRJzDCaXrM39Q2eKPTpNQ8jDIO9Tiy5smXaz8l+aLrx93bd12FgBt3CHnPioh09QJcxsy1jxm4uk20y1/eK8bRiAviJT34vNvLWMSv4FfRhVgQgkfPkQbxDWpzeRP3gSVmWsVvIdYJo0EkT/phNk/9u4seqzA7nDY6H62QRQx4rgXpYtQljo8AoNmFxMbw2Qzx1poMElDwbVT/rsf+Drudtc92SjvZ+GXrAuZvlS74go2aGJodHiWgIru/XEIqhUgKtymdTycnwArp6jnJc93DRGC2as/k/xcftiU5pvpiWfy0C/ZxA48VvrrLETZt3jOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCLwWGSRolTJzWNItE9r3CIy3BVZj97B0vj/HZDMQ6w=;
 b=hBCymsWZAL2DRRCHY/z57IlfXPdWziJ+AqHymATgumv3XuKp5ImzSJTz2N8HsZeDy/bmOFOuO0ZSiSrGu43TCzmrCAgGy/eXTyItuoN0pTELkZu2cYAei4tAVlB7YiECgYlBleZi4RIkl0CVkaYWrjPqJpVVmsYyjghlqb1PgmoA4IcEp0fQV2T3jNC65U6gxcH84LDSWQi1itWf65T2ZmsNDO/sJ9i1b+yqZioJvd+7HPoVBMDXcTOIijHKLIEZP0V/T60Mc2lHRpdYs+TAtQ6Ayvup00WNtkOgPd0dnC8Phoq9Jl9VhHEtdqGAQHnh1IZNTwIKGOaZ7WlGxKlnJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCLwWGSRolTJzWNItE9r3CIy3BVZj97B0vj/HZDMQ6w=;
 b=F4S8s+980vEYURcwRJ9gRHp3XPgbaVJiKEsbDYD5nlQpHOWNCWcpN3M/zbG/FGioCehV1oe+QQHM7eSnVOqyt5poSmcPwES2I23ZXTSHxjkH0YQ4hAbOmM6cv6tQstapP7OXmebnwLCtiL58JuXwbwdAPSdVHBzw2b1lF/Gmrq4=
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AS8PR04MB7575.eurprd04.prod.outlook.com (2603:10a6:20b:29c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.30; Sun, 29 Jan
 2023 02:48:54 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::1793:79b4:2cb7:4db]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::1793:79b4:2cb7:4db%4]) with mapi id 15.20.6043.030; Sun, 29 Jan 2023
 02:48:53 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        "lee@kernel.org" <lee@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>
Subject: RE: [PATCH v3 2/4] input: bbnsm_pwrkey: Add bbnsm power key support
Thread-Topic: [PATCH v3 2/4] input: bbnsm_pwrkey: Add bbnsm power key support
Thread-Index: AQHZH0eCtmXkN4FOEkSzNEQOgzMhRa6tjK2AgAc68XA=
Date:   Sun, 29 Jan 2023 02:48:53 +0000
Message-ID: <AS8PR04MB8642701F89ACBE65C6F672EA87D29@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20230103074742.2324924-1-ping.bai@nxp.com>
 <20230103074742.2324924-3-ping.bai@nxp.com> <87wn5c18q4.fsf@baylibre.com>
In-Reply-To: <87wn5c18q4.fsf@baylibre.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|AS8PR04MB7575:EE_
x-ms-office365-filtering-correlation-id: 20183df6-64a9-4e2e-7563-08db01a35c13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mr3sdz3W/eraCfqSvZR+yf2LtFs62WiXKU0SQNuQUgACdBkp/PR99eOSWvRVGbCjsy8UDi/2d4SDeNHgDDkHjLv7qLLOyGhD/ILIaAvK7DE7gb1n6TFrmXZh80xiXmg/fmF7gZoyVb55X76vdFAjvEXrgZ+ZI79JV2cCX+57zPbCBVJ6eA+25JiFw4HQc6x1dkqgLzS41cNdvL7JXY1y9Jw12acsEeknsQkSpDHxxcHIKPjVCBO76lkZZzerB34EzGLJnSUHg0ZB8+iJrJ83XuJ7kB4kwHMhLaMRm4g8wpan5QKjluUOp+xhD2keKz/mjVk0rmKMyvkbk6rt/pa8g06ufvMD69Y3MRxqxxg0I2GFUVlbzN7nB9WdyBtdPYVugu3+vFmDH/Dt4+O0cwFc6RqxBeDEMqq5ByOzKzOtGAm73ra54191WQruDxKM9UcB7WY1hEM/iNGzW3DTf3Og9WFVXYBgq8DQLXFmXuxeHZG5DaSv8sS1w5b1M5um/+MDhg7TjiMtxty1eeDsk/hPJDSQ8D0DQIdyj7v1CsZpzMRxrbtBbVvIo9hsFCfYGdO0/khaIcp9WpaWCKY+IszAV/UqKL483LTwi8cnkjVMGhB7GxCKUb9W8hf8+q53Rf9utVeytdAL9GU2iX+WtFHkv44M3yy+NMc8iLZt8yXUI2Im7TJov16f0X610U3ZLvfmIKYybbP8yyLPHqRtoNCHyw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199018)(478600001)(71200400001)(7696005)(26005)(83380400001)(86362001)(122000001)(38070700005)(33656002)(55016003)(38100700002)(186003)(9686003)(53546011)(6506007)(7416002)(110136005)(5660300002)(54906003)(64756008)(8676002)(4326008)(66446008)(316002)(76116006)(52536014)(66556008)(66946007)(66476007)(8936002)(41300700001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6y1xRjZAe+vwC+PZYqXU6B/JAY7WIT3YWa7qEr33FcnE/TptVNe4E7V5Iuua?=
 =?us-ascii?Q?Nmj+OxSaLHVttNns6NvKh/nYVN4UBISbBBwKZQ+NXaJh2mfVXAFYBDgQHZgd?=
 =?us-ascii?Q?Rj+FvkOeob0GcwtM/no8V0FPPHBeH+rUM3bXNd0ihFzpchX2MT03tBlA/Zxl?=
 =?us-ascii?Q?loJdKdX7mKsoAcELajGWdfH758Q77YtSPCXQUfuusPDD16xp8mXwIzYS+VV5?=
 =?us-ascii?Q?XWFD1KKx4/3N4hCsCLArzkoHajPjsjeLacA2Ir+ENR2KIfox+WJAlM/Zdhj7?=
 =?us-ascii?Q?Sg5Ie4JgWnz8ybBfNOkOz+4JP683MJo6T/kos8hsSaRqtPSxS5kvYDJ5ADrm?=
 =?us-ascii?Q?hT/9TOnPZmmc1EB2HF1hnBRdXdpkTagQ8xU9aGHmyvg6gY7WIqtcaZ0n9UwG?=
 =?us-ascii?Q?l/pVSQfoUkYocLdOIwKXyAYPBCkiSggnnMkxUSNLy8rqGm3y9bdKDWGFTR7i?=
 =?us-ascii?Q?mlww4miB99eO7y5qn7/oIPHIx9bPOvWEh1ckNiPC727UvwFBKz7PwuLGaBSJ?=
 =?us-ascii?Q?7hJPhDsmpelhsNQo1ltCIhtR030VvVoUeZUt9Z6CxeC5TpUe4GVm5nVBoOEh?=
 =?us-ascii?Q?fZ4HImUrqZv0Gp3zbQPaQUPCpoYHvVah+JenF+/mda3uxEcsQzsBGUp7JoWn?=
 =?us-ascii?Q?vAR25GIr+nXZF5JKL59KVmczGeH1AIJsMCC7yt85MZFM4HL14ymHLhkOSpL5?=
 =?us-ascii?Q?Ji0HjGuiRdjNqOBH0x4qDTBvgsIk9x1FmTaawsdiK0xgnGkC12KmR0dK5MhM?=
 =?us-ascii?Q?go5VEPg4JWGBvVSOuv+taXeoU8XVCnxkfPw6tE+R4AdKIZi8GQq+YhCt5VsV?=
 =?us-ascii?Q?xQf2rEY8PRiENfgn/wjfikm1dOYUD8Ijt8N5zPldKCCCSX/G70ifpRaC7H8e?=
 =?us-ascii?Q?PsidPtEDa+CJ4YUaENRHM7gd58xvBZoxA2e7HydWP2i/33Si7qhTztHbeb0U?=
 =?us-ascii?Q?eM7ylF7udJUc1b3vby9B8c5j1IGmljdWfOLRa9QC96l+o5MiMOJCjGUIiF7Q?=
 =?us-ascii?Q?cZrdA1dKqoxi7hdBMH71879drH9EowklB7EilyAjHv510gprkc0OmlDnc+Wb?=
 =?us-ascii?Q?G9vDlmWTOVnpn6wfleJH7kWwOOQ6OsDz1nC+UcOBhlsCaiRcRatQY26P2eiO?=
 =?us-ascii?Q?MLk1R9TKK1BpC2bRFGh4M63qm49KibmiiokDXoJia9nhKVIW4TLKltkvfj3W?=
 =?us-ascii?Q?HQ1J0wce3qROt6/uyzHN+EoOPR7IN+70iKzmXRpAxaysCvHKqP/b+CmhzNoJ?=
 =?us-ascii?Q?RLIjKCzbqcM+ts02ipdZktUA3tOOaDY17QR9D7XClJ0VIdtjIaAcpvtdje9g?=
 =?us-ascii?Q?8M/7dal27xzBIpVvcuZ4aUliHrivx2aQ029Mcy3zRqXE0YEf7SUcmeV7Sk1+?=
 =?us-ascii?Q?eT+tTqEQ2DXLvXHq/GFdGjHWyiPth4s5inFFXzk/i2GT4hoV5dfd/8+Wh0jO?=
 =?us-ascii?Q?wQX4gyz9T9jr8Oc2mZoJB72SxTSPLRhpXgIJSQW0lE2Kjtzlcgs9dwrZOOcj?=
 =?us-ascii?Q?3U/m1G5MKI2ReoVncovQ3f3pHWyTwSVmDEXXOrC8qRWGbjgqETCnCIcOsCrf?=
 =?us-ascii?Q?D1bvxwav+GAs0oJsPuM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20183df6-64a9-4e2e-7563-08db01a35c13
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2023 02:48:53.8664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i1CpdP/iRNlxhXrKEXWaGAZ1g1NvVnlstgvenFbRR556p59wKf4pbPV7tWf2Fh0V/zjbmLhZbmY5b+vg/YlK6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7575
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> Subject: Re: [PATCH v3 2/4] input: bbnsm_pwrkey: Add bbnsm power key
> support
>=20
> On Tue, Jan 03, 2023 at 15:47, Jacky Bai <ping.bai@nxp.com> wrote:
>=20
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
> >   - v2 changes:
> >     - use device_property_read_u32() to read the property
>=20
> We state this in the changelog
>=20
> >     - clean up the goto return, return directly
> >     - sort the header file alphabetically
> >     - rename the file to add 'nxp' prefix
> >
> >   - v3 changes:
> >     - get the regmap directly from the parent node
> > ---

...

> > +	bbnsm->regmap =3D syscon_node_to_regmap(np->parent);
> > +	if (IS_ERR(bbnsm->regmap)) {
> > +		dev_err(&pdev->dev, "bbnsm pwerkey get regmap failed\n");
> > +		return PTR_ERR(bbnsm->regmap);
> > +	}
> > +
> > +	if (of_property_read_u32(np, "linux,code", &bbnsm->keycode)) {
>=20
> But of_property_read_u32() is still used

Sorry, it is my fault, will fix it.

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
> > +		return -ENOMEM;
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
> > +		return error;
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
> > +		return error;
> > +	}
> > +
> > +	error =3D input_register_device(input);
> > +	if (error < 0) {
> > +		dev_err(&pdev->dev, "failed to register input device\n");
> > +		return error;
> > +	}
> > +
> > +	device_init_wakeup(&pdev->dev, true);
> > +	dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
>=20
> Can we add some error handling here?
> The legacy driver (snvs_pwrkey), which looks a lot like this one, warns w=
hne
> irq wake enabling fails, and so do the other drivers keyboard drivers tha=
t call
> dev_pm_set_wake_irq().
>=20

The error warning removed after v2 based on Alexandre's concern in rtc driv=
er,
I can add a dev_warn in v4. Thx.

BR
Jacky Bai
> > +
> > +	return 0;
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
