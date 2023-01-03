Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3224465B8C8
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Jan 2023 02:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbjACBX6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 2 Jan 2023 20:23:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbjACBX5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 2 Jan 2023 20:23:57 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2073.outbound.protection.outlook.com [40.107.22.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A9B21A1;
        Mon,  2 Jan 2023 17:23:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccqMcd91VeAMEachZKJTaXCxdUAIFPLx/UmmT47jJSjwEDBDvz+1cln5Ubm124uU40bqxNxxl/EfPYQv9yFWHGOKRsmc4ghvGA0Mh8Z/uJQFmy+IQ3I/+zmKd1NiGQgSMqyGSfNYbJnjizhj7S8gmtcZiT7dxZhs2BkxyHzh0o4m963JmQUonKoU6r4X2l8b1gRQSbtjAUGtOO6WUNckbG/fQKV4Rn1ZkqeGH6E5PYsU26YmNIyojmTjHVD1UIkYejwSnrMgBANL1M6ahEIhEMLXL6fToI8z2x9HwpcftswjKPu+InxcEQ/H9WnQvaw8XAk7VoMN2jAB8c0n2iXItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfPTyyKgH0RggvNIgjv4DBYJRGk2LlHg99K94fGSRXs=;
 b=Vw4C4vZ4mvwFDGp2UpG0VC8d/WyFpcBCrODpS/xeLAl2vEzXlj41GtHLFVgBymXXpmrY8Bo6CxeCMTOnFfjMPT6e8dBxTgdk79kG4/qBbwjqZBv91jSjsltVn6KLlnu4yywQMUz5ujUOZw2cUNM6KyytW5jqumh1rk796Kjck3mJNoDRjrqFYtq7ufZBkv49+OMFsh86+oceiAoq0yu2Y0IP0nGiQWU9K2PuM5utJnegSDDo3RQj19Il3d6WCqODxi3J1FzhwlzrQ2p5OIsLtar80k5PCrtozIkCEZUxBvywOENwlDrs5dOof8D3k1rsiywbDrHse2r2+0V+8vfpUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfPTyyKgH0RggvNIgjv4DBYJRGk2LlHg99K94fGSRXs=;
 b=REAMdI5U4Ry7XDqj5luuMe1CvVQ/Ai4N4R70FI1frcB5AwsLAyrVDBd6v1zhqVQaGnLb7NvvCTl4qrdB3owSNJYpwqTqKEEOPm9VcqwCMiK/o7Tmgur+0xeSZj1JbG4XetN1lxxF3/yCJvJC9Fjydj6zbm5JlZNyBYB0ZMIsFVk=
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 01:23:53 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::d9e7:2c6a:a479:6c4f]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::d9e7:2c6a:a479:6c4f%6]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 01:23:53 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "lee@kernel.org" <lee@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>
Subject: RE: [PATCH v2 3/4] rtc: bbnsm: Add the bbnsm rtc support
Thread-Topic: [PATCH v2 3/4] rtc: bbnsm: Add the bbnsm rtc support
Thread-Index: AQHZGNMw9miq0aOsFUS1aq5HxrzHvK6DKegAgAjIStA=
Date:   Tue, 3 Jan 2023 01:23:53 +0000
Message-ID: <AS8PR04MB8642AE9D87FB0ACF883A1CC887F49@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20221226023942.1027270-1-ping.bai@nxp.com>
 <20221226023942.1027270-4-ping.bai@nxp.com> <Y6wldnu6+apmnSxJ@mail.local>
