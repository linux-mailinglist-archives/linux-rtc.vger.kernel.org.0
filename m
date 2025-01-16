Return-Path: <linux-rtc+bounces-2937-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C9AA13AB7
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2025 14:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1151161C94
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2025 13:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E834922A4F5;
	Thu, 16 Jan 2025 13:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="MxjLssrU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013003.outbound.protection.outlook.com [40.107.162.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C741DE4FF;
	Thu, 16 Jan 2025 13:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737033476; cv=fail; b=przCYtNu/yfW+jcHK3Az5p2D93Ku1H204YlLoiHqvWAXF1KwguUJ1HcZVxkgKwwTEIZYth8lG5LIzTkeZrLqKmOjtD33DDZ1oySNzMzG4PCEDD1ZCtdtdY91DdPhqD6EWQyIeihp9V37ADoK9oMBIZ3xNusVpPvGm/ffs5wxk1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737033476; c=relaxed/simple;
	bh=G0JpR4o0dveiFewUjh3D2dDUod5Gr2K3BzE3efjffzw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TgfUOyrZM366pes5XYqW3KdkDNch3a8ab/Px2NzYVwnCHrKuOIYkc2lSM0rLigG83KePuR3Vlf1i2P2uEVNVtgES49RlZjD2O7vkSGx6Q9JViuEXdbPI/oqaRQsUFdn+BXwM0VzKMc4EYmZ95P/owUG5gSNiDk9W5yXBYCAvWa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=MxjLssrU; arc=fail smtp.client-ip=40.107.162.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tklw/tNNOsw0OKyP5dAWSs1ejmcb6i6AtUTfxpnts2vYoaxdPSmJh/4HFoSWtUK8aUKNig9DztA2kELj4mLog+rn1D4NR81IMN/n1wIr710rgJIpuJ71wRc3J6fNZYpx3OQdFrET3e+klpzxXG9ZYzJv2LcsfE+uuQIEgC+bihNOoWuQjn7r3PkpaORootHEP94BV7vwe9wF5Ostr41QHX2/lO9kbuoLKZbnEavF2SB48QKef5rI3s3AWxE4Ul1pGo+TH3x3HoMqCgJem43NsHRQqvJOdimN6V8mQvq3kHL7dSvnrl04hDTFR1GfCiHacXO9it976mDq++vJJ2wZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6Nm1bdr4Hx2yhx20j0v0XZqdvj853dSp2i7hjJp6QA=;
 b=sHTkyGHjsvspxryf92TojItreC1qZ8ivuSAg17zlfShslWehXzuGtMW3vvyO6/fLYb1s/t03lIkokG0Zbe54eXLBsorxVzzH0+EO7cenCzonCb/zoWCSmFCdKL8X1FdQZDn1jSfs69vrudulVxcaklwBRRUt7d1aIiQxu7AvIHdc51E4qneUIwjUU+QbmZPCXuznm7zsnLBUxi67osxiIkLi2X1cT+gxws4KEWcVhNdNwIvzdV+28Qaw+E5avkfn80lDUI490sAvTalZYKAy4ZbzB5hCi8WQ9krFAA99qXcX9sVVQOauFAKmjQBb0c+u8VGtyRAllhC+DB9mDtjpNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6Nm1bdr4Hx2yhx20j0v0XZqdvj853dSp2i7hjJp6QA=;
 b=MxjLssrUEWbAlLtvRKg2Z0wOKusruiNidwj2nzV0enHL/INvhUp2diQ+Lvlb1RxFyAxJTBdo1dmYvU2kZLd/5sNCfZ5a5LngIMYJ03RgtVvmqsa8sD8nXpjD252dmVs+J+ae8gIWeyOLc591XtUydxZGqQyUkz6XNt/8Gaxqgqef5dS9vuF4uTycQ79WhcvP5R42P9R1c3ggUq/h/r9DI4urDjG+te2Qae9UGY/VLcgbTi2IYRMfLuL7VMjU+IFd8U4M63mLGFGo4a3ILwNvMvBTO17Cqwcwxtb65c6NtHLdKI9q3o/9TpCNeewv8iX3hExd8jhBIyPc1DTm3JMtog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by PA4PR03MB7326.eurprd03.prod.outlook.com (2603:10a6:102:100::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 13:17:52 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%5]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 13:17:51 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>
