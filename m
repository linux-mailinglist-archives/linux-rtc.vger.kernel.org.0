Return-Path: <linux-rtc+bounces-4125-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C93AABEF1C
	for <lists+linux-rtc@lfdr.de>; Wed, 21 May 2025 11:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A56C1672A2
	for <lists+linux-rtc@lfdr.de>; Wed, 21 May 2025 09:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E9423958D;
	Wed, 21 May 2025 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="T5rKyF5a"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2053.outbound.protection.outlook.com [40.107.22.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5DB238D3A;
	Wed, 21 May 2025 09:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818408; cv=fail; b=FweqZYM7hR3dRwoTp1XxStBW8vtuY33/lqMxDdfsZX4tHYEsmTIfEeI6AGU7MygYonPT7rP6AmlDu8azhNa5TjbVTNrYlWI9ZNlwCjWsCUYI0HCTYViy7PmcDFznJFcvSoOVPihocNKdZCNvF+jdTEIoMg0uNpO0SIUyhiDk9hU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818408; c=relaxed/simple;
	bh=SzAa1zhmlr/TLycmHwE+rKqnbzteks96QW5pKfe/Hyo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D2kb+DK69u9QIFHbVkawnpfMA6oN+ChJd3zfgbUnrJpMwk45/JU6vMTES1ftJLwlsrfGfD0WO4cuiC07YavJVe7/NVWvYPHkceX7NHn2YJQlPg+aEkcCfi/+n9Mv5WnvliblEonluPsYaTPtG4/q2KGUTy0/7vihSGuiRoXK5mQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=T5rKyF5a; arc=fail smtp.client-ip=40.107.22.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bl8xo+narxf0eQ7W0KA7P2I6iG78z9VrTt97pFQSdsUJFHhVK15lZZxqvWIDBISr7O1CE0oWehTNnKzPB7pDL7bq71K9vpcHQbGhCmXL506fL6bEs4XI3BdtetcXjuXyHAQbzzoPW42oTKpKqeMYq0Y5ywOnjxliDvnBjer7Rr//gh7ZeK6t30eQL7lFxZR94nqfALwjDlpg1hCfn0HtiY5HfZM1NAFh4GW0/W60D4Guqbfo3rKRct3ChgMIywL9uSzNIv8D7yVPACDugMn5dH937Jj0brhJtCqLE0yxeB6yJNCZXrR0cUxNdiMBygfXb2JIGgqiSTOwatERpDCPLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xhsa9n3P6opxCU0Uj91w9kkrP8yAgn7lIfdDu4qlM80=;
 b=QsbiDorX5pd8IXeDhDYuWN8Imeu8xSbSM6biSmrVcNL55dbSKx6l1rlfAv1OEBd6DSmc1XwgJXlWrySxWpLwk1+zK6Bajt09gc9JtSbrCxYrb8mO9sUXp/sEjTpgtd729Rcx/4rzjcIXLJju3cAlnR70p2zFcH1O5ijD5hIFM/amI3Su3cjenb+9MIL2b7hPOWtrXUWC754zq4sSC+DcJ3p5KKLfj2jepiiofCcHH3ibiwa9QaqrJxkSboaTjmHzb1ZTgFDbfdnY6S6IiEaF8XjQW0XQSP7P6s//bRWd6+0hiBJ0Bs0ZAXP5IQ62mtBPmsbrgTjwgsg4jCzcI0TWZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xhsa9n3P6opxCU0Uj91w9kkrP8yAgn7lIfdDu4qlM80=;
 b=T5rKyF5aM0t+H3XBfsvcZARwi+2IYxNxS5AhyV8Y+c/NRKGotFKGcwUa6E9ItIoTKovR2h8V0yluJDhP5niTaJpQC4sIdxYh5j+5GHAmC4Hnk2McW5IJM1TiKIGfNOCWhVeJ0WTBZOXmpOttDH+44SWIGYXAhBi2f3MvY41k02xWNqcfq6ArMeHtCnk4FkNQjr7mio7WZ7JvZx/I8C/X6d6R5souFj3XQrX4n/95jWu5bHgBVIQNlLGeGGnG2uIDo0jNMRPyjsltqp7kGxzSlC78V0I4dGGA/Brw+LHkZLLgs0sONahRrXJRD3atFVB5mEF2Tj5KWjEoKRtsIHow+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 AS8PR03MB8088.eurprd03.prod.outlook.com (2603:10a6:20b:443::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 09:06:41 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Wed, 21 May 2025
 09:06:39 +0000
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
Subject: [PATCH v4 3/7] rtc-rv8803: add tamper function to sysfs for rv8901
Date: Wed, 21 May 2025 11:05:48 +0200
Message-Id: <20250521090552.3173-4-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250521090552.3173-1-markus.burri@mt.com>
References: <20250521090552.3173-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0017.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::13) To DB6PR03MB3062.eurprd03.prod.outlook.com
 (2603:10a6:6:36::19)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|AS8PR03MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: 42e78260-e86a-4d2e-9ec0-08dd9846cbab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k1EKuKH+6es7FZmS+/6AZOYKwYEqpcaa29Tn5cINKPWutS50Oe7Pse08/Yii?=
 =?us-ascii?Q?hB6iMBqa8+iTENVnTkAhTx1qJwnO5A5K/GGCGai5VhgE9JuvaSKUS4ricbtw?=
 =?us-ascii?Q?ZOjGOoDpW0DYNmTPv5RZpI53hPw6lWq4LOFOnLt4fNSbWxU632iQvhhqL2SY?=
 =?us-ascii?Q?x5Mi29MetMAox7JN/ECrYvXSzrc2NIoPvp6lX7v4kuCMqoH7b6lmRPzJm+1g?=
 =?us-ascii?Q?E+ELTiSedH5lSFrSwz5UQy1O5lGQoQQHyeudNruxN5qwuxkU+sCluAUfYq4i?=
 =?us-ascii?Q?8DXTw3ERq7yvR5aRVU37vYvPYs0Zq/lOynuqbF9qBWPFOY8Bo+QUjmwDayNX?=
 =?us-ascii?Q?b665YtrJDY44FH63H6KHihI8Z20yKot3TvNAjye1fvVzdGK2eT19WQdvWt54?=
 =?us-ascii?Q?m/EPGS0IT6YlaR7AQ6Q1I6pfE8cw2Ai/3mFljrMI0zTQB0YgTfBu5zHWomjO?=
 =?us-ascii?Q?xzAbK9koM8ILDdjdLXGpA/RrPWkDxdumKeZ8wiftGmHJbHY1r9PGCU6wg7EY?=
 =?us-ascii?Q?MpkaNSwxzJomhjcQeekgdaTtG+NQCMRoPBcwakdG1HkSpR3NQsRCPGtBnFNC?=
 =?us-ascii?Q?DgLU3tal29c86H5PCbNWT46fNWosRPL+jkS7G0gm9UKmNT5xuv0A2wJ6y4Wy?=
 =?us-ascii?Q?7nRqI4fsdPMZufOQQ/zNj4ckz9ZxG0Jilil+YH0Qq27Iwkjka6Q4kuGR2XQr?=
 =?us-ascii?Q?tQFYzq6wzKWsJh3ahMtAObpGssvINegBVBWQFKpgMcW7qeHxxz9K4gG4icRl?=
 =?us-ascii?Q?6+Latqt0kNck2jiVNcx0vXbLtNjAt8ncvaMVkTgDjaIfmXBXG2sE+VEcHDps?=
 =?us-ascii?Q?TmpC4iEc2npVqfBv5RBBppJuwk6enJOru9X9MH9wdEEyLQnmrP+xM/NUJ05E?=
 =?us-ascii?Q?kwoYyCyxBU+glMkZCz/WViA85Usc0gWqMYlkrw1U5xW0YGd8tGBVVVOXAQ7J?=
 =?us-ascii?Q?CnROBk9L39zZvxAkjv2Tx2Odo7I54psH17oWBYX63sxmjquR5lvHWPVF04aL?=
 =?us-ascii?Q?ysIjpC+893U05I9FBphnjfVGRcPKlbM0EuxOUn3BXgdpHiJrq/6sQXyhjt6v?=
 =?us-ascii?Q?J5Wdn1z9//qYI0yCHVt/ARphgNLsu6/3c3OfLeAWgC7ydWgRiIIdud3PGFUj?=
 =?us-ascii?Q?MKTCLwFP4asRjHFpTvCdGBUVc6BzpHztnmHFguRenlYaoWRNWjFCzes14X04?=
 =?us-ascii?Q?JPesA052biuOV3DMN6GVxfSzxHMh4W1dQRzJofXwECkqHh2hA6ftqqh8K8q1?=
 =?us-ascii?Q?v1OVCcr1QaV7GndmJHpigYL24FWFAuwpxlq8dWyDomxyXACM1UIEGmP2Zpuc?=
 =?us-ascii?Q?MHYX3KsoX5K3OOO/yFSJ2b0aFjequww2cIgLeoKEA6WiizctRWdiFzLtShW0?=
 =?us-ascii?Q?hFlyjao5JfLnGMcxiLaUvBewVXJM17gykdVpE04ZZ3IDrPySgqPCkv/sraxQ?=
 =?us-ascii?Q?wGJUuHEG1DZ4R9ozkj3qdWSg5tFqDwgeBRsAZ+HiNGbAx5Gbmx2Pig=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?39SM1xoHVjEdh3xH7M7QwzmUDzL/U3xO3F4bvcwko1QHfz9SBYetDvq0/sXQ?=
 =?us-ascii?Q?ZHliOOeWLaScL7mrJKZSDcZS2TJ72i1LX2IKGWozNFIGNNn1I2xUO+rVy39Q?=
 =?us-ascii?Q?E3zqRTwGNtLVOqA4fPijm8vd5HgToBfV4SJtfnUpy5fY9DXfklvc7pw19MXQ?=
 =?us-ascii?Q?zQYeZr4eSi+MqbCpH45a8G9s9kjOilYgVwYvgkNgTs8BynaqN6Ab94ORTMiL?=
 =?us-ascii?Q?GphApQcf7xstj2atkjuOV4sZ5Z0rXaqOoJEo//RF/HPJOo4BsbYopBvk/7/H?=
 =?us-ascii?Q?r2yGqseWPXCf0+SwP/c90TIrrGyH9AnyjD5ZP33zTMC3qNih8adDeKbbszlK?=
 =?us-ascii?Q?Su5BpweYr5eO0JL1hRZYoWESNfeHhO3hSKH+HI7vdfZWkmNiIfIEC59irLHM?=
 =?us-ascii?Q?C8IWWQmB1IenwdmkIypCIIyolIWOudIAMunwBvVffyMjMHL+TYc/6vFkwQgY?=
 =?us-ascii?Q?XLFpmek6pa59cxfPbj1tGXuXpNSZ8SGomyB6KUC0E1l/n7nGWotbncgxlKa+?=
 =?us-ascii?Q?BAhuQhZAEL73IPgkpUzfJtna0Dhi6lF61daVlxcM4pjAQWRNuYlKaRYFct1h?=
 =?us-ascii?Q?UhwmgCPtglDPXRRX0LjoLyUUTz/2ILbmmkiTdaLrQ+/E2XVqKmEpsx2vYceB?=
 =?us-ascii?Q?HHy6ucCU06UJNw0SXWU3i3MpLoD6VPVIZQWVDSXw4fJBuWe6flUs9i8255v7?=
 =?us-ascii?Q?zCYoBdniLG8qF/7PjtlevMKoZrpQPGjECXcWJmoQ8fLa7IhP5kRAAsxfgiPl?=
 =?us-ascii?Q?hNm8pAhrho87ouOPf+ZC2/NS3k3Oh84w51o5pUlF52/xP/1wT6dEaBMNN3m4?=
 =?us-ascii?Q?QX6q3Zdmtb/XcD2QcM1EI2yc1QVKu1vooyHO97cU49mdM1gj1DGgmP7phVso?=
 =?us-ascii?Q?utG1UHEq53pgYGIqheiaMeye5LRwbxSP32fGAOZg8/Aj+ucBhmvopwP6USQD?=
 =?us-ascii?Q?DWxwtq+ZYXdiSUeyN0g1r8xrZGlxbv2s9zJMqzopwSp01dcit8oiKhfVHma2?=
 =?us-ascii?Q?Aul82/yS4KjL/aIeD5366TdWYZ3np7LQm5MeDEA8fefcx+sRHLNU7jwpXKYV?=
 =?us-ascii?Q?D6G3dYqHIU9coAwRbVNgA33/jnxwykmm/wfNsU/6RwF3Z/9waUNwBDAP7MBI?=
 =?us-ascii?Q?FVeHe5Nc+vzrASTDX9QF9Kjs+6in+wHg5vKpaylPkS2LqejueU7CXPO2S5qS?=
 =?us-ascii?Q?yNTXYCTqUFLKpys2v6RXc82EZ7ZC6bYBpOxoxg7d1HWt+7yUC91nunOYUYKK?=
 =?us-ascii?Q?UCZq26tPdTtfn3AEtfwuHDzO3KZG8XRWubyxZZWnvo8/QnwqU3T6ohAtdOby?=
 =?us-ascii?Q?AXTZImITwbIleZoJpKhs5nBWxF0xzad9XqKqFR8oBiTxBuTGIMso/UPxeA10?=
 =?us-ascii?Q?NYcbr03gkJRQq6rQzXCIUQZqcgbI+vmp3P+6jhYPFRGzZXOXYumpOCQUJ0Lj?=
 =?us-ascii?Q?rhKixQ0mgTrADjEFnj0184XVHS2XNrym9jpD++ffM7uXArKf+VmgQsK5SXnL?=
 =?us-ascii?Q?yvpF6EWQXnBzdlyJq9p6i6oKLuvvsWY6r4mtzhNEsbmX6baWzEIqbEqqUEWg?=
 =?us-ascii?Q?Uz3vQOgwsE4SRsSFbYYQi2CL+IFU2FnQAlCZRavL?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e78260-e86a-4d2e-9ec0-08dd9846cbab
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 09:06:39.0012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORb8YUEhbMFqaiCcB+LaHSFp0TKd3ONaZeIQapie/n8khh5Ril1wp3VwfmyA8kYFKEf+HItg3audNYTD9VWPEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8088

Add sysfs interface to enable the EVINx pins and read the time-stamp
events from EVINX.

Signed-off-by: Markus Burri <markus.burri@mt.com>
Reviewed-by: Manuel Traut <manuel.traut@mt.com>
---
 .../ABI/testing/sysfs-class-rtc-tamper        |  21 +
 drivers/rtc/rtc-rv8803.c                      | 391 ++++++++++++++++++
 2 files changed, 412 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-rtc-tamper

diff --git a/Documentation/ABI/testing/sysfs-class-rtc-tamper b/Documentation/ABI/testing/sysfs-class-rtc-tamper
new file mode 100644
index 000000000000..3e61ed628c17
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-rtc-tamper
@@ -0,0 +1,21 @@
+What:		/sys/class/rtc/rtcX/tamper/enable
+Date:		May 2025
+KernelVersion:	6.15
+Contact:	Markus Burri <markus.burri@mt.com>
+Description:	(WO) Attribute to enable and disable the rtc tamper function.
+		Write a '1' to enable tamper detection or a '0' to disable.
+
+What:		/sys/class/rtc/rtcX/tamper/read
+Date:		May 2025
+KernelVersion:	6.15
+Contact:	Markus Burri <markus.burri@mt.com>
+Description:	(RO) Attribute to read the stored timestamps form buffer FIFO.
+		The timestamps are returned one by one
+		Format is 'seconds.milliseconds' since the epoch followed by the trigger events.
+		The value of the event is the current pin value.
+
+		Example values:
+		- "1234.567 EVIN1=1" for a trigger from EVIN1 changed from low to high
+		- "1234.567 EVIN1=0 EVIN2=1 for a simultaneous trigger of EVIN1 changed to low and
+		  EVIN2 changed to high.
+
diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 50fbae931cb2..e367d37e6a8f 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -10,6 +10,7 @@
 #include <linux/bcd.h>
 #include <linux/bitops.h>
 #include <linux/bitfield.h>
+#include <linux/delay.h>
 #include <linux/log2.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -41,6 +42,7 @@
 
 #define RV8803_FLAG_V1F			BIT(0)
 #define RV8803_FLAG_V2F			BIT(1)
+#define RV8901_FLAG_EVF			BIT(2)
 #define RV8803_FLAG_AF			BIT(3)
 #define RV8803_FLAG_TF			BIT(4)
 #define RV8803_FLAG_UF			BIT(5)
@@ -58,6 +60,35 @@
 #define RX8900_FLAG_SWOFF		BIT(2)
 #define RX8900_FLAG_VDETOFF		BIT(3)
 
+#define RX8901_EVIN_EN			0x20
+#define RX8901_EVIN1_CFG		0x21
+#define RX8901_EVIN1_FLT		0x22
+#define RX8901_EVIN2_CFG		0x23
+#define RX8901_EVIN2_FLT		0x24
+#define RX8901_EVIN3_CFG		0x25
+#define RX8901_EVIN3_FLT		0x26
+
+#define RX8901_EVENTx_CFG_POL		GENMASK(1, 0)
+#define RX8901_EVENTx_CFG_PUPD		GENMASK(4, 2)
+
+#define RX8901_BUF1_CFG1		0x27
+
+#define RX8901_BUF1_STAT		0x28
+#define RX8901_BUFx_STAT_PTR		GENMASK(5, 0)
+#define RX8901_WRCMD_CFG		0x41
+#define RX8901_WRCMD_TRG		0x42
+
+#define RX8901_EVNT_INTE		0x43
+
+#define RX8901_BUF_INTF			0x46
+#define RX8901_BUF_INTF_BUF1F		BIT(5)
+
+#define RX8901_EVNT_INTF		0x47
+
+#define NO_OF_EVIN			3
+
+#define EVIN_FILTER_MAX			40
+
 enum rv8803_type {
 	rv_8803,
 	rx_8803,
@@ -66,6 +97,50 @@ enum rv8803_type {
 	rx_8901,
 };
 
+enum evin_pull_resistor {
+	no = 0b000,
+	pull_up_500k = 0b001,
+	pull_up_1M = 0b010,
+	pull_up_10M = 0b011,
+	pull_down_500k = 0b100,
+};
+
+enum evin_trigger {
+	falling_edge = 0b00,
+	rising_edge = 0b01,
+	both_edges = 0b10,
+};
+
+struct cfg_val_txt {
+	char *txt;
+	u8 val;
+	bool hide;
+};
+
+static const struct cfg_val_txt trg_status_txt[] = {
+	{ "EVIN1", BIT(5) },
+	{ "EVIN2", BIT(6) },
+	{ "EVIN3", BIT(7) },
+	{ "CMD", BIT(4) },
+	{ "VBATL", BIT(3) },
+	{ "VTMPL", BIT(2) },
+	{ "VDDL", BIT(1) },
+	{ "OSCSTP", BIT(0) },
+	{ NULL }
+};
+
+static const u8 evin_cfg_regs[] = {
+	RX8901_EVIN1_CFG,
+	RX8901_EVIN2_CFG,
+	RX8901_EVIN3_CFG
+};
+
+static const u8 evin_flt_regs[] = {
+	RX8901_EVIN1_FLT,
+	RX8901_EVIN2_FLT,
+	RX8901_EVIN3_FLT
+};
+
 struct rv8803_data {
 	struct i2c_client *client;
 	struct rtc_device *rtc;
@@ -558,6 +633,316 @@ static int rv8803_nvram_read(void *priv, unsigned int offset,
 	return 0;
 }
 
+static int rv8803_ts_event_write_evin(int evin, struct rv8803_data *rv8803,
+				      enum evin_pull_resistor pullup_down,
+				      enum evin_trigger trigger, int filter)
+{
+	int ret;
+	u8 reg_mask;
+	struct i2c_client *client = rv8803->client;
+
+	/* according to data-sheet, "1" is not valid for filter */
+	if (evin >= NO_OF_EVIN || filter == 1 || filter > EVIN_FILTER_MAX)
+		return -EINVAL;
+
+	guard(mutex)(&rv8803->flags_lock);
+
+	/* set EVENTx pull-up edge trigger */
+	ret = rv8803_read_reg(client, evin_cfg_regs[evin]);
+	if (ret < 0)
+		return ret;
+	reg_mask = ret;
+	reg_mask &= ~(RX8901_EVENTx_CFG_PUPD | RX8901_EVENTx_CFG_POL);
+	reg_mask |= FIELD_PREP(RX8901_EVENTx_CFG_PUPD, pullup_down);
+	reg_mask |= FIELD_PREP(RX8901_EVENTx_CFG_POL, trigger);
+	ret = rv8803_write_reg(client, evin_cfg_regs[evin], reg_mask);
+	if (ret < 0)
+		return ret;
+
+	/* set EVENTx noise filter */
+	if (filter != -1) {
+		ret = rv8803_write_reg(client, evin_flt_regs[evin], filter);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int rv8803_ts_enable_events(struct rv8803_data *rv8803, u8 event_enable_mask)
+{
+	int ret;
+	u8 reg_mask;
+	struct i2c_client *client = rv8803->client;
+
+	guard(mutex)(&rv8803->flags_lock);
+
+	/* event detection interrupt */
+	ret = rv8803_read_reg(client, RV8803_CTRL);
+	if (ret < 0)
+		return ret;
+
+	reg_mask = ret & ~RV8803_CTRL_EIE;
+	if (event_enable_mask)
+		reg_mask |= RV8803_CTRL_EIE;
+
+	ret = rv8803_write_reg(client, RV8803_CTRL, reg_mask);
+	if (ret)
+		return ret;
+
+	/* events for configuration */
+	ret = rv8803_write_reg(client, RX8901_EVIN_EN, event_enable_mask);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int rv8803_ts_enable(struct rv8803_data *rv8803, u8 enable)
+{
+	int ret;
+	int i;
+	unsigned long tmo;
+	u8 reg;
+	u8 reg_mask;
+	struct i2c_client *client = rv8803->client;
+
+	/* EVINxCPEN | EVINxEN */;
+	const u8 reg_mask_evin_en = GENMASK(5, 3) | GENMASK(2, 0);
+
+	/* check if event detection status match requested mode */
+	ret = rv8803_read_reg(client, RX8901_EVIN_EN);
+	if (ret < 0)
+		return ret;
+
+	/* requested mode match current state -> nothing to do */
+	if (ret == (enable ? reg_mask_evin_en : 0))
+		return 0;
+
+	dev_info(&client->dev, "%s time-stamp event detection\n",
+		 (enable) ? "configure" : "disable");
+
+	/*
+	 * 1. disable event detection interrupt
+	 * 2. disable events during configuration
+	 */
+	ret = rv8803_ts_enable_events(rv8803, 0);
+	if (ret < 0)
+		return ret;
+
+	/* for disable no configuration is needed */
+	if (!enable)
+		return 0;
+
+	/* 3. set EVENTx pull-up edge trigger and noise filter */
+	for (i = 0; i < NO_OF_EVIN; ++i) {
+		ret = rv8803_ts_event_write_evin(i, rv8803, pull_up_1M, falling_edge, 0);
+		if (ret < 0)
+			return ret;
+	}
+
+	scoped_guard(mutex, &rv8803->flags_lock) {
+		/* 4. enable EVENTx interrupt */
+		ret = rv8803_read_reg(client, RX8901_EVNT_INTE);
+		if (ret < 0)
+			return ret;
+		reg_mask = BIT(5) | BIT(6) | BIT(7); /* EVINxIEN 1-3 */
+		reg = (ret & ~reg_mask) | reg_mask;
+		ret = rv8803_write_reg(client, RX8901_EVNT_INTE, reg);
+		if (ret < 0)
+			return ret;
+	}
+
+	/*
+	 * 5. set BUF1 inhibit and interrupt every 1 event
+	 *    NOTE: BUF2-3 are not used in FIFO-mode
+	 */
+	ret = rv8803_write_reg(client, RX8901_BUF1_CFG1, 0x01);
+	if (ret < 0)
+		return ret;
+
+	/* 6. clean and init for BUFx and event counter 1-3 and trigger cmd */
+	reg = BIT(7) | GENMASK(6, 4);
+	reg |= BIT(0); /* CMDTRGEN */
+	ret = rv8803_write_reg(client, RX8901_WRCMD_CFG, reg);
+	if (ret < 0)
+		return ret;
+	ret = rv8803_write_reg(client, RX8901_WRCMD_TRG, 0xFF);
+	if (ret < 0)
+		return ret;
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
+	/*
+	 * 7. enable event detection interrupt
+	 * 8. / 10. enable events for configuration in FIFO mode
+	 */
+	ret = rv8803_ts_enable_events(rv8803, reg_mask_evin_en);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static ssize_t enable_store(struct device *dev, struct device_attribute *attr, const char *buf,
+			    size_t count)
+{
+	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
+
+	bool enable = (strstr(buf, "1") == buf) ? true : false;
+
+	int ret = rv8803_ts_enable(rv8803, enable);
+
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t read_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	int ret;
+	int ev_idx;
+	int num_events;
+	unsigned long long time_s;
+	int time_ms;
+	int offset = 0;
+	u8 reg_mask;
+	u8 data[10];
+	struct rtc_time tm;
+
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
+
+	guard(mutex)(&rv8803->flags_lock);
+
+	/*
+	 * For detailed description see datasheet:
+	 *  - Reading Time Stamp Data (FIFO mode)
+	 */
+
+	/* CHECK for EVF bit */
+	ret = rv8803_read_reg(client, RV8803_FLAG);
+	if (ret < 0)
+		return ret;
+
+	if (ret & RV8901_FLAG_EVF) {
+		/* clear EVF */
+		reg_mask = RV8901_FLAG_EVF;
+		ret = rv8803_write_reg(client, RV8803_FLAG, ~reg_mask);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* check interrupt source is from event 1-3 */
+	ret = rv8803_read_reg(client, RX8901_EVNT_INTF);
+	if (ret < 0)
+		return ret;
+
+	/* CHECK for EVINx bit */
+	if (ret & GENMASK(7, 5)) {
+		/* clear EVINxF 1-3 */
+		reg_mask = GENMASK(7, 5);
+		ret = rv8803_write_reg(client, RX8901_EVNT_INTF, ~reg_mask);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* check interrupt source is from event 1-3 */
+	ret = rv8803_read_reg(client, RX8901_BUF_INTF);
+	if (ret < 0)
+		return ret;
+	if (ret & RX8901_BUF_INTF_BUF1F) {
+		/* disable interrupts */
+		ret = rv8803_read_reg(client, RV8803_CTRL);
+		if (ret < 0)
+			return ret;
+		ret = rv8803_write_reg(client, RV8803_CTRL, ret & ~RV8803_CTRL_EIE);
+		if (ret < 0)
+			return ret;
+
+		/* clear interrupt flag */
+		ret = rv8803_read_reg(client, RX8901_BUF_INTF);
+		if (ret < 0)
+			return ret;
+		ret = rv8803_write_reg(client, RX8901_BUF_INTF, ret & ~RX8901_BUF_INTF_BUF1F);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* test if there are events available */
+	ret = rv8803_read_reg(client, RX8901_BUF1_STAT);
+	if (ret < 0)
+		return ret;
+	num_events = ret & RX8901_BUFx_STAT_PTR;
+
+	if (num_events) {
+		ret = rv8803_read_regs(client, 0x60, ARRAY_SIZE(data), data);
+		if (ret < 0)
+			return ret;
+
+		tm.tm_sec = bcd2bin(data[2]);
+		tm.tm_min = bcd2bin(data[3]);
+		tm.tm_hour = bcd2bin(data[4]);
+		tm.tm_mday = bcd2bin(data[5]);
+		tm.tm_mon = bcd2bin(data[6]) - 1;
+		tm.tm_year = bcd2bin(data[7]) + 100;
+		tm.tm_wday = -1;
+		tm.tm_yday = -1;
+		tm.tm_isdst = -1;
+
+		ret = rtc_valid_tm(&tm);
+		if (ret)
+			return ret;
+
+		/* calculate 1/1024 -> ms */
+		time_ms = (1000 * ((data[1] << 2) | (data[0] >> 6))) / 1024;
+		time_s = rtc_tm_to_time64(&tm);
+
+		offset += snprintf(buf + offset, PAGE_SIZE - offset, "%llu.%03d", time_s, time_ms);
+		for (ev_idx = 0; trg_status_txt[ev_idx].txt; ++ev_idx)
+			if (data[9] & trg_status_txt[ev_idx].val)
+				offset += snprintf(buf + offset, PAGE_SIZE - offset, " %s=%d",
+						   trg_status_txt[ev_idx].txt,
+						   !!(trg_status_txt[ev_idx].val & data[8]));
+		offset += snprintf(buf + offset, PAGE_SIZE - offset, "\n");
+
+		/* according to the datasheet we have to wait for 1ms */
+		usleep_range(1000, 2000);
+	}
+
+	/* re-enable interrupts */
+	ret = rv8803_read_reg(client, RV8803_CTRL);
+	if (ret < 0)
+		return ret;
+	ret = rv8803_write_reg(client, RV8803_CTRL, ret | RV8803_CTRL_EIE);
+	if (ret < 0)
+		return ret;
+
+	return offset;
+}
+
+static DEVICE_ATTR_WO(enable);
+static DEVICE_ATTR_ADMIN_RO(read);
+
+static struct attribute *rv8803_rtc_event_attrs[] = {
+	&dev_attr_enable.attr,
+	&dev_attr_read.attr,
+	NULL
+};
+
+static const struct attribute_group rv8803_rtc_sysfs_event_files = {
+	.name = "tamper",
+	.attrs	= rv8803_rtc_event_attrs,
+};
+
 static const struct rtc_class_ops rv8803_rtc_ops = {
 	.read_time = rv8803_get_time,
 	.set_time = rv8803_set_time,
@@ -732,6 +1117,12 @@ static int rv8803_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
+	if (rv8803->type == rx_8901) {
+		err = rtc_add_group(rv8803->rtc, &rv8803_rtc_sysfs_event_files);
+		if (err)
+			return err;
+	}
+
 	rv8803->rtc->ops = &rv8803_rtc_ops;
 	rv8803->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rv8803->rtc->range_max = RTC_TIMESTAMP_END_2099;
-- 
2.39.5


