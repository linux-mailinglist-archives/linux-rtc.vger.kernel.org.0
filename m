Return-Path: <linux-rtc+bounces-2267-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0639A9E79
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Oct 2024 11:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3EAC1C21492
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Oct 2024 09:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34121187330;
	Tue, 22 Oct 2024 09:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b="GncFvSnu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2121.outbound.protection.outlook.com [40.107.20.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8992110E;
	Tue, 22 Oct 2024 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729589355; cv=fail; b=OCm7BpnwEDKB3SdpzQ9dhObdlodj6M6Jb4itdKFlq9jGhSFIRlxQqvnaY1tGJe2/0vuBTSkMiVkj52KewrAdnaim+D8w1Mr4XMLTuJPifAbFhSYJy7tNuSq6P0oHzWi3xuLMwrZasOfeA8NpFo28vPYu5S+PtNe19IvIlD3Q3ZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729589355; c=relaxed/simple;
	bh=k4pPXxWxY/S8XwhT7B/30kBTp9St/9u6/pvkX8iMwd4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Bea8/UxrwLlGKff/VsolobWgViUKTjab2iY3QUvxd9WQ4bqA5CwDmkTVG8zrm0UT3ynvs00NKuyq353O5BqU56z+XvDVuX0Un6E9ch+FU2XAz1gFKxJyWA/sAs/aW0yeOBG6sLQEuiuaf5e2022JvmMF3LzFM+pW18u04IUZJY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com; spf=pass smtp.mailfrom=kunbus.com; dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b=GncFvSnu; arc=fail smtp.client-ip=40.107.20.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kunbus.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQoGTZ6LbZWqMQrkUa+ZOF9nooFQ9cU498lmr+h8ugY3Rs0jPI2FhOHTbqPbR6x6XldxpiFdU5p9yb40lKgFVU+5lcaskTTnQVO0AO+NRIQz6RijYsXA8U0SUFWwvgwIB/6fYWmzH/NPTC+p2BB4lCo4RGwA5SWIZxybcGkX64RVagOrs362I1YIajISe6ARv8f2emqYBfDi1hOSmqG+gbdAYZBtr2lKKBlFlwHgfNNGWfgH/OL2HlDx9plNyrrK1Ma5fWtENBkG7HKDQbaeF26vZq+3sPASVWcM5b8fVYfb4Vs2TrTjyz6fqLCotkZ2LwSj7OXm5fO5Y+S6jr+CAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8GHjR4RtY6fKhqVW50BJ2U4ngMQr8fnJVgYHZRUvMI=;
 b=qcjly0TYwsP/x1tuj579/q78DSuT4nm3bYM/29JGpBIMWVwHIMGYfemZYwrjBEWUQLa8l4Kbvwk7fCCWZw7Khpjm1zAFaDLYT9/oUSqsvG2dOvCG4DaQyWksTkr+o4aq+HJCKj7syR1sw72QDu15589B3SkxlIkjVYeYb+/H4potHVQarwcHQQw/TsxCPHvKedv7tjgUkcRDMhcS9xA2t4q3HUOwDnfjy6SZYzRHgX3mkXD8JdRWM5T/M2wzDnuLPazX7JLULTpGfKid3UGoBFKFVNZaKTTHgKgxX5t/I0JF1zbXCatsthy9qpv3iw3e89iHACJRbp7LkxMomwEOTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kunbus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8GHjR4RtY6fKhqVW50BJ2U4ngMQr8fnJVgYHZRUvMI=;
 b=GncFvSnuITy+Brau5LXzbruOCxdws0G6s0TvN8wAyQ7DTIb7SkTD5cl5bF5pHReN4X5/xov9kkt4gdtji0Gd1DStWD80Xn5kJ9WZ1+ItMgLgoYPwU9T8BQBzIFvXUNyKVjp5X6Ft/XsqiWdVLVcD/7DKKVkTqRIUwAKSZy0KRds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kunbus.com;
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:160::8)
 by DB8P193MB0663.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:158::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 09:29:09 +0000
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90]) by AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90%3]) with mapi id 15.20.8093.014; Tue, 22 Oct 2024
 09:29:09 +0000
