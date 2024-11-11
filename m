Return-Path: <linux-rtc+bounces-2498-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D47479C41A1
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 16:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93E5D281477
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 15:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3282519D084;
	Mon, 11 Nov 2024 15:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UJzBpomn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011023.outbound.protection.outlook.com [52.101.65.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066551E481;
	Mon, 11 Nov 2024 15:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731338059; cv=fail; b=CQt54VJjrLoJJTqRlkp6+wveI1XhS3if2oMv4saKJx7WJp85A5l8bUSC197IxfasA1HzTRVCy1BcI5AbahZdxZbN7atBM8sNj9a4nTQXDs1jtQovbs1ACn+2D58dhsO7UlTWY0t85FZDxf1296T00Gq3YRoHijKfjaNkFL7IIiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731338059; c=relaxed/simple;
	bh=JiyNIgxiQV7hkjJIkji3/abFFhIPQ06oVtqn+Qp4Z5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i0+1oO+OU/wnk+IJVc+/yZhY5WZVXIrd8HmpiQfbODdx0GQFHB47VR+Gs7XXsU5JIfO85nxPJYvpweXzFuRwKz0XZFLVeU3i/mNjNZ1QGgm+isklh36uDKAyT1XD5IKO8crHOp/7qer+UEihakwDrCA9mok3zmZh8Y5kZnuFFgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UJzBpomn; arc=fail smtp.client-ip=52.101.65.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odo2gxEBfEvt5y7BatROTZa7+01JDnI2BOJ7Jkg0P4qmyEL6O+yGIgaBe+70l7TO+1XKzCZiv3wCSaKzMB3XDSV8PYJAqdxUhC3/22F7UqDRxMQXsIq9snjHRyuraOoKMGcNdAu0RVBUEEUKLZhuieKMJF5BFucsDl+ACazMHL/RSRAlk0Ag1AqmuMtoPYS4fzoEiSLsJ9snDOa+g2QgTS0ZH/UayTWmJ4rxAeYMg2H91l8WjqoMiZpKV5UVqpUisOwOisvZAv+tS0NH1Gf3s+QiDX18gxrg8BXo+PjJuTI8GPyDDuAW85TNWOnXgMZUenD96/rEVl3Swlxk3C8VqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/Ohm7X6BZu/KjW+c5oFXznRy4f1BSUnmsyHACRTBtg=;
 b=F3Hny3B6xNXdQit4pynpIAsjm401yHEWTIgoyJQMjucHGHz5D7PeLiJcy+0EktWp4gFiC0dJwSAk40xTKiX3iooDKMMyfVFDdpCRwAFRoXtwHe5C2/+RFFDITqj1awP9wuDWYFWvRnwHwSfrcL2eP2wr1HLkp3utWgT30KK05YQsDCrXNWOm5aTXulmLp6OSzgc5CF1oyLMXhNL+5/XEvjAsyMmflKtSAVvsBgdck2Vl5VhPbNcynkc2Pewd79VpcEbXHGdFMrCrrItMf+8rkaUXaHBRdSFVXrhohark81lzRLvtRyucYduLH0HJRAKI3kdeNZXpo1YnMtue7cL2dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/Ohm7X6BZu/KjW+c5oFXznRy4f1BSUnmsyHACRTBtg=;
 b=UJzBpomnhOdr7U3dYh1aSbF9iMrrfJyqaeTEyYSw+uKDW6UUf9afSYYgXoaBpJWL9YuaaeoWo9XzNVc8l2VI2PTiZQ5gKKRj+pzyACBg0v/M5o1m/HkWv5AOfQikXkjygw2neHYZuxDOXfpMggkdpqyOIhzS1/wq1mKlhblEKE55vmpoBTnOhnLmLCpv0dDEyyHvveSTD39mh1uYhTrjVIMFRm83aCnpAbAC41qfBxMXdkycbK/NUQixTrWgA0V/gKE7MJCmuM6x60YFMVV8pEYYNhcHysatbV81f1NdfMTn4ZmR4xfwhtB/ElQvkI1OXqp1fUoKBOTqo9ARHQemhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB9092.eurprd04.prod.outlook.com (2603:10a6:102:22a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 15:14:12 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%3]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 15:14:12 +0000
Date: Mon, 11 Nov 2024 10:14:03 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
Message-ID: <ZzIfOwm9b0IjPd80@lizhi-Precision-Tower-5810>
References: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
 <20241111135940.2534034-2-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111135940.2534034-2-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: BYAPR08CA0065.namprd08.prod.outlook.com
 (2603:10b6:a03:117::42) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB9092:EE_
X-MS-Office365-Filtering-Correlation-Id: 4122fb15-9b06-4237-b071-08dd02637f81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ST4ugF65u94vDgYF1yjduGoaGXjg2xa0CIf6L1WwuUcklA0+KgGhEDoFk4/l?=
 =?us-ascii?Q?+aQfkc9Cd5tVPwpSzTJFtDNuZeI5OmjxCiud3RGxxEy5vW2d1fAUYw5Meu73?=
 =?us-ascii?Q?rDIV7ScoVZtF0DiJesZsreSyeJkHB6Cg7bQox6Zmyu7unlOsJDE/nluUydE2?=
 =?us-ascii?Q?zwN7cox5Oze3JE5oxEs7ZxcHGRoLKIk3d7SlhmJTa/+qBMliS5oSxNNODx98?=
 =?us-ascii?Q?1iPsb/FcT1YH3EkRHLmnBnm1RVU/S0PXfmqVh35hfqmT1c2PpXMWYEOmCtST?=
 =?us-ascii?Q?+HXNKrjsFhOaLPB4mlD7ELIxW75w/2FjoVZQtvvEZCLJ54dX+GrVoU4xr1Pp?=
 =?us-ascii?Q?7Gg5QzVzQbF3LcOk9/B6E0ln8V2L1ToRh90qiEECFkS2FM8kIptdh1e88M2N?=
 =?us-ascii?Q?SQxBw32aDUIsk9Km9lrhi93u8oNYgseWH/1kTivNPydJOlL7KU6BfHSazQxI?=
 =?us-ascii?Q?6HAeob5Huq1mJZeFUMgzLVu7LB7ErlIrVSf/P+wMgeyRt1I7/D3R8WsjozQx?=
 =?us-ascii?Q?3UiJcGaTzSIWkSaGpf6vKy7yUWTArxEiB86QozOuaWAH9RxU3fLZ9WN7F+sK?=
 =?us-ascii?Q?bvbgLF4asa7y4GSIBXeCQJjLgiW5wLhPIrvMmvkIzy7FwhmlWOICJ81fc/9q?=
 =?us-ascii?Q?aO/jskUUylmcSKhBAI7jvryREzWxDFvpY3OZY5SQIEdoqa6Vg1+Y+Bkyi0Je?=
 =?us-ascii?Q?pTCJxqfLDsmqTefWJ8Jhe+1THeLjPfihZHOMoVQP44MwGT4sGjZXYZ2+JsPi?=
 =?us-ascii?Q?587Xm2bLDkGWvxqi+5VKd8gcAXBBFG7TNo8WZYGuuEEkFCeuceH+4nzlfr0v?=
 =?us-ascii?Q?LdigW4vPwxG6mVx+Fp3mihL8QHj3T9cLWnj0eNyfrhrDnG/JvslGLSqg2GU3?=
 =?us-ascii?Q?50K1uz24gwOWNWOY7+IckTaHI3w3a/9TydpRN9Lovj+N0vWjlRZh+2M0u8HV?=
 =?us-ascii?Q?d5sbJ6hs2nXuzPPDg3LYSs6T+uTHSY1rgPi6wtPyjNLLMQurRx31ce+UUB8t?=
 =?us-ascii?Q?3RElxRotAkeSBuIeaz2Mn6yws9mAiCN7/ZKaVFKr08FA7H8Ujx4tKTQHJLpL?=
 =?us-ascii?Q?KMhTL1X5HRAbxa59JK04275q44/TkK/eGQQuzmOUFhQVsOJ14wmtyNB+wDmO?=
 =?us-ascii?Q?KJjw63VlOObHhXytFK/1Bjwy6Aq7ZMBMLNVhTpJg7VWXMp+txpsA/2u1PLtB?=
 =?us-ascii?Q?uyokevrARm39HzHCjwAKkZPQpYmcDnUSflgZOcIOaD/LHse0Yw5p6ic59Dn5?=
 =?us-ascii?Q?MmKW/BzAuBdzHSww2v0nzim7ADKekOlEaO1gvJVIzXya4oUkGaIIjzbcvF9R?=
 =?us-ascii?Q?7lU/v91bG7CHfxFJCqJEzWTQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IzZhOxVN3MFgcK10JVYNsJnoCEcTq3U1V+5H9YN5d9PggiOCHPGOyBYBHdpS?=
 =?us-ascii?Q?miYYLubQ7B0ktO2bISfIVsd1ZUV0ELGeD58X+50Iem2+SHXaGU9JyG5lYQ14?=
 =?us-ascii?Q?bcy4PugM7QfCaGcKnVuNt5li8Jn7yj87Y8QIKAoVH/MaQCMlIojQAieMoQcl?=
 =?us-ascii?Q?TP7iQ4ykHr4DkPb3KSlQZ8e16v9MLZJAF2QbMCSSQxLNTtQklFUpsfs+EaIv?=
 =?us-ascii?Q?FjokNEuShGKxrKnMKC375HcG88o4GmB9w5h6876gtem8h2oRqP7/ovfggwAl?=
 =?us-ascii?Q?WbbB/s61Wvt4VDnmDoFdnGAKHroWfLCM2KFVP1fhEDES1tsleuvR13FXVbdg?=
 =?us-ascii?Q?OpFzDJvUEz4PzoEH0MkxZx6+W6tafku6nPHpLuJ2vo+ltaI/3rOIXeAAnw62?=
 =?us-ascii?Q?6xzh37MqNTSb+28qBSESa3gOapNya/3s9rh+fz8TLEFV/NMH2IOEcp3QS9X+?=
 =?us-ascii?Q?+UPLefdgiLwX4rhHH6/tIFeuaj7WXJFPKtHxp83utWxM6lsER17gqJVat+5K?=
 =?us-ascii?Q?qd2/VLZGZwoyt2JjawltjA526VKJYkazm2dJM+L8+4p1621INCcOCIf62dRo?=
 =?us-ascii?Q?L9Deh1bbk4lplP2X5NvfPLnC+ibE2rKld/znuSfNLb7HBYvpKwkSfjU/V1Fw?=
 =?us-ascii?Q?pc3zZBcmhUeg1zZSCSmwrHVRwTG0tInWo+yzcmw6A8NVtGIPcurw9KlIWpGp?=
 =?us-ascii?Q?QrSpurCOPzYIdvrLG0awT+A7eCcOX8gQrigHuoi3Gom8+Xm/wkYQ4zwlrh9F?=
 =?us-ascii?Q?G/EyAf1YvaCt9fdR3MZX5+eBXURJn8NBkpu1LDrZ7wHMLi+r08pmru0fznLu?=
 =?us-ascii?Q?ye1nr8SVBoYqBoUfVoAPcRcIBmRBauFSi/s7TSzjd3vjlZXqFO1e3+BBJnyf?=
 =?us-ascii?Q?q/aht1/eiOcD7gcLD5915Yg41PGDJ6CojRQYxleIZdISWJmB0wC9dlrdCn7l?=
 =?us-ascii?Q?n/E2fRE4jCI0a3rynD3rsdL/flcAse0dI8FGmjAs/k1sRUPmYC8sBBGcKo/A?=
 =?us-ascii?Q?D59KLoYwV5ZkSybw3WCq2hLoBDyEEWy34m4rimE5taodTZod8F0D9KWeErfP?=
 =?us-ascii?Q?CNR0/xjUn7ydOiLaAJ5v2uomRBsqOPOgYkkMZLUS4Z+wPfxnvTrx5y0LXD7s?=
 =?us-ascii?Q?+o3g4mKQv7HlufX/tivuZVz5do3u4pA58U150jStQcHjZP0gG5kyteEEuH6E?=
 =?us-ascii?Q?ASzNZOQ6PrqcOfmN48SERSU5kJ6m6XFCCcCYR435VlCJhUP/+OZ+BFAl8tLS?=
 =?us-ascii?Q?lRW0sWgqJ39t9AeNhcMnt37Ik91UDB7jLwOW1oEYKdyL54iKNAGMl5KIWVkt?=
 =?us-ascii?Q?BrnbzXKosvb35h3luqfYEMLtpK/Xif0U0efigPe26iqO7ZWDJhi5qSZ4EQlj?=
 =?us-ascii?Q?uAYCUCimEYILnAM814q8GNK9r+/z5ixz0VTh9Hwvyd/wkMt6b65VmkI+YC0p?=
 =?us-ascii?Q?MBcIZBpqjdPIupIh5ChTlQQs/ZXNMQeS+WHKh/QnAojMHIdELY/+RTQMrHUV?=
 =?us-ascii?Q?RSwfYuDQ1vfmcBoY0k/JsqmGBXAbUNWYcEUazKhgUOzHsVDl1m+dgy8ZDKuH?=
 =?us-ascii?Q?f/qYhAHD6TNmO/Z0cFU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4122fb15-9b06-4237-b071-08dd02637f81
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 15:14:12.3000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ocx5Pw4eVQkGeiK67shb7KVEUAq+28kWXFlCRGLHKoG+wV16dGfC49apuSsKMlTUPbkd9p9lpsjToprF/hp6TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9092

On Mon, Nov 11, 2024 at 03:59:37PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> RTC tracks clock time during system suspend and it is used as a wakeup
> source on S32G2/S32G3 architecture.
>
> RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
> during system reset.
>
> Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> new file mode 100644
> index 000000000000..231811579e1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32G2/S32G3 Real Time Clock (RTC)
> +
> +maintainers:
> +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> +
> +description:
> +  RTC hardware module present on S32G2/S32G3 SoCs is used as a wakeup
> +  source. It is not kept alive during system reset and it is not
> +  battery-powered.
> +
> +  RTC hardware module contains a hardware mux with 4 entries/inputs
> +  for clock source selection. On S32G2/S32G3 SoCs, this mux is used
> +  to select between a clock source for runtime which brings more
> +  precision but is not available during system standby, and a clock
> +  source for suspend state.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nxp,s32g2-rtc
> +      - items:
> +          - const: nxp,s32g3-rtc
> +          - const: nxp,s32g2-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +    items:
> +      - description: ipg clock drives the access to the
> +          RTC iomapped registers
> +      - description: Runtime clock source. It must be a clock
> +          source for the RTC module. It will be disabled by hardware
> +          during Standby/Suspend.
> +      - description: Standby/Suspend clock source. It is optional
> +          and can be used in case the RTC will continue ticking during
> +          platform/system suspend.

wrap at 80, keep wrap pos consisent in this file.

> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 3
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    rtc@40060000 {
> +        compatible = "nxp,s32g3-rtc",
> +                   "nxp,s32g2-rtc";

align to previous line "

> +        reg = <0x40060000 0x1000>;
> +        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clks 54>, <&clks 56>, <&clks 55>;
> +        clock-names = "ipg",
> +            "rtc_runtime_s2",
> +            "rtc_standby_s0";

align to previous line "

> +    };
> --
> 2.45.2
>

