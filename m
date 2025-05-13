Return-Path: <linux-rtc+bounces-4090-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2B9AB5999
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 18:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95B001B61BF7
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 16:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA092BF3C2;
	Tue, 13 May 2025 16:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="GzCMJycz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2086.outbound.protection.outlook.com [40.107.105.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F642BEC5B;
	Tue, 13 May 2025 16:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153189; cv=fail; b=ob5v1Pf+X48IpfvpK9EffYG4Ea31Z6Vw+mep5c/MasPCP9Cp8kHwd5UGoOPOUh21vqDyKcW3VNsRd0iKV5vZH8p+yppCoce+TwFCRYW7MnSjiKmpShfvGbK0B5V0k9hr4Xlwi2PtkZ/tz2kH3FFHi+5fWXnYusHviiF21L+/JsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153189; c=relaxed/simple;
	bh=JtwWCfsnLRCSle9IigsH1Mcm7KHQA6XlE2qlJZKCa28=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aCMX/sImV/c6r6Pxt1zjnVMaNTu5Da7fCzcI5cpL6fb21/kYYVwGaekwGDjnY8yiBAbQLOhM2OSdRSMpTMzkPi9+5WlknN7hoyW2YI6UxoRZmGaXiMWcH7frFXYukpyJW8G5eGLfMm68ModY+evQySBPTEsWVzmZs7zEAf/7Ns4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=GzCMJycz; arc=fail smtp.client-ip=40.107.105.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5u4QkjZXmAyjd/GAmt1IAB/WWCmf+kt2Kwv3PPgJDot1kl5gIYwTif5esE2tzwTCuwSJP3Q5N2XFOi1RubfoVyw7Hv37D+DDgCzAUfg5yfOR1tekb045P1+VIQnW0qQN1cz6SFtGMqPAEOUcFMdZPgg4DciRCWgHXGg89lYpeqaeop/zMEwp5PF4trOZlCVlBUyTtwWFcrcajZjJItqm5DXIgEV5/ySoDzVkntyQuDY2d+OovHcVqT3/e9Bw7MPCQ0bP9HrwbyOakf8NP6fjCnpRWlHgY4JYcgEco+bXdio3MAMCYjoXwi/hpvSL8sU+M0w0aYIXnmKNKFMnw5IpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+0A18aQs6LwmmFcOijBKrJZEbJh7/JXhgaoKMREink=;
 b=xJnH9kbDhQ+vT+ArQWIIiM+2Dvi6if5/6ZBO/GKIC0TxarZs3IEnmbCdRiIExKvabzm+OgH1EEHQ6PyLAYST5YDMiJlPJN5bSeWT8S+igsuEnq+z9oK14tGOqkRApO/VD0Ko/MBZZ90KJLw37zr37rnvN//cAHydmKV6Is7adxaIylyZTs2M6Bi92tFKNMj2vy+elWMukNlW4pBq9x7JbMQu0cENx+Wa2Rny/pJqnOJ+h8/YTnpJoJMlTmLYQBOb8w9PbzrevlWmudD7Kg4gAvkY6aU4gk21gkh+X2KogtLpDW47yJdrJB6AVFhWp0CfALT/QwTWneSzgwC4DhAc2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+0A18aQs6LwmmFcOijBKrJZEbJh7/JXhgaoKMREink=;
 b=GzCMJycz6VyyJfZlh1fW6/EzgMRLC8mD+9gZklwhnMxEkXRYavBpmk8NSq6GzA5eXuuxsOl43pNH8tKL2WKNLr6mD3tYw2wF5PaywL2eVMN0Ui2LwaZR21EZd90trTCtZutVnBPjatZaAWKmHwqPxMcZZ3r2k0yc6/zbr/ffN6uOAfZdq8gNa5AkSnNI1bx8Ap2Fg1xzRjVnpELK91qOLtfkOnOcoPANx3mhsS96wGnLZDZr6SIl2aBFA5iGpEGqwrg+Znllx7IoP435oGOgfBjUkqhtg45steztRbPAjGE4GhaU4dQcwN+Mml4mp+kL7WbdpnBwj2t9fG8bMEkVpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 AM9PR03MB6724.eurprd03.prod.outlook.com (2603:10a6:20b:280::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 16:19:44 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Tue, 13 May 2025
 16:19:44 +0000
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
	Markus Burri <markus.burri@bbv.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/7] dt-bindings: rtc: add new type for epson,rx8901
