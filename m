Return-Path: <linux-rtc+bounces-1215-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E0F8D2106
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2024 18:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 047F21F25116
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2024 16:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F9D172763;
	Tue, 28 May 2024 16:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Vol0P5Cc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2089.outbound.protection.outlook.com [40.107.6.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ABF2561D;
	Tue, 28 May 2024 16:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716912107; cv=fail; b=Dk4MggBfq+yxIj3y8nW2uJr+1IVy4pc0QFGzy68CVLsepnDZMtqJf25OKNx7KZ2Cl+cNp9ckf/Ot3vxpnEY7zt/hI9ixMc2GFNMhEv/sRBf+Xe/MW1l8V4bq3PD6lQeGRP7IQhKmYrlbPR5iRkqnU/z35bIPm0T2DPSmK+vgKzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716912107; c=relaxed/simple;
	bh=bxzsL22r3fPQLXcwWMDm5NZ4PuE7AcupE1uceo7R2kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ksyN6++0VvvO4cGSqMyKp6CQ3FQKMjCTOk/EWismQraAQOs1+NQtWDeeuAYKv2x/9pJegmTkcvLvsf29tWMUquS7hi4nmlcI5qKRd+WbikBBzAx4+KdqBQB+z2CLwwKzczzm8V2u57xKJ3tqe0wM12qvZKfkYX4W+tRX3XhUJMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Vol0P5Cc; arc=fail smtp.client-ip=40.107.6.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyfbM7vSW6frlQRcdMXrfXrWjBTH6uHHN3wGSt7A/HyHqjmfZgHRXb6jSQvG0HmN+sg6rImbsNKVOZvj+HB7XT8AhUdepB7igjMsz8m+tLK3Kj1uY7JRsByLI27pCpJMJotAbcTzCvfkUitK78Il9uJVJKFeboEEFeQocs+/Dq2WXxMeWB5scb6U4L4Inu3tiEspVoMlK1BkLql733KOhnVXSXvbhJUmOXUAcHxkK4yzHjrWBU9sYRa3Q5idEluNQfVif8tYz/8l8kRYkGFwWR/+BvJ4aKJeT4fdET7uTJQWOyhfGoSlRQjtWE4yZHmPhUgbb0woujh+px5MoTxcbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHyCX0PxWzhsInV2LWN1zWRgnNkSz0TQX4Aiet07JIM=;
 b=H5q6f2IQn6TLRXi9YaABI4rxZkDLAL7+Qdt54BZ+KXJjq+yGv5BcQ9o1S9DWBoCSbRDVvrCm6MKAQIyIFsiBAsccCUi1AQgui54USsDuQfxWZTidfgrSVTvWuKndgWnDMMWd8oNA0B/pvZroAQ9L49VTljQD0uI0rPB6fQb+xWiYOI0yUX0kFVmu6KjAiDtNZxZHRq83t3kE4cnQ4f9TlQCBuibFluE//Vg0Tacy40aVDyWhGT4qUuIn+XhIW70hP+scIbwCoX+Lz/BX82bRtP+txZxWyiMt+FXDWOFT6ivLeQz2h366uOw/2BxntKsNW5CkkrClpMmserzHEb1RfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHyCX0PxWzhsInV2LWN1zWRgnNkSz0TQX4Aiet07JIM=;
 b=Vol0P5CcX0VpeNL13V/aPEPmOP/aaDUEQkO+ZwSsAYfuJpB51Gp41gfh7PHScHQ6Pai1jmqlKWePtOWiJ7lDJ+qtHR3ie0P0Qzbq/s9emUOqeDIdgiKE2wWgknAClOvvS8Yb5aHvxmAX7aRqyYgks6SGgFxxsjzuSYzf06ky+0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9255.eurprd04.prod.outlook.com (2603:10a6:102:2bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 16:01:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7611.016; Tue, 28 May 2024
 16:01:42 +0000
Date: Tue, 28 May 2024 12:01:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: rtc: Convert rtc-fsl-ftm-alarm.txt to
 yaml format
Message-ID: <ZlX/3ubifkR/RTl8@lizhi-Precision-Tower-5810>
References: <20240520214614.863539-1-Frank.Li@nxp.com>
 <a3c76bd2-f453-4320-8675-66ecb4bc6fc8@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3c76bd2-f453-4320-8675-66ecb4bc6fc8@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0040.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9255:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dde4e5c-9d54-4811-b114-08dc7f2f777e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|52116005|366007|376005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LacgbphlDu2YTWmGZHTQJSmZqxTJlihaJsaksBRKUU6BLnar/cjjeAQECNqr?=
 =?us-ascii?Q?Txgoj2r4YKL1a5wk6+2LRVGDTLo4lcYKyRzNimJe46xZ3v6Rq/1qDtFLEAxE?=
 =?us-ascii?Q?ISqmUSDrfQ6CZRfcRex4OTmd/RlpzygTOP/4I2PgCZF8S2wb/ojYmGaVlWHq?=
 =?us-ascii?Q?RiupZA7jL0oPdk+G3C8+MtEm85RyTMvt6vpGOsT8gph6r4XxXVqnBU/6XA8A?=
 =?us-ascii?Q?jujS3y11wcZ021KxJ8P0xWoT3oSMX584JHORzCfbFoVvfHzeddBt+hqfqP8l?=
 =?us-ascii?Q?LwRu1xcZ1lq79E3F9mBYp1wpxY4XzIYXfg5E/qBKx+hZs0nSu/a5SExhtlRr?=
 =?us-ascii?Q?S47c6QmXgE9Bxmw4i/7HlI0mdz2JaacQt1V267hUxg7p6Cyzu985yp+ezfoK?=
 =?us-ascii?Q?uJ5DOVc7NHL4t1O2xViTlbs4nWxEEzqwP9uIwQUo7cSQGOEMLU7gPH+Ei76E?=
 =?us-ascii?Q?N/IfRO1FwFw80VLQj9KqqXqPxzFzbTpPxoHoNkymhMQiJEyTHhCB4zhjXl76?=
 =?us-ascii?Q?aOEkUQeqLALVSc7y5zP8uvY8N1zSKDflKKPOeGrQBqeFxdPFcvnTDUNJiNC2?=
 =?us-ascii?Q?iEABX+UEGiIlXt63H761GnzoyD9Z19eE5eGlqUu+OSeNtUa2lWxWGkYp/BJ9?=
 =?us-ascii?Q?lYXUJfLpXcn2Bg3StrMx+FN132pEhDk4LHinEm8gOkuVk4OYyl2g/ejLRCfo?=
 =?us-ascii?Q?JBsSHV9BhJUL76q/faaZWAH+fnAgmc3Ez3o25GBbT9vdHa1RwKO8ZXb5PFne?=
 =?us-ascii?Q?DqLyRHnSqdjszSy3YSrlI0/gWphRisW50REvFKxpX6aZcwaqv3dQNzDfRHGv?=
 =?us-ascii?Q?06HQLGcFZCUvXJshpd9H0NRaLMPwy+iCO8ga22jw99rj3rTSNQYg/HUh/5Zr?=
 =?us-ascii?Q?PmgHhMT+AjXISkWjByVWcQar0JQvHfkOoegER6Wval9gDdBf4yvf97Bx5bRc?=
 =?us-ascii?Q?YeRBTPpv3Q4xb2jFRiG14gvll3C5jHHakGYA9w8PnWjWXxuXdg4ITs5re9EO?=
 =?us-ascii?Q?c/Tzh0UuV/nFGBibA7JfCyhzkPSpAFmEtrHpzpV5vA9H/Cgi1JaimF90pP/O?=
 =?us-ascii?Q?+NPKvHVfpqTrSsOM25jxsKd1A3kGq4HJu7ed3ZpBgf5boIcR3IdCbYht+ZWV?=
 =?us-ascii?Q?o7xNXfbqYlq09q7Q+zKefCb0WXoUkxengHdLcqID7ENWwPrCZh2ZEhgnG3Ty?=
 =?us-ascii?Q?dBA6QOXBNxUGhpn5xuY7gjw6NC1cvna3QY3riGGbdVRracvnrpX49a+yw41U?=
 =?us-ascii?Q?ydJiEiVoVD7eXenDkWcBe2NOFKWDHW28S45Ysqplu8rIgmbdxGMFxxnzMsyM?=
 =?us-ascii?Q?Xgw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(366007)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/th4eRpPSNo4dr8WjzLm0/yrpAXPyxgoRCCmaiJjS79KjB4zIdHBLu966KY1?=
 =?us-ascii?Q?lFayBzk4x2Oq8XsWCYGoPgoGHNR1Y99fG3LTXWFrIN2i4YQIou4y8suQZ2ih?=
 =?us-ascii?Q?mMUd5UgVFrYu45lZkPClRf3+pr+AbcPsaGY9IcqO84RZnNgQVBZargswZRfm?=
 =?us-ascii?Q?2kY2eFVfdxfDhoHrDgBQYQwpP4hZ8ih+kap9HDyFgp6svF0PcGr4n8ap4Kpq?=
 =?us-ascii?Q?2VWaS0rCre02ykkO+1ZNZYAnJRv5hj06w1b3nzg0H+p9uMwKHxkchNerisUF?=
 =?us-ascii?Q?3fN66Kup6oP3GXcMXxUBdrY0ikaZSBAsARcoFap5+8qA1QGd//4C4cW+6SCA?=
 =?us-ascii?Q?wdl4gKnXJi2k7FmzbkTsTPNmT7/dgkCvBD+nl9Ihk94RmWE0vpcrw4PNQYYS?=
 =?us-ascii?Q?Ay5E7sG8GrDvwdYSLBBBHTaQZBUgW542+X1bW3IOvOlK3/79czEzaYO8pJ8P?=
 =?us-ascii?Q?wHPN9kcL/zSScuGKaD1exgtPDJ0h54uYDyBR8FsOsyjpJWSHkvhFOlW0fIp+?=
 =?us-ascii?Q?OyzIRlnr/5ZZD1xzW4walV0ip0mCCLyK2e1Njothhs/F2J04CBRqCcUxy0rS?=
 =?us-ascii?Q?3g7YY7NKHjxUxKn3CrG9SAvBsSkvgHVQT3J5Q9Mm56W71aHht6mfGeENbYJa?=
 =?us-ascii?Q?kC7qEqBjl6xphp2ApIhgoADYVhHNnp0PuMQydVQtJc+LWlJ7I5xyzY0Am88j?=
 =?us-ascii?Q?+Z8zvKQhL359JlZ+9lr65mO9K1qfaSnCxrjEUW4EBO3ZoMrmW9+QtzUULvKl?=
 =?us-ascii?Q?If88Cu8DVUm7ojKr0lgYt5qepvqIpovuo3kqKweBFChOfJmwzcl4oD15fTG0?=
 =?us-ascii?Q?RSVZ2qEipdixSWq/CthmE/yTXzuyRVFRTQdlm0HTIWEXlyg1ly+L1stbTTTo?=
 =?us-ascii?Q?QzNxrsYXoM49tnHRQ1wyiJ0/LqaDGsgpsewofId3RaYIpiM6K4qrGEqBoDgi?=
 =?us-ascii?Q?76geLZ1+SwFl43qqUbxGFiBETHdn/T/7e3ij/4yUuBV+MGmNBd75f2VITIZU?=
 =?us-ascii?Q?N7KNMxEuiskBblLGlK8zzwoVPmfddE6iHZj7aaQBVHexN+J18MW4r2CQv+eZ?=
 =?us-ascii?Q?afqZOjbhgdqz/ONicZgzdhZRMdHDzMKhmNz8rY2v9p/Ku+3YchVQYq5UClKJ?=
 =?us-ascii?Q?gz018VlBQWsKok7r0IbNnJtKah0sF3LMKyg+si1VenTi+nT2q7ztBQyOR0Y8?=
 =?us-ascii?Q?Ni8PJGbDUpV++VZSHEyw9ZCE/EIviFoy3VKUz28AI1VPsvIYNchBNXwEVL9s?=
 =?us-ascii?Q?vqIxudLQOGC+J9OYSo5BL+ELiwA6RSd1ZprkAfH28VLGYT4aaYggIeMUSXGq?=
 =?us-ascii?Q?59ZV/Eco+Qvlwne5QSQtvG1By0IcNlhLvSPruXbL/r35dzG22AR3nfLEVRHs?=
 =?us-ascii?Q?yKnLoyqunRB4Hfo98CRmhVKVcXTc/rQbUhHPJW7R+Jm8CWoRYc8mLfcx4/FV?=
 =?us-ascii?Q?ap3gp4CCOQbs3tpYh0uDNyvgotU/4WgxFrJg4ytVG/CNZaeLnwj7EIyoLJ5w?=
 =?us-ascii?Q?1YJiBGhBLXpUmfbIBbQY1rJ2z4UAfOOiYzuCumklhzekpvHLhx73LcYVq+do?=
 =?us-ascii?Q?t8NmT65tf4BUD1tYVB8xfI/sH8s6PUo+Ko0bNxKU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dde4e5c-9d54-4811-b114-08dc7f2f777e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 16:01:42.8037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Ww68Evmz4TZFWPxfMKZ4M1a/RsyxIrPHT2TrgjgFeryELS4RCOGbQVKrj2Bdq8EWqITkhmf4dnNqj5lArjjBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9255

On Tue, May 21, 2024 at 09:59:00AM +0200, Krzysztof Kozlowski wrote:
> On 20/05/2024 23:46, Frank Li wrote:
> > Convert dt-binding doc "rtc-fsl-ftm-alarm.txt" to yaml format.
> > 
> > Change example's reg to 32bit address and length.
> > Remove unrelated rcpm@1e34040 in example.
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > 
> > Notes:
> >     make dt_binding_check DT_SCHEMA_FILES=rtc-fsl-ftm-alarm.yaml
> >       SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> >       CHKDT   Documentation/devicetree/bindings
> >       LINT    Documentation/devicetree/bindings
> >       DTEX    Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.example.dts
> >       DTC_CHK Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.example.dtb
> > 
> >  .../bindings/rtc/rtc-fsl-ftm-alarm.txt        | 36 -----------
> >  .../bindings/rtc/rtc-fsl-ftm-alarm.yaml       | 61 +++++++++++++++++++
> >  2 files changed, 61 insertions(+), 36 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> >  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> > deleted file mode 100644
> > index fffac74999da6..0000000000000
> > --- a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> > +++ /dev/null
> > @@ -1,36 +0,0 @@
> > -Freescale FlexTimer Module (FTM) Alarm
> > -
> > -Required properties:
> > -- compatible : Should be "fsl,<chip>-ftm-alarm", the
> > -	       supported chips include
> > -	       "fsl,ls1012a-ftm-alarm"
> > -	       "fsl,ls1021a-ftm-alarm"
> > -	       "fsl,ls1028a-ftm-alarm"
> > -	       "fsl,ls1043a-ftm-alarm"
> > -	       "fsl,ls1046a-ftm-alarm"
> > -	       "fsl,ls1088a-ftm-alarm"
> > -	       "fsl,ls208xa-ftm-alarm"
> > -	       "fsl,lx2160a-ftm-alarm"
> > -- reg : Specifies base physical address and size of the register sets for the
> > -  FlexTimer Module.
> > -- interrupts : Should be the FlexTimer Module interrupt.
> > -- fsl,rcpm-wakeup property and rcpm node : Please refer
> > -	Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > -
> > -Optional properties:
> > -- big-endian: If the host controller is big-endian mode, specify this property.
> > -  The default endian mode is little-endian.
> > -
> > -Example:
> > -rcpm: rcpm@1e34040 {
> > -	compatible = "fsl,ls1088a-rcpm", "fsl,qoriq-rcpm-2.1+";
> > -	reg = <0x0 0x1e34040 0x0 0x18>;
> > -	#fsl,rcpm-wakeup-cells = <6>;
> > -};
> > -
> > -ftm_alarm0: timer@2800000 {
> > -	compatible = "fsl,ls1088a-ftm-alarm";
> > -	reg = <0x0 0x2800000 0x0 0x10000>;
> > -	fsl,rcpm-wakeup = <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0>;
> > -	interrupts = <0 44 4>;
> > -};
> > diff --git a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.yaml b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.yaml
> > new file mode 100644
> > index 0000000000000..69b44e9920033
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.yaml
> 
> fsl,ls-ftm-alarm.yaml
> 
> or
> 
> fsl,ls1012a-ftm-alarm.yaml
> 
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/rtc/rtc-fsl-ftm-alarm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale FlexTimer Module (FTM) Alarm
> > +
> > +maintainers:
> > +  - Frank Li <Frank.Li@nxp.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,ls1012a-ftm-alarm
> > +      - fsl,ls1021a-ftm-alarm
> > +      - fsl,ls1028a-ftm-alarm
> > +      - fsl,ls1043a-ftm-alarm
> > +      - fsl,ls1046a-ftm-alarm
> > +      - fsl,ls1088a-ftm-alarm
> > +      - fsl,ls208xa-ftm-alarm
> > +      - fsl,lx2160a-ftm-alarm
> > +
> > +  reg:
> > +    description:
> > +      Specifies base physical address and size of the register sets for the
> > +      FlexTimer Module.
> 
> Drop description, redundant.
> 
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    description: Should be the FlexTimer Module interrupt.
> 
> Drop description, redundant.
> 
> 
> > +    maxItems: 1
> > +
> > +  fsl,rcpm-wakeup:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> Please describe the items (see syscon-like phandles).
> 
> > +    description:
> > +      phandle to rcpm node, Please refer
> > +      documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > +
> > +  big-endian:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      If the host controller is big-endian mode, specify this property.
> > +      The default endian mode is little-endian.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - fsl,rcpm-wakeup
> > +
> 
> Missing allOf with ref to rtc.yaml.
> 
> > +unevaluatedProperties: false
> 
> becauase otherwise above does not make much sense... unless this is not
> a RTC?

Sorry! which one doesn't make sense? I suppose not "unevaluatedProperties".

Frank

> 
> > +
> > +examples:
> > +  - |
> > +    timer@2800000 {
> 
> timer or rtc?
> 
> > +        compatible = "fsl,ls1088a-ftm-alarm";
> > +        reg = <0x2800000 0x10000>;
> > +        fsl,rcpm-wakeup = <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0>;
> > +        interrupts = <0 44 4>;
> 
> Include proper header and use defines for GIC and flags.
> 
> > +    };
> 
> Best regards,
> Krzysztof
> 