Subject: [PATCH v2 5/5] rtc-rv8803: extend sysfs to read status
Date: Thu, 16 Jan 2025 14:15:32 +0100
Message-Id: <20250116131532.471040-6-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116131532.471040-1-markus.burri@mt.com>
References: <20250116131532.471040-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:610:b3::15) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|PA4PR03MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d29fbbe-e1de-41b8-cec8-08dd36302e3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l8KmPxqzaAl0B2fR2tMdvfnJ40E28nwZRBLU2YquiI0J0/ONvv3F8pfUoCK4?=
 =?us-ascii?Q?nlfUOHHdS0CAnEpsEXp5aBXpFhRTR8KYhuLtecYpbLBQ32GO2n0yN0c3Zgzw?=
 =?us-ascii?Q?v3i34cUBJdtAcpmRSOz5pdhOEB3xhGhuPF415DaC4MeJcnw0bPePqMXcqfiu?=
 =?us-ascii?Q?r6rACeyS/T0DX/sR/kpSJhNPu86jJmSMqXZKc845/7RSDOFuDIzsJuSrCQ4j?=
 =?us-ascii?Q?2wSfGlVmnz6pPsgTQZ1SwXdFng3nP5vkYlIQRdW7wrc0at5TO5viYUDGQ4qu?=
 =?us-ascii?Q?ILGzLa5qfhjFmUMptWDTKRM0vJfMm1wAtryfijX14zELSaRwJiCZKOcOcivU?=
 =?us-ascii?Q?/UwnebVXkuFf4dIwGQTWOLZShaYc3Co6I3hKv7J0mT9gSZk59J60ChEvY5Up?=
 =?us-ascii?Q?FMwc3GWLqQ3nxpOy95uyp6xqrI4LUeTLivr4/bCD9ydlVVaScBmePCt7P23E?=
 =?us-ascii?Q?zSuf1y2UWzik+Kg+FX9TDDMRbC5ow+mc9e3p+btaUJfZUxmnZTBBrnqlhbTS?=
 =?us-ascii?Q?CFimERmnhHL0FW7jrubTX8NEGJUbhiPPFa3UOLocpUQHL/lgVV1Y4AHkgouV?=
 =?us-ascii?Q?cxOosCNb+Run3IWIOIG3ifj7E+MBAs/y1+Cija6dlLww5jYvot9vLIS9TNqp?=
 =?us-ascii?Q?0PFlwEPK5mbQBNtXET61ZFWHS68wWuxb3GcXvsIXopFVAdifgs+FtE+re96M?=
 =?us-ascii?Q?7raT01QjEAoq0NSyrSB3qm8J2CYkVOLOSfaX8BeO+rQC/4OK2ngG/Dha0bPv?=
 =?us-ascii?Q?K4n1k0BZ4IKM0WzoBJRqAu9h5ivqOj9dcI91zVS8xuy++C7GGGTOiChZzBR5?=
 =?us-ascii?Q?+MDeBqhjy++TpDosQZD7V4wByjM1NuoSARYuEpoOAMdGtiYlINLXoMt88IEX?=
 =?us-ascii?Q?/xC+rsMMCcziD1SmklEzbDT2eATzsYjQ+gQfHow20fQFkL11inUngmWeOyzo?=
 =?us-ascii?Q?VGqPKGgJ+OG66Zpgju/BOyT7oQBZ7SyKhjk+PsdcTM+rDdikQ3PwaqNA9sNh?=
 =?us-ascii?Q?CRiIqb3qIfL0GMcuFEHXA5EQOLmfON/TW/hSEFYKnOB3S/URasA0gXIYbsve?=
 =?us-ascii?Q?qbQNR6bYgKVCN54aE+PDg+CEOXA2eisIgz6HBna3h07Gi+iUtbmUM8I9Y6e9?=
 =?us-ascii?Q?bmzRErk54+LbMB0xjzbld5XEw8yqNIdfKyIqpZnw2a9KKklKKdRkW+B8oqOe?=
 =?us-ascii?Q?YWqgYPuAXkfcubXHW7oSv+KYRwdNPxhWw5Yww0jL/g3Fk2Vbq/D02wm/kD3k?=
 =?us-ascii?Q?HVIHxx0VhWTBSSk6ts4pHuJJkB0dXTGNKEG/11v2Q8W6m+DMSBJebV6FjTy6?=
 =?us-ascii?Q?S1Kcnk+xN/BTy/lc9ZoWM8Qq6iogQlO/6d5Yfuq8Gk/y85nsik27ZwX5oITB?=
 =?us-ascii?Q?7MV+0pxbSLdjwY+rSL0HiWkufgIRbLiBMtJ1Fm+y+IdVdglajdJu8JQNYk5N?=
 =?us-ascii?Q?h49oKWHcO8idE5K0/tMpvI4En8KD6jI0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2yMnxbFz5nDNK73q8OmrYrGmkwFMYUcks3EAtZx3GxA5DiMieXXTX4IhRjiJ?=
 =?us-ascii?Q?I8Brl6tfZ8vr08Qe3Yp5il4OEUmV26g2PF7WJG+XgHQiIXS5qUm16AoXFVgd?=
 =?us-ascii?Q?P3/PSoUxxscGsKmhU7iR0BLJTKplCUpWMCNnORbLqW1s2vg8iUuNxD0LNIvw?=
 =?us-ascii?Q?ieuphzsnnkuRcdZVhKVJKkvKHCp6EYvsAo9Jv/yJw1NFX5OFzJKYzEQQYcQg?=
 =?us-ascii?Q?aGazXYVr0DGXJVSH7+AN++n7QaYD3ilg9/Mi+HM6MumfhRfRRF3bbrYOvBC4?=
 =?us-ascii?Q?9zdKlo2LkyS9ltx1Y9I/yhKb95a3VcpO7IcNTxrQ+MpFT+AD4EPjkT9FNSSb?=
 =?us-ascii?Q?I1QX3fC4Hv9PhE8lO6LqY+uP7hmn/bREu2wrTFoNdzxONcZkK0hvqk42DORv?=
 =?us-ascii?Q?tlhJFkQ8R2k5B0NHETpaaQIR/PvYAs8llihHSJjZI3llm9prksiY1Bmcu8hr?=
 =?us-ascii?Q?1AcxLDm7bch4c2XVLmcuoeYyU5nCWYunfeJJPCZBlIvWlpgPuQYRH0pvIx5Q?=
 =?us-ascii?Q?Fk+A7cYI7JqJxnMxXTevGB1bHZ19n6L4ETDSQB5SCaYy5y21BswajWYVOWnR?=
 =?us-ascii?Q?Weujedh+GdHEixdFTmAwcVA/loKsLAV7HHHTLaDUVC5kvy1l79UJosjWxy5S?=
 =?us-ascii?Q?aROIIPj3iBr3EKYKa4ss7cKORC04WFYEuN8kA0RiZdhImkVspJHPITwRxuUi?=
 =?us-ascii?Q?GlOlx+iV45rFH98t/rdr/xA7Db98Xy2jkgyJHBqhWm3oL5/OMzFTYgxxlbPv?=
 =?us-ascii?Q?Jd6iDKybzlvMLJWSvSN6+qaLAF6bvPZFVYJob2P1MYmawVq/X5EW9t74p3zd?=
 =?us-ascii?Q?peMtjC2oC4ZbFN+ge2DVZG//5Br1AJ0LiYVkCiQOajrlbnWHfj/XLS9ZWrGw?=
 =?us-ascii?Q?6TonjTwJev7lroK5u9QbrvK3iIkmsAeKyCFMyZ7OmRlGTSFMal5XPnaXEbh9?=
 =?us-ascii?Q?N5rtErf1HunEI+m8LeHxw27nrWnUb9ViSIlNkUnVLiChrLsGBXOKarSaYu5p?=
 =?us-ascii?Q?rTIRtUAw/DVOiFuCrAJdCZQSjGtNjp2zkXQsqIByZiNyMiv5FJkJMt/e/lkN?=
 =?us-ascii?Q?XwxT2hJE6tr+/HPaJvv1h/VoM02EzqSf0EEKzSahejsL4zW+k+CtEO5ui6lt?=
 =?us-ascii?Q?qvDuMIV/gJIKjpFkI2nco1/N9aVzGFU1/OsV8CEFS5QbxvM+b7WPYY+/CUZl?=
 =?us-ascii?Q?paYWIAnBPh7hAovSd6dxl18PQzAj2vTIAufEwnzG4BEptSR2I0tDK1+iAlUH?=
 =?us-ascii?Q?rm6qjzgY2i8q7iJ8OgAPdF8x8qNFxTSvaaWydX9TKDsVt9hz10fxVC7tl4n7?=
 =?us-ascii?Q?tiHahjnExM9MAoZQbdq+WvEBVNGLOw2Wb81XcuhtGEvqrfTOIjG8rRRxxhnQ?=
 =?us-ascii?Q?+yPiCR+1a/GL1rD8BW2gCXb/zLqcCKnKevgdmvLEQGGvhKku7O7lIAlOcoIV?=
 =?us-ascii?Q?D++cmsMnF+mfbloLiJ390yOB8JZF8DxYiNs4l3neuZ9Yg8b/+HBLP+/qIOzs?=
 =?us-ascii?Q?xmvIRWf8iN+3dnZz0UD52LG7h2ksx7Yqqse69N6sGl+ba0cfF7bD9uL+gFFT?=
 =?us-ascii?Q?5fbDqiYg20e1tGOTFAMUezQF8dmGZmoybs+GxwHI?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d29fbbe-e1de-41b8-cec8-08dd36302e3b
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 13:17:51.9330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMMc+Q2kq5m331b/R1n3fxCF4RY3YtPMEqsecMQglpFBhykDVdMQ25F8f0f9HZ20wMBALFnk5Hk2HSmbAW4q2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7326

