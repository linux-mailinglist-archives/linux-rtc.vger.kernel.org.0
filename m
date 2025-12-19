Return-Path: <linux-rtc+bounces-5596-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F505CCFB82
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Dec 2025 13:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13A7F30380FD
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Dec 2025 12:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508E333A6FC;
	Fri, 19 Dec 2025 12:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="azJtDbYw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010043.outbound.protection.outlook.com [52.101.84.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714262459E5;
	Fri, 19 Dec 2025 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766146263; cv=fail; b=AuZ5eH59GIQwTsNQntW8W3fgzMBBgdk7m+JzZNVDRCgaFSYDd9FGQbYhgcuK46DX6oMmASqnkRlN5bO6PxoUUkmhVpICDScnFMQVQYMx2Tad1bS5EtXvQkw+tFhmtJLllAmCxJByvLY4503i5vNDTr6VJLDgYA/5bS0cqedNtJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766146263; c=relaxed/simple;
	bh=5vEklaigwb/+oZCp2KNuTbPnxTCpW97fFRIqXjWpBu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nZqC+4vP/Jf7umAVm9kXhZtYAnSnSXGxtzVXYHHeEqgU5KorEgEkc+xMW+v/bhNW+S2ny7epq1UlzIzBj73l/23xUqR6qRkaCekQ+UCgqatlsd1ajlbRE92BXWWN/8b9v6bkB1f3QD82E7f2B+YjKSf5Jyn4V5j47XkjR0G6OpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=azJtDbYw; arc=fail smtp.client-ip=52.101.84.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSUhhKB+9RhBRA/1hCIxsMZ88tFeKFTIMpyDOZHRKmTADJ+QxTziqkWqywmJwPnF1o3QBFk1vc64jyrMwW9oQWgMXOdD5cuL3Y1tzF2MtteMOcINiHY32jzSP4Fhbe/N7AaoWwi3/KUrM9k3Q5RV2n6e7/CHDv1OeqyowdcrJjB6BpFz8ylvJ2GizLgkTO1IFDGTme6EjNrsBEif7c2SkouVEyegO8qV64VPA6XnjWomeyCyKPW7w2g3osnA+bRw3O0SJq3ccYmoYmP3G4yc2amjAzkEDEsoiOaGDc14AR7nVmG6gKXLsX43GIWYUS5LTe0NlEbwCz6gNkQv9RyMZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTcmaeCZHorqefiK4rxyqWBrewZKDbSSbMWMyMxqKeE=;
 b=qzzIPOha0waJDTSDlT2Dsxbh3MJ3l4LgYA5mtqSyHbLXjTEsEHFj+2vH6voh+FzuMap31CUV5GepnIKm5bZiaaOlxeVXLwfbGu+MxG050RXAlxBLc01v77xcMifIvo+YqLwY7Bmvc83WbVuORI+XjjFn1agDhffdPJ/RLOwqvBaQudikPtFPpdYpaO4XjECn3BT2zaXCxYVhAk+b7pRkEs7rvGLjDM5rI+xx73j6pTAA0/D+wrxjtTSp1q1+wLT3tpzsiW/h9MDnZsg44cNZNC5GLeXnw5aVebhNkSY6CsQ0m5JaIpNZD05duE3yspVJXLRIRu39/gUcZdL2jo2/aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=bootlin.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTcmaeCZHorqefiK4rxyqWBrewZKDbSSbMWMyMxqKeE=;
 b=azJtDbYwDQ+GqEJSlreTmyQPmox3t1MOgYSK5VsZHuTAgn4vrz1Ewdo64xyBdTqrpzbtrTdZJqYMjVX92coOklPtyT9yB4QBUzqqpBofaAlowNsmsxI9LWmJqEZHDtezT4zt+cZx7bDA90JCXhKoUKfZ3+Itxp1N3Culyg4GGu4=
