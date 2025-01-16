Return-Path: <linux-rtc+bounces-2935-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 005F9A13AAF
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2025 14:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F23FB188BEAB
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2025 13:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5438522618B;
	Thu, 16 Jan 2025 13:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="KbbVMAY3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1854226170;
	Thu, 16 Jan 2025 13:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737033398; cv=fail; b=TXhL14CyO3uAA6eZzQOA932drDBwB2Nad7S0WWCPOCqu1Xt5TO1rK3H245x52Ely7dg7k1SpwCnIuEYdWOT9F/XY0R3DqciqwffZcie52hrYBrW5hP+zO81q1F9BJKXw/ZFB8EEcUOYWbjrwdlLap+6I9jdEh+GQUstNDKGJo0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737033398; c=relaxed/simple;
	bh=6ou8ybhXWKfUoHNz+tV/ZTxJrMkvkQY1wkkmV+yrz7A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B0dOiKCm8BMqy/xk3aoCucUxUuQ2SBMehoDaGSZI1x8A5Gnmx1K9VdB7uhyKorInc1jN1RicRIwXwOxqbM0+42jkTe5puF71HDXWH0VRWIzgndp2xHXdI58xsJRpfgF7U6e6YoA8jL1PI6esEEkq4kq8Rp4sz9Arro3sxh4xp2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=KbbVMAY3; arc=fail smtp.client-ip=40.107.21.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXDBaggPMxDwiySmeX5pvBc+KvtewqrebIhOktf0v/oeRqziVO4TX15odTtOp6cusZ0iJSCERreg7p2Laee7tV2tqn7GEwypY80lzbWzL72HjHer4bJPwzivIqURwCbOXkHIDw2H6Amly4VVtcAB7b9Uui6yZWZ7+l1Z6l+p1JpsvwAgqP/iVJ2MmaijEu98XNgcZe5sSdSYozJiLDoV8KEGjYhA5GIX3SXAwVlbQRGoB5jeA+QV9qw9lwPEf/3uSRye/Nnm45cDu9UbWEDEribIR4zxdPCcqta+txT2K5gQILfQHSN0qNSDJ+LOFRoqLsNVgRzwYlVWU1kKzmD+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5K5ry7QlbAucDKyTcfoqAcRedTOmjyQa00Wt/wrpO88=;
 b=iH++no3LODeX+7eB3Nw5xi0GMdXfpzwVIDSKdr4Yhh48OGUcU6YX7/GrEjdgE6icfHysa5u81KSQYWdGC7GHyVlQhoUXYWcPQud6l6pudeTKk67tl8QvMBz9Mm293YC4rBBgc6GEsDjq0ks9liOmKQO32IxnP/c7fjKLs4A68E0MXddTZCUUviG6VaCbOQUoFDu1nng6+f/4FWMWj0G6o7x2bKTFoauO/VDEhaVX0Nu1Qq60dECuzSY0CIs6aI/MCD/JnZob+9Bu2hB5pUHxgL2NMHuXmyeWszja7rDvDCl0OCddxzCO4J3cZfRUb0WW/qeC+o9tgLCtEX14+B2MLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5K5ry7QlbAucDKyTcfoqAcRedTOmjyQa00Wt/wrpO88=;
 b=KbbVMAY3GRLv7Gc+NNysjFFmpefj+N3EkfTtTWxgsAGBTqOsRl9Kiel4yrV6t8nrNW3rQBauTxTUoW5z+3hhXKkKd/WlogX7omyVroto81Ruhy8TUyzugCI347RRfkk/c+08ePuvmVTSewgobquxrTQ0aUvJ0xbKnKuRwkjhL+drwBKUnDHjqihO/OWKEnIaKhyTl2BkQSk1qw+rpQcV4OJs4w60azJvmL6wgHkTlnTOzhvDCKaeSvJiPDngb8YsfPE/0R4rvD6ITFD1FuL0xUYqh7Za9kXIkp93zhXE/9sqMrS3AzEMFkvAB0ABfqJ7pLuU3K7qL2/jW305U///cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by GVXPR03MB10213.eurprd03.prod.outlook.com (2603:10a6:150:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Thu, 16 Jan
 2025 13:16:33 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%5]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 13:16:33 +0000
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
Subject: [PATCH v2 3/5] rtc-rv8803: add tamper function to sysfs for rv8901
Date: Thu, 16 Jan 2025 14:15:30 +0100
Message-Id: <20250116131532.471040-4-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116131532.471040-1-markus.burri@mt.com>
References: <20250116131532.471040-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0446.namprd03.prod.outlook.com
 (2603:10b6:610:10e::35) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|GVXPR03MB10213:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b328b61-05dc-4f1a-7351-08dd362fff2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wRp0rk1n0Csq9SnWUfxNCobRf5d4UoCA713PnXUOaXRDhNQqa2Oxwibzkku6?=
 =?us-ascii?Q?vXVswme9KSHM1i4G3wk3Ow6v8oNWwnt0ojOt+1NGsK2aI6B98trsfwY/JfJE?=
 =?us-ascii?Q?qtut5lKVMKwbdKuD4vsBtagzudJDItaxKQW91GXZoZWD0M4q++paAskBdxtu?=
 =?us-ascii?Q?swLlUnZwocFie4tGSn7T5hJwwaYIz7IWsngBW+je87qDjSIBb88uiYNfBPbg?=
 =?us-ascii?Q?Skpjxge1SdzcTrP51pn23OSZ3CuqRteqBrQ0npycnuItCVRYdtjahmvIPcVz?=
 =?us-ascii?Q?JWSYXJOeZaTJFn8TyNndehHNdmHt7QYj3aPBdI4eZ7uY/iBIZ2I1wuKHFJQB?=
 =?us-ascii?Q?VDxHfir6vvDF7A585+U1LWsiQ3Njlq0QJ8yGZafKXJORyssVT5RtmnSdCbXP?=
 =?us-ascii?Q?7IZOs+/pyEToJGXSHHkys9aa5V38ZtJ+Zk4+8E1n0YGBN3KHXT2rjgY7H3mB?=
 =?us-ascii?Q?dG6JERX0aBwotl4cuAbax1pxsdVevrL5rywXJ2OJHTjs5CNDDAOdCegGEcML?=
 =?us-ascii?Q?MlPsFPjxkcHmCmXYz2zAgyqqKf7bBjbkD2YbeU0BCGyiNoAcTzDx7wnp1fRa?=
 =?us-ascii?Q?moYsH0daks1Hj5lG/S0NPYScTSvhXRjQnOO/qX3HZboOBfvYKOt4Sqe1JqMG?=
 =?us-ascii?Q?lbKurQ6Ix0XKzPvbemgxc6FJ7SV3lrWvldx/TAZOPNJhaDZCVtj8oTxRO19I?=
 =?us-ascii?Q?ZaS2zjXocGmWt9mf3SZ20/inRmEoKZ8C2YAfMqtdtmWwKOMdzbNk+9w0jN+9?=
 =?us-ascii?Q?ylIk14wbmrS4B7S5ZUhAi5jTrv2dDcPq9TCToIZ1VRN6Iy0r3CCIDA04U99s?=
 =?us-ascii?Q?YrfI0smPZULQd7bIWRK6z7P2EcetY2fHP58eL13ikbemXoVAcJH7v9LL2LHm?=
 =?us-ascii?Q?V4q/Jkwr1iuqHbRn8KC2cVb7OQxeak4RxKcwx40fGj0E/ewT5LCGAm7ip1+H?=
 =?us-ascii?Q?ke/TdNOhJTlIK7PgPtn310R2Vwt5BR9+lvJzeYgTEu/OgPUuEzGEmLZEMO9B?=
 =?us-ascii?Q?6bUNW0SxGrUDBW43alKtbA3NEHCHnvY3+UqxQanhlscBaWDK44NLWDvkIGfa?=
 =?us-ascii?Q?gqdg/9RIQAtkjXP8SRIg5ej9YWHpGR3LWz9wjKMHvtHd17+JnDF9L8PabQY6?=
 =?us-ascii?Q?9RS4PWdft24S5kFf0G9sFJ8GX1q/jSU4GPmGBa1gAdnuEUvw7c8dxcF3YrI7?=
 =?us-ascii?Q?OhJylPKvW5mZ/OssoIaH5mbSim02F4iboejvOEfnbsDQXV3zVfxGlKTzF6Rn?=
 =?us-ascii?Q?Big36YH3uEGebtDtTn9NNrPhv9ZrQSwzp7AeAwgf9H6RODkpw+EMOjHif9yG?=
 =?us-ascii?Q?Tc/jkuvFtQtjRNntmeEasLo6mMRfc+qkDsiSGudBHHVIbs1It33raDbDMmir?=
 =?us-ascii?Q?Bv1IUwXPyNbP3BnMkW+3FOd7jRtq1EO5X53VZuwr/lR3Zl1IbYo4wYKPKpQp?=
 =?us-ascii?Q?7pAZalYFVY2QQ5fjtc9tvK6vmtmLWu2H?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lUKbHthN4gggRFRgwx4DdgN/qADkfN18zRBYssk3nopju935SBglmK+8clq0?=
 =?us-ascii?Q?Xp6Z1WOZaCrKe7/uFYvz06UYNCuj4ZtDKScH6SlDwqH2+9zwZGD0VDGvyhdv?=
 =?us-ascii?Q?jhrq3OfkzUW517EPlxfBjfnQ5TljiMvYy5HT6KJvlSwqDSvGCLFnMQ6xWEfc?=
 =?us-ascii?Q?EoAdJvfGlMXJYORmfHF72O9oKz7Vzy/hMmQ2IlfOd0Swd+7a7yt8PIEL+XK+?=
 =?us-ascii?Q?4ANn/wG4/ndtLpoCaHQyT6qQJLLQWjCdwSchGQQM3h47w9VEEIiCGo1DDUwG?=
 =?us-ascii?Q?OwH0A01+5j0EZPNdNrYvSQDz7iox8cBIEEo7P+GxDBlwI53OM8AqINzcQJ1H?=
 =?us-ascii?Q?hVzFBcEmjfsicPFzM0Z0rLUx2DcaDxkO/UMGZR0uMFlcPZ1SBLKMzZovHM2e?=
 =?us-ascii?Q?wuM+YSJsHvMVxJ4cseyIZPyOcDRnNigGvhnXhaSKNSAvo5blgA5Gd6sZKF8v?=
 =?us-ascii?Q?VzzDGegjwH51dO14EiUjGW9GxmhMS9vd34qPSHFkJqr6yEpuc9Mu5U75OvqT?=
 =?us-ascii?Q?1d5vjNhHqfQVkM4rJlH6931kZqyLUL6N2uK/LfBzQnSY2EKHu+8l1nbkqgRO?=
 =?us-ascii?Q?30czqdnuAU4zScPsyxsYGeydo6gTZ7PHbUdsWFyHlvJZEakG6oYI3aPkyfuW?=
 =?us-ascii?Q?oXiLU0RzQKlzSXza2/qRdIS0rPzOEqgrVzXbimNI/BWNW3UD1omJ7XaMt4Oy?=
 =?us-ascii?Q?EhkD6HS03W3TssPRm00l1z7xhxLiRIdaHMMgxOXlP/Aalm0hWUMGbhQ+O3/f?=
 =?us-ascii?Q?eDSKO7gpWxmn0Nv3sm19Dft5XDuJJkzsuQkiuDiGaXhh+q4MSvVkSbAwMAdi?=
 =?us-ascii?Q?ZVsD0SZeC9O2d/5HIBcHR88Kstr9ELYhwbROj+E+CFyKmiLpTKsOpIIG0wym?=
 =?us-ascii?Q?7KW5bJysIdsPK4AwlWKCzZc1Wl/Fb6nezdnWJpcy5yNWumH8lzQv1bkDIKBj?=
 =?us-ascii?Q?juL6aL3LfPASgpSVaFxHoHISCUQojHH3TJ1DbAvvwXa0kpH6LLDQT3cPpQNz?=
 =?us-ascii?Q?zAskAmqcFxKfMdiKQX+HoZKfen2cF64cpee+UEXQxzwVOD+DEV3++hZPEM8T?=
 =?us-ascii?Q?zLh4lJ+y2D06ysosacJA444SQw/Kci7RosHOnY9sxBV7AUa6CyflEqauhMBF?=
 =?us-ascii?Q?UgmlhzdYzRYZ2kNFSx/9wG6VfZQdaZvvdNOBw5XwnFBeBe9J1xUxtkwl8tZB?=
 =?us-ascii?Q?1rBZ6TxIw6dyPZK4Q7qpxUSBMt0BWqguLUH1C/ryG8zph6Cj+FKuOBqJsDtS?=
 =?us-ascii?Q?nBEvMgXE36zYXlFknrx7Md2+HNy1qiDDvxJwc9WzOUQoFqC0Efm9dYdaqwxK?=
 =?us-ascii?Q?u/MzoXJuNVqVWSQKanIy+VLfAQ94sVAjgbAYtMuT/yCWQ52c4+bODgHZrX3g?=
 =?us-ascii?Q?K04JSAxRbCdRVRhe1KN8rcMYHksJE2A6ZJdLUVqF1W1jhXMkczJrSARF9SMc?=
 =?us-ascii?Q?budSo/osODoY/l5w7LDmDZ03C6GCSIFUtDOiqczE3MFt+zMBGab2G4qFGCOf?=
 =?us-ascii?Q?EoX7CVCMZCpVOEn75c0SebnpaGnIPFyNjyErpt01J+7cYMuO8/XRLAg/v/RG?=
 =?us-ascii?Q?mGLrqyrnfjZW7El6C0JhsVfKooVxjq61AtVGsbYl?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b328b61-05dc-4f1a-7351-08dd362fff2c
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 13:16:33.0928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38m0C8YiQalp6KYBAmrAATtIT0jWu8BLbZqcJa/xtRt6ZeS8nIZlXkO0G4D0APt0X4GeKDjcfImJLlY997TpTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10213

