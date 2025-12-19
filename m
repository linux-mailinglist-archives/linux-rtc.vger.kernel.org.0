Return-Path: <linux-rtc+bounces-5597-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4810BCCFB91
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Dec 2025 13:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE13D3057593
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Dec 2025 12:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DC833A9F5;
	Fri, 19 Dec 2025 12:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="TD5LRXOO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DF933A6EF;
	Fri, 19 Dec 2025 12:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766146265; cv=fail; b=KLLLe61FLDlkmP5j1/emtfCqC3UufOoVx9vYlD1UD6oKVLz/6j/5S/qnXRjyoxZo3Ub7da0dIS8RWPCDCwYQloIDljFE8nmefTKPZlrve0XL7GpKcMQSG1xTkyYebgVPyxQchmJ4ihxWFcS4kyNu32OeM5DkzmOzqbJyjq+CqDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766146265; c=relaxed/simple;
	bh=8HuKec27OYgcZzyjebEPpSdjUbL2OFDBgHc60LT1CVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sGXjLGY1biT/mTo561Ku2raLN4oWtwJdYvcaVCE3o+Y1H6idy50SWsnwcJTNGUuQ67NLkeCIF9B4Sh0fwyHjiaJjI9QZLeVCdiNd4MFE+GQD/l8LnRog5pX8JbfC7vHMoNnp+cpybmDtRnJWl0Witg1eh1PhH9W4kj3Y5z1552I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=TD5LRXOO; arc=fail smtp.client-ip=52.101.70.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aU/ez/PtrlWxYrGwpEk9kWd2XEf2YH91MoNdspsMIoJc4h0dI9wLotOM3T05zI0ZHqgPwqtLDxTkVX4czp35LKAMKaTPJHhjSVETYXN0xaxxH8DtCA3XTv6M6tFfIyE0bqOtFAUPYM/xFuulqQy+hRqFHBVO2X8t35JcwX1MyhcP3gsHSrXoYth+Zon+Oy3plH6Z1RNe/zNL9t7hgDcoy+qtjZZZbHFrr10qWEP3LJdiNDrzQ2NJXUlN4+s5hVoDe0l67ZsKpSqQFhhwWbtLicAJO3tW78Yhg9bnLFOxTCisy2ksrqMkrEhg4VsupwcvaGNJf8i3VB9BSWk1coy4zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CPoSwtzjTR8hyD4+FS0GjXBDo2ROi6Q8tUk4gLu+3s=;
 b=C53fz7owk7JRh6w5F7S2JEDYmspeYtZQdlu84DvOv2bZVWNncQDPNfO9DxvDq46Tiwo/ip7AoPvUhrrvTbvXIfoeUjVTnzYDozprSXas2M9BhNff09sckRFF/YVmFXQIp/vyBSd/ELdv2XSicddjIlFK1vOdGJ4a5ELxwcThTfAH2IQfloHfqD1BGpmQrKscGiR7+aIOzmrDVuVbBBrSHpWqkjkxFprpy2Fnk/WxPMHk6KBPyvsQHs4/ShbHGaLlxs2acm3UxGLj+AGaDL0zlR1e4B3MMuZ9CR8c9+5gkrYq2rG0YzhzguqImlOdU1VfHghdn/xeH9TqFs0FJxX29A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=bootlin.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CPoSwtzjTR8hyD4+FS0GjXBDo2ROi6Q8tUk4gLu+3s=;
 b=TD5LRXOOixz0JTUnR9NeBby6nUs21EUxCh2ZGLpG1v1FP2curjyLX5wXKQFzbxG9UDmIpXhG3cnDoEId1vACLJlzFiCq83Q2mm6RvRBPliPMc+olKQWSFPf0WT4G9EK1fARuSJ+5Bo7jNMtggwb2EL1pPfWPI3OJa+sVyFB03JU=