Add sysfs functionality to read the status and configuration.
The functions provide the number of stored timestamp events, the current
EVIN pin configuration and the enabled/disabled status.

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 .../ABI/testing/sysfs-class-rtc-tamper        |   8 ++
 drivers/rtc/rtc-rv8803.c                      | 106 ++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-rtc-tamper b/Documentation/ABI/testing/sysfs-class-rtc-tamper
index 2fd6578a6..b3aa73c81 100644
--- a/Documentation/ABI/testing/sysfs-class-rtc-tamper
+++ b/Documentation/ABI/testing/sysfs-class-rtc-tamper
@@ -26,3 +26,11 @@ KernelVersion:	6.13
 Contact:	Markus Burri <markus.burri@mt.com>
 Description:	(WO) Attribute to trigger an internal timestamp event
 		Write a '1' to trigger an internal event and store a timestamp.
+
+What:		/sys/class/rtc/rtcX/tamper/status
+Date:		January 2025
+KernelVersion:	6.13
+Contact:	Markus Burri <markus.burri@mt.com>
+Description:	(RO) Attribute to read configuration and status for EVINx and buffer.
+		Provide the number of stored timestamp events, the current EVIN pin configuration
+		and the enabled/disabled status.
diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index ca3a19162..350cd92d6 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -84,8 +84,11 @@
 
 #define RX8901_EVNT_INTF		0x47
 
