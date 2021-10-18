Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C98254313DE
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Oct 2021 11:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhJRJ5Y (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Oct 2021 05:57:24 -0400
Received: from mail-mw2nam12on2086.outbound.protection.outlook.com ([40.107.244.86]:58977
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229610AbhJRJ5V (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 18 Oct 2021 05:57:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oo5npD5C/Ely/lEqfduGHAi5tK/spGpe1TuQNQFrOcjtsw78uvFc5OF6vuh2zuddUFC0UzIgDTNZdBo9D2tFxj2+VliWd0fOCc6z/vpv8mT2pPT4TzyutFuN/sZAf7FT625dH5zHI9pHwur5Zb9YBhMQI+KzEQ7RmtTJ9cnI3qDBF9kUsqdqNqnUFhJ+v2aJLXzF5XxicFKp03TRU3foh61p6oiuDyJTDofPjRImLE6GJYuF+VUob8dOvbNEzFzU04jBe9VPryhsvGGIxAAidzA668CpA56KKoVDC3pJ+g8pOWi076XJ2AbgPBMLYUk+A7uolGvA0CR41aJucEEPZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhrJ+TGUb4ZnFqYEvtyNT7XWhoqT1XYBBuQmJknjtxc=;
 b=Zl/R0pjaXYaE6zdDhwzmzkJz3e0tdX4bW6sqUlqj4Oql2IlTR6lKAfMaS4tm4Cr8+xkgmK8J97Gvt/G+ZgeD19aOJYkdIHBWd2NggK5ZAfpiAPHf1h7eb6ZRlQ1u5awq9TydcfM3em6oIxOjzpbVTj9ESJQxwaC3aND0RcBJaz04GqMXW3pjiiui4YTeSx1QiOp0/Us6HK5bGyh/am8cZG7B2p3T6saPSDDG+Xgl4xje+1pXWhBuxc5lePBxgRKaIBv3pgpfpQBL6XJO9Gy0ZtYfO0A11PqZ148hWFiIYO/RJgqbKiqo7qQMBsTxKWB8kL1AwlTB6ls3BlvXevsVOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhrJ+TGUb4ZnFqYEvtyNT7XWhoqT1XYBBuQmJknjtxc=;
 b=CVp+oJLKrP/w1fwHbfgtpD+hJSIbIwaa525jugPcWO5Oz3p/mfkzk4FlgxkRJZo23LqXWasvETHwRvgou76qwrBFC0Eh4/Ttrb48w3/ioiPic/uXkIERLEklo+/XooXAdwLHTx33SKvg+hOo8hOTEXedB70+huv/hDg0KatDQms=
Received: from DM6PR02MB5386.namprd02.prod.outlook.com (2603:10b6:5:75::25) by
 DM6PR02MB4315.namprd02.prod.outlook.com (2603:10b6:5:1e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18; Mon, 18 Oct 2021 09:55:08 +0000
Received: from DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::e985:a4fa:7955:d224]) by DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::e985:a4fa:7955:d224%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 09:55:08 +0000
From:   Srinivas Neeli <sneeli@xilinx.com>
To:     Srinivas Neeli <sneeli@xilinx.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        Michal Simek <michals@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>
Subject: RE: [PATCH V2] rtc: zynqmp: Add calibration set and get support
Thread-Topic: [PATCH V2] rtc: zynqmp: Add calibration set and get support
Thread-Index: AQHXs2pV7yt8MZeB4E2jSXKL5oOgSavYpA5g
Date:   Mon, 18 Oct 2021 09:55:08 +0000
Message-ID: <DM6PR02MB5386B1903AD7EB5B34B0DF5CAFBC9@DM6PR02MB5386.namprd02.prod.outlook.com>
References: <20210927063837.38478-1-srinivas.neeli@xilinx.com>
In-Reply-To: <20210927063837.38478-1-srinivas.neeli@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09787b76-f296-4543-6af7-08d9921d5e90
x-ms-traffictypediagnostic: DM6PR02MB4315:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB4315D4D969107C38CF644AA2AFBC9@DM6PR02MB4315.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Op8aaf2jwQ4kYuOLCuUVRCu/wDWdVXjlOWswdLSgOio06Id2ruVmQV+joPxwliAo/vSr9rwvlTvQdFeXeN4kZunCwREkmWs3aJ0H8x7gjD6J95c0U8143UTmWD46LQuJiINpwO4KLXL1WZviJSPEx9U59iCZYZIrDHDXdYGnI4D9JLWwAu1JDRNo45HrWKDICAReIv5l5QCGkuJFmIm6DkFJak9AZHHW3khHoLqc2ShVPwfAweSqXNiVMfXZlPwYfcltbEsc2g8zVfOg5+TSjNW6PGYgwzlQ0irxiOvvSbWvQxjF1rRNVNwun2TmMkpobL8c63bxiGgPeXCavGszsSxdGguFHJQf3JGVdFHsFLWXes+5qbCHrWaMv/65+RMk5/cFqW1+GN0qlyOEo6tNro3C8ZhT94vbiJtV2OYmx1EH+Zw9JtOgDMrGEWc4EUKrSVxivuMfDocHM08Mnl8O135ld/yrCZH1nQFAMe8RilNC+/jPuURxycdFOJMjXyLJ5nt7S/RYjMX63AHZZREmlcDimCVn7bt1vr5ArGwoK2Pg7AQwRzdlrCncIQ484GU3KfthK1bOyAhwSizM/IS6XaFyW0iY7fr78OACbPKP8D+kth+yVSr+AfI8ZgstScd2zk2D7O+iTSP4Cf+6awH5WlbRDz+Dbo0dIEsOgwE9TlT/d8MFu2HK+78C+XEUeQVlRLeXds/d2VLE5U49i93TRw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB5386.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(122000001)(83380400001)(107886003)(9686003)(33656002)(186003)(38100700002)(6636002)(508600001)(55016002)(66476007)(55236004)(26005)(71200400001)(8936002)(6506007)(7696005)(8676002)(53546011)(5660300002)(110136005)(38070700005)(2906002)(54906003)(66946007)(86362001)(52536014)(64756008)(66446008)(76116006)(66556008)(316002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OmjRm+IpAO1KJ2JF3PgBvQnQaHpiEWO8bnRBce/Ry0IGcIYvvvux7dHMvq5v?=
 =?us-ascii?Q?L71MXedSeHtchSxB84nx+s3ASzo8oPRFKcQEpyhJ/O9BaPDvIEJSTwl0aIG4?=
 =?us-ascii?Q?zaZgEN3JkmdT9z2w/gM6ds91TOtoczn4gCPFGd5HI8bP5KoYwDSTfUY02+H4?=
 =?us-ascii?Q?EQPH5B3MJCh19+tE4jYYkkmkmaG7oH8G6bLaabqtqXbLKK8hG97e3nPIL+8A?=
 =?us-ascii?Q?6FKBW+0XxJbbK6YIv4yDhLO5GxvjKtYsagAiwaVTQn9l3rZAd041gSnSiiLd?=
 =?us-ascii?Q?qPrdp/RY8PhEjiL/Yy5GOZ/WxB+rc3aH6MGTLU27xnFgtYTsWy46umhVdUB1?=
 =?us-ascii?Q?rHF2eX38veogt+HciiS69gZiD+GL+jMaavm+tAHAyWIUEu6Rdn5qxXl32Wbq?=
 =?us-ascii?Q?YMnPI1GJsJqySqjA5LnJ/DilmuKc2xHjE37+fyG6ptTd4kx761L05Xm+ckoz?=
 =?us-ascii?Q?Yhn/aQdyBNdTKpzLuTuMRaxPRlGfysv5SvEtRDcWhyGebVy7ztoEUlP5t8YY?=
 =?us-ascii?Q?AK2AEt7x9H7Dylq2F+j1CgIvrfQQ2WzmMcfHcbCLVdqockPAL7DGMZLpiSIp?=
 =?us-ascii?Q?FGpcttqrlCFc+ojlZvkN2ail/0UUKgkXrqGeuM4rDdvy/2i8ztGvSwvXcv2D?=
 =?us-ascii?Q?Jp7mcZgskXUkslCF+mMiA7YlefRb1SrXnLL096gvWwbIKHyw+c1jClTZzfBr?=
 =?us-ascii?Q?kIbDtPqw0HRk+3vZGITMqK8n9iGhTJbipauVIgZ/XioDftPPQrP6JvOHwhqX?=
 =?us-ascii?Q?3vyT7MSwAsf4KSvmT2ESsj8R6zIh5mdMVu1ifM3/vh1C1KEUphaaI/m04+AZ?=
 =?us-ascii?Q?sQmryPovHCsBtczoJvFgMlnopp8qGUHm6mNli94UyU4gtXYrtXNfMhgx1otf?=
 =?us-ascii?Q?3P1TQ2P9Ee4aWgQ0SN1dsj0FrvYZI9Xng84tGl3PJ25SdxiWqapCrGz2B572?=
 =?us-ascii?Q?xI1dbPo5A6zX99Ni5FvIEVrs+Zfu822pYp/gR0O+Rk0FEycJgtEX+6B5T0mu?=
 =?us-ascii?Q?TFIq6PexVne+/Jnz62O/ifaZIxVeUCfWn4t3vZffqJ1viLsk/omviO+v8hWL?=
 =?us-ascii?Q?O34FR+Toq9sLcE7Bej0wb4Ib/pi8Xlzy19F4LhmOrAgFcdEqPCO+ype9ZUbF?=
 =?us-ascii?Q?tziI37WlTOrB//Le9hfT8SdqKwdXNyyQFRugZyLtw9ZxOVfLkMqzLP/4YO7S?=
 =?us-ascii?Q?vKpbDLiXW1dS3o8fM9t14RHn2KRaVB6HLD2LrnYkb6+tllJK4lf5NiDvxPiD?=
 =?us-ascii?Q?aCwEbncS41R9fffsddd63O56J4x0CwreBQIFl4FPbYRuVr2jDOwL28C1BLP8?=
 =?us-ascii?Q?7WnzcGx4U7IFpEnulVlErAzE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB5386.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09787b76-f296-4543-6af7-08d9921d5e90
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2021 09:55:08.7455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PSY7ZURPxPyAjg3rLYCucwbP0QxtFNJIFld2YiiYsmQhVdgKinPARWZ6nHAH6ZcR3Ov7MPLRaWZR1uclec3lrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4315
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> -----Original Message-----
> From: Srinivas Neeli <srinivas.neeli@xilinx.com>
> Sent: Monday, September 27, 2021 12:09 PM
> To: a.zummo@towertech.it; alexandre.belloni@bootlin.com; Michal Simek
> <michals@xilinx.com>; Srinivas Goud <sgoud@xilinx.com>; Shubhrajyoti
> Datta <shubhraj@xilinx.com>
> Cc: linux-rtc@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linu=
x-
> kernel@vger.kernel.org; git <git@xilinx.com>; Srinivas Neeli
> <sneeli@xilinx.com>
> Subject: [PATCH V2] rtc: zynqmp: Add calibration set and get support
>=20
> Zynqmp RTC controller has a calibration feature to compensate time
> deviation due to input clock inaccuracy.
> Set and get calibration API's are used for setting and getting calibratio=
n value
> from the controller calibration register.
>=20
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
> Changes in V2:
> -Removed unused macro.
> -Updated code with review comments.
> ---
>  drivers/rtc/rtc-zynqmp.c | 100 ++++++++++++++++++++++++++++++++----
> ---

Hi alexandre,
Could you please comment on this patch.

Thanks
Srinivas Neeli


>  1 file changed, 83 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c index
> f440bb52be92..3731ddfbd90f 100644
> --- a/drivers/rtc/rtc-zynqmp.c
> +++ b/drivers/rtc/rtc-zynqmp.c
> @@ -36,10 +36,15 @@
>  #define RTC_OSC_EN		BIT(24)
>  #define RTC_BATT_EN		BIT(31)
>=20
> -#define RTC_CALIB_DEF		0x198233
> +#define RTC_CALIB_DEF		0x8000
>  #define RTC_CALIB_MASK		0x1FFFFF
>  #define RTC_ALRM_MASK          BIT(1)
>  #define RTC_MSEC               1000
> +#define RTC_FR_MASK		0xF0000
> +#define RTC_FR_MAX_TICKS	16
> +#define RTC_OFFSET_MAX		150000
> +#define RTC_OFFSET_MIN		-150000
> +#define RTC_PPB			1000000000LL
>=20
>  struct xlnx_rtc_dev {
>  	struct rtc_device	*rtc;
> @@ -61,13 +66,6 @@ static int xlnx_rtc_set_time(struct device *dev, struc=
t
> rtc_time *tm)
>  	 */
>  	new_time =3D rtc_tm_to_time64(tm) + 1;
>=20
> -	/*
> -	 * Writing into calibration register will clear the Tick Counter and
> -	 * force the next second to be signaled exactly in 1 second period
> -	 */
> -	xrtcdev->calibval &=3D RTC_CALIB_MASK;
> -	writel(xrtcdev->calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
> -
>  	writel(new_time, xrtcdev->reg_base + RTC_SET_TM_WR);
>=20
>  	/*
> @@ -174,14 +172,76 @@ static void xlnx_init_rtc(struct xlnx_rtc_dev
> *xrtcdev)
>  	rtc_ctrl |=3D RTC_BATT_EN;
>  	writel(rtc_ctrl, xrtcdev->reg_base + RTC_CTRL);
>=20
> -	/*
> -	 * Based on crystal freq of 33.330 KHz
> -	 * set the seconds counter and enable, set fractions counter
> -	 * to default value suggested as per design spec
> -	 * to correct RTC delay in frequency over period of time.
> +	/* Update calibvalue */
> +	xrtcdev->calibval =3D readl(xrtcdev->reg_base + RTC_CALIB_RD); }
> +
> +static int xlnx_rtc_read_offset(struct device *dev, long *offset) {
> +	struct xlnx_rtc_dev *xrtcdev =3D dev_get_drvdata(dev);
> +	long offset_val =3D 0;
> +	unsigned int tick_mult =3D RTC_PPB / (xrtcdev->calibval &
> +RTC_TICK_MASK);
> +
> +	/* Offset with seconds ticks */
> +	offset_val =3D xrtcdev->calibval & RTC_TICK_MASK;
> +	offset_val =3D offset_val - RTC_CALIB_DEF;
> +	offset_val =3D offset_val * tick_mult;
> +
> +	/* Offset with fractional ticks */
> +	if (xrtcdev->calibval & RTC_FR_EN)
> +		offset_val +=3D ((xrtcdev->calibval & RTC_FR_MASK) >>
> RTC_FR_DATSHIFT)
> +			* (tick_mult / RTC_FR_MAX_TICKS);
> +	*offset =3D offset_val;
> +
> +	return 0;
> +}
> +
> +static int xlnx_rtc_set_offset(struct device *dev, long offset) {
> +	struct xlnx_rtc_dev *xrtcdev =3D dev_get_drvdata(dev);
> +	short int  max_tick;
> +	unsigned char fract_tick =3D 0;
> +	unsigned int calibval;
> +	int fract_offset;
> +	unsigned int tick_mult =3D RTC_PPB / (xrtcdev->calibval &
> +RTC_TICK_MASK);
> +
> +	/* Make sure offset value is within supported range */
> +	if (offset < RTC_OFFSET_MIN || offset > RTC_OFFSET_MAX)
> +		return -ERANGE;
> +
> +	/* Number ticks for given offset */
> +	max_tick =3D div_s64_rem(offset, tick_mult, &fract_offset);
> +
> +	/* Number fractional ticks for given offset */
> +	if (fract_offset) {
> +		if (fract_offset < 0) {
> +			fract_offset =3D fract_offset + tick_mult;
> +			max_tick--;
> +		}
> +		if (fract_offset > (tick_mult / RTC_FR_MAX_TICKS)) {
> +			for (fract_tick =3D 1; fract_tick < 16; fract_tick++) {
> +				if (fract_offset <=3D
> +				    (fract_tick *
> +				     (tick_mult / RTC_FR_MAX_TICKS)))
> +					break;
> +			}
> +		}
> +	}
> +
> +	/* Zynqmp RTC uses second and fractional tick
> +	 * counters for compensation
>  	 */
> -	xrtcdev->calibval &=3D RTC_CALIB_MASK;
> -	writel(xrtcdev->calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
> +	calibval =3D max_tick + RTC_CALIB_DEF;
> +
> +	if (fract_tick)
> +		calibval |=3D RTC_FR_EN;
> +
> +	calibval |=3D (fract_tick << RTC_FR_DATSHIFT);
> +
> +	writel(calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
> +	xrtcdev->calibval =3D calibval;
> +
> +	return 0;
>  }
>=20
>  static const struct rtc_class_ops xlnx_rtc_ops =3D { @@ -190,6 +250,8 @@
> static const struct rtc_class_ops xlnx_rtc_ops =3D {
>  	.read_alarm	  =3D xlnx_rtc_read_alarm,
>  	.set_alarm	  =3D xlnx_rtc_set_alarm,
>  	.alarm_irq_enable =3D xlnx_rtc_alarm_irq_enable,
> +	.read_offset	  =3D xlnx_rtc_read_offset,
> +	.set_offset	  =3D xlnx_rtc_set_offset,
>  };
>=20
>  static irqreturn_t xlnx_rtc_interrupt(int irq, void *id) @@ -215,6 +277,=
7 @@
> static int xlnx_rtc_probe(struct platform_device *pdev)  {
>  	struct xlnx_rtc_dev *xrtcdev;
>  	int ret;
> +	unsigned int calibval;
>=20
>  	xrtcdev =3D devm_kzalloc(&pdev->dev, sizeof(*xrtcdev),
> GFP_KERNEL);
>  	if (!xrtcdev)
> @@ -256,9 +319,12 @@ static int xlnx_rtc_probe(struct platform_device
> *pdev)
>  	}
>=20
>  	ret =3D of_property_read_u32(pdev->dev.of_node, "calibration",
> -				   &xrtcdev->calibval);
> +				   &calibval);
>  	if (ret)
> -		xrtcdev->calibval =3D RTC_CALIB_DEF;
> +		calibval =3D RTC_CALIB_DEF;
> +	ret =3D readl(xrtcdev->reg_base + RTC_CALIB_RD);
> +	if (!ret)
> +		writel(calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
>=20
>  	xlnx_init_rtc(xrtcdev);
>=20
> --
> 2.17.1

