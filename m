Return-Path: <linux-rtc+bounces-4089-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD41AB5993
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 18:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1CF5861413
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 16:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C962B2BE7D5;
	Tue, 13 May 2025 16:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="aWYgRt+p"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2067.outbound.protection.outlook.com [40.107.105.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05681E487;
	Tue, 13 May 2025 16:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153182; cv=fail; b=OWIhlhC+jj8vGGKPNDd1ZEoOBajt6EvOFxFaQ0NC83h/Xx4MEMGcKJL184O6sDmcDIRYi7e7srWUy40fTwJBuveP0to5l4pwMFBHLnngyU350GBbNQX5xFHz0xucQoz6jkZ4npGJhLzGHrWF+z7JcS2zmmso5FsWbOLuSQFnVSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153182; c=relaxed/simple;
	bh=nnVMxqb8D++ELDyzRQ4cDsmvhoe08gOSrBMk9n2UO1w=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=W6IouTU/GkO7JGmc0UdJfQqEbZ7fIY7DCt4BreA6w8QOBvy3wsFBupuAaFirNgvV/o4oBFm4peLnzSzMmdJMAoekqSxHHYXUL3lUHQF2yvscGJBrGv1IyVbT1jeZAUzaDKnHaBbIGyzk9mYToKScuQOE5I9DSPlU6kujkrYtBcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=aWYgRt+p; arc=fail smtp.client-ip=40.107.105.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLnqG2Y2fVFXI4f4Bk5AGSx5x4VtbeGwxOEUxj0yrocpH2Rso7yYmQqtjlAqP/CUEBPaHc2qJF8lDMMScb+x+LKY0ukPhf5UbWafwnO6AZLTn0f3BphR4soY+agthj9ryCSQBVb+99wcmyu7vd1G4Jql06/BB4LSXdnLSJ2TYOZok81JGt7AMMhoPnz/N2mEulizMpknIgYQGrllZd0ytXRIaRXAp7Tmyxy/h7d1zIG07X56T7/BvxrFqH1DSPANdM88q3ARdYKmR0FZ2ca0hRmA8M36gqpa9Bh0sSowtzTW7JLm3QplIlXREuT20r09C8SbAyYT4KLQ41kDmMLmlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8zh07OxUgB6xxNtpC++58q2PQ0SioNs8Ep7Fn5GZ58=;
 b=yTLHxT9q76b55413VfcgKMYOAfDdRvixfBWkSciYrcgQpRzrRHcRecKysrTYhtCcWJbrFuG04H8Z9LWURHndalCn71SB3AdarLkPDTJfB1wIYvQR1dq8d/O3nPPqyquKjDyWxBHaQ+/n8Uw2SYayrbmBeYFk67I/KMsZ2HyBi4HkHcRk/UfYITizyiIKW7R3sDhUNt8LxVU7t7WgIxy/EJ29Z6oa/Ysnro7dYtHRdIrWKFyE6zDAwHZSVHIfSg5w9H83iDrsN2JA8EX5JgHaQhDytsyIyPk2lnXU+aImkEXyx6reRHonzUyfgPRfHls2JHf+BfPQw0vXb/AKiIG7Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8zh07OxUgB6xxNtpC++58q2PQ0SioNs8Ep7Fn5GZ58=;
 b=aWYgRt+pBVtM6JVjOBzIRhyZQr3R7pmYZjB3i5EZdTlABbrA1a1vlH7DtgEB8rn+CBzySDK0h/TJ+DoevUx1gA4pcGAZEFXuSnaBU12uYcSUhMXVKVUwZHvV3qQMKNYeZxNjHRhLzQYQbbCzkxEOeOJnE/et7m6o6dLH4JmVaMq9RxGdwSaVU8FJR/bT1JvCILvPzJ4VWI1N0p4U4B3BMapNEVgGrjRYhwpKRjPCN60+CD9Wwg/2RiWDK2LArObTNJMlieFEl0vJ2YL2loEo569SVRKoVDiLhni7cwV3eVubB+Ft4POpmkv2n38gsf95kIV5r89rL0bUvpkYXOQdMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 AM9PR03MB6724.eurprd03.prod.outlook.com (2603:10a6:20b:280::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 16:19:36 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Tue, 13 May 2025
 16:19:36 +0000
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
Subject: [PATCH v3 0/7] rtc-rv8803: Implement timestamp trigger over event pins
Date: Tue, 13 May 2025 18:19:15 +0200
Message-Id: <20250513161922.4064-1-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0027.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::7)
 To DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|AM9PR03MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: bd5df19d-591d-421d-e95d-08dd9239f42f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cIzaJ7aEIf1Bcy9HZi+Wqb0z2XI289q+GG+FW6XIK6v533eVq9Zz4USS9ClF?=
 =?us-ascii?Q?4nN8zDUgL43SiJZldsXXxohn3qIoBX40vjk5/KSD+KBzV9jOHfJLXy4dcaJ3?=
 =?us-ascii?Q?1Kjt6doaBhXvZMCYBGkp5wXQNjTqlim1sIxqc6f510TFzsf/P3PxJynWGKUq?=
 =?us-ascii?Q?p//pY3iVZ7+FXfKkCYCBu63/qUKSm7hEjTShbt+byNaFze+M0U5k4Begf77P?=
 =?us-ascii?Q?Nc2flq5hwtzEeet0GI8loup+m374F9lVxANHbIkf/Z9Dul7nbJap3eUvCOjH?=
 =?us-ascii?Q?CKdVJpejxjuL4jE2kOwwjUj1niG/udMWNerBObpTpsbQdQ2jCxDG8GmfM+h3?=
 =?us-ascii?Q?O7hR+tTLndEmrmWFh3BEihueKtMt+y/KKPf9LN0MNpUJ3J+/nQ+DdWSCAzPJ?=
 =?us-ascii?Q?9wx+Xgc3r4RqYSe+0vAUefd4ARJWsUajInaWNUkYH2f57dQHnW48H3dHk2Vw?=
 =?us-ascii?Q?k0E4N3IWu0FGeVRQnzQE3spnP5YSnqRoJZw5ORrkVqV/EYjzrZPWt7YxG6L6?=
 =?us-ascii?Q?vhrlD7PrHfWb1rNosdgfX2c+sh6xxH4Q2H3NCZf5zYjFc68U54mVdYz8n6ab?=
 =?us-ascii?Q?ETssvDG1b1DoJAWOzqse0vqAZRR/Gf8GC7JVQTCGRJFei8ohkAhcQ6sgftzN?=
 =?us-ascii?Q?TLGvU5j9UxTWjeat7YCfCDQFUIJCaUVZhp0/U5yhwuAnKjFF3lGtJja1hBDj?=
 =?us-ascii?Q?sacNHx6fkcpvzd9tVFYs8u2C3WrKeUV4UyjMCXUO8LQuUlkySftzBGTF6oZs?=
 =?us-ascii?Q?66ls6FPeWQ47spiutHytZvYjSpVsSF6msuaQculgBIJPn7xcxIdOU1JDWfug?=
 =?us-ascii?Q?SjHJ+qjR/dJeF4qMUKzxHtkE24Z8EmHWdgVO/ZaytBD5mJGuLcxxY313qKVh?=
 =?us-ascii?Q?3ynQdGDwvW74pMq9JU20LjLKg14BRiB1yaGDWeRQJRbB+tprwXu6wZmyJqqu?=
 =?us-ascii?Q?TLJQVFnBDigRtLElvBriHuPs2mdlF7wy7JsbLVhX1gHEq6ez81Fx679Af6fh?=
 =?us-ascii?Q?5YpyWDP3a5/A+Qpj7D5HqAFOGbEH+sYp/W+myO9J/yV5YbK26sOXZ1KN+m+/?=
 =?us-ascii?Q?phzeP9nlNVO0R/SCiyijebaAMOe4QSR4paEQtGL7ItyqqaGmuHmlCJmt/dhx?=
 =?us-ascii?Q?xZ0PhxY1ghhhibBvr/y997Anzh8YmZBAYPpiP5mTiNQnEhcXyLZgKsHr85e4?=
 =?us-ascii?Q?xIkd/i7YyxEsgMgU5evwQ2bUP6HIf8to7Cr34rMvwA8a0keHhwBA9jNJAf1e?=
 =?us-ascii?Q?B25rM9Umio4VldXqZTPRVBMJY9sCMlazlidr8g4rmq/aJmJrsOWJG28DT8c/?=
 =?us-ascii?Q?3+uLfI0fj8HgbZKO5l9pxpzPnYWOpcn+GV7N4LBYA5oEXQzBWohzUmzXSsNW?=
 =?us-ascii?Q?oCsI6tUtZhUxoZ+HR5tvcaP5xSu8xCJRVzp40g7PBgbSngH0asSeEzzGAyoD?=
 =?us-ascii?Q?g/luP8OxRsU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7qdjueYWbVrEQGbLpxwyFMOtNSGzCa7Va7/QhbELGBRo7tk5/2y6nZHHklUR?=
 =?us-ascii?Q?VmMoQwcprEeCVct4Gzaivi2XaPd2hdTbJ8T13dG7vRoNqYSDfkTnInUk8SVK?=
 =?us-ascii?Q?nJ6ejuJ8JejxhaIQ8JDSeMc6/Z84JjEhQ5a3p23LJKiUBKV5koqIfGlrQhGq?=
 =?us-ascii?Q?7Y8V4msMRHlN33oR9o58/1Eje3kjAApmM2lc5VWpKj9Epw/74vHQgewki4EV?=
 =?us-ascii?Q?MPe7dyMCYNWF6V9IfXaRLMKQGC3OPknJ+56mkDc8/6OVeDgKhAj4A4ghKlIv?=
 =?us-ascii?Q?VqZqqDPYDMbcSl1UMOlSqb4afj5IF3HC92VPplrVnPVUyxdAx3uoYjbIn3PJ?=
 =?us-ascii?Q?TCr2cgR8y/imeNbOdER1KwgMyWlO7zbkY7f/3S0w9ji+0qRJI0GfFMMARkeC?=
 =?us-ascii?Q?ZjJpariws6rz9LVLLR3Q6AtzJ74p/m960or8tnlSo7HBb/9AAPAjkUpL3MCO?=
 =?us-ascii?Q?UsQYWIaLCCAfzp00optZiELAQy47CQJGFYD2k9QJK7fDevI+eSjkMFDktB9h?=
 =?us-ascii?Q?rOxGmsGWgCmS8OZi8DoQK0oVXedpnq7vW2yjGtJqiH3zbQvMMxfCu68LOa/D?=
 =?us-ascii?Q?grQHE+RdAXXp5gXU6VTQ7XJsVJt2udnvsPBpOpk2V6yD21eTxazJq3rSKA/5?=
 =?us-ascii?Q?ARUKsvCfU6MYCRcNlRghaT+HMB1v9pzJyc5UIb1ikBCUB5IgUbZ6SGnioDJ5?=
 =?us-ascii?Q?qdfIJvZo/5pSMJhPHYIvehTa++N8Vpe6Vs/cwU0I0T9GL+nJVCzjK95X9mOB?=
 =?us-ascii?Q?+wN3LxwntjLU9ouBV+l2GAhA/lmCDV7WVPk5mgNdBFSq0Bw3mS/FlLIsrnkj?=
 =?us-ascii?Q?cIWUgbLoM6O8pAgX4x58QUmhJba3uu7cTHHdjfukqPDv/pVI9kVe5rxNxRwh?=
 =?us-ascii?Q?l7Cctf5r1oLBY/esCh6uvwArib0CWmZEaonHGeTbe+c9kFDxLjlu5lOiztgK?=
 =?us-ascii?Q?Tn5cSW/FQ0AIreZFEC4no9vOcH5uoxqLknOu03NX4eehTXXas2GM6y+ujR8J?=
 =?us-ascii?Q?pURjT9wMOP2dD7mc7S44NwWdlekjchpfxHr6nkDlDBx8r+hdeiEWVVs4Mhpj?=
 =?us-ascii?Q?oIMwOmdrT+iTau6ZZk7V1RUiC0cAMhrWUO6OSiUw2SfJjA0IZ8DLQbmKEST2?=
 =?us-ascii?Q?mnE5MON/Dj62d7tLEJi1phin+NSuy1UH5de1mDPj6r3EQB8F/Pn20YYCD/cz?=
 =?us-ascii?Q?04iiZWTnoeTyGOoKSFNCtE4bBBtscx2g5q5g8hZrS1CngtJqy/fogWtHvU7w?=
 =?us-ascii?Q?CR1ZA43ao9Rr5WNZa61vgEK6FDKn8iwGIr1K4zyH0bnOMyMntd0JDdyg920f?=
 =?us-ascii?Q?4McPb4ld5iERp3ezhojn5u4/3X0O07rrMHICbFRz1hTFjWAuamzhby2eepCU?=
 =?us-ascii?Q?IqgniJBzLBJrsgEg5GS5x2q2PUddqbuGaH45sAbrExn3W7gN98J9zvYzPaAy?=
 =?us-ascii?Q?TReoJ9acpG5lp4K1Q6msORF/QXAUNUinNCnaLJ0ExEpPatOisFmuenmV/yfI?=
 =?us-ascii?Q?y7C5fGn33trqOK8mpL8og4v0SSU7M6WYwIRlpJOXMxszrAlwfVTYLrF/DoAB?=
 =?us-ascii?Q?/Ol0xICS41WC1XyLs9WV1LAnvRFxObybPlHwSq5a?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5df19d-591d-421d-e95d-08dd9239f42f
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 16:19:36.5176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMWOEOMWbse1hR61YriFbeKa2lef/1ezjFldm5+OmntGR2HyYkEeQQ0nexlL7vhLfDrv5Ts/GSTq14GgJsth5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6724

The RV8901 RTC chip provides a function to store timestamp events.
There are three input pins (EVIN1-3) available for triggering.
The timestamp can be read to detect tamper alerts, for example.

This patch series extends the sysfs interface to enable and read the 
timestamp events.

The data-sheet can be found here:
https://download.epsondevice.com/td/pdf/brief/RX8901CE_en.pdf

This series applies on 'linux-6.13~rc7'

Changes in V3:
* change permission for sysfs read to admin
* add device-tree bindings for event pin and buffer mode configuration

Changes in V2:
* remove separate patch for register definitions
* remove pin configuration over sysfs (use default settings)
* add sysfs documentation
* rework enable to simplify and remove big mutext scope
---
[V1] https://lore.kernel.org/lkml/20250110061401.358371-1-markus.burri@mt.com/
[V2] https://lore.kernel.org/lkml/20250116131532.471040-1-markus.burri@mt.com/

Markus Burri (7):
  dt-bindings: rtc: add new type for epson,rx8901
  rtc-rv8803: add new type for rv8901
  rtc-rv8803: add tamper function to sysfs for rv8901
  rtc-rv8803: extend sysfs to trigger internal ts-event
  rtc-rv8803: extend sysfs to read status
  dt-bindings: rtc-rv8803: add tamper detection property node
  rtc-rv8803: make tamper function configurable via dt

 .../ABI/testing/sysfs-class-rtc-tamper        |  36 ++
 .../devicetree/bindings/rtc/epson,rx8900.yaml |  42 +-
 drivers/rtc/rtc-rv8803.c                      | 599 +++++++++++++++++-
 3 files changed, 672 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-rtc-tamper


base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
-- 
2.39.5