From: Philipp Rosenberger <p.rosenberger@kunbus.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Philipp Rosenberger <p.rosenberger@kunbus.com>
Subject: [PATCH v2 0/2] rtc: pcf2127: make battery switch-over configurable
Date: Tue, 22 Oct 2024 11:28:53 +0200
Message-Id: <20241022092855.1609427-1-p.rosenberger@kunbus.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::19) To AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:160::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0P193MB0738:EE_|DB8P193MB0663:EE_
X-MS-Office365-Filtering-Correlation-Id: d2676ecd-f267-46e9-d10e-08dcf27bfb76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l6nu77HWp44EQ2tJm0F0RYrgJnWq2a8woakOFl3SgNZHnlW/8zk6rButCVw/?=
 =?us-ascii?Q?zUVSKXMDAwp4xnE09fWCS1k1CK07si3lhRSGgbxjQB6jNPvWfraD4ZIujr3/?=
 =?us-ascii?Q?dDA9YRlfLghSjdlrHMym/ZBnbfp/bdWJA0mexq9NMb8NDuhjmKe2Iv/ao05x?=
 =?us-ascii?Q?oqwseNygu4u21LVKc1PVMHEdh+y9N64MJxx/ia433Cex91hyQQk5MaAZ6fDr?=
 =?us-ascii?Q?MclSX3oHSLelkfZN2lVsUwk1LAGKgaewVSwL8d9xmxnh8QRPGlWIGJtloKZm?=
 =?us-ascii?Q?5AoxYc0ATuPzm2oMVdrYa423dzDHG2NGU89K6dkG9rQ8QKRTU2Iayh63uY+D?=
 =?us-ascii?Q?JLvvOJKXdgaXn6p77sreLkhwRPHOT0G/W/h162yZ7ErmkxyxV597mycRxIv9?=
 =?us-ascii?Q?aNTPuLVI5SKoMSXZGJQzTxJ6s9k5LR56aIqxGznUA06RLveKNs5enzSnB0ZL?=
 =?us-ascii?Q?i1uHua7HuVAhMkEgUO8P/9N0nk/DiY7n5VEjQuQO8GuqxljbK/qed1fCF/W2?=
 =?us-ascii?Q?deozdNW60pEE0BAK4RZLzmLB1I1k290oy7Z+td6inpETQMiF/T6D5mOt4hTK?=
 =?us-ascii?Q?iimaGt/OL9ihij/NUkx5q6PEY2LDoYhq0a4p5nVrttfd2elxwMFvaGdboabg?=
 =?us-ascii?Q?mC9nKY/a5oREBTHZb/1Cw2aZPk25vhVmFbCNEYcvNlDwhEDwFqjrS2r4g65u?=
 =?us-ascii?Q?w7HXA9lBpxqclRljIhHOVCQA+U1v9IkgcEZRL/ivNOwrDw0c22a2NETsohMp?=
 =?us-ascii?Q?hwWk7Q94xIUdlqPGp0tAPOMQQoXCHnHb2imqXpRh78OKu65/hu4S6IDlrCsk?=
 =?us-ascii?Q?Q31RmohFTKsiBRoXaFGh5i8KrtT3ZegkNRp4MxbSIqHkkrmYGXZ767r6MAt+?=
 =?us-ascii?Q?x1YrYPDxaeNUZAlfM8yJzyKfTySgUzV1ycSFAmAiBoAENiLk86qthevwOdgr?=
 =?us-ascii?Q?ZHQO+Fy6UYtAJ39DY7USUmIC+fjFE4V/O6iMfHZ/laDa9xbWmkp0Wc9hexZs?=
 =?us-ascii?Q?h/Xk9cJkqTlMJfpLrH/OlsWfDB/ykvYAYsYhLQHbvak8ZV3NkITJUDWtul9u?=
 =?us-ascii?Q?a5Qgud4XX3ftDgA6LwdYeb6nyJ+XRYCDHgjkyQFKitEb7wN+0zOeA5V7W5Xl?=
 =?us-ascii?Q?gESKwTXJ0e6Fncmmw5Pi82qhY5wQDU/NOngA/pNcxFrxDu+HUKBnkdE/0FHH?=
 =?us-ascii?Q?QLh5jBMUTUUltrmRbsrPabgOykChfn/a80qZwBrraPF0fu89Tg2fOnOBRPSA?=
 =?us-ascii?Q?Vb8KqFW75Du0ZMHGJPJXL/f5pwgIfIYI2I16wX+fCr0HS6eSSc4ZIT3heLVg?=
 =?us-ascii?Q?f4bQnwDkCkG0uVPnF+tqfuC6utaGaF+6kRu9Xh1Ve95KHTy5CotB4/6FvhUh?=
 =?us-ascii?Q?V6DUe48=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P193MB0738.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qFpJDpkxeJUBX4p4GlSXR+6J4KGXwNizUpknUMXIKjOEUgG4Sr0tc6dFTF/v?=
 =?us-ascii?Q?8mkQ0q17BTKcgzqcCHPQEymq4Jcw5NerO3kTh/uX/H8LDyOKAdPA4Yn5Muxa?=
 =?us-ascii?Q?DZR5I6Y8wQNTsBcTUBdwf5a19BrcGf3AILD2WBXoD4xNc52G/v7nT5dRrAW4?=
 =?us-ascii?Q?VcXSZMn8HaDUHuoxFetk1pXRzVuXijjoeez0G+xMwF75MSunIk7QQEDenBLY?=
 =?us-ascii?Q?NyCKP6aNrH6MPxhOuy31NQBkCoI9vxLFbYXz0urP+t1dAskXKFF6CyBplY17?=
 =?us-ascii?Q?iIiJEAGjCGIITm4m9AhSvoBazd9I2o+VZPc7f9d1Mf7k2rHaNL2Enx/0cCXu?=
 =?us-ascii?Q?EHMe3RBabeHU6cXOTvxrsa8YZER5G16Umk/xKodNusOYW9+nxuR+6a9xOoMR?=
 =?us-ascii?Q?bBgPiZIt77jYH1Pgs71yh7y18oLvou/ain4nvcZgdfdibjadKOXc/r/vRt5j?=
 =?us-ascii?Q?uDmhhtWjsIaEtkzMEEMnLDKyTc6DoIQOgGCGknShxc7Dsj2/KWJvbsfQ/ILi?=
 =?us-ascii?Q?7UlaLRqd1KacQpbp/D737h6PaJOy0FIM1bcr6hWSIulkiInL10xkzdkBCh1l?=
 =?us-ascii?Q?3KNK3rR27AbjUcakMrzSETGXsXDY2EuRR+/pKKhT1cJYDdzfU5ByH8xP5X8b?=
 =?us-ascii?Q?Rfd5o/Je2mpV0vzEbhQMSaXsqivLn/+qSZlA40M9z+64qSIGehH5oC7lrxJH?=
 =?us-ascii?Q?53Sxs2s8ot39GzLUiksLJ/u18wkHxppEt8/SFl62/StMGAyZAvVqe69vAhrk?=
 =?us-ascii?Q?c9xQPEO12hSFngrlOAfJGbxaWI6q8h1x+efN6wh3gjVxWaXRWdCmXcCy7XJq?=
 =?us-ascii?Q?JXWL9J2RWy7H5Gd47dTgyPGQs6/qoUQQYawWcQsGtJy48rkKVCTRnD69I1cm?=
 =?us-ascii?Q?MvjMyoMQARC/yDRXWyJQL3Flmmrl5QWFQo0MJDO8kLAhwr6hzLS5Cx/D30Tc?=
 =?us-ascii?Q?YAI06opq5ZE2ngfw/jXNbD4yTOX9c9/s6i0GHf9KpkXcZHAT2O3cboEPTG09?=
 =?us-ascii?Q?KaONvRGY7MIxolnUpjo7rohcifWlt78N4M7k75S98cI/BJ2KnEU6Mj/AAP6P?=
 =?us-ascii?Q?V01e78sIJDUZbJ6vJTflnK1V9i/fqQ/MG62+VyxX6DpjwZeOf1bWl+x+4Uxa?=
 =?us-ascii?Q?QvnxlUPUdaUXo5WrP/ZikZn/aJ7ahLVl43tXKqOGAgWgGl56NtevEiUt1D5P?=
 =?us-ascii?Q?2G8j0AqTNbGKp9D5qsu3QhIacEllkUI49Lr8tv91KpWLQS2xgwzPYHv/5mLn?=
 =?us-ascii?Q?rfqnqZjYLFoLBBb+wpcn1N37DaEQQGu8QCqlUnErInJnJlPEEgToTST+QCme?=
 =?us-ascii?Q?ilzV1cRQ9KCF/XvoNcRatANyUvYcBo7ifXO9VterVTJhhXHVi9EDwGG+xIba?=
 =?us-ascii?Q?CrDP5p4yjAyucGJL80BDtfg7ZVr7JY6XHRUVmo0vkk8vuvGsXT6coqKmHS+f?=
 =?us-ascii?Q?o5b25og0snyGxl4lAAcW01V7i9viBNNBts0EERbcsAkHoe7obVfg6Vd0Zfin?=
 =?us-ascii?Q?MYhMR2vPGOuM6tOQ6JTgdbNFIiHrnj5iR86QLzjjgIEGqfpUW4SGGPMFjH8w?=
 =?us-ascii?Q?XRJ5gykdotwReMkcIRTNb0KmIO5RVyc3aEWs/r9CCsU7KKEjerR6st+XuuJA?=
 =?us-ascii?Q?RA=3D=3D?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2676ecd-f267-46e9-d10e-08dcf27bfb76
