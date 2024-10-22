Return-Path: <linux-rtc+bounces-2268-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8319A9E7C
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Oct 2024 11:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29216B21206
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Oct 2024 09:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F30B1990C7;
	Tue, 22 Oct 2024 09:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b="cIKnPq/G"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2101.outbound.protection.outlook.com [40.107.22.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FF72110E;
	Tue, 22 Oct 2024 09:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729589361; cv=fail; b=hKSbb6q9PttRwBfy0mk650111p6J1iJPjkWAj0nFe6dJYYkJbIO00UbBbNwZ72KX8MXcTqlX95Gp4irKLOKwhzAOdS549jzj5+YPxDHNocOn67+7bzGMxgeGynHsbeuMmj2MtNS3rdxn23oMfePZGMQo7mOM8XcLNL8VbECVWBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729589361; c=relaxed/simple;
	bh=o/2BUj3ip8a66rzWe6tXvvZuCHmtcj6lra0ieYxlnMg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OQxvTFiJE51+slAlWQ9+hiC8GQBJgRs/tUVEMaHlqU1lDqzcnYDajauLRzR5pGozbTDTQ7oZBlXdSIk5lJa0AaVNpgwvE7gmHUJGEp+UcmIORe76EWKSMPrcydMxAhTPFePhZNjHCkxgSvykDaWmYzqTxWy6sfxjNMxJDcAx2tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com; spf=pass smtp.mailfrom=kunbus.com; dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b=cIKnPq/G; arc=fail smtp.client-ip=40.107.22.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kunbus.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vy/RPpgxIpK8tam2n9eFG7Ht6UOFHR5T3MKb8jny25hNHLl0It0ISZwWwrXR3xYsZ345wJpytsBBtc5H/feD5qD/R+g20FTyN3MNAdljF2iGWJKYSoqFPP5t/kbmMDUYi/HrWm94RA3geUaGMdTfPKi5C4fjFTXMNOMP/wdekEsS+TUnWqEkMA2EVA20xD7TKUK0dlOkGCGQlpxUeCDni+XMcxX22UTOeWn+dWlj4tOhEFJhMRaQqHZj43HRPwTJ5duLLgKIS854sZoXQCtVjlvJkSO2WFP2Mb5/ro0BOokmlW+TLjUPV28GBeuAXmtOkAtsHnUKucotWdg46YCzXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSyhKKPipf/9RJMNNOj9n0TW8gAoTKEAUT4E8Cw6mzQ=;
 b=oiHefy0b+Opbw8askvGsMMzxzihO/tjNbgsfJYQU9Tj9IijTKZPkHiihNgeUXLOdaxEb4/+EBpWYiQ5+fxG+y/dlbyu9wG16PHWKfG8XgHmTZMNEZjuh5CPCQ/6jOkkUS1Ahk4qmyYP7nKSIctqGgX9nzx1aS5x0SKmZG5owJ7mW2vyNkJBKDqlTeRb5tzoDVpTxG8wbf7sLjNK3ImDhMCPV4oA/LRXBnN50yEQ7HH92q1BIqzr+iesfwIEZkAsqvcFf37lx/MNoNwzoEgU8VFbEmgADGA+JGn3HwEyR0RtkyHRSNDWl5QTp+o17f0YtWRrEo/ereZpHdmb5wJqKjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kunbus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSyhKKPipf/9RJMNNOj9n0TW8gAoTKEAUT4E8Cw6mzQ=;
 b=cIKnPq/GFQUucoiM0fiHn+4U/ltaDWgFpu3ocs5Di8OqBPdKBrkkvCb8T0WE8njaqufdU9OtTReGtfKASbkDOGVkeT+IzRsSzha8jlJNoWfSQoJfHzOfZVbLP1jcAYWHRwuwepTWebGHXYtzNoFxLLDUrK95/MpRXu9OQeCNRJo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kunbus.com;
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:160::8)
 by GV1P193MB2407.EURP193.PROD.OUTLOOK.COM (2603:10a6:150:29::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 22 Oct
 2024 09:29:12 +0000
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90]) by AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90%3]) with mapi id 15.20.8093.014; Tue, 22 Oct 2024
 09:29:12 +0000
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
Subject: [PATCH v2 1/2] dt-bindings: rtc: pcf2127: Add nxp,battery-switch-over property
Date: Tue, 22 Oct 2024 11:28:54 +0200
Message-Id: <20241022092855.1609427-2-p.rosenberger@kunbus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241022092855.1609427-1-p.rosenberger@kunbus.com>
References: <20241022092855.1609427-1-p.rosenberger@kunbus.com>
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
X-MS-TrafficTypeDiagnostic: AM0P193MB0738:EE_|GV1P193MB2407:EE_
X-MS-Office365-Filtering-Correlation-Id: 2503208c-db14-4fe3-9c4e-08dcf27bfd66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZrQSiPdPTjmO0q4XWXK44fRKm+045YngvrirI7J5srKh7U/kfDbAcb7kdoQd?=
 =?us-ascii?Q?gFTMHUdGCJlw82g0tKISEo54MJf/GLo1ys2gVBndouoJE3nTU6lztejH8EwW?=
 =?us-ascii?Q?VtVNcqM/9fPa3ZwqMIhHLq2rdG+BYOLJVOloxmWl2O0U/vmfcjkwvjIyen29?=
 =?us-ascii?Q?ALa0nZmHZ1r2b8C2kKzqOU38b9zGL9ETksXXSmJfl97OF1165mVg5N+Ej4Jr?=
 =?us-ascii?Q?FfslkabAInGM2wusVFzyvYEpNxOQmYAsc4jcmR3fULMJdKD588faWevsjJ7D?=
 =?us-ascii?Q?s+eAqZ/flFrAKl9S+HsbntQe5yxlyGYHBimClApa1DCuWTQmNnZmnhnV1YpN?=
 =?us-ascii?Q?gK1Tr13S2Rt/QifvE4ON/mIjnMoO/wrOYSqG1JTEf8HrXBe4PUAuQmEcBI5L?=
 =?us-ascii?Q?xeaWZ0MulFvPg4B59eOVfoF0Hj1QveR0lHd9tSpYNaCzO4xk4Jmc31YMPQ5n?=
 =?us-ascii?Q?KfjKflUm3Z+TBLsmH26uVcjP7Ms/NdymsdHzU5WbEVAHisz9OJAYc/Sbgeau?=
 =?us-ascii?Q?3FAMExBM+kKMh86pwXA4irqtAfRbtEKtkBYTOvhvyqHrwy9AupBq/Q3B3uUE?=
 =?us-ascii?Q?ZURJTcwvWubbECLZ7Hsw9kHhmZNdjyIAb7NK5WUks2I21Cw6YiZMHYBqD/0a?=
 =?us-ascii?Q?EeL4Igd7xNauYjGf3XU3hzNVPnolLjYb5Sm1eBABkn6DzNteSBrCAz4NAYGC?=
 =?us-ascii?Q?OfZfoJmcenQeoYw2gOGYQmGPIL83hNJuBU75DEt1rkYSqddy0PPLII7gDZsm?=
 =?us-ascii?Q?GSbMZd26nDe2oPg1GY/8bATIyvM67cDCCjJCqLPqlUyFpR4LO/NwqKQH3d/w?=
 =?us-ascii?Q?hNA3v+Z1c0a1ZHcw/jSBM4vNIfRoTtswz7QvYg1M6GnOMcw1JBU1JzwMoSp+?=
 =?us-ascii?Q?sGLxzZMktC5X76mWxzk6Uk26W+OTSU2i14NKf73+QLjkM0+UJ1awd7x7i8y6?=
 =?us-ascii?Q?T7Uf625oBPkqx4bKqucK3G8dEbzZ2JpT7pvSAAHY4Ruz9bnE7DRbLCRMAXIx?=
 =?us-ascii?Q?SwL02EkHMFZmf7k++SCwlVbiajGPA2k5QxRWigALCxRR6VsAhmiaxCXvq1Lf?=
 =?us-ascii?Q?B1h7sgsSwWvrQWboeXMiGCcAyZBgqFpMrFmadDxqaG3RvZcgyADIkIof+X1y?=
 =?us-ascii?Q?eUK9vAyPXoWahIWsJhikp/s9rY0j0SPyBeVnlFv3N7m7a278860ScLVr1t+N?=
 =?us-ascii?Q?gMiifm+KUZkuPhKx2jy6w2FrnfmIh2CQzVyIropXFflqeD+Ngf0t1wrp8g04?=
 =?us-ascii?Q?uZ1L8EiCSDZEibmOM5Xxs2Ng91//J2/y857nUGn89BLleEXOblBDX9V8uVov?=
 =?us-ascii?Q?KOop41anrdV+HbgURR1T5HNozZiCByWn87CqeP47S9eTvaEX903U4yW9vrfm?=
 =?us-ascii?Q?nY8CXAA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P193MB0738.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aOq1OjmDAyyfyW+6UAaXtikk7G1qG8I8IC60rnTcQs36BE1Wy6BmgmKzWCmX?=
 =?us-ascii?Q?eO/r4Hk5xwwsb/89UNxPMYTJwuJ5JV/b79ADPPSqaKBftFxGtfLBeWXizEtL?=
 =?us-ascii?Q?yWgZEIqYBAnuIKnqbXdMpntPUHYhnO4eBxBQFRNM5U3kco9DJjLPGgm05kDs?=
 =?us-ascii?Q?mYyHscNFZCNAoegKG7sFRrDw6o4i6mMdRiE6QJ/LiEMZwbFjI+Q+mFQBC0SF?=
 =?us-ascii?Q?T6GNajm5F/YDs0ocjIT9mYLGE3XP4dOux/9hAlceufFrXPyu2C1UmmFx8aPv?=
 =?us-ascii?Q?IJCnS5f/P7xjuf97fdxlWvebj5zTpuSQArYK6suqPKynyOFNOTiBWT8SriNC?=
 =?us-ascii?Q?6lPi6kqa7WqGC7wzMj1mVSoJHDKtkB1U7bRtI2de8lQ+Oozrao0zrnsSzOzl?=
 =?us-ascii?Q?vzxvORnZVWxw8s1cIY3RWgn4mhJIm1Y5wZNq77js34LW9r9iHr+B7TIRYzkf?=
 =?us-ascii?Q?Wt1oJHl8QSRxvWerSxSJXMbITJQ5I3oq/KlKuUimRYNRu+Z2SKE42cyd3mmp?=
 =?us-ascii?Q?iDvTBS1lvpXCM5BSxGqeHjtzUfQTYF1cBPoHaTiw+wyjJxIdbb+WrDZaO6ZC?=
 =?us-ascii?Q?xZQ9MJUVCOooo/7lTSdMUehgD5BLCX11iIsch7P0t8C18sjsD8F5vp8aseo0?=
 =?us-ascii?Q?ah4SlYLTK+stIR17Yzc4IBFsCPGI7ti0pgMsH2XMbt7I1qoI0Z9F6e3s1Mkk?=
 =?us-ascii?Q?mjKjVH6WEDTOeVMFNG8ivX75PFK3LR8NGb4PFwDJA876fTLVsGvXCYF2noML?=
 =?us-ascii?Q?CuodrofxhnbGXVnj3S9zXJoecbkcE3zcamnkHaFBwA/aNTDV57XWkmJG+lkC?=
 =?us-ascii?Q?BeJGxt6pUBHchC1SbeejIgSOCEfSYdhaLALYGrELVS5aWQYNczqY1ck8rABl?=
 =?us-ascii?Q?eOdKvTG0YWmw+VixEqpFZgF3IeqAq8KGrq+fXeQjWf06C4okFG4W2IqlpVXi?=
 =?us-ascii?Q?0CDl8VQ9Pxwt6GUvSaiAQe15rEVTW+wGTavCyf9GwnTTqMDzDBcXySUD0OzY?=
 =?us-ascii?Q?QeeUvSwpTJSHg8datlCE9EjPIHgxHQqvTIfw+eEl8kj1hLM5IBgY9Bvyg12d?=
 =?us-ascii?Q?cvWmDkS5+mq2TWrcv3iihVNNCuA3gBHfjGf66QpvcCT7FZNO07SLwrfOluga?=
 =?us-ascii?Q?ZVe447k2GF6G5yMCEELahPzjT4t+6AmDfwXbONI/SlcZeGQ05XoQ/BU98BBA?=
 =?us-ascii?Q?kz8bytBIn9655zB/6l6qMCDc4PMLrJ6fqp9yuLGSfqzBYUNSm0orsweZjczQ?=
 =?us-ascii?Q?AzCdOgiUnDngv9YAvzgVphm1X8qebutayxkoDqiUmHZbWSgMe8lv7DgqDsr4?=
 =?us-ascii?Q?kRWo741PsgQhsR4iM1mW6GnZ8wj77z7M0EzfL6SWvqw+Q5+Z1V5wb2WjCiMt?=
 =?us-ascii?Q?rQzdXpLmiZuUGprUJ5IFV78wATa2V5oBA/UdeIzc4DpEZICW44uiTfZKLLf2?=
 =?us-ascii?Q?9rd5gkrVFc7g7Y+mGpytW7bgOZXm/7c8nxwkLW8yBI4ZRstk56JyA+ZEr+6Q?=
 =?us-ascii?Q?fYmWtN5ZiMgBZ2qeD7OvVI19wm/2/SkjppO4uO+4kNUNvhdfuMD2lmw9N0RS?=
 =?us-ascii?Q?cUB0km+HgNSZOaM84JaZ5zhC9tFOEaOgW5Fjp+WC5ATuQ9ar1l8Oy8Uh/k4R?=
 =?us-ascii?Q?Kg=3D=3D?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2503208c-db14-4fe3-9c4e-08dcf27bfd66
