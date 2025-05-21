Return-Path: <linux-rtc+bounces-4128-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC70ABEF29
	for <lists+linux-rtc@lfdr.de>; Wed, 21 May 2025 11:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CC7A1889ABB
	for <lists+linux-rtc@lfdr.de>; Wed, 21 May 2025 09:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A84239E80;
	Wed, 21 May 2025 09:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="n98/LH7w"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C1F23958F;
	Wed, 21 May 2025 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818436; cv=fail; b=Rj/Vmhdh/a3EMs1J9w2vOZXpcScgThBFWFtS9cD8LNTS6pBOZ71UHpgYsc5u9unkUlLd7I8Q3Y+808DBwXDBFUwXujKfMdtktPKC1VYeg67VAjuTTXjZp+W/iTzMpFAf1KV1IRERLODu3PqMAP8JBzh90uaSgT+E/BKCdHuLzQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818436; c=relaxed/simple;
	bh=iK1HV9qvgVDRqctxyg1V7dR529bmmnYuqmKsI/O+Ca0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lxpNulHIlx6X3ywTTMCnvDLkJxlX7zWEofIEPdomb2xzwZlurZ1GGgKij5I16wg8IHZb5TwUOCPjx4vxe9dnZFoKWGQKT6rcE4M8mFXaQbjgVpQ1lJSnV9btawtU3qX6okt4GNdeAItwu2vlRH6Fm51rP9TVQCmy8riE+JyKpFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=n98/LH7w; arc=fail smtp.client-ip=40.107.21.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZYqmCzhuoGeDyGG+SF13lkSDwDmGNYmmCBQEEP5y8RvvVW8kbMOfXOq1UbI8Te3CAmqUAIDRw8WS7mWxkceTODHCkzan/13HKXQhCLu+hcBPY7Ynvw1vwRW252mF3PKX6QkJM1VJrka/p0y2YcMJVvU/ESgKEFwHFbcnZM6QEbt+fv9ufjm/3qxegH/gqNPw5u3E0wDeE1Ps0Qs6GJ2yKQxjtvWup3BEm5bGd+Wl+M/BUNuzKkLU3+JQagmZW5oKQapQbhXCCuDj/dVfnYnIJN+wDx+i+5SuoaLb2pQMDfwtMiNjAM8DNKCjOkCpNXHYFykGI2tg0PQPwgLB7ODfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYaVpEBhq5G5+PeOJjCdTaXasPhlHa8+UO/9rH1Z20s=;
 b=M1LyxNA4GClsJZGtJseVmNsaScCnrIDy4zh0jgFtmr0RaeSzry93ppPOZpLdb4WH99I9tMiHAMgHCm4PHlTn8S7ggutLVox/nHCPMCQw8OAJaNsURnpLVMo97+nDfRm5GPvBEt5G7CceqM9168UGTI/UM9RNmIgrTsZZeA0IiLa//ZKMVOiR9rIR1VIucn3TKVFYIBUFbLDedvGRXrTFUY5S61VX3JRWYIcokWRPI5lVwi6ihewP7SEyfOezwMOVe3yXdZ/FWHG3+cMBFNa9iMi8qz6Bpl/c+7vgwfMPYRLYj69HO8u4EvMBhl2JqJI94EoXezsbHwMyhCeO/eVaiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYaVpEBhq5G5+PeOJjCdTaXasPhlHa8+UO/9rH1Z20s=;
 b=n98/LH7wpy5odCtr/ZmJ/bQez2aSu8BKee7KKbqqNLjkzagnTgWjCzQbZnrIAPcvMABbeSRmn3wkwAIKWxpd6wsQxQaca6AwwyxoReZUbQFuwC+2/ihW1j+EBee7uJ2d/6VYpftjR4qWAxV3UNwmCoLaaAmoMGZwQTUnq7fTPfBqS9LOZtS6bg9BovHijviNEbqpVlyRtx5HlskAD+9iOcTK3GMMQ/yTbdN3e57UKMGjxA0cBeRYQBCqvMROJBHWhfAArR1MFbS866T1EDiKsncFJCOJRsgT5Re3YEMPa+AH+9vKfVtbXTlfNZVoJGNEOFcEsJBvIBeuGI98oJT/LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 AS8PR03MB9486.eurprd03.prod.outlook.com (2603:10a6:20b:5a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 09:07:10 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Wed, 21 May 2025
 09:07:09 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manuel Traut <manuel.traut@mt.com>,
	Marek Vasut <marex@denx.de>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Markus Burri <markus.burri@bbv.ch>
Subject: [PATCH v4 6/7] dt-bindings: rtc-rv8803: add tamper detection property node
Date: Wed, 21 May 2025 11:05:51 +0200
Message-Id: <20250521090552.3173-7-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250521090552.3173-1-markus.burri@mt.com>
References: <20250521090552.3173-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0176.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::21) To DB6PR03MB3062.eurprd03.prod.outlook.com
 (2603:10a6:6:36::19)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|AS8PR03MB9486:EE_
