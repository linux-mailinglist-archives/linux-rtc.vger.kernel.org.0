Return-Path: <linux-rtc+bounces-4126-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8255ABEF22
	for <lists+linux-rtc@lfdr.de>; Wed, 21 May 2025 11:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A25C1BC0490
	for <lists+linux-rtc@lfdr.de>; Wed, 21 May 2025 09:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001EB239E7E;
	Wed, 21 May 2025 09:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="SeLNvf1S"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2068.outbound.protection.outlook.com [40.107.20.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D131239E60;
	Wed, 21 May 2025 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818412; cv=fail; b=eLgoEvBlKqEJ5vItgzoS25k8AB/mzjZX7aUhi+IwfD6aqL8E/XaAlQXL5ndk0bz+6lXkOLv7GaWWCIWGbEZmPCLdhoAtAT2DsIFABMRsJHpMuJJFJJPG9EO3oQq91oh1FcoHRtQ9ByGqnWn5ykmGy5MGs9r3XZV7uoUKRlkHtwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818412; c=relaxed/simple;
	bh=h54Fsqfttc+J57kI6GX5XNnQLqbG9n8coKBMBpxrP8k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cT1f4d2Tl3EZUcTnP1G3oo8UJJ6xrM9IHnA8HDI6GJC6zDDIAM4C6RfE94LAtTCOlR1MJEGqZwZ+BzhgCnRshBd6PUeZTlidaSxg/RXm8bib+mzJ63YNhMnaZoOk5llOGBaCkAE6ZEDckbGOrlGDRihISCPlHGz0HuN+qtTUKsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=SeLNvf1S; arc=fail smtp.client-ip=40.107.20.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=srKEpYfl+OkP2I71T7hg6uScUcbX459/piiPFX2b5lZe1jX3iCbxOehwzVHq3oC/Vbpzl6HnOdat2r1maerIY5b4fEqnmyyapIhDZ+ADmXDKYz96/hha0//Rz+r4Y5eFMA5lbfvbTQlnba977lI2bjjfC3SVAZyl+vfR6fNeBL9pIrnabdJe4YKxCLUxtpl5eab9KIDdNO/KR4fMAgMrYzop6HY5u+qKUML0hhbI2IBfbR10+1nh+s8uAI1CkdI49Fr2pTslWzC7W7M7VrPJJe8OkhyaSM9fCzCf8Zic8sxX0UxxJlkJzMMp9v5LC9B70W+tztkoTuMrTeyVFjAuVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfhywwyPhH2+EQXtnNQ0SnYyoNLpb46m+gjnJJEG6Yw=;
 b=o39OGJkI1EMrsiMSi/pQJV472DqaGKSn3WJrVVtNIngHQDVDqoR3vGme1jcgQlXw36xAMWTyFMYBfp7CIO4nmlTwgyFQoNuFAPib876EvvaFids7FN6pAIyoqBR0/ang9outCPUd4ZYrohfAshu1fifPMWYnvGw/kb8soKxDWimUqjNcW6JTHmoWWGg+6BBkc+dIprmRKqR/4YKZCSor6FPMIvUbxN8S3IiZmX0PdH95F8U+EC5De8Hk18uO1eVmf0aFiYuS64ojaPke+h/GqTZoiYbAU1C6vaOW1fbdafv700FXT58D2RFJ84VrqsWaegewJDVTSFKNGFGvcWh7ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfhywwyPhH2+EQXtnNQ0SnYyoNLpb46m+gjnJJEG6Yw=;
 b=SeLNvf1SjgGUmrEGTPskY/1pqOiS8YE+rndASARMjG8dNu/f52wNgwSkpnccUGHpONf2ygDS/W6R8wyEkXBTqgb8z1FDivMNf3VlGUdLOPCaulqbijDNUyIIppBjLnlooIiQcVdggF21uSInIbnu3jyW8S1TLxgsPH0LSHUOR4X7x6uQwSm9RVJNYREs73IP3368OKEuYkVT04wMcEl4N+ebZzvUmkIcTgj4Axnc7jR3XXSHpWDI/vIai67Y0xWYJIoNznUiV1Nk++yoJ0miDceFjDlsSU++5rV0jXhYMROje5R928cpJ7V/Rzo/3xfrkPzDtwEzDe9PDvciN6hzHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 AS8PR03MB8088.eurprd03.prod.outlook.com (2603:10a6:20b:443::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 09:06:48 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Wed, 21 May 2025
 09:06:48 +0000
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
Subject: [PATCH v4 4/7] rtc-rv8803: extend sysfs to trigger internal ts-event
Date: Wed, 21 May 2025 11:05:49 +0200
Message-Id: <20250521090552.3173-5-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250521090552.3173-1-markus.burri@mt.com>
References: <20250521090552.3173-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0002.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::9)
 To DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|AS8PR03MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: f243b747-7608-435b-ec50-08dd9846d13a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t9e3ZZJVWFXOF4XESCK1BHYNR1Be4B38EsxCUgmFrAa0I7ovA3PSw7otQRzH?=
 =?us-ascii?Q?3dgfZcpl3cNNQ7aeg8vNRti5siELa7yWxoq+UeIb8xEgUJuiQNwAJ+aXRkpu?=
 =?us-ascii?Q?0pfxDqhPTrTQZGdjYETSiKRqI3shvAMWfpMufCVZCnrB79wZrea0AUS37EyY?=
 =?us-ascii?Q?tEjlm6fvIc0jmcyMLD/baBeo+UW/p3329fwFT9r3ObzfStq5r/0AxRLHMGgj?=
 =?us-ascii?Q?WKle52UJyr3Dq7GbgsnSN1svLJxw0aQyBUKhyrl94Dx+vLtPUJgK0dAgJBWX?=
 =?us-ascii?Q?6E3wNxClBNPkN2Ixinl6rKEmmVvovkMigV/lD6O/ojDajWuDcPLI6AJk4IAp?=
 =?us-ascii?Q?lBrNz/7GTKdCHx/TBRdYxt1jVV7DTWnJXgDMVHvXiutrjcYDDW9D5IquIQj4?=
 =?us-ascii?Q?p46MU/56/enE6fJ0W8Y6XU6XrsVmu8T1DbBM/uZmaENzdoNHSRbw8FVryzwu?=
 =?us-ascii?Q?VtT+sDwfejxf0RblZ/iSXBdOVQTA51ldkaMPW4qbMScU9P7Jqo0P9olHJUiL?=
 =?us-ascii?Q?zgUXEQIsa7CclqeLybOQHtAfREYXbCS2mso6140OAePD5+nOSXYRTwfL4YGH?=
 =?us-ascii?Q?3Ae6ZDUY3IoFL6H1xwIDanQa9o4DQzK4USaqxpRWboDuET4UW80+9E9SkKtM?=
 =?us-ascii?Q?x022A60ElO/cK46w8XGalB+OmGjiueb0C0XLd2xJ3lyJqVkDHHtqnWfQ/Khx?=
 =?us-ascii?Q?hN9uhFmdOw6paJ9vxB1n1PSeLPnqPhUGS1Qip7uVRHEtk1bjDm8AScnpKb6V?=
 =?us-ascii?Q?oCmTwWIbgtNCBhCZnmvnJo1cagFeHYFXT0YJvwd91eJYRUny0ABG2eWe9JP0?=
 =?us-ascii?Q?Cw529ZqBjE7r84eQEw7t9v5Zn42U/Fb1YKrrD6eqBoKosRcH+Q3cCaVaj+x6?=
 =?us-ascii?Q?6R+YLTFzB1lTyrVGvs+AMIXbnVhmrHedvx3XkglWI8/JBLwi9om+PG4jDubi?=
 =?us-ascii?Q?gONdQFZ03EYronu/HAgbFRePraXMMs83bgt69tQBJhVm2mHFs7iMpibSdIgy?=
 =?us-ascii?Q?+jqcApqG+ejnOs+ejB/YpIBZagFf5Snnm/R/Pw9rH2svJBpG/evXlhO79vMJ?=
 =?us-ascii?Q?ekHRzxF12Rr6wte9cuw3gh2BisqLRcR4NqbOJ2n3IGl9eJ4QeHKjmkFRLsFP?=
 =?us-ascii?Q?3Gsre6BrBDSWwY/pIjNXeSoIue/9phutGfO1uJX0mKqpOL4g64Fox31y+47L?=
 =?us-ascii?Q?fqpcVwzsoGWjw8RCd54iJ+JcwcLQ5K/Uo5DCmGEu+voL5AXMQgLPm2n5YwBH?=
 =?us-ascii?Q?oiQ1ricf8uG1BPZLvlaGxcrVVBz9AAgHKTEGAbX2NtdiMyD0z5P+1tngIIVq?=
 =?us-ascii?Q?t1cbaHBn1vFOXfC6MX8IC+gUIHFNV8tkZADWSJw5pPnPkIMS88cr7o3YdIhm?=
 =?us-ascii?Q?/fWM45g5GvAym6sEZaJ0HebU/q96jp5NKRV2BZlTqFQUZGRgaKg3osc9EV3E?=
 =?us-ascii?Q?8I0RhEu+CodsgtUH7XCUPyw9BUI+qA8J8webu6hr7j9mIFi4OQpvNg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a2wK6G7ENmPjIr9tF82hDvMKhfQLT1DiFMz0M8phsglsv2XBB56K/XZYTg3H?=
 =?us-ascii?Q?fpZ0IfT36JNERy82xQjIbtyeseBm0okmRidhdj4+IA9OxD4ELgIKlUgnhXco?=
 =?us-ascii?Q?X5eFjeR3yRykLKmtCSm/+NKOupwxLCjCrxVbY1OMVDf63Ft7x+pHsfyH1OlH?=
 =?us-ascii?Q?kPWldazOXYsbX3WMuvmEH+lbVHqGAhNvBxpc/PEOln/7erU5t92dKjh3Egls?=
 =?us-ascii?Q?Pu95DlKTnLXDN/DSRXLrQ2Jdg6s4l+vyD6gX7qgt/3EvZ+r9+lux+rTXGfTR?=
 =?us-ascii?Q?WR2SRnYvSRJl8hsI1oqSqAvM3SAzt5hgky0h1CGbtwQYwPDBUPc3ykXmhsis?=
 =?us-ascii?Q?p81a3glMvqrxAC4vbNQqREFQqpXy9B3bEBzrHZSn9ndygNO4/6g+T4FRY4dZ?=
 =?us-ascii?Q?W4Xozy+C3PPD4fePrDlPNdORBCdSZN/k79FJpAlMOeDAgm3pinOpLZae1ev6?=
 =?us-ascii?Q?n3y/DCC9OcymVWWFDiBVQrO1hv2CKcg/uRkyal5zUpe1YtGXF3xK0oh/XXhp?=
 =?us-ascii?Q?xIZC5A2zNP8Wj/KdOZ9+Q+Kpf8KCWsesd37UlSDNOuu18bltsnJ5n2cvjdSi?=
 =?us-ascii?Q?TUnSGbndpFXWKdt2sQA54NYlpivJpavmlzOAUDnDjJeHrIzUdy99n6bxjevM?=
 =?us-ascii?Q?2fDZdrR7bKKeWtqc0IBBvGL0SrENnGD2XMpbYFWY4YHsiDgcVO1VRxiQcD3J?=
 =?us-ascii?Q?Jp9hpm5oST9avoP1DJyCTJU/dkObyEg5Udl2GI96dX4tvagaG7e+/V0J3wKa?=
 =?us-ascii?Q?PXQdTsJJHzRO0veNJbGfLI67MCNaKS/emjJob8Vg74wd5e+zj2LzefmZi7O3?=
 =?us-ascii?Q?49ZKD6s7Cnm2PdU69EvZh3hZdxCw1lwb74YtTo8sACblVKuNHEkovbeL+yte?=
 =?us-ascii?Q?0NEe09jGGV7uVj7QkQyg5OOhwXZTlhtdkgfAIWTYfd9Upl4Adh7oNUN+JMoI?=
 =?us-ascii?Q?1OvwYuqY524zDFZ9XrupKhEtvdinDtbmvcssopWAusuOpFgybg1/WzNZFDhF?=
 =?us-ascii?Q?zLQQxKB4lHPZv0duLwpzUuvRX41nyRF7j50hOx+Jdr062RX5JwZnzvtJRc8g?=
 =?us-ascii?Q?6T6eIcb3zQKGLIyFvY52P/UFp0sah4TH2kAV8ZXCPWcfJ1e4WuDLAfNw6kl2?=
 =?us-ascii?Q?6W9Qap5KtW2H8BoTAQpYXtYGlRA0dk0QjpXMSDr32XfYtoIxvgW5y5c1yOUM?=
 =?us-ascii?Q?O65ut8eNHg5kpcOD5cQ9wHh0haY1Qwps5rUEdwyxsybG6z7oYGKLEOzp/FEh?=
 =?us-ascii?Q?/noYaMjJwtttKyFNkayu3FETGR6EdOUqDFiB2+qcxGi6LhbEQp8cVRcQC6G6?=
 =?us-ascii?Q?nvSU5a3nIUh/lIc39hCudOgkBQ8BWBqTKZrdh7NzdEsE+qtFZ+Y5UDEKHHXu?=
 =?us-ascii?Q?3jubasGl2vpSsgK7cDYdS3qR1W4f18ksbMkBudf0kN+i2BdiSlPtAbOHujmd?=
 =?us-ascii?Q?BwKCg4ULBfiDvrCL3kmD4C+ehBMYMFu6EuwkRep1Dqyc651+zyEXFS8JF/mz?=
 =?us-ascii?Q?MTfFU74h5ZBBNp0EibtrB+Xwh6NvaLb/nUJnhcUee5M8eImqYuViBApxovKw?=
 =?us-ascii?Q?/QKvpx2E747g1cCxKWyjlL/RNwPSJS0+fYZAwQGL?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f243b747-7608-435b-ec50-08dd9846d13a
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 09:06:48.2737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVrV6VQYYaUtL2tm3iGY8HOM6vxaroiFOIfbvlLeWT5GP4aIHaNvIrSMiNRCNBNf4XwxUnT7utlG9JLxp5l34w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8088

Extend sysfs to trigger an internal time-stamp event.

The trigger function can be used from an application to trigger an
internal time-stamp event.

Signed-off-by: Markus Burri <markus.burri@mt.com>
Reviewed-by: Manuel Traut <manuel.traut@mt.com>
---
 .../ABI/testing/sysfs-class-rtc-tamper        |  7 ++++
 drivers/rtc/rtc-rv8803.c                      | 33 +++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-rtc-tamper b/Documentation/ABI/testing/sysfs-class-rtc-tamper
index 3e61ed628c17..83b2fae1fc6e 100644
--- a/Documentation/ABI/testing/sysfs-class-rtc-tamper
+++ b/Documentation/ABI/testing/sysfs-class-rtc-tamper
@@ -18,4 +18,11 @@ Description:	(RO) Attribute to read the stored timestamps form buffer FIFO.
 		- "1234.567 EVIN1=1" for a trigger from EVIN1 changed from low to high
 		- "1234.567 EVIN1=0 EVIN2=1 for a simultaneous trigger of EVIN1 changed to low and
 		  EVIN2 changed to high.
+		- "1234.567 CMD=0" for a internal trigger
 
+What:		/sys/class/rtc/rtcX/tamper/trigger
+Date:		May 2025
+KernelVersion:	6.15
+Contact:	Markus Burri <markus.burri@mt.com>
+Description:	(WO) Attribute to trigger an internal timestamp event
+		Write a '1' to trigger an internal event and store a timestamp.
diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index e367d37e6a8f..d0aac250774a 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -929,12 +929,45 @@ static ssize_t read_show(struct device *dev, struct device_attribute *attr, char
 	return offset;
 }
 
+static ssize_t trigger_store(struct device *dev, struct device_attribute *attr, const char *buf,
+			     size_t count)
+{
+	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
+	struct i2c_client *client = rv8803->client;
+	int ret;
+	unsigned long tmo;
+
+	guard(mutex)(&rv8803->flags_lock);
+
+	/* CMDTRGEN */
+	ret = rv8803_write_reg(client, RX8901_WRCMD_CFG, BIT(0));
+	if (ret < 0)
+		return ret;
+	ret = rv8803_write_reg(client, RX8901_WRCMD_TRG, 0xFF);
+	if (ret < 0)
+		return ret;
+
+	tmo = jiffies + msecs_to_jiffies(100); /* timeout 100ms */
+	do {
+		usleep_range(10, 2000);
+		ret = rv8803_read_reg(client, RX8901_WRCMD_TRG);
+		if (ret < 0)
+			return ret;
+		if (time_after(jiffies, tmo))
+			return -EBUSY;
+	} while (ret);
+
+	return count;
+}
+
 static DEVICE_ATTR_WO(enable);
 static DEVICE_ATTR_ADMIN_RO(read);
+static DEVICE_ATTR_WO(trigger);
 
 static struct attribute *rv8803_rtc_event_attrs[] = {
 	&dev_attr_enable.attr,
 	&dev_attr_read.attr,
+	&dev_attr_trigger.attr,
 	NULL
 };
 
-- 
2.39.5