Date: Tue, 13 May 2025 18:19:16 +0200
Message-Id: <20250513161922.4064-2-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250513161922.4064-1-markus.burri@mt.com>
References: <20250513161922.4064-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::16) To DB6PR03MB3062.eurprd03.prod.outlook.com
 (2603:10a6:6:36::19)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|AM9PR03MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: a704d912-6066-458a-47a9-08dd9239f926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SvedwwTzfMV81fBJn0T5KIkajIf2llOVChnzqzASCapE4naAMpKXW+QvtTtA?=
 =?us-ascii?Q?iJDwXDHcFLwSy8+5Qq9jzkFH0ZOsuMN46sOVEHkWJ+oOI5sy9ihTKjS/+Eq8?=
 =?us-ascii?Q?gQtxf67Xo+iqxpsOEIOQ8b9wJlOMH+Kw4aSuBNXwO6qysXzsRLPMF3mSwng/?=
 =?us-ascii?Q?CSc+YLrXdm3LDLTNpMBWC6j/9MzV6qR4GSbl6+ElWKZBqFsgt3VyZcXky6fz?=
 =?us-ascii?Q?Bp1V92nxQK2g0sFJGNUK+SmiYiKtkv1TaSaIY9CAGgKiQ3+VO1u7X7vgayY+?=
 =?us-ascii?Q?ak0ZS7+d8WfiLKhnQGJw+7bRoHik0TQquGCOJCvDAcw+rFCD/FOWSVtUlXdw?=
 =?us-ascii?Q?pr4Bp8x7WYZAEF+7NmL9Q8BZOByx+orRhiKzoGwE/1W5OveAW/MQbMipFF+U?=
 =?us-ascii?Q?yospzIoNCIKVH5h3CK8tiojYwK5fgPTcs20BSTq12bBlKQvKcisbPP8tkdMs?=
 =?us-ascii?Q?n/39rV+AbWC9KnObAEDMo1dGKJV8Z6/6m49w5ToxMCGPXZ7vHj5VUkNqMlqX?=
 =?us-ascii?Q?EuY6jXUKC3vWCRMXDgjnOq/R6DzzUI96BMkGZjr7ayMRqx2bHk7YOi6Uttsh?=
 =?us-ascii?Q?/HQqjBLvrZ6s9svplCpEx/oWTi0I/wJeHOgvCpTdNPxDoVyh9YUosZLh3x/X?=
 =?us-ascii?Q?czurj+X2R77GC3NqlD+n1J7Jmje0v/iEtvmrYcgnvgFzjEkPNKULBWIuyMt1?=
 =?us-ascii?Q?0ghH7ztv5N0EEkv2aAuIu1YRsHbMHO/W1hwHwB7LW2HLazEeBxfHNLXwv1iO?=
 =?us-ascii?Q?O+j05SyzKTKoAzD8jdZGCqPijxuB/1s6cnsHyDnzK/v2PjLlmqax5Tvn+C3g?=
 =?us-ascii?Q?HQsVW8bv7+en3CKh4Nm4HbOqjVOMfUN8qZV33c2yBnshcezWkEVPHczK4Dps?=
 =?us-ascii?Q?D4sIy4qau2E1nduNiI8mm+20a8Y11kgNbEyWwzgOcEC970OpkxP74VQcP82g?=
 =?us-ascii?Q?r6GmmvgngAg29af8XnCdn4AqyV5if/FDYFr4r9nhjl1yXuAVmIVxPdjTh5UH?=
 =?us-ascii?Q?4XB/sxeTouKjm3eeuRxqVsb2ZJZxy53Rw82AmWgWj0al3qpOfVIM4h70Msoc?=
 =?us-ascii?Q?G6zTCTGP6WA5Y9D8VCsZrCgzLbZmTvbXLTFI1FOx5NMUuTaukpBictAOHR8n?=
 =?us-ascii?Q?aW5CmdZpbEGoQ0kc4kw8+gOFmdgwXM+jrB4W5DdCb8e9N3UQYuPd0HuF3Dir?=
 =?us-ascii?Q?kCAgHajm1NiBmC0aWNTGYXlm1zNnAX+AhGAeexKAfdnJH3gU/DY7TDyc0YIw?=
 =?us-ascii?Q?gqZSCA6u0DKmeLUJ0E0U3KtAeXsPjxiIHngR/uSbxb9xxMl7zhnQt72FpuDs?=
 =?us-ascii?Q?iPPDkxMSGfmcJfUI/czk4fcMUU8a6N9zH39SH75xFrhMmjrcf906P7llAB2M?=
 =?us-ascii?Q?iqBrD/XLGATDXzlYQL3o2Zzn0AspI/wU8QEVrExSIZJBZsp0ZK1cH3IWscV2?=
 =?us-ascii?Q?YwuzO7S4mCK31ah44BMR78oocaPtlHXiCSQ3I/eMwN4z+ctIDhKt3w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C1R2UH3BNhZVxoV2gvFxq9jHiKzL+/boAts5ldUQ/vBLnVi73/tqcQ7fosKI?=
 =?us-ascii?Q?yJBhtpOiUuTuSW0BiQeTAsXSaoegvgRTmEIz0+v0WAnvyzaSXFITazpd9yWX?=
 =?us-ascii?Q?3wWh1AE0BkjhhhJJJQyRCJFRl8yADlJt5XUmtdHp+h23E38CckgJzvIpEMgu?=
 =?us-ascii?Q?KfJ0kn3d6vZHLXaIo+bs54WAbatAXC/3haSn+O1FDez3hEjJW+Ksuo8rOtQ9?=
 =?us-ascii?Q?n1I90GLMk1iavZ4L60YVyHIouHOkVLvG+za5VvW0f9g7sBjocJGglizfRhGT?=
 =?us-ascii?Q?ClxPISJO/XbAr4FmzV+bV4CdtkmrAMhCybqLK+MUL7Q+coR8uisHxfyCvo1+?=
 =?us-ascii?Q?LhRHJw9OPM6dVwCfMI7zFPcNnTP3FDCwSxVP/iwkZc+XD5RgM0drCyWbn90X?=
 =?us-ascii?Q?5nNBuByAmXD/xImIHZyieAp+9U3rBUxm7jmR0yAgd+nOAxVAuR5CLp7ttYGN?=
 =?us-ascii?Q?xqKsu8OvNdkqUkOkAsntldqjXHxF0wKR3CHP599ZS0Q0of5ixo+sWUZd0fmM?=
 =?us-ascii?Q?kcwP5vbDMWzX0fG/WrxAKsRmjqOM9df6TzQoUci6BJ4AE+V9B0qK7x70617V?=
 =?us-ascii?Q?+9hPiydUBax+16tdj6JxzwSgtd28iQwHDv4GKbi7EAVdFgcFi7Ikf0xXE5N9?=
 =?us-ascii?Q?YWVVj3Zmloll4+3vbkZNVe91bUsBKt3JMQyvxZc8PMcxxBRs/p4kIvTj5yW3?=
 =?us-ascii?Q?FWyxOnFa6twyRCX/9FQxJBp1BiVv00u5EPP8Tfh32EJf2w1/D7TFjUT4eSW+?=
 =?us-ascii?Q?8/MhOjfgVPLuQT4YHhzv4n9HWEy7qPoHNKe424Jf0Nf8ApfUqOiNUnpHr7fz?=
 =?us-ascii?Q?OGWU9HAQejvvz0wjE6B7UJglCotHsfCoCV4ao0OAMVg/U4DF3Wp4xmW7B6HA?=
 =?us-ascii?Q?tlhJLATm6z6L8VB3CJHg4itaNaTQS+0kANKPTdxHK2Cfq8reBCpEzsWhC+QA?=
 =?us-ascii?Q?G69Gem5qhpViUMFqIkPD+VDHheY6jhTUD0aP4QgRxOVc8940JuhDolAyE02t?=
 =?us-ascii?Q?v2n1La8Or1cytYyq+4WB6AZKAiWbsAboNM4J0qC+b6rezzkrXI/28lyDGRyP?=
 =?us-ascii?Q?Y5hgXfQV8PQ+wRnQHiL4WPCpZxt8zoY3rEZ8T4fbtl59VZe6wKwpIDOAxJqc?=
 =?us-ascii?Q?NBviu8OWtp9eFEVZC4yFxxOlJt5K2yKnfw7V894esqQNACY02q4/sfarim+K?=
 =?us-ascii?Q?47Uq0SWpmTYzItc1YXiyOJEF5NTpMlHVkdChMSHQFKof4miAhCKwng48z6MQ?=
 =?us-ascii?Q?PtiHabWnmryaTGQ0UnNJQzYEqVeBXCA4cgcp8l5VBVSt0yKHG3fzOX9dNlUD?=
 =?us-ascii?Q?OMtPjelvga1d7g3cjenAKWznGLyovSUMnXxoFIs4IFXD/tCwnYmchfFnQg82?=
 =?us-ascii?Q?6gsxCcNovxKMgbHTWYgrrwNevWsy18x591BPt0v3nHip9ydo68j68Va+QtcH?=
 =?us-ascii?Q?/gD+GtWZKSQvMx8IkO2NUuZXHQDRMkAI3IGY1W7i0sjiF10aEpNX5TXqiQpv?=
 =?us-ascii?Q?mI1xhhHPxCAOs2/+/C6QgTqd1856QCmlMT2tTFwJyT9ygFBbgmsiZVQqcIMp?=
 =?us-ascii?Q?gXckSPm43VzAGRD33NDgdOzsto+dBzL57CaNpMj3?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a704d912-6066-458a-47a9-08dd9239f926
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 16:19:44.8082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1sfMITAVSZbrJ4iS2tvCnfM1VlrBHcB5NFn4HLrNZ7idanIw7pO8t+GxPVBHBJjsPxJAuzIkqqc1r7c4FxXIWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6724

Document compatibles for:
 - RX8803: already used by the driver
 - RX8901: new device supporting also tamper detection and pinctrl

Signed-off-by: Markus Burri <markus.burri@mt.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Manuel Traut <manuel.traut@mt.com>
---
 Documentation/devicetree/bindings/rtc/epson,rx8900.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
index b770149c5fd6..03af81754482 100644
--- a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
+++ b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
@@ -15,8 +15,10 @@ allOf:
 properties:
   compatible:
     enum:
+      - epson,rx8803
       - epson,rx8804
       - epson,rx8900
+      - epson,rx8901
       - microcrystal,rv8803
 
   reg:
-- 
2.39.5