Add sysfs interface to enable the EVINx pins and read the time-stamp
events from EVINX.

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 .../ABI/testing/sysfs-class-rtc-tamper        |  21 +
 drivers/rtc/rtc-rv8803.c                      | 366 ++++++++++++++++++
 2 files changed, 387 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-rtc-tamper

diff --git a/Documentation/ABI/testing/sysfs-class-rtc-tamper b/Documentation/ABI/testing/sysfs-class-rtc-tamper
new file mode 100644
index 000000000..f035d0fa5
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-rtc-tamper
@@ -0,0 +1,21 @@
+What:		/sys/class/rtc/rtcX/tamper/enable
+Date:		January 2025
+KernelVersion:	6.13
+Contact:	Markus Burri <markus.burri@mt.com>
+Description:	(WO) Attribute to enable and disable the rtc tamper function.
+		Write a '1' to enable tamper detection or a '0' to disable.
+
+What:		/sys/class/rtc/rtcX/tamper/read
+Date:		January 2025
+KernelVersion:	6.13
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
index 50fbae931..764e654c2 100644
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
@@ -58,6 +59,35 @@
 #define RX8900_FLAG_SWOFF		BIT(2)
 #define RX8900_FLAG_VDETOFF		BIT(3)
 
+#define RX8901_EVIN_EN			0x20
+#define RX8901_EVIN1_CFG		0x21
+#define RX8901_EVIN2_CFG		0x23
+#define RX8901_EVIN3_CFG		0x25
+#define RX8901_EVENTx_CFG_POL		GENMASK(1, 0)
+#define RX8901_EVENTx_CFG_PUPD		GENMASK(4, 2)
+
+#define RX8901_EVIN1_FLT		0x22
+#define RX8901_EVIN2_FLT		0x24
+#define RX8901_EVIN3_FLT		0x26
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
@@ -66,6 +96,50 @@ enum rv8803_type {
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
@@ -558,6 +632,292 @@ static int rv8803_nvram_read(void *priv, unsigned int offset,
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
+static int rv8803_ts_enable_events(struct rv8803_data *rv8803, u8 enable_mask)
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
+	if (enable_mask)
+		reg_mask |= RV8803_CTRL_EIE;
+
+	ret = rv8803_write_reg(client, RV8803_CTRL, reg_mask);
+	if (ret)
+		return ret;
+
+	/* events for configuration */
+	ret = rv8803_write_reg(client, RX8901_EVIN_EN, enable_mask);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static ssize_t enable_store(struct device *dev, struct device_attribute *attr, const char *buf,
+			    size_t count)
+{
+	int ret;
+	int i;
+	unsigned long tmo;
+	u8 reg;
+	u8 reg_mask;
+	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
+	struct i2c_client *client = rv8803->client;
+
+	/* EVINxCPEN | EVINxEN */;
+	const u8 reg_mask_evin_en = GENMASK(5, 3) | GENMASK(2, 0);
+
+	bool enable = (strstr(buf, "1") == buf) ? true : false;
+
+	/* check if event detection status match requested mode */
+	ret = rv8803_read_reg(client, RX8901_EVIN_EN);
+	if (ret < 0)
+		return ret;
+
+	/* requested mode match current state -> nothing to do */
+	if (ret == (enable ? reg_mask_evin_en : 0))
+		return count;
+
+	dev_info(&client->dev, "%s time-stamp event detection\n",
+		 (enable) ? "configure" : "disable");
+
+	/*
+	 * 1. disable event detection interrupt
+	 * 2. disable events for configuration
+	 */
+	ret = rv8803_ts_enable_events(rv8803, 0);
+	if (ret < 0)
+		return ret;
+
+	/* for disable no configuration is needed */
+	if (!enable)
+		return count;
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
+	/* check interrupt source is from event 1-3 */
+	ret = rv8803_read_reg(client, RX8901_EVNT_INTF);
+	if (ret < 0)
+		return ret;
+
+	/* CHECK for EVF bit */
+	if (ret & BIT(2)) {
+		/* clear EVINxF 1-3 */
+		reg_mask = BIT(5) | BIT(6) | BIT(7);
+		ret = rv8803_write_reg(client, RX8901_EVNT_INTF, ret & ~reg_mask);
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
+static DEVICE_ATTR_RO(read);
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
@@ -732,6 +1092,12 @@ static int rv8803_probe(struct i2c_client *client)
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