+#define RX8901_BUF_OVWF			0x4F
+
 #define NO_OF_EVIN			3
 
+#define EVIN_FILTER_FACTOR		125
 #define EVIN_FILTER_MAX			40
 
 enum rv8803_type {
@@ -116,6 +119,26 @@ struct cfg_val_txt {
 	bool hide;
 };
 
+static const struct cfg_val_txt pull_resistor_txt[] = {
+	{ "no", no },
+	{ "PU/500k", pull_up_500k },
+	{ "PU/1M", pull_up_1M },
+	{ "PU/10M", pull_up_10M },
+	{ "PD/500k", pull_down_500k },
+	{ "no", 0b101, 1 },
+	{ "no", 0b110, 1 },
+	{ "no", 0b111, 1 },
+	{ NULL }
+};
+
+static const struct cfg_val_txt trigger_txt[] = {
+	{ "falling", falling_edge },
+	{ "rising", rising_edge },
+	{ "both", both_edges },
+	{ "both", 0b11, 1 },
+	{ NULL }
+};
+
 static const struct cfg_val_txt trg_status_txt[] = {
 	{ "EVIN1", BIT(5) },
 	{ "EVIN2", BIT(6) },
@@ -632,6 +655,16 @@ static int rv8803_nvram_read(void *priv, unsigned int offset,
 	return 0;
 }
 
+static char *cfg2txt(const struct cfg_val_txt *cfg, u8 value)
+{
+	do {
+		if (cfg->val == value)
+			return cfg->txt;
+	} while (++cfg && cfg->txt);
+
+	return NULL;
+}
+
 static int rv8803_ts_event_write_evin(int evin, struct rv8803_data *rv8803,
 				      enum evin_pull_resistor pullup_down,
 				      enum evin_trigger trigger, int filter)
@@ -935,14 +968,87 @@ static ssize_t trigger_store(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
+static ssize_t status_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	int evin_en, evin_cfg, evin_flt, buf1_cfg, buf1_stat, buf_ovwf;
+	int i;
+	int offset = 0;
+	u8 ev_pullupdown[NO_OF_EVIN];
+	u8 ev_trigger[NO_OF_EVIN];
+	int ev_filter[NO_OF_EVIN];
+
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
+
+	scoped_guard(mutex, &rv8803->flags_lock) {
+		evin_en = rv8803_read_reg(client, RX8901_EVIN_EN);
+		if (evin_en < 0)
+			return evin_en;
+
+		for (i = 0; i < NO_OF_EVIN; ++i) {
+			evin_cfg = rv8803_read_reg(client, evin_cfg_regs[i]);
+			evin_flt = rv8803_read_reg(client, evin_flt_regs[i]);
+			if (evin_cfg < 0 || evin_flt < 0)
+				return -EIO;
+
+			ev_pullupdown[i] = FIELD_GET(RX8901_EVENTx_CFG_PUPD, evin_cfg);
+			ev_trigger[i] = FIELD_GET(RX8901_EVENTx_CFG_POL, evin_cfg);
+			ev_filter[i] = EVIN_FILTER_FACTOR * evin_flt;
+		}
+
+		buf1_cfg = rv8803_read_reg(client, RX8901_BUF1_CFG1);
+		buf1_stat = rv8803_read_reg(client, RX8901_BUF1_STAT);
+		buf_ovwf = rv8803_read_reg(client, RX8901_BUF_OVWF);
+		if (buf1_stat < 0 || buf1_stat < 0 || buf_ovwf < 0)
+			return -EIO;
+	}
+
+	offset += sprintf(buf + offset, "Mode: %s\n\n",
+			  FIELD_GET(BIT(6), evin_en) ? "direct" : "fifo");
+	offset += sprintf(buf + offset, "Event config:\n");
+	offset += sprintf(buf + offset, "  %-13s  %-7s %-7s %-7s\n", "", "EVIN1", "EVIN2", "EVIN3");
+	offset += sprintf(buf + offset, "  %-13s  %-7ld %-7ld %-7ld\n", "Enable",
+			  FIELD_GET(BIT(0), evin_en), FIELD_GET(BIT(1), evin_en),
+			  FIELD_GET(BIT(2), evin_en));
+	offset += sprintf(buf + offset, "  %-13s  %-7ld %-7ld %-7ld\n", "Capture",
+			  FIELD_GET(BIT(3), evin_en), FIELD_GET(BIT(4), evin_en),
+			  FIELD_GET(BIT(5), evin_en));
+
+	offset += sprintf(buf + offset, "  %-13s  %-7s %-7s %-7s\n", "Pull-resistor",
+			  cfg2txt(pull_resistor_txt, ev_pullupdown[0]),
+			  cfg2txt(pull_resistor_txt, ev_pullupdown[1]),
+			  cfg2txt(pull_resistor_txt, ev_pullupdown[2]));
+	offset += sprintf(buf + offset, "  %-13s  %-7s %-7s %-7s\n", "Edge",
+			  cfg2txt(trigger_txt, ev_trigger[0]),
+			  cfg2txt(trigger_txt, ev_trigger[1]),
+			  cfg2txt(trigger_txt, ev_trigger[2]));
+	offset += sprintf(buf + offset, "  %-13s  %-7d %-7d %-7d\n\n", "Filter [ms]",
+			  ev_filter[0], ev_filter[1], ev_filter[2]);
+
+	offset += sprintf(buf + offset, "Buffer config:\n");
+	offset += sprintf(buf + offset, "  %-13s  %-10s\n", "Mode",
+			  (FIELD_GET(BIT(6), buf1_cfg) ? "overwrite" : "inhibit"));
+	offset += sprintf(buf + offset, "  %-13s  %-10s\n", "Status",
+			  (FIELD_GET(BIT(7), buf1_stat) ? "full" : "free"));
+	offset += sprintf(buf + offset,  "  %-13s  %-10ld\n", "Overrun",
+			  (FIELD_GET(BIT(4), buf_ovwf)));
+	offset += sprintf(buf + offset,  "  %-13s  %-10ld\n", "No of data",
+			  (FIELD_GET(GENMASK(5, 0), buf1_stat)));
+
+	return offset;
+}
+
 static DEVICE_ATTR_WO(enable);
 static DEVICE_ATTR_RO(read);
 static DEVICE_ATTR_WO(trigger);
+static DEVICE_ATTR_RO(status);
 
 static struct attribute *rv8803_rtc_event_attrs[] = {
 	&dev_attr_enable.attr,
 	&dev_attr_read.attr,
 	&dev_attr_trigger.attr,
+	&dev_attr_status.attr,
 	NULL
 };
 
-- 
2.39.5


