Return-Path: <linux-rtc+bounces-5598-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A7CCCFB70
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Dec 2025 13:11:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DE5F33018B7D
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Dec 2025 12:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B3033B6D1;
	Fri, 19 Dec 2025 12:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="QuRNTI3x"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012063.outbound.protection.outlook.com [52.101.66.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B42B33A9D7;
	Fri, 19 Dec 2025 12:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766146266; cv=fail; b=XbWDF6rU3wfcnyvKmfUv2Lb8I/AJGydu51fzwcVXwc8oDucKHxWpzohm7j1VTsheT1iMydstqK36iahIbuJgRi2BBOOuyLLNbfFUmfWRTdbTzukP2wUhjzGc7xxGIsuOkcdkjvqYzhXmEcZsRrGe8hClbkPH76+LEQAs6Yw5XTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766146266; c=relaxed/simple;
	bh=cQlpTpJmqiEL90BJCj1KRnaKcPCTqIaohhrSPz0SaZ4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=DbPCFqey9+LA2D6KC1AieiEuChKcGFuayfZFDXtlW5nBwt8ucWkLKvEu9lHALYQvgxrtfQhrenMSLQc53AkcRsl/+ywbmCJiS1Sz8WbpZDXOeal6M8Ino5rp2IvjAPjz9v6UgWAUWlrSx0tzomC1svy7LIECbSAT3pVKKcibtAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=QuRNTI3x; arc=fail smtp.client-ip=52.101.66.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7tka5kLuiIN7hq9WXwbNjlJBSxLdQtoz6EbOmpDn8fuUXL1Ew22EInpAppPbdb419fasRWTwWwyqBsmiEAhrDalQ3eMTbFuU+s1OgHyre+ZiNJVbPqGel3UJkmkXLE0ccYXgFWV2J6acm/+/UbSN7QCS7sB+vGhMgeJ995IErVpLy9AddFYQa12+U8UzpNrNiQuP4jzTtAdlvPC56W2T4jHvkCA/6ebpr/l067dovWvCN5YBDetPfthnyKkAveRFWZGSfxwWyTZyGISvKD8mGH90+KW9Aypzq/RXsRY7WBVxmJNYaSiSMe8dpOshhA/T+9Q/KVP7F0NumUh0MDW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OJunakGOyzvMTWef0h8nPdAqqgXs+5tew8GvtCC85g=;
 b=FolphxoYnGE71jpNW7iwk1tbsMb7ofHF38sKUqdPTR76qegjtA571EH5g8f/88BLKXu8Ue4O04fpN3Yeuw0P1VFR5qAlWUUG4zdqCJK4m3KgahngDNIgnb4n1IK1x5aZFo9vftwN+C5wSrOeBMrX8i52Sf0Zwcz3UblDPmXbiaSSed2z9nnvQYQU9Cm/ASKelHjiSKFFl0yt2owXIbexwumeskFVdq1TYSG8Zilbk7iJ+W3V/tIPUi/Z3NhG0dr7QHdhh5Cm25x93+pXalH9PdDfEGNEcUNhTboBHhxiv82rwuKWYd4mSjxCrcfRnTeUr6Bfolp14vwyoHhahv64Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=bootlin.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OJunakGOyzvMTWef0h8nPdAqqgXs+5tew8GvtCC85g=;
 b=QuRNTI3xgjuVh+hEH7KRsKSTiaqrh2pkdtS+yY8ynnYR6+5Z66AonoTvPuGuQ0cFCxYGDKoLfVQL/7UOK2VKJ1iLnS5E3YdEHDZzIbExDb94SEY2kx5d4LkfILUmPfXOrnTDrIudhtqyR+yycVRlnywR+zz2WZzlkG34xmbVTno=
Received: from AS4P189CA0033.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::6)
 by AM9PR02MB6883.eurprd02.prod.outlook.com (2603:10a6:20b:2c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 12:10:58 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::5c) by AS4P189CA0033.outlook.office365.com
 (2603:10a6:20b:5dd::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 12:10:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 12:10:58 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Fri, 19 Dec
 2025 13:10:52 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Fri, 19 Dec
 2025 13:10:52 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Fri, 19 Dec 2025 13:10:52 +0100
Received: from pc62507-2516.se.axis.com (pc62507-2516.se.axis.com [10.94.180.48])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 9151B3010;
	Fri, 19 Dec 2025 13:10:52 +0100 (CET)
Received: by pc62507-2516.se.axis.com (Postfix, from userid 13629)
	id 8DD2B42B35AF; Fri, 19 Dec 2025 13:10:52 +0100 (CET)
From: Fredrik M Olsson <fredrik.m.olsson@axis.com>
Subject: [PATCH 0/4] rtc: ds1307: Add support for Epson RX8901CE
Date: Fri, 19 Dec 2025 13:10:34 +0100
Message-ID: <20251219-ds1307-rx8901-add-v1-0-b13f346ebe93@axis.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALpARWkC/x3MPQqAMAxA4atIZgNJi79XEYdiU82i0oIIpXe3O
 H7DexmSRJUEc5MhyqNJr7OC2wa2w527oPpqMGQ6ZtOjT2xpwPiOEzE679FREB4sTVYs1O6OEvT
 9n8taygf4kIuQYwAAAA==
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Fredrik M Olsson <fredrik.m.olsson@axis.com>,
	<kernel@axis.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|AM9PR02MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: 35466210-4bbc-408a-d751-08de3ef7ab77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3BtSW9mM01LWkdGL3lmaVoyMmc0Y2FOMXNpNWZxTldoZnVrVFlYeEUwWVNr?=
 =?utf-8?B?QzNTRllYS1Z0WG9JbU1UTTJDQTk3bUd5NzRoR1VlUkw1TVZHenRGUDJ3UzhN?=
 =?utf-8?B?cUhZWU9TbmhjSDcrTGFqUnNCdUZGOUh3VmVoaklFSkRJTjY0aTBuUWpJN0lR?=
 =?utf-8?B?MGxOdU9wRnd2SncxbEtGNitUc2Vwbk5yWWhRbW51Wng2KzF4UmhYOFVNamgz?=
 =?utf-8?B?TzJRb1JEVEg2OG4rUzBOa3RIVkpLbWlHWDl0WTl4dDdGdjJsbDNlUDlKSWFQ?=
 =?utf-8?B?UG9DK2lXUmJNM0FrOGg0OTJCVnkvdjMyMi9tSnNqdTNidFV0empKeDRoQVB4?=
 =?utf-8?B?M2lYZVNzLzE1WG9reDFXSjRkdXJtQzdtME1Zbk0ySkVsTmpWWTJad0JIMzFq?=
 =?utf-8?B?RGZxUTVkekU2VVpETHZsZnZtTFlOZWxSS3ZmMUQ2L1ZGYlNVZFU2TXZtaHNN?=
 =?utf-8?B?ZzNXR1VhRVhQMGRPaEo2OENxYWZ4TUhIUkp3NUlPRzR2ODFpeUVXUWhuTS85?=
 =?utf-8?B?R09VZkRJbm4rUzZDWll1OUd4ZzBJVE9GcWErY1BuZk5zT2Q4cHZVUHN6b0ZQ?=
 =?utf-8?B?OUw5RnJlTUJXb2drM3RBV0hldXBaOTVEQU5vTWVnY3FOKzlKWE5mUHRxWmgz?=
 =?utf-8?B?ajd6Qytad3lNZnluOFJYZVRKcVp4dkJNdlVxZ1ZmS0RGcVAwSVZSU2FwYlp6?=
 =?utf-8?B?V2Q5d2NpNXZqa0lTYUtqRlhHeDVKbGFwZzBadjZkS1hyNitoalpqL1BSc2ky?=
 =?utf-8?B?NlFSdVNYVWtzWWk3VDJLMXR2MW44UnhOOU1uTjVjQkdaRVZPS2JVMzFhcjVX?=
 =?utf-8?B?bE1vTytvZmV0VUZVWW9ZWjFSbmk2SDV1YVh0WlFNZkxsUERiM1pWZnRtbnJD?=
 =?utf-8?B?N0hDMTVSY29FRVpqREZWQmEzSWJWSFM3MFU2bmcxNWs5Rnhmang1dDVIYmN3?=
 =?utf-8?B?aFdqT054bGtoaVlOdlZVM2NOS3Q5eFNzZkZIR2sxZHN6eDFFa0NwUk1BWWVO?=
 =?utf-8?B?cTNDTXJkcVFqcDlOcXlqSlhqMzZEVlhYdlFjOGFUSVBwalhKeTBUYWZtYUdE?=
 =?utf-8?B?bGIyM04xZzNpRlJtZXl2Yk1tQU5GOC9acWZJNjllRi9UbVJLSXNkeE0zWW1E?=
 =?utf-8?B?MHljT2NiRDJEY2QyOVBLdCtsRHZhSkR6OTFXWTFISHYvNEo0OTloeXZMZ1dz?=
 =?utf-8?B?UUdqK0tFVnA2NjBFYTFwVHI2SWNhdUlqdW1vcG53L1gwN0N6Q1IwcFUzeWxh?=
 =?utf-8?B?U0kwU2llODBhbkw1cGZEd1B6RFNyMWVjVGFQSlJCVThySG9USUptMmxkUjRB?=
 =?utf-8?B?RHVwRlFRUHcwMFluNWNUMkIzMm9GN3JIb2RRcGNiWENTaWVzVjJkbFUrcE1w?=
 =?utf-8?B?b0FPNGFqYXJJV09Dc3ZLbTczaFRiYzcxYStwZnNveUIwaUlVYU1Pbk4zRmg4?=
 =?utf-8?B?a0FLN3VTcGNXelNQT21lbkVRd3FDRjd2eDd1SjNPaHlEMkRYNEZFVXBXYlVE?=
 =?utf-8?B?TzhxSlR0b1VUeE5vUHpva29HRXhOMkltbUdJZHRuWnNDU2Q5TmY2OWN3NWQr?=
 =?utf-8?B?R05vMXVjTngzRkc3dTJ1YUhvK0dXcnNtTEsvYU9hZ0YvZGZMREhjWkIrT2lW?=
 =?utf-8?B?ODJJZFZrTm8xMVBSby9xWkV0YkpOc3VaVkNaTU1ZWm9KRG4vamFJZ2txeE9N?=
 =?utf-8?B?dGlmMDRQd1hNSVA0WjNIK1M0WVAwTVc1dUhNTjF0cDBWTUtnbUlkU25GQ1JT?=
 =?utf-8?B?VFpTOTVOMTRTN1dORmpMNzFVakllL2o4c1JlbHRsWjcwTjUxeVlHN1RLeVpS?=
 =?utf-8?B?OVFpVmU3WklGVEJ0V2NoTEpGT0QraHc2bzdBY0NvcFNmSTV0WFZNdjdnT0Ex?=
 =?utf-8?B?enBBUHN6Q0ljSUg3TE83TENLMm1RRWJrMTBHR2RMczN3Mk9LZkJ5MFY3cWFI?=
 =?utf-8?B?SEExUFBnVnpQeE9WUk5KT21qbFVUa0tZWXZycWFIcWx5Z1pMcjMrS2hZM0U4?=
 =?utf-8?B?dy9NZ3BPejVMS00zckhlL3lvdkZyYnVJODBuT2NPRkh3eEhqd3kxdEFOb3ZG?=
 =?utf-8?B?TzkweFp1STNxeUI3aUFJNDJzMEFlUnB5UHFvdTdEdkN4NHl1WFl6LzZNeTg4?=
 =?utf-8?Q?ui/w=3D?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 12:10:58.7367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35466210-4bbc-408a-d751-08de3ef7ab77
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6883

Add basic support for the Epson RX8901CE RTC.
Datasheet: https://download.epsondevice.com/td/pdf/app/RX8901CE_en.pdf

Also includes a bug fix for an issue with reading the weekday from the
RTC which affects both the existing rx8130 and this rx8901 driver.

Signed-off-by: Fredrik M Olsson <fredrik.m.olsson@axis.com>
---
Fredrik M Olsson (4):
      dt-bindings: rtc: ds1307: Add epson,rx8901
      rtc: ds1307: Fix off-by-one issue with wday for rx8130
      rtc: ds1307: Add Driver for Epson RX8901CE
      rtc: ds1307: Add support for reading RX8901CE battery VL status

 .../devicetree/bindings/rtc/rtc-ds1307.yaml        |   1 +
 drivers/rtc/rtc-ds1307.c                           | 104 ++++++++++++++++++++-
 2 files changed, 102 insertions(+), 3 deletions(-)
---
base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
change-id: 20251126-ds1307-rx8901-add-a0fe173093e3

Best regards,
-- 
Fredrik M Olsson <fredrik.m.olsson@axis.com>


