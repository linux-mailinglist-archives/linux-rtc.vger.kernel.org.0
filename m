Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5B66B0384
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Mar 2023 10:58:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbjCHJ6K (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 8 Mar 2023 04:58:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbjCHJ6H (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 8 Mar 2023 04:58:07 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E8EB1A4B2;
        Wed,  8 Mar 2023 01:58:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJvuQMvBFOqxKR/ytr5oCr/wFv36RpTzukXrGlcb2Srtjc5zmgGQk3e8CyQgeglgN/6VkZ6S7QaWw86Ykaq/GP76D66FW3Ojn8lgCDP5x/7l50VKiERWc9LydBg3d0nf41Obs0i+HiRBqeZExY6VOsf499BnszssCak26NrilaCUpWJJCNo0M3wHBqQothwYkuAtXlpKnpws9mjMRqvPJkgIgxevKZcbQmAaxnGi9lLVVHAqIu3+gKO790au9voustr2CLJkYpRkLTUMCcXEVo7XCHnuTMTfyDBhzs6i8sRxWmf+8Os3KZqwRIAuDsLyAq+GDW3EhQbknHKckJtpJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmx94k0I7sPgZGTq6ov4mKL2CZXwWfe1RrlZizsbXCw=;
 b=JWhGlCKhenDqX9SQ+mCCVML0wXTVx/JAPnEy0IH6CQjk8G8/+eKHVLnIyXGyXc81A3sQj7xnGynALsaFeGkoqOZSHrrUczVLYJG3eCu6/Wf0yddE2rUk7b+U+ZEzvPi/bymIaKhE3f07WmxyPCNgeYAbVG6LIBKUTzZTnl8vH7zW79d2bzNVE2PU2XhPkG09CAK73mXhkLbboXmmvmwFkpoU4fXS3bB+m1A6tGSkp5zP9inEjg1Ih7G9XrhNzoiU3J9scNzQy3KU1+e5ZmfSNE/5/OVbuESgHzA+WjN6ogRP0bzoKxPeI5drnn7MiGp7VCZ7Q/dM+mpgLoo6jGb+Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmx94k0I7sPgZGTq6ov4mKL2CZXwWfe1RrlZizsbXCw=;
 b=PDWtaNbSrj0o+9kIqQ41MnlVmDGM22M+gRjkOOZapBH957g/xzxuriFpwi00LzuGCyAh7SxKLvgNsgHR+KYM56fg12lBhJDOolPpYhRLRH8wkL99ytCdcsVQ3jXkG6cMqqWQORjRQlxg60bg67IKOgK0a96DSmJCMJhKklDRFdo=
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com (2603:10a6:20b:43d::18)
 by AS8PR04MB7703.eurprd04.prod.outlook.com (2603:10a6:20b:23c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 09:58:00 +0000
Received: from AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::c140:8a2:4de9:f1af]) by AM9PR04MB8650.eurprd04.prod.outlook.com
 ([fe80::c140:8a2:4de9:f1af%9]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 09:58:00 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     "lee@kernel.org" <lee@kernel.org>,
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
Subject: RE: [PATCH v5 3/3] arm64: dts: imx93: Add the bbnsm dts node
Thread-Topic: [PATCH v5 3/3] arm64: dts: imx93: Add the bbnsm dts node
Thread-Index: AQHZQObSR8qQQ94gik2ebpDfjiixYK7wxuaQ
Date:   Wed, 8 Mar 2023 09:58:00 +0000
Message-ID: <AM9PR04MB8650E01C4772DF3D48A3564587B49@AM9PR04MB8650.eurprd04.prod.outlook.com>
References: <20230215024117.3357341-1-ping.bai@nxp.com>
 <20230215024117.3357341-4-ping.bai@nxp.com>
In-Reply-To: <20230215024117.3357341-4-ping.bai@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8650:EE_|AS8PR04MB7703:EE_
x-ms-office365-filtering-correlation-id: a1cce56c-1087-4cd0-240c-08db1fbb99fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Xc+iM4AqhV4IC7CdYHMWwJ+zhQGLufLhrih906DcDuADwjshmY7PMUq5Dm18mcQ3WvAwFuqo4SsMSS2PjiRo/lshcDZc+erN0yIcqTZuqdERCVVIdReagP0KB6pr+6F0H32MQhXx+6ltP9Yc3UTsMZOtB2P4pAs2zq7x5COjxKhhPgHz3M4iiiYWUrazK+alDLK/i3eQ/Lz/5zi2GjT726dHdu8cqCh2t6NqjII7a9mR/LWDgMYKn1A1iyfITyIE8sfdImHDK3EkrMDZjqtPMM6yBlQOGwqVyELWYPFZhJq8GAqV3M123FkTWTCuCxjBG92z7BijaZPwQjCcH8jkLLYw5lQ1R9E4JknTrtWJzMlgLbGwwCQzqLd6xIO4/FyqwScxuF9Ftjb2tFk0mVY1rIUxZGHp9PnaYXjEyglh4ot0BVhFmNRQdEjiQ0wUWud8zQbh6iMU/2DujqkAuxApYZQGr8GmsYkw4oSMTiK549XFsx7+KGLkNCXreTGdNIVQI2NqvcOU/CAXkwfb0ikgai2yZiKW5HZ1+nMTUGcVCzSINlRMZUt77XU3xBUgym4v2ErFsOwI361t60hXpspCekjwoNtCtwRyIMpFWgYAbF0Zc7fYpcD2rJxLIJPxVKwVpjOPTA3xD++3gxYOmMoLKOm3eP7VtjsUiyULyc7tdrCU8hvZalOUB3aY2017lHNfjS1tGym9gp/Gcyr5pvaVQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(84040400005)(451199018)(38100700002)(33656002)(122000001)(86362001)(66446008)(8676002)(38070700005)(66946007)(8936002)(2906002)(7416002)(5660300002)(41300700001)(4326008)(64756008)(66476007)(66556008)(76116006)(52536014)(9686003)(186003)(26005)(83380400001)(316002)(55016003)(478600001)(54906003)(110136005)(6506007)(7696005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hiRzbal4lTxME10cQ+aZ5GzuX+F9kC3WervjBeIG9lpDnaVNyy/dQvwrSVgV?=
 =?us-ascii?Q?WHs6Bfgf33vjO9xS1jPlJVXgeLWnHDGyspG+YO4E5aWBgboVZ0ZAnbVhuJLT?=
 =?us-ascii?Q?hBK+D1yRd+8v4qZsOz6j61fXh8fZWy6W0PbewjAXKTiVPUtWnrLsLmI58Xoy?=
 =?us-ascii?Q?sJaqxBl6jAeGxHRy60ziCzVrr2CyUsSSTFc/TN8J3DHJRYx4wvet/CQ1G5EL?=
 =?us-ascii?Q?mk3d2LGDpv6oKU9vMElnRy7SsaqoSKuIP45zwRNgPUaaGxn7LDhnbzhZ4OJn?=
 =?us-ascii?Q?050XsFgInggeYH4VCt1eN23/vLw1D5XF2aTK1i/Z7PHbvtbLcWfUXsWb/3gl?=
 =?us-ascii?Q?WtsNiEdN88PtwCRUjYdlgXAMqiSt0s6/7Duv5EPEchzwPG+zZtFY8WPGt14s?=
 =?us-ascii?Q?0BsFSNko+EuZptVPng4aImrPoMpuJa6sMsxSEw/77kmMh0+SI9vOX2D2lEq5?=
 =?us-ascii?Q?a5Nxqvdsos/0Ugxueveis285W0RSMQplos2M98oFyO1UkwmGd7uHc1FMwKf9?=
 =?us-ascii?Q?X7fuq7gUy+4W4TtLXjEb4D+716Rf2WpjMpW8TV1phPy8wagE01CRLg3mVP3X?=
 =?us-ascii?Q?uYc4yC8su6e4YCR3kwYsGRa9qO6fNnnMfuQ/EcwrZVctNV59Bt4vjfelcl4U?=
 =?us-ascii?Q?+uImIfjdVwDCsFaDvWWT3r2mX7GIhiTk2Zgp446tv4VuP/K3NluUSwCxhJR2?=
 =?us-ascii?Q?KHDnhw8XIJDhgXhNbkd1lhB6U4MEZp6nj73+p3iKdqXudgniRdR8P7eVbTAL?=
 =?us-ascii?Q?e8B8CjcRkzAe04SJh2eMhdefucSwgdOEq/a84bL2nE0UDE9dPeEiV3QkrXS0?=
 =?us-ascii?Q?jpT2iBR5+9r+D2ZuD8X41lke/dKAP79xdhVxCeGWKrMQTSUYe2N7Bn9mj1A9?=
 =?us-ascii?Q?ZqBO3n+QWZkVp3TqytpiUAhqV+BNNG662Ya7OYkcQQSWDUfQPMe4AZX+QDhw?=
 =?us-ascii?Q?pZ5SJe+arq7pAbaTYq6MYowBjyZyYcoRVRNdaK209lPWnZxP0qF5WJ8TxKJn?=
 =?us-ascii?Q?SPswq8jIJulMjJ6kC0fhVpyBljNvf2Jouw18SXE59qbN9UINXD3Q1ANcVQrO?=
 =?us-ascii?Q?vFB+fGHuOO/2nWA2RiRLdfuxFXQlS07NlJDKAT21tz+71jGHBgVMBpJf14Pn?=
 =?us-ascii?Q?Ek16Gh3X45tOBd5KHar1elf412wDWETDWZShJ0+wOLe8shj7S93c6RZpv/CI?=
 =?us-ascii?Q?sA5VJvGbrbUxvm2LNp+MMUDLNFZNyyb1MZLgJ2HYicptSFBlkkiRBQ7Ymz04?=
 =?us-ascii?Q?LePmaeLqthcM6WnXrjTs1smM0VfqxbX1UQhXtMgblc7U6qqfEzCQyEUQCf6T?=
 =?us-ascii?Q?+zaUU9ba5N4wOep3YYm+Lq4P0PW29MFXBcQ/5mBeQcHRpBZ+5QZ5QUHs7Nfb?=
 =?us-ascii?Q?6iY/QxtoBzWnflnky+oW8/pA22NmMTsRUXKczJpJG+jaNjn3WAMQvDimkzC7?=
 =?us-ascii?Q?QQZNMEsLasAe0Yi45QWDxTO30DgHGZRCW/qlGAzXolrBpK4ja5PStF9TuyTB?=
 =?us-ascii?Q?opzlvJlCgd7477THju6WPf3nSaq6s7nJT83bUrWHIpKXHNDWbJLNWHS8HKQ6?=
 =?us-ascii?Q?4CTyZE4WWwX1CAYL1P4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1cce56c-1087-4cd0-240c-08db1fbb99fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 09:58:00.5397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JqNxIWdc3BI+5sLp+zrjwN7CooC/J1ptMNM9aq49T0vLjupqfCmlzbE/he9JQWqe9FMvVpvynFJtrt9nJAleNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7703
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Shawn,

Can you help pick this patch?

BR
> Subject: [PATCH v5 3/3] arm64: dts: imx93: Add the bbnsm dts node
>=20
> Add the bbnsm node for RTC & ON/OFF button support
>=20
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>   - v5 changes: no
>=20
>   - v4 changes:
>     - update the compatible string to align with binding file
>=20
>   - v3 changes:
>     - remove 'nxp,bbnsm-regmap' property to align with binding doc
>=20
>   - v2 changes:
>     - update the regmap property to align with binding doc
> ---
>  arch/arm64/boot/dts/freescale/imx93.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi
> b/arch/arm64/boot/dts/freescale/imx93.dtsi
> index 2076f9c9983a..e772c136e895 100644
> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -243,6 +243,22 @@ iomuxc: pinctrl@443c0000 {
>  				status =3D "okay";
>  			};
>=20
> +			bbnsm: bbnsm@44440000 {
> +				compatible =3D "nxp,imx93-bbnsm", "syscon", "simple-mfd";
> +				reg =3D <0x44440000 0x10000>;
> +
> +				bbnsm_rtc: rtc {
> +					compatible =3D "nxp,imx93-bbnsm-rtc";
> +					interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +				};
> +
> +				bbnsm_pwrkey: pwrkey {
> +					compatible =3D "nxp,imx93-bbnsm-pwrkey";
> +					interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +					linux,code =3D <KEY_POWER>;
> +				};
> +			};
> +
>  			clk: clock-controller@44450000 {
>  				compatible =3D "fsl,imx93-ccm";
>  				reg =3D <0x44450000 0x10000>;
> --
> 2.34.1