X-MS-Office365-Filtering-Correlation-Id: 025675ab-320a-4a36-2636-08dd9846de1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jyWgYt3NjgVHlFsqiPHkZrBmw9K4YntuC27nFdGAqJG3N2e9/r/oserdmG1N?=
 =?us-ascii?Q?SK71I7Cir+ZpTBycycvTxGoqT9tjGNWmtqV0IIw0HYG0EZHtbtURx4ph8jCq?=
 =?us-ascii?Q?FgXvfou30pJtSXf5sb3en2/cCpCAFW78oMJTdfyGaMDU9qzr8gF1zMBvslmM?=
 =?us-ascii?Q?a2wWnXr+RG0wBKqo0aGDdZtEbW1WuF1ZgUGz2j9nphjjat4W7NGqMpaSnYuk?=
 =?us-ascii?Q?Aak+JM3qivJqmnLoimHYDsnT8kY/UsqhTPyTplvwsyijCGhZCVMWDwh8N7F/?=
 =?us-ascii?Q?/xhRqssqSBGO8xEAexZR3X6jcE+QP0i8CQ1gBP1xiStNBD1v0s4yIM11ivKr?=
 =?us-ascii?Q?D7sAQIjjF0X7uymR08GTBiANOeEhDI3PcI9BfQ677jQxYMlzshY8wRCEfZZh?=
 =?us-ascii?Q?ne+bJt1DFupkCpjVPdCW3SXd26jeM9UVouc9Pdpqnb/kXq2I7JNk5Cn29uQs?=
 =?us-ascii?Q?orH8NOrvCtQfQSWrnDfyJtW9aDCA9pn+Du5J6lXQzAAqlLVJGU2v5QDL84E0?=
 =?us-ascii?Q?UPpj0rA1p6e3943aJHHisrqhQpIZ469S6UzrVzBEF4ldxbBv7hfaMxYzRq4h?=
 =?us-ascii?Q?eHxlRLol8rsXqdk2hO8WglEMdYQvoPQXllbXQhTFHKj1qqGlx/hhi899e9ZQ?=
 =?us-ascii?Q?jjGp8zz5cI9omfZLj3sn3sZe0knxjiSKrpUOtw2C7iz5jAhA6U/xFcyaAqEr?=
 =?us-ascii?Q?ekQC8m8gR5fH5TcJ15QOdKb/ZojNH1/b7/DbWu0LRggDgb4YCzvMjkU1YUWh?=
 =?us-ascii?Q?M3hz0nnmznAa8cW/tdIbbjootKuxZqHCG+scCyCryw4AikMXoHzTrJljZuhl?=
 =?us-ascii?Q?1kipWjHITaK6/IKZv3fMmKPt0B5sEhKhapdg5kjfwp0eAofhM5imRiLyXBwx?=
 =?us-ascii?Q?2PNBr5stAskkcAIelNccIDyRJ3o5Dx3pzS6TuM/zxR3sK0O5XOAYjYfXMu/D?=
 =?us-ascii?Q?U+jvSzwOdlFmcFsPD8qn1oeGrz+nCev2f+EPNmUnrOAGT/2W50s20q3DWu74?=
 =?us-ascii?Q?LKxEYivTzKLHxA2Z2MLp+MTbmxAMBGD/6dF22e2nRohYYFpl3cHtHMUc2kVI?=
 =?us-ascii?Q?3NnN4Bw7op0ZvLn4MF6W/c51HDVTDQfvw7ito6k2RVvS9Wz5a02NHYu9X3ek?=
 =?us-ascii?Q?L3Js6Hz8ZcXonxKabJ4cuUIb6Z2ynGkYw3khZZLMeWmGIzQ9L2X2FofN8lWj?=
 =?us-ascii?Q?69tE++FvcuY0DsqgkkdeANplUlu5a/RmS/X9ZoQlxIC/rA2l7zysqSDsbCEr?=
 =?us-ascii?Q?LjSOAc/itUMOty8CKI81jlinbHhA/CVE4n7ZgtLhjq+7jzTkoa2ktXJDwA+9?=
 =?us-ascii?Q?tSGTEKx1XaC/N/ETuvSNxCVCBjiM+PHSANomtPg1DpFfXyhSc+G1oaKDLKtw?=
 =?us-ascii?Q?rOk+xiJuI/JC2RKB/thQPkl79391gE0xn7W/ulc1sgKdZhR98ERR8MAFKGu4?=
 =?us-ascii?Q?nrzABs42X1661z7yZ087yAnfJ9bmDniCIBUbI+uq4uYXuIN31VGSNg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sYLmyoBPQp0OU7tpE7N1ClQpgRDW/1DlcjjMkDTbOfUKHlxiX9oDYbY0A2av?=
 =?us-ascii?Q?TdcrVIH2tmUwWKbzFcPI97oKvjVk42hslB5foOh0eSXUHTxLxMAgAydJxNz7?=
 =?us-ascii?Q?VR+JuciwyLP4fKWy7zNeMxSKMNgTvYMI7pzxgsysYtOreuokSt8fp2CAe0jU?=
 =?us-ascii?Q?i6qS7vv0NwCalElJCt52p6DCeeDN2LyZwmFQdG27JiXU8KG4VFVBDtm9aQVU?=
 =?us-ascii?Q?CfZeaO0GshNppKIQ006IMUQlXa5kL7WDqcjItf7ws+hVfdxdE8CUEvninQnW?=
 =?us-ascii?Q?YL5xBBYc4liTQ7yeOzmwcK/jlVGmzNioxnidjRaI3HuUO3dXcVMhoSUmPAy5?=
 =?us-ascii?Q?qb7ThSNtJqV+0msTVv+eYQC2IeyekgS4pCv7qAdkkAG8VZLOjwwbMFpr9Vbb?=
 =?us-ascii?Q?QOZgwGcOeRay2VunT03U0jcA5LbB4PiT8RQsYnEkOkte5ZidGZbDW1RDim4w?=
 =?us-ascii?Q?dxkeIYtJwZtukGG4DfManVRXfPvGRHnI4IrtHkGVjlbRu28XVBBBNSd9IdLE?=
 =?us-ascii?Q?99xA6ZwqW39O79lzLP+PcqPJFTjxmIlHgF8CnpFLW6jd1ZC3aWB5COXQDK18?=
 =?us-ascii?Q?ANF72OSWsmZwZJifxrqd2bPVhO09z97+31ZlWGf/bXCpvicIwmQzsIn326rs?=
 =?us-ascii?Q?hy/U5oNUz+H+BwdsC6aWce9Q9V6JqQuQPWa8TD4WinfKehRGywGXiFiKEIpc?=
 =?us-ascii?Q?nPctxO/heNeVjXYT6J1lo/vqGYO1moVJD8wAaZY7UKPnHrmTxo+hHnX+pqE9?=
 =?us-ascii?Q?c88VF3PDl0t7ks+NdPulQJNIhtX5koZbFtPgF7Y32NivfAO7ChqaNqXJrztq?=
 =?us-ascii?Q?OuRxSb/nGur8GgU6YuHukMuzDr1C+tv72sXAeQaHbrBWTexaSn/4MFJ1mT6/?=
 =?us-ascii?Q?Y2427KN8K+sz9tWz55acRanDKo+wyVPn7eRu62ogNLoDETsss7k6aUzzq0pD?=
 =?us-ascii?Q?/fHMpYGUpeFgfaJeyNLsdOIXwxmZ4qz7FMKNEjMeTD3/6R+OPOcHyF61CKXx?=
 =?us-ascii?Q?+AGcZU56yh3Wk2tCnD4vCjjABefQk5UCp+CD3mSKzSB0rjEja7sCYLnLlli+?=
 =?us-ascii?Q?v7TzJuk+AWOboPmBul9y0zgAIM9k2aG1qKIaQVSRZL10FxlirfdlTpsek+/g?=
 =?us-ascii?Q?yyz5sIqFN3TpkfklJ0M2kMdhPQoMmOXU5/n2UdN27o9kHy4kcqooy8WNlE1Y?=
 =?us-ascii?Q?XiGA8zw5MNwlJjFYe96YCYq1lFuQY/9kLcgMt5C3yK2oOP1w1I1cl+Nk1xAd?=
 =?us-ascii?Q?NtF7flpO/qsjJKC7R3FNAU7/7yneKCiFeBJnkM2OYvZQM+ftylV+kIGGj9nS?=
 =?us-ascii?Q?PcGswS+D1Lpi93boGn7BMC7butcCqx0RVyb5bIwjjEYzr5X3irct/gDnFjKO?=
 =?us-ascii?Q?Oa5qdqe4Cr3phoiYWhtVWZ9j1dr5iqeJtnIbBqWUDXQmEf7NSiEFXMwjZCNs?=
 =?us-ascii?Q?6LLt8Cxg6NXgcXl0yH5qNFGUfmbzzRIM+X15HTybErYSJZf13SzvC04Xd+vV?=
 =?us-ascii?Q?TDPK8ihKa/aSjRCrrmWESroVxXkFfvS13MmBsVCvl8ahrKyjjPsRS6/WQ4T3?=
 =?us-ascii?Q?x/zJZuYdSiDU4j68aSuwrxoS6wv7Oy9N1tNkwB/x?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 025675ab-320a-4a36-2636-08dd9846de1a
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 09:07:09.9002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PiVEeTi/qgm9eYY2mYQbpAoYHksZA7uCVBXPn9Cv+44w/SPyPdZ+2joe5x/jsyuirA6Vqs1tmCKVSDnjiy/Rbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9486