Received: from AS4P189CA0035.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::14)
 by OSKPR02MB11218.eurprd02.prod.outlook.com (2603:10a6:e10:98::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 12:10:57 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dd::4) by AS4P189CA0035.outlook.office365.com
 (2603:10a6:20b:5dd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 12:10:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 12:10:56 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Fri, 19 Dec
 2025 13:10:52 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Fri, 19 Dec
 2025 13:10:52 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Fri, 19 Dec 2025 13:10:52 +0100
Received: from pc62507-2516.se.axis.com (pc62507-2516.se.axis.com [10.94.180.48])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 92008302F;
	Fri, 19 Dec 2025 13:10:52 +0100 (CET)
Received: by pc62507-2516.se.axis.com (Postfix, from userid 13629)
	id 8F4E843393A8; Fri, 19 Dec 2025 13:10:52 +0100 (CET)
From: Fredrik M Olsson <fredrik.m.olsson@axis.com>
Date: Fri, 19 Dec 2025 13:10:35 +0100
Subject: [PATCH 1/4] dt-bindings: rtc: ds1307: Add epson,rx8901
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251219-ds1307-rx8901-add-v1-1-b13f346ebe93@axis.com>
References: <20251219-ds1307-rx8901-add-v1-0-b13f346ebe93@axis.com>
In-Reply-To: <20251219-ds1307-rx8901-add-v1-0-b13f346ebe93@axis.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Fredrik M Olsson <fredrik.m.olsson@axis.com>,
	<kernel@axis.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|OSKPR02MB11218:EE_
X-MS-Office365-Filtering-Correlation-Id: d5c111b4-9d86-44c2-f171-08de3ef7aa66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2RFREpDVEZOQnRXK1FJSGNYSExnVlduZE9sd0g5MVZJY2ZZaktXS0hYdVha?=
 =?utf-8?B?UXdhN0haTytEb2pLRFN0NThtUFBIK05xL1crSkVNdGYyNTJSMTc1Ky8zZHdR?=
 =?utf-8?B?WHZvWWF1Z2lHQkI4WkJQZUdkdmdIRXNmVmR4RXlyajNzVnhoUUNaOEJmVDdY?=
 =?utf-8?B?cjM4S2NFUjVhMnRHd1JZN2xnbDdVNGtKRG5RZzIwUE1jZkVvaVJSd3NwaXk3?=
 =?utf-8?B?VDJTOVZSVmcveHpWNmVyNWdBTTM0QmFXOVZWZ0JmRDVxTHhIb2FHcUF1R1pj?=
 =?utf-8?B?dmp1cFpJSytyTjdHbkdpQ0g4NVQ4VjViWWc1RGVFNXZBcElIN1d1VUpxWllP?=
 =?utf-8?B?TWU3ejJrT2FTMzJ1RGJiUnZ0bW5GUTZEeUIxVWlJSDdVNk5XS1JvUU95SFpn?=
 =?utf-8?B?M0NJYVkzVm0rZlBobFNaT0l0T2FXRzdqSWViTG50aTFma2xxVVg4QjFCLy90?=
 =?utf-8?B?MXNkTGk0QnRJdDIwV3dWbXJOZUE1dlBoS2oxaG9iV0NZWEVENTJQNFVHeElY?=
 =?utf-8?B?QUplajFPNEJPcFh1L01MakJUbUJMNThGUW9PRUFJdzlBb3AwWFlrcHBmbm1F?=
 =?utf-8?B?ZzdyclN6Um5uMjJSc3hNMmE1RlAzT25yR054eVcxWFd6N1plWk1hOFY2TFBh?=
 =?utf-8?B?NU4wcFlieW5oSThXeE1XWkpzcVJDaThySWFveU1qNTNQcWdsNUlLS2ZhRmtj?=
 =?utf-8?B?OHluTDNEQTVReVMyRVF3M0t3aGVUYW4vL3VJcXJpdUZsd1pnWUhKaG9vMVph?=
 =?utf-8?B?NnpCVWJ2dER5RHZpQVRtak1sQ3p3anlSNSsvbzkrd3F4NWNURjhUZGRPVitU?=
 =?utf-8?B?ZEN1cDBoRFhwc3VBTTNvTzVzNGdXZUJEZ3JMQXVOazNvVEg4QmJCU1k4a1pa?=
 =?utf-8?B?NFErOWhsL2s4b2lqRFg1V1dVL1YzVlBCVmN4bGljZno3VlN1SEpSc21OU3Fk?=
 =?utf-8?B?eUZ0STVDN3RBQUVzalBUcG5VbW93YzBJNlphMG40UTh3ZXFwVXRjZlExczg1?=
 =?utf-8?B?cFhBZFhNbVZGdkNraW1SdHB4a2RwZ0VEMzNhM2E2akJhcEpnNUZTN1FDVEJp?=
 =?utf-8?B?SDNEK2JKWFFHUWE5cWJZSW5hcnV1eDNCQ2htUHdMelM2RDk0eEtsa3VSWGt6?=
 =?utf-8?B?UTR1dkZHanduYnBaUWJSL0hibmw2dHhrbWpUbUNhcUQ2U1RFcURHT01sZnhn?=
 =?utf-8?B?NCtKZlFGZkxxMTVFQ1E1bHhIYmRNK3pnNXhDZHBtbVlOOTI2bU5PeEFINE5r?=
 =?utf-8?B?M0xvdHU4VTEyK1pQU2VFY3JHTTlHeFpmWmJNMUNyTXZkclVpNlRYREo4OHBO?=
 =?utf-8?B?OS9ucW9YMzhSZWNwVUdkTllEUlg4bHk1YmtRdFVGUHBMVFp5Ti9uZzFFdXl5?=
 =?utf-8?B?aGlzRWdxcngwVHNaNHVnK2VxRmZ4ZUJzZ0J6MHMrelBwc1BFN1ZEcno0WVZ6?=
 =?utf-8?B?eDVFQjYwYngvcGZqanFlVlFRdzFJa0pHV0hFbGRaRElEUS9ZeXFzeVR6WGVG?=
 =?utf-8?B?SHgwbWJEeUQyTFNSNnlsMDQ4V0xnSXhpS2sxM3lYZzhRUFFOL1FET0NTdjcr?=
 =?utf-8?B?cEt2ZE5lMDArUWNoYXFHVEVYNnVuUzFibFh4NkM1NjZ2ZjJOVm1VZ0RBbzNu?=
 =?utf-8?B?ajV5S2p1cVlCcVZYNlZMZDFvbkJRbWJhTzBtK3V1KzJ1blBkRGVJbThkeEZB?=
 =?utf-8?B?ZDJDMlBmVmZ0ZWxORkxyRi96ak5mRXhvMkIvMG9UZWZVcUplWkhkYnQ1NlMw?=
 =?utf-8?B?V1pkRmIwbmVsWnUzanVOVS9DQUsvOUNxRStObjl6RGNWM0M2QnRpNTMvYzNR?=
 =?utf-8?B?VFZpcEhLd05paklpL3Mrai9LN0xqYTNnelJScVVxT1hRZlFLWGd2d1RRUjhP?=
 =?utf-8?B?VzljbllkNGRlU0JjT1Y5ZklpK3dOODJDTklDTFNQb3RGRFNHTFFZVnNtdHJa?=
 =?utf-8?B?b0pEYzZ0cVFuYXprV0FsWmM5cGhERXFZWGZiMjV4RDVNQW14QkFBNjh6TnNs?=
 =?utf-8?B?QlVYMXI4RytEZHpqZExWV21zcUNZejVyQ2R6dVRSTitnRzB4ZUkrSnRFSUJu?=
 =?utf-8?B?L1l3cjZhZk5ZYWFQM1FjTk80K21BQmN4Mng4T1NNYisvNDhwMEFNNElkY2FZ?=
 =?utf-8?Q?NYFs=3D?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 12:10:56.9477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c111b4-9d86-44c2-f171-08de3ef7aa66
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR02MB11218

Add compatible string epson,rx8901 for the Epson RX8901CE RTC.

Signed-off-by: Fredrik M Olsson <fredrik.m.olsson@axis.com>
---
 Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml b/Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml
index 98d10e680144..9b2796804f07 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml
@@ -31,6 +31,7 @@ properties:
           - epson,rx8025
           - isil,isl12057
           - epson,rx8130
+          - epson,rx8901
 
       - items:
           - enum:

-- 
2.43.0