X-MS-Exchange-CrossTenant-AuthSource: AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 09:29:09.4480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMLpHFnV2TEXIYsm12jwVDX6nOHQtHS1dOJk0/2KTeuFhUGzGz8MoaV7pOk37pYsonTmZzDSfT1NQW7tm7kW2DnCWA285jqPmRCGNXfATD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P193MB0663

Hello,
sorry about the broken V1 series. I didn't know, that our IT added a
footer to external mails. This also replaced all tabs with spaces.

This patch series adds a dt property for the pcf2127 driver to
configure the battery switch-over behavior.

The default behavior for battery switch-over has changed with PCF2131.
For PCF2127, PCF2129 and PCA2129 the default is battary switch-over and
battery low power detection is enabled. For PCF2131 this is now the
opposite. At least PCF2127 and PCF2129 are not recomended for new
designs. This leaves the PCF2131 as "replacement" part.

This patch series introduces the nxp,battery-switch-over optional
property. With this property the PWRMNG bits of the Control_3 register
can be changed.

I have tested this on a device with PCF2129 and one with PCF2131.

Best regards,
Philipp

Changes for V2:
 - Just fixed the broken tabs and removed the footer from the mails.

Philipp Rosenberger (2):
  dt-bindings: rtc: pcf2127: Add nxp,battery-switch-over property
  rtc: pcf2127: make battery switch-over configurable

 .../devicetree/bindings/rtc/nxp,pcf2127.yaml  | 10 +++
 drivers/rtc/rtc-pcf2127.c                     | 61 ++++++++++++++-----
 2 files changed, 56 insertions(+), 15 deletions(-)

-- 
2.39.5


