Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE7943E4395
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Aug 2021 12:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234804AbhHIKF5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 Aug 2021 06:05:57 -0400
Received: from mail-bn8nam11on2069.outbound.protection.outlook.com ([40.107.236.69]:5600
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234800AbhHIKF5 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 9 Aug 2021 06:05:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYws0lVhLxAeu8qkgiqdcpyQj8X9vnDJUkVgJ2h2WOTkj14h6nBcafZo/soki9aKEBz45YPkGZaJy/8MGHf8h6ZW9WDtVStTOClTyBt1eaLIOxtKtQtPGrBmttjBXFOIus6pw8k1zRsFiSJpQBdWC38ew7Rz4vGHzZDBGY55tcQErtUGPJMa3FVYo5i1/DbOtC/q7lZOGDqwfyVx8hBwC735MO0jhdmB3ATrYB+jjeXLgSWs4HQztx0EyZgNKeQIt/LPWSgZSRwf087dhKE6e2hFLhxhCzzv4DsyHGsRoYNIKS0c3/QG07oMUwYNJQD8fqGHoU/cTk+8iFnIpBOt5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiYGJr1aRtZjg1RPfb9AqelgaRpYuD3koeEbdkYKmhk=;
 b=MoFcs7A5Ot72EkioGB3dXjwYUi7XgE65ppccpPNVBYDXMJE9lXEq1aB4EWuH61IR+1ugUTWuQVpCvC7mLlBvn5AUTVy/UTL70FqTo+p47Od3lR6B/aUtM231wvItnMbdcywq8fMueM0m+HgA09JlJDNrI2Zd0mrAezaPLeA6kmdZyuvcVTm3ixHVIhPt8c/j7BetbxE7cnu/u5QIYIp3oV8+o+Qp6DUyMK+dknh6tb/OcCa+k/1PhC06QuO89qf7ABN9sgcc4frc2SCbaNPFa++5D+GAPmpXr0JFIWHq/0lxr+UKaZPaJ70yUbiPPL6ePaLjRTpksTx21COBnG0+vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiYGJr1aRtZjg1RPfb9AqelgaRpYuD3koeEbdkYKmhk=;
 b=KmMDOO1AZMxtr39nakwNCU3xWaYOtxi56PFBvAfyyr0MAsjZ3aRA1c9ERD95x8lS/kGwkzzGkvrDoRmaKFuHV0bsnh0j7y5+qrm+39yGCtYzYpXjE9gx8qhg2qFI8ZzP+5tPmWMYxID74EuPbp8fuoQtsjpX+NOgy6HplcHX/P4=
Received: from DM6PR02MB5386.namprd02.prod.outlook.com (2603:10b6:5:75::25) by
 DM6PR02MB5179.namprd02.prod.outlook.com (2603:10b6:5:44::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.21; Mon, 9 Aug 2021 10:05:33 +0000
Received: from DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::90fb:2d02:150c:cd10]) by DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::90fb:2d02:150c:cd10%6]) with mapi id 15.20.4394.023; Mon, 9 Aug 2021
 10:05:33 +0000
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
Subject: RE: [PATCH] rtc: zynqmp: Add calibration set and get support
Thread-Topic: [PATCH] rtc: zynqmp: Add calibration set and get support
Thread-Index: AQHXeIdtredUt0IFlkqy5cg9C3sl76trGtLg
Date:   Mon, 9 Aug 2021 10:05:33 +0000
Message-ID: <DM6PR02MB53863D113E167A4C789201EAAFF69@DM6PR02MB5386.namprd02.prod.outlook.com>
References: <20210714080809.34289-1-srinivas.neeli@xilinx.com>
In-Reply-To: <20210714080809.34289-1-srinivas.neeli@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8ccb898-8f64-4d0a-f09f-08d95b1d39d5
x-ms-traffictypediagnostic: DM6PR02MB5179:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB5179A702CB5EF1DA2F20C955AFF69@DM6PR02MB5179.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hlbv0MjM0gA5I2nD7/nO+BboXAgxjKKOjUFAMEk4t0hiA8dVGhW8GlllRpTk0eIO+miT2/Je0lKEndlTjKBPtr1w4WZLIH6+teNyY06UCDg1wJrsh1LiLPCRArNSV1x4Mu8Aqz49CApTfvOl15+4b10GgikRPIyCE/oKVj99cB2NjILT9x8Dx8jL/A8zKpLqUlySfoEqU8TVNYdle167xw/40AYBLXZD6Apwz7jqv//G9RGop5Uyc4D4glfyF5jPVv2N/svXPOaBaVb5IoOhrYpPijS7DscP6gX31IfpkhivJ6rGoI6DbR8o+MP589761bF4kEZJd8l0z1xiVlZs3181qW9ZrGpSjstEwot9g3BH16/zVZcg/s6Hmr4fSV18Ka11R0jBSJLCBvcC0bJSzdiT7jaW0sfwJSA9khG2Ua3/w5krgjyQaMdjOIov+BeNZgsjph2MMfeMciQ68H2W6EsJsZm2CMJwacyTv660cIMUEk1fBY5UwPdsUKW8mbrF6H6yxmNJqFPESc+5jE7FHvd97YVpKNg74KXE4uKy65IKTQIUCpdb45sXe3+k1ZRE7gNevhJnG9VmkE807+GZXtaoBw4F5qOt1/gqjL4OZ1B9rZ2e/dnMX4lGLM3hy7X8Naq33omk8vslTJ/C7YXwplQjiXR5SezweF5XD5WeSljtmFM1nZ2RuBwmbJrtc5ToiEHdBzC8Yo4yz35gQj5gXA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB5386.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(396003)(136003)(346002)(186003)(107886003)(2906002)(66946007)(8936002)(86362001)(6506007)(53546011)(33656002)(316002)(38070700005)(26005)(8676002)(71200400001)(66476007)(66556008)(64756008)(83380400001)(76116006)(7696005)(5660300002)(6636002)(66446008)(55016002)(9686003)(38100700002)(110136005)(52536014)(478600001)(54906003)(122000001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NsAgfmOnpcInqeIiOjIb1Hoe5HJ5vPMWxwcamuE6wMqWi/6hmPbeKo9jND6d?=
 =?us-ascii?Q?H6wAdvca1xU4b9rimMJ9emruWCAkMyQXlsFRXP30LhUhFl7RYNpX8D3sXTvj?=
 =?us-ascii?Q?NPwCikyHzHwG5FDvNXeVrKMBjO4TEMmLWCRRfy8JRQ2L+8PFZ5s09eo236rw?=
 =?us-ascii?Q?yktZ6Eocky0BPTHssL5bDiRm5RgYyMxlTVXmWpYrnkbbaXvSrJHb2jthD7Pw?=
 =?us-ascii?Q?SX2KF0stDaL/N11C44yHyHFCdDq6ruqBJqPd2Q2CVAN2zDMj3i2DGzIvRp+N?=
 =?us-ascii?Q?mKS7G1H6sETygGXETCmQQK5SfzPm2azhfljfjhQC3IGEfxoxmW9OPqrJMymg?=
 =?us-ascii?Q?eRu38DmMP7OUqKMKfn7kR3BGk/Isjoj1OHjEda0dBZLpajXuJkEGQ8QsdWXs?=
 =?us-ascii?Q?4bfPEMw5825I8aephrN33++G9KpZKQAsbKEEt9xkAWrmnd/qOGRH6AcEaZe5?=
 =?us-ascii?Q?elP2INowkhLUfUfdYkxiui0UyqCBkIhy9CxXXsASmwaVN6958wsN6gRk6M4t?=
 =?us-ascii?Q?Yi7jZBLk+sYUiy1k0G8G94ZZR0xxQmvOcVtF/0gUPF5uTGpvp2qTSah2jy8M?=
 =?us-ascii?Q?X6IkEbznl8Vf/XKGfpm01ag5RbqDfE4Vskw85s627mT/1+QeFd7yP+l4gJaq?=
 =?us-ascii?Q?fsG6+fgAjcbvpDhFigSDlnQ9McEEJoUZB2zKTL4fcBIRrHTcfWDGSKYz8ynb?=
 =?us-ascii?Q?zq3B2KVtiZlNw16cviC7YVaYU5FAu1HPXyFf2zchYrGWOKaMFdfas01vM1x7?=
 =?us-ascii?Q?J8w8+oI/yCCw3YZhuWeQbm7mrWjXcOrb+8YZQRgg5VO/uN3vDvLD26Tqdwoy?=
 =?us-ascii?Q?sp0KSiZh89A+gku7OpiHO8zkpSWiB4Q3OqjklT7P1zUV0tkTYB1qvHCIfkTh?=
 =?us-ascii?Q?GxNC07UlxpV9uGWaA2O7VVI/COXgkjXINfZP+zz4CT2RI3IeV8Nw9d3uawhX?=
 =?us-ascii?Q?+9Au4iwrscx7oUq0Ez+iu5h4x1GJO+5/Kg6wVan931/KJnxa4m9n1toM9pPH?=
 =?us-ascii?Q?y+HbXwMLiHDGsxv0gCcxSMXZdb0jeaWCn0MGdEs682wGtOnorgwl8ykZ5hAe?=
 =?us-ascii?Q?hS+ludwf0imh0mtUqbL7PqZPco++aqHYMNMmjhGrGMd7Vxoj8eMKseLvQd8E?=
 =?us-ascii?Q?gv1T1sk0BYnEwFqTGfHNDGYZokf75cNaPaNCWcfNUYJEKFbAQ/xcnHaV+n7a?=
 =?us-ascii?Q?zWXPjzblekfCN0Lael04YB33P13V4O3ZgZAhBS3ZK6PLjpMAGEkUbm/6WWLC?=
 =?us-ascii?Q?kvhlE4nxIFKpPAlEo8kPdSQW8Xe2Vu2pOr4vR31EwRdhtUUexgv3C5XvUdku?=
 =?us-ascii?Q?/x/IVY0PM4TJ2rm47YsmdcY1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB5386.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ccb898-8f64-4d0a-f09f-08d95b1d39d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2021 10:05:33.0957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +q+eUFQMjRsdiGgvWSBU8OQHWYfnzXImwLPILm7B2QDUQkxFqLLm01AJptzVLilv/MHEvZyN/Q5G5eoaeKn/ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5179
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