Received: from AS4P189CA0033.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::6)
 by PAWPR02MB10239.eurprd02.prod.outlook.com (2603:10a6:102:366::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 12:10:56 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::d4) by AS4P189CA0033.outlook.office365.com
 (2603:10a6:20b:5dd::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 12:10:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 12:10:55 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Fri, 19 Dec
 2025 13:10:52 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Fri, 19 Dec 2025 13:10:52 +0100
Received: from pc62507-2516.se.axis.com (pc62507-2516.se.axis.com [10.94.180.48])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 947323040;
	Fri, 19 Dec 2025 13:10:52 +0100 (CET)
Received: by pc62507-2516.se.axis.com (Postfix, from userid 13629)
	id 8FE8641ED2A2; Fri, 19 Dec 2025 13:10:52 +0100 (CET)
From: Fredrik M Olsson <fredrik.m.olsson@axis.com>
Date: Fri, 19 Dec 2025 13:10:36 +0100
Subject: [PATCH 2/4] rtc: ds1307: Fix off-by-one issue with wday for rx8130
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251219-ds1307-rx8901-add-v1-2-b13f346ebe93@axis.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|PAWPR02MB10239:EE_
X-MS-Office365-Filtering-Correlation-Id: fbb05e55-9af1-4178-a4fd-08de3ef7a9c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVhqUzVGVDkvNmw2ZXg2RFpEbGZiN3g3YWNHVzlGd0JnV3NBODBPY00xcWpw?=
 =?utf-8?B?REZGNXNWaGltTlhPZjI2cE5TVTFzOU5UMjcrbWE4QzRtZEdRaXQ1YjB3YWRT?=
 =?utf-8?B?SWRSdlB3cG1PdS9MbkpaY2lGeThFS3JxOVZleERFRE5Zekk2UzR0OHBhSWJX?=
 =?utf-8?B?MVhRYjl0VDVSM2pydEdSQXl1MFZxRm5vMVRBdTIxVUFWQ1VQZFg5Z0poVm9H?=
 =?utf-8?B?S2pOUldjSDl4eFFrY3YvSTZXUXZ2cFlCVzZHeHBId0lSVmlmWUtNdmtUL09w?=
 =?utf-8?B?Mmx5eFcwL25haGROOC9QSTRzNmNIdFNFNFliUVF2S0UzK29pNVhSYUsvRDE3?=
 =?utf-8?B?c2NndnFyUlhFZ2l3TXRzYm9lSTh4TFViaHAvVEM2cUl1dVNpamw4SGdLZjZ0?=
 =?utf-8?B?dGtRalBlcnRTOUF5bVRSeDFndGd3SmFGeDF6bVlwSGZzaHY5OUhxOXI4bUpN?=
 =?utf-8?B?cmRCeU8zRE11R3d6UGMxWXhyNks2QjJsdGpxbXJ6WnV5NWgxYm5mdjd0cG1J?=
 =?utf-8?B?YTV6R0Q5WnVQMElqSWI5aU9rTU9qbmwxMlN6YTF3NUl5K25HTDVJZEhUTnlG?=
 =?utf-8?B?TEViYXpXT29TS1V0cXd2UjR3cDRaVEYwM0loeHpBc1ZlSTE0N1BDdHFYQlFR?=
 =?utf-8?B?a3QzeEx3UW9wUjIxWitQU3BCNGNmSHhQdGFSWmhvbVY4bGJkWnNSTmRMVWxJ?=
 =?utf-8?B?MVNLVlgrT0lRQnhuUWsxWnp5b2NlUHJqNVhTdnRJam9XVEc4Q1VuaTNXUGY1?=
 =?utf-8?B?RTlzTmFaYmxFNkVlNGlIdUVNV3Exa1hGWmo1RDlrdGthdE9EV2hnKzlKK3hC?=
 =?utf-8?B?aDVUdVFBMTltczhzbitJZWVrUDk0My9ZM2xzaDNvcFg2Skk0bkxOOFYrV2c4?=
 =?utf-8?B?Mm80TmR2MHh1Nkh0eEtBVWRGWWVxUExQblpGSmhLYXlzR2VvZE1zT0l4OHFZ?=
 =?utf-8?B?QkVmOXpQVVpqZ0J0bFNvSysxZkFOVmt2OHc3K0VVdlUvZ040ZTFnb3NQa3Js?=
 =?utf-8?B?VTl2UGZhblBoYnAwcFZTcDZibVV4TlRBUGJ5UXppRldFUnc2WjRXREZsK2pG?=
 =?utf-8?B?YldkSDlHTGlCSlFITnRsK3JHQkJQWFJWQ2c2dm5leGtQdSsrTzNBSTdDQmJW?=
 =?utf-8?B?UXJ6M0xZNFVIMi9KQTB2bWdxcm9HMy9NVXk2dmxZTm5Ia2x0U3hSaVdmcTgy?=
 =?utf-8?B?ckNTeXN2RGxSS3RnOUlBNVpyd0psQmVRT1RxcDErNC8yTmpweUJaaDAydlQ3?=
 =?utf-8?B?cGsxVXFjWXlzdEVNWGRSTGFqQ1B2SHVvWHEzMnc3akV6ZlRGMTEyVzZtQkZN?=
 =?utf-8?B?d1pPQU9QNEhSYXByb1JXL1ZNY1Jzd3dlVEltdisyOUtlbmhoVmthQ29nN3Jn?=
 =?utf-8?B?eDlYT21NNllYdGJ4UTduSjh1eXFMaUpIS0crSDlPZHBzekNwSDhrek1SMEMy?=
 =?utf-8?B?cStNQmpXNlphb0Jwa2ZycldQc09CYjFiWGhYZVN6WmErNG9JOWRuN1o1QStK?=
 =?utf-8?B?a3EyK3V4NXNRWlJUMWFBTEdEcHhUWWRTSkZWOGRjQlh2NGFtUWM3VkQrK0Ew?=
 =?utf-8?B?YnVqWDJIZk1ONTl0V0c3aUNUV2VncWhyWTlQWVZVdlg1OFk5b1VsUWljbnJM?=
 =?utf-8?B?OWpXdkRxdVZvTWc1YWpGZUFiRHF5SFluT2FKeENPOUpoWUV1d2c2OVBnR1J1?=
 =?utf-8?B?R1FMQlg5YVF2dTh0ekJVS0Q5bUJqVFdOOEVHRVE3UmF4RC9jWXViZnYreEh0?=
 =?utf-8?B?cHVPTitNUWlOK1A5bzRWdTBQZzdTSzd6RitaMHBCTG1naTlXeGV4bVVSeG1M?=
 =?utf-8?B?TFU2ZkNnWEpCWWdXeXNGMktHL2xEUUIra3RITXViazhrTjU0d2gvdDAxeEQr?=
 =?utf-8?B?bVVLRGhESmVHS2NSMERFT0E0eU1LS3ZyUmJXNzYxV0RBcGgrdXJBYi9EekJj?=
 =?utf-8?B?L2tremhmcjhWODV0dWFqN0xmZWtVSEp4QWJLSndla1Ruc1cvYUcxdi9neGxF?=
 =?utf-8?B?UFhFemxXQnA1elpOK1NaZEoyL3ZQckoxM0dwdEx6MXZMa1pMaVBOcFJmQitr?=
 =?utf-8?B?RlYwN21zVFdVQW9DTFdYeHVycXpCNDdiUG9SUWlkaWpqWXNxaE5jZ0tpTjJO?=
 =?utf-8?Q?kuJQ=3D?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 12:10:55.8707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb05e55-9af1-4178-a4fd-08de3ef7a9c2
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB10239

The RTC represent each weekday with a individual bit set in the WDAY
register, where the 0th bit represent the first day of the week and the
6th bit represents the last day of the week. For each passed day the
chip performs a rotary-left-shift by one to advance the weekday by one.

The tm_wday field represent weekdays by a value in the range of 0-6.

The fls() function return the bit index of the last bit set. To handle
when there are no bits set it will return 0, and if the 0th bit is set
it will return 1, and if the 1st bit is set it will return 2, and so on.

In order to make the result of the fls() function fall into the expected
range of 0-6 (instead of 1-7) this patch subtracts one from the result
(which matches how the value is written in ds1307_set_time()).

Fixes: 204756f016726 ("rtc: ds1307: Fix wday settings for rx8130")
Signed-off-by: Fredrik M Olsson <fredrik.m.olsson@axis.com>
---
 drivers/rtc/rtc-ds1307.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 7205c59ff729..bf42c250ea7d 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -308,7 +308,7 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
 	t->tm_hour = bcd2bin(tmp);
 	/* rx8130 is bit position, not BCD */
 	if (ds1307->type == rx_8130)
-		t->tm_wday = fls(regs[DS1307_REG_WDAY] & 0x7f);
+		t->tm_wday = fls(regs[DS1307_REG_WDAY] & 0x7f) - 1;
 	else
 		t->tm_wday = bcd2bin(regs[DS1307_REG_WDAY] & 0x07) - 1;
 	t->tm_mday = bcd2bin(regs[DS1307_REG_MDAY] & 0x3f);

-- 
2.43.0