X-MS-Exchange-CrossTenant-AuthSource: AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 09:29:12.8728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7GYEE6HorKdY5L+nExILzwqQrqHg3cTy+W/+MuUnX8eBSgDumRUT65fmO7qUZhmoBMMdPzARAugf5psUwV9mFho7kRomVdJ0s9+RMx90NJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P193MB2407

The nxp,battery-switch-over property is used to control the switch-over,
battery low detection and extra power fail detection functions.

The PCF2131 has a different default value for the PWRMNG bits. It is set
to 0x7: battery switch-over function is disabled, only one power supply
(VDD); battery low detection function is disabled.
This is the opposite of the default of the PCF2127/PCA2129 and PCF2129.
With the nxp,battery-switch-over the behavior can be controlled through
the device tree.

Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
---
 Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
index 2d9fe5a75b06..5739c3e371e7 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
@@ -30,6 +30,16 @@ properties:
 
   reset-source: true
 
+  nxp,battery-switch-over:
+    description:
+      Battery and power related configuration. This property is used to set the
+      PWRMNG bits of the Control_3 register to control the battery switch-over,
+      battery low detection and extra power fail detection functions.
+      The actual supported functions depend on the device capabilities.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 0
+    maximum: 7
+
 required:
   - compatible
   - reg
-- 
2.39.5