Is this patch fine?

Thanks
Srinivas Neeli

> -----Original Message-----
> From: Srinivas Neeli <srinivas.neeli@xilinx.com>
> Sent: Wednesday, July 14, 2021 1:38 PM
> To: a.zummo@towertech.it; alexandre.belloni@bootlin.com; Michal Simek
> <michals@xilinx.com>; Srinivas Goud <sgoud@xilinx.com>; Shubhrajyoti
> Datta <shubhraj@xilinx.com>
> Cc: linux-rtc@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linu=
x-
> kernel@vger.kernel.org; git <git@xilinx.com>; Srinivas Neeli
> <sneeli@xilinx.com>
> Subject: [PATCH] rtc: zynqmp: Add calibration set and get support
>=20
> Zynqmp RTC controller has a calibration feature to compensate time
> deviation due to input clock inaccuracy.
> Set and get calibration API's are used for setting and getting calibratio=
n value
> from the controller calibration register.
>=20
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
>  drivers/rtc/rtc-zynqmp.c | 101 ++++++++++++++++++++++++++++++++----
> ---
>  1 file changed, 84 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c index
> f440bb52be92..718f60d42760 100644
> --- a/drivers/rtc/rtc-zynqmp.c
> +++ b/drivers/rtc/rtc-zynqmp.c
> @@ -36,10 +36,16 @@
>  #define RTC_OSC_EN		BIT(24)
>  #define RTC_BATT_EN		BIT(31)
>=20
> -#define RTC_CALIB_DEF		0x198233
> +#define RTC_CALIB_DEF		0x8000
>  #define RTC_CALIB_MASK		0x1FFFFF
>  #define RTC_ALRM_MASK          BIT(1)
>  #define RTC_MSEC               1000
> +#define RTC_FR_MASK		0xF0000
> +#define RTC_SEC_MAX_VAL		0xFFFFFFFF
> +#define RTC_FR_MAX_TICKS	16
> +#define RTC_OFFSET_MAX		150000
> +#define RTC_OFFSET_MIN		-150000
> +#define RTC_PPB			1000000000LL
>=20
>  struct xlnx_rtc_dev {
>  	struct rtc_device	*rtc;
> @@ -61,13 +67,6 @@ static int xlnx_rtc_set_time(struct device *dev, struc=
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
> @@ -174,14 +173,76 @@ static void xlnx_init_rtc(struct xlnx_rtc_dev
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
>  static const struct rtc_class_ops xlnx_rtc_ops =3D { @@ -190,6 +251,8 @@
> static const struct rtc_class_ops xlnx_rtc_ops =3D {
>  	.read_alarm	  =3D xlnx_rtc_read_alarm,
>  	.set_alarm	  =3D xlnx_rtc_set_alarm,
>  	.alarm_irq_enable =3D xlnx_rtc_alarm_irq_enable,
> +	.read_offset	  =3D xlnx_rtc_read_offset,
> +	.set_offset	  =3D xlnx_rtc_set_offset,
>  };
>=20
>  static irqreturn_t xlnx_rtc_interrupt(int irq, void *id) @@ -215,6 +278,=
7 @@
> static int xlnx_rtc_probe(struct platform_device *pdev)  {
>  	struct xlnx_rtc_dev *xrtcdev;
>  	int ret;
> +	unsigned int calibval;
>=20
>  	xrtcdev =3D devm_kzalloc(&pdev->dev, sizeof(*xrtcdev),
> GFP_KERNEL);
>  	if (!xrtcdev)
> @@ -256,9 +320,12 @@ static int xlnx_rtc_probe(struct platform_device
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
> 2.31.1