In-Reply-To: <Y6wldnu6+apmnSxJ@mail.local>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|DB8PR04MB6843:EE_
x-ms-office365-filtering-correlation-id: ae7342d8-20f1-4d65-774e-08daed292d33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e+kcjTVFhC4rrUcvPF3Tr65TxVWKzeWNsLEvanjHB+XlvTdKAI/XrM2gFdUN6fhRJmdLv6JW6iMDz9gcw/hywV7jhZPiWdQe4qDnNHR942Iq6hz8JvHwu7UNhwZ/yQqZLvyvrBUE4zseTqSRG3z4GPp6Q3EhZHQ4HriZTHXahuGXu9bISR6mHWuG2QNzormsTT//KBqSdOWdlWsTE2jh3wN2892byUjCwxWkhML2CUdTAORzMfzBBrPnRyqgn4XvAayAP3EVA0mTCkaoBFyHsYZwOIeNsqRcJxcOSU2wTt6TmWMB35nh8lCJFtWNQmETJQEW1U/jqQdLxA+PoCToFG1b7izU0zUeUtaqD7jwzGzyggMeo46SJbxQNxB2Aap51h18wGV6/k1sYxYGbDg0LAd71dAIKqdaZNPTat2+9DoqBT36JDXtCz+PgW5FgCGUl4Csy7lZ/M98gG+L4rFmwRD31LOn/dlgi4O07zUtwZhQBQ/vkiEdgqqq2XH48ILhC8vfSA4Q1nCzKLrBC1m4jj3YlA2yrk6z757CSCcO+uTldFYehRvUVe/S8hP3VPH2ageSUJepB+fyRp/rF8JSs/LXA4SVR+k/yQqnufgwWRy+HtTxtQbYB5H5nirQIjvgcKqmD/cj8oMeqriuVznSeFuFqGEniZM2BIsuB+5CD4UE99TXKCD3Zt4d4bZndD0UiT5yZyzW34LWzizL1FXk5RrtAq6MkSJtpvQcLbDR/ITKd1FIDe3lvD6rHHm3bADr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(451199015)(52536014)(5660300002)(76116006)(7416002)(41300700001)(6916009)(316002)(2906002)(54906003)(66476007)(66556008)(64756008)(66446008)(4326008)(8676002)(8936002)(66946007)(71200400001)(478600001)(6506007)(45080400002)(26005)(33656002)(186003)(9686003)(83380400001)(7696005)(966005)(55016003)(86362001)(122000001)(38100700002)(38070700005)(22166006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2ERpXtGZAELzchSSMGuKw0CdabWKCdQcxoWNNk4PSmuGt+NEc1nDtaoCzW/j?=
 =?us-ascii?Q?KxWJcDunXSWeWEwvCMgXgIzCf0G0vHqX0mxKoeIiMfA3s2pOE4icxNBzWm+B?=
 =?us-ascii?Q?SWmcu0q+1Mnxqq2GY2t8vCktJ1U1adWSCR4DhsnI9mgklhKfhVVF05/gbqUz?=
 =?us-ascii?Q?siEMTdPjmuh19cOycpasml2xJlTvJGov6b2mySGgB+zvXgwfHhuFKVDLyWV8?=
 =?us-ascii?Q?vbP0G1Sy4P/0ylxY9cFCQTJpHdp+L+9kiqQYaKIGPQR8rNvUkiyOs7fUQI2B?=
 =?us-ascii?Q?/Kbkty+gli4CAIpfED4N154NZwriuWqu8rbUklxl2DnFFC8Q+tjYZRWxjSt9?=
 =?us-ascii?Q?uSN779REvJNxiIIutYn30YiSrgphVi14vsYZqEIpPqvWszQvo3dF7SOdYaBu?=
 =?us-ascii?Q?BnEN77VMemSxgVR4US1zRW9EcDo3j7XSg/WQFpmuc/ytW5s+zITC0w42jxJQ?=
 =?us-ascii?Q?8tSFVJmE6C5VUqgiM3R54jh5tcPDLIkS8JZreuqNvDNm2914KKpGoHjsmLsa?=
 =?us-ascii?Q?v3X9hm1SDuQ6oc05caJUzEmDeMjZW7JROt7sHsJ+wdm/kp2tv6L0AYp74E+t?=
 =?us-ascii?Q?j/Y76doUOdZDtf5NuazUC9T/i2NoSyH8NOwiZbT0GgpFbEizh0rXlQoq440k?=
 =?us-ascii?Q?nLoEOrEZPh0l7/XSANPU7STHEYgCQd8PQTfVGcDNIntuxe6Z6Yt9e02f9B56?=
 =?us-ascii?Q?vyBIlWGfMXAgNS6CRNbJe4/vTmBK2ERubzkL3jQLn2k1yTk9gfA6FD3mnL0M?=
 =?us-ascii?Q?tZRU2Z6KcVl23CDXYs2IpiQdEUuX8cLcFQnuyPWbH2WzZ0ZsnA3sW8VW18s/?=
 =?us-ascii?Q?7AcBsKvs8J2r+K1/5z6Jw0ZOKvQrsakbpqIzUVUpSPZYMbbm+5QlDAmqX9kB?=
 =?us-ascii?Q?tHe4gguI7rdHOfw7tyfGiMBSj5HbpoDtRjWjMBJg+joIOqe3CiqslE5Ml6cr?=
 =?us-ascii?Q?Xd+8zkHhglxbj3W8g9xv4PTq6dk5zXtDkrycB6bcmOkT49ZvfvCd9rFrzCaT?=
 =?us-ascii?Q?Ub7lhoSb9czYFzTvWScocnotoO8+LvVpHrDwcwSsv3jG3Dhtev3VO0aFsQCu?=
 =?us-ascii?Q?lDbgSPC+yCOdQydCqwMHk8ctrit/eOaiqscuRg9FLOe0vdrFl1zC97cRlnEC?=
 =?us-ascii?Q?XPqie5Pj5I5nDUh/Z+gs5NnpCL9dKvL7Fum/Cm1jOr01Q9NXKLYtLKte0Gj8?=
 =?us-ascii?Q?ZJcrqB24kzyWK09ZWLrft61PC+Oc9Y+zWmREcwtKkf3nQs/Tl77VYuTX7FV/?=
 =?us-ascii?Q?zIIIfYEOpsA7cruGa5ep71rgWcf8G4wuVlTKXW13AhNNfUEPiiPJV747NrgB?=
 =?us-ascii?Q?Y0kMOiBvVWUwsm6HVQbKfEvr+KRsUoDBvrH9l7Cn+CR5uZXnhA9zuxYs/EFu?=
 =?us-ascii?Q?SJ8uRoZKJ+nI2KYjKOw/VxD4WOmRr5JPbNtoEwGE5BxlOYpqQQDfe/UJ0M9S?=
 =?us-ascii?Q?CGtV+ZcJrKikiWk6IsIIC/IWBliZRu0VntW5aRJGf/y+1ImnrUBzto1dlguS?=
 =?us-ascii?Q?u2Y36AWhpaATF7IebEAV9v/JVPBvs9OxM1hx3t1lvyAHxRFxQoAhDF5CawBb?=
 =?us-ascii?Q?pomrVMFPFJK39NHrzdg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7342d8-20f1-4d65-774e-08daed292d33
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2023 01:23:53.3823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e9fUD/Z9Uzm5U15uqqOSdm+Y5zihqDPQwSOkR4VwD26A37ZbhC6wTW5fHrebrVl93I40UP/RstMArK0TaPY8zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6843
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> Subject: Re: [PATCH v2 3/4] rtc: bbnsm: Add the bbnsm rtc support
>=20
> On 26/12/2022 10:39:41+0800, Jacky Bai wrote:
> > +static int bbnsm_rtc_read_time(struct device *dev, struct rtc_time
> > +*tm) {
> > +	struct bbnsm_rtc *bbnsm =3D dev_get_drvdata(dev);
> > +	unsigned long time;
> > +	u32 val;
> > +
> > +	regmap_read(bbnsm->regmap, BBNSM_CTRL, &val);
> > +	if ((val & RTC_EN_MSK) !=3D RTC_EN) {
> > +		dev_warn(dev, "RTC is not enabled, time is invalid!\n");
>=20
> I don't think this message is necessary.
>=20

Ok, will remove it.

> > +		return -EINVAL;
> > +	}
> > +
> > +	time =3D bbnsm_read_counter(bbnsm);
> > +	rtc_time64_to_tm(time, tm);
> > +
> > +	return 0;
> > +}
> > +
>=20
> [...]
>=20
> > +static int bbnsm_rtc_probe(struct platform_device *pdev) {
> > +	struct bbnsm_rtc *bbnsm;
> > +	int ret;
> > +
> > +	bbnsm =3D devm_kzalloc(&pdev->dev, sizeof(*bbnsm), GFP_KERNEL);
> > +	if (!bbnsm)
> > +		return -ENOMEM;
> > +
> > +	bbnsm->rtc =3D devm_rtc_allocate_device(&pdev->dev);
> > +
> > +	bbnsm->regmap =3D
> syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> "nxp,bbnsm-regmap");
> > +	if (IS_ERR(bbnsm->regmap)) {
> > +		dev_err(&pdev->dev, "bbnsm get regmap failed\n");
>=20
> Maybe this should be a dev_dbg?

Fine, will fix in V3.

BR

>=20
> > +		return PTR_ERR(bbnsm->regmap);
> > +	}
> > +
> > +	bbnsm->irq =3D platform_get_irq(pdev, 0);
> > +	if (bbnsm->irq < 0)
> > +		return bbnsm->irq;
> > +
> > +	platform_set_drvdata(pdev, bbnsm);
> > +
> > +	/* clear all the pending events */
> > +	regmap_write(bbnsm->regmap, BBNSM_EVENTS, 0x7A);
> > +
> > +	device_init_wakeup(&pdev->dev, true);
> > +	dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
> > +
> > +	ret =3D devm_request_irq(&pdev->dev, bbnsm->irq,
> bbnsm_rtc_irq_handler,
> > +			IRQF_SHARED, "rtc alarm", &pdev->dev);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "failed to request irq %d: %d\n",
> > +			bbnsm->irq, ret);
> > +		return ret;
> > +	}
> > +
> > +	bbnsm->rtc->ops =3D &bbnsm_rtc_ops;
> > +	bbnsm->rtc->range_max =3D U32_MAX;
> > +
> > +	return devm_rtc_register_device(bbnsm->rtc);
> > +}
> > +
> > +static const struct of_device_id bbnsm_dt_ids[] =3D {
> > +	{ .compatible =3D "nxp,bbnsm-rtc", },
> > +	{ /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(of, bbnsm_dt_ids);
> > +
> > +static struct platform_driver bbnsm_rtc_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "bbnsm_rtc",
> > +		.of_match_table =3D bbnsm_dt_ids,
> > +	},
> > +	.probe =3D bbnsm_rtc_probe,
> > +};
> > +module_platform_driver(bbnsm_rtc_driver);
> > +
> > +MODULE_AUTHOR("Jacky Bai <ping.bai@nxp.com>");
> > +MODULE_DESCRIPTION("NXP BBNSM RTC Driver");
> MODULE_LICENSE("GPL");
> > --
> > 2.37.1
> >
>=20
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl=
in
> .com%2F&data=3D05%7C01%7Cping.bai%40nxp.com%7C2a4980d832274ceac4
> e908dae8c4ec12%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6
> 38078229719156877%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM
> DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%
> 7C&sdata=3DnfDGoPytTNjULmOzC8IMF8r%2FrHiNJehsEls6m3lPsGc%3D&reser
> ved=3D0