The RV8901 RTC chip provides a function to store timestamp events.
There are three input pins (EVIN1-3) available for triggering.
The input pins can be configured and adapted according to the connected
hardware.
Add document of tamper detection properties for epson,rx8901 rtc chip.

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 .../devicetree/bindings/rtc/epson,rx8900.yaml | 37 +++++++++++++++++--
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
index 03af81754482..2682cbb9097d 100644
--- a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
+++ b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
@@ -9,9 +9,6 @@ title: EPSON RX8900 / Microcrystal RV8803 Real-Time Clock
 maintainers:
   - Marek Vasut <marex@denx.de>
 
-allOf:
-  - $ref: rtc.yaml#
-
 properties:
   compatible:
     enum:
@@ -33,6 +30,40 @@ properties:
 
   wakeup-source: true
 
+  tamper:
+    description: Subnode for tamper configuration.
+      This subnode is only available for epson,rx8901.
+    type: object
+    additionalProperties: false
+
+    properties:
+      buffer-overwrite:
+        type: boolean
+        description: Set the buffer mode to overwrite. Default is inhibit.
+
+    patternProperties:
+      "^evin-[0-3]$":
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 3
+        maxItems: 3
+        description: External event input pin configuration.
+          The configuration is an array of tree values and contains
+          "pull-resistor", "trigger" and "filter".
+          For a detailed description, see epson-rx8901 datasheet.
+
+allOf:
+  - $ref: rtc.yaml#
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              enum:
+                - epson,rx8901
+    then:
+      properties:
+        tamper: false
+
 required:
   - compatible
   - reg
-- 
2.39.5


