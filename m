Return-Path: <linux-rtc+bounces-2860-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA01A0881E
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 07:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D6051881C9A
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 06:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBE9207678;
	Fri, 10 Jan 2025 06:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="TMV3ls/W"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F232206F3D;
	Fri, 10 Jan 2025 06:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736489670; cv=fail; b=sFMnw7IJg2j8IdWdOjuMFLgVXL682KcBwhK1WVtOXOEvOW6akqyJWLw0FpE8eGNb4SFqdcFcRLCvDN2UQHpOHwsou819cMrLuEZS0ihj7lc7PvyqeJWvHyD7lZd/gmkideaIZzhW2TtsbebNFXLy8Ob28o6x0EvjnMkt/qMtP2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736489670; c=relaxed/simple;
	bh=2vz1ZVwaJCNDnz3KiAsFhTXQealtkDcR+KuEgV014Uw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dczQO4vKB9j7pXM0fobHR+16ktGRbtYxyQ007M7kdk2treKTgz0RwQiW5yyN6lGzAhv823Jl6XkwCUa1r/lwgYMoBqKJ3awengGgoCvk6j1VQsP9R+i+Z6PJuT/PTnkUVrdLsFze2DDwxa88ZAwiYs3yntwQeWJlKJUEGLUXmak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=TMV3ls/W; arc=fail smtp.client-ip=52.101.70.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLXZxFqwk3R1BCJCNJ8UtmttFwxZo6POkAIhN0ta8UecnBuU+qLfiHqy2qMNaPH6QifRpoiZVNkneOYaoHchRdm04ObO6vmXfIuYqSluhPvQo5xb9zeE4t5T/uvJACEchYWbv/MAibxso6FYCpJg6zd781IZUNOQlL4RCpSsx0jb1kc3QjonJMUjzH4VLWE0xev78DbF+Cts18ZGeIobkAxoncv1grMv2VmXopvWvCuu4tDHstY5NPRZ2ljgfZdtJh0Eb/AYaA5hAHJd1Cq3RITpgUF/zAkKQbMlzociwf7hCdgnuj3CK1ZKEhLv2Ihei0kVcutUo2tqjn254u1IAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nd4XWniXMF+Fx6wnXtBZPE74V0s6WBX+ztagqs0OFrQ=;
 b=N2MwONKdOwTfNmTgzc2GRL9/DNfWGv+5IGEZqH9PHf6RwXFlo8qpfbbEJwxegVMIgmvfoZs//ZBGf91o6aZG+ykpn5Qw6n6cqUnx/4z02TNb8tcWrqG+xnpv88DptzenE9kx+sYO97egJe7EKBPH3VFVZNqM3e4kx+VG4+aYN+4ARhSOqm33nIY1DAYmwiv5SA4Ra6Iy2WPtMgpPwxL9MNWIWhWdpJEse1IaG1l257CE++4rltma5TMcidRdU8jSQt5dbC/F8wJb7oV0RbeIkJ6Pn8sYI8n/TyxYKGOGL+ohiYWf4orQuqQ+4czI6N0PejIlco8Si5M17pILwcz+CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nd4XWniXMF+Fx6wnXtBZPE74V0s6WBX+ztagqs0OFrQ=;
 b=TMV3ls/WwPiiJvN7+y/Uj2nosYTmmpHnuoAsJLEQCkJ1OZiQF48fjZ1x8bljaMM2bzUgG/vSQLtkHtaL2y75dYbrqX5Y3MGwIdUlJ9+557ePd4mnbBvb4x3zrk0+kXH+NTR93R17sFNhqg7LONVsXHwvC6jKNs93yJ8aGSuAaKSz/QsNILrPZUY9EmKWmJhMifUj8waK8nlQox4ml6wSsbnaB63gJR95bhFXg12fN8NeN2W7/Qo9XNgQztJ011Pc4UvBOpFJlh25JJfa7G52ivcyJJn2dZ5gVcYKhLt+Zr7nT6JW2aDMpCFnp7ZGIlsHF1fU0rtVXQAaKIMmvbSb0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by DU0PR03MB8855.eurprd03.prod.outlook.com (2603:10a6:10:40d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 06:14:16 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:14:16 +0000
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
Subject: [PATCH v1 0/7] rtc-rv8803: Implement timestamp trigger over event pins
Date: Fri, 10 Jan 2025 07:13:54 +0100
Message-Id: <20250110061401.358371-1-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:610:32::24) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|DU0PR03MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 579414a7-268d-4e61-4451-08dd313e02f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LNsBpjMmL8hJk4PlC1qNZDTGsXAwkJUkm+Q1MzoPkd6A8+zePu/5rYG2hUV/?=
 =?us-ascii?Q?w5uFHqRwILL98EKeVMLNi1pHUhrcoi1mfhQwwo+KIJIv/jigIL4WOn8Fo5cy?=
 =?us-ascii?Q?wy6m4OcRWDm+S4ULhe5xnGjq4YxF3ysGKWGmr0SaMo0TYuBkcF/fIpNLUNeM?=
 =?us-ascii?Q?XIeCu8W80RJFyntdox3Mo/jF23NOpUTwrqIqDr9+0apjOf+5gSK4IzZSh/ju?=
 =?us-ascii?Q?kc8ctMuOahSPWhGIZ6EKpuLk6kgE/kDOhbsQ7pCh1c0ZB48BU3YMSkBSR02U?=
 =?us-ascii?Q?QhqjEDU8mye3y9Mlirzf3DDPNGfRluv0H7O5Q7bRX+b0N7ZGChr5npMnh57p?=
 =?us-ascii?Q?GeAYQ4Lm26N3UeD4gH96h4sHTzd+pV0+CUN5AqYJ+0dMGFkjREX3rUmN83RL?=
 =?us-ascii?Q?JP498Baaj2mX/rWLy6RuP9MeMX9PHmYWZnUeQkIMzmaIo3Y/m7tMKPgshc8W?=
 =?us-ascii?Q?FuX3P4jbhoHw6+em4pgciM3mQYDPfXMFamZZPC2CM3MVxN+IwS2ca3BxcK4v?=
 =?us-ascii?Q?roUY8WrSwBgusNPTss4kGsMciFbXpK2UsSbASM8b5gyQ4ljdEMPWQMy+PKjr?=
 =?us-ascii?Q?pZGKMQ8EJnxlhWyppY08WlY9G2LQhGjNWGUk2vVuUhU6T6O6fOL3N9SXm8pn?=
 =?us-ascii?Q?VO6at6WEoskyhIW0y8LYNAlLJecPTuQxzYmLjUhcGuR26eB2nmHVjaV8cbPL?=
 =?us-ascii?Q?tZinsa/B3GAbmkWfkBTw89waDv4nS0MVBnuIt8tJM0wrfD2FZG2i04nJVnWw?=
 =?us-ascii?Q?dbozM4lPWnRNA0i90Pz2hMmmYK4l10ZV3DvDBoBVvhIleBL3Y+0NKsoguyeL?=
 =?us-ascii?Q?Dxlb6glYNfKqNZbuc0kehNN+TpdCGT6o18u0+XPEQIZcrrzhdNF2/7BbbiRQ?=
 =?us-ascii?Q?W9xxL6gzXpynPF9ApQ651ZVbbrw+YtqLYmUUa888xrwzIxPSFbc15YShOk1T?=
 =?us-ascii?Q?jdCngrYPatMsilyn76TFZ3Zx47iOOY85T+Rap83tYS7RFms1Nkt93PnHTeFi?=
 =?us-ascii?Q?LzqhrHd5DJMV4v6SVAHcG0OtPgxn/KgYXVgCjCl/T5mSY/4g6ab/Bsm9zIfp?=
 =?us-ascii?Q?rd3Kgcisp6qXwCnD4/Vd3tmAtTICUesLq+FEBguYZCToznc3khk5jAI15Oxd?=
 =?us-ascii?Q?u1skbmUpnyDfaOXNZ1xWHiowXRO+/PIQR8xbFhgC6tRBC8CFUCLUQdVtgywi?=
 =?us-ascii?Q?rimZWgAlw4K+sdIvl46k1qyF/MgOpNwE8WQCFuCgpBw+mPryl9xxAMOnNm6/?=
 =?us-ascii?Q?K2Rg/+6DshGHrZHGI6hVNADlebjf1TOambh4nQCNlLs4HgrU+nPajuq1iHJ5?=
 =?us-ascii?Q?Gtp0xcmgInvNoJyoYo6yDzBoLqj+mmfIwVziFRh9FLCsp2D0S5zYkhhAUCGE?=
 =?us-ascii?Q?ZG1/7snOBtcDPz9sJ95XZwhlfMxM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pWAJuv/v02nWC0XldofAJuo9IKxb2H3YRtJGRHc1E0q4LUIYLfew8jWQSHLR?=
 =?us-ascii?Q?F0REDmPle95ncSbBK29hqKNaLsX/EUC72THieDhzDgM+39uLR6e0LKxGc28O?=
 =?us-ascii?Q?6mldtNz8J+wSyLcjPGy2xjH5NYq1GfQ/txTOC46pGEKP/uwBd1gD2lLZpOZt?=
 =?us-ascii?Q?oDCouYONjKC/3rE0YuwyFF24R7F8FPsuFLd1STP+rU6mBS4p0ByJuIxT+sbT?=
 =?us-ascii?Q?xpQ+ZYxAlGVyTPJPx/uu2fCak5kDafeksBoW4Efpbllc1cMN6FaQgmn5FrNX?=
 =?us-ascii?Q?b4cbVXSa1Fouoq3QSRm4mS1E6ZmNDEanN8EtAWVKpMzdaLGLLy+z3NR/tS4s?=
 =?us-ascii?Q?oXhHf+nO/Z+1tup5FpJfiEpt9+vQ7lR92wuVZpffuykg8g0YJwfiLJci36MB?=
 =?us-ascii?Q?75xxbAm1t6mpE5DcIGCV5GMyM2VCvVL6DbAACeeBoZ3wDWxulJ5wjL4AE/tk?=
 =?us-ascii?Q?llqcdD66m9PZZTJ1AiFeduyIY/KD9AzZYTLUL9knd9Et/bM2xUOlSog5hPuN?=
 =?us-ascii?Q?qcFJU3C7fhovzXoFsAtPlg6nGj5ZO7UGHxH/isNjh/A7r3HFbhn/rfuzJTCK?=
 =?us-ascii?Q?C5DkueArPTdOviSPnlQyUS/grnYq3UUKCxvtBDDtREUFll6CUAmVqArRlpa7?=
 =?us-ascii?Q?Iss3123agIOr/OQNWinAq5xuYYasxd3NB+xmbCMQpUiucecDTqfhqhOp63lC?=
 =?us-ascii?Q?VT5roDEj5KfZA1IrpyaXlG/fXaSMShNLRbr25d0yB71zRCsKtUmseZ12BjbQ?=
 =?us-ascii?Q?1z6K69eM1r+6Un1ptLHlLxFRZGMhj8MUcRqEg7EMsXt9AtCi/zYnF8MWEs0b?=
 =?us-ascii?Q?6GejAsaisoxROdwckxNMMYJSCLZRvki7D234m5ppkQ4890W2F2CNp8F8Nx6O?=
 =?us-ascii?Q?VNuN5OSTKuVNceuDgy4Emdvp0pTIios2BewJGuBmbPW7DWGPGBNVU13zK7z5?=
 =?us-ascii?Q?vWpHmgk4YZxjxr33wU4lXPBiPfsbqLMjPMuHrAlVHlxTHTFQumhJeFaM3I1a?=
 =?us-ascii?Q?4z8y9apgFj5WvYzqKuU/K6evmd8wUAPZGAChdkVvYWe2lTrQJb8AZ+jvy/20?=
 =?us-ascii?Q?4wmfD+Kx2bHBW91/yS0paOxJpBgAtXJO8DSILejkYepcyba1Henws/CAvFNx?=
 =?us-ascii?Q?1fz6W8HbEGwMPN9MQpbsRAEru7McoCae1X/FeVr78GqA8Us76hLyHN9SBvJi?=
 =?us-ascii?Q?i3k1Lhz9VmtCDuSAqev7o8aGE5Pag8ZkPcA+2461rpCMCBrNb+JWTJv49QeC?=
 =?us-ascii?Q?gkCHoXZ2zSRgOKzerZRzzTyXmiZRwuq1g9vd8Y+uMSt/BrR7Re0FtlOpS2ML?=
 =?us-ascii?Q?08pUFuM+owNIK2Jng28LyO+qwOwsdzq7WrPS4EY5KhtDwejLyDQs+1KzrdOI?=
 =?us-ascii?Q?dcdoUzKYBUVqAu/3s9NbHz1UKt1d5PLqjbqZds39GDYdREARCauoJeKv0p8Q?=
 =?us-ascii?Q?kESJmH7J+xKIQoWyZI7CwV23jal5axIVVjIR0U76266AMTFYuKrmPBAJfMiV?=
 =?us-ascii?Q?PYol/sAMQAPToJZLJ/l9JgqCJ3hab/Do8V6IQzquIXHA6Op072Nc00WjOwz5?=
 =?us-ascii?Q?wRUjH9WQ86cYjvUsFyq1bANOWHwGAdaRFMaGIhNx?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 579414a7-268d-4e61-4451-08dd313e02f9
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:14:16.4786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ONh66sL0Jv3FH8WpVkhWGikA8LgR+ZEDaRlTy05hkJUarF2dC2UvmZh03omwRccJm4lRl78Je6sSbjEqXtDqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8855

The RV8901 RTC chip provides a function to store timestamp events.
There are three input pins (EVIN1-3) available for triggering.
The timestamp can be read to detect tamper alerts, for example.

This patch series extends the sysfs interface to enable, configure, and
read the timestamp events.

Currently the configuration is implemented in sysfs.
Maybe this could be moved into device-tree, since pull-resistor, edge and
timing is more hardware dependent.

The data-sheet can be found here:
https://download.epsondevice.com/td/pdf/brief/RX8901CE_en.pdf

This patch-queue applies to 'linux-6.13~rc6'

Markus Burri (7):
  dt-bindings: rtc: add new type for epson,rx8901
  rtc-rv8803: add new type for rv8901
  rtc-rv8803: add register definitions for rv8901 tamper detection
  rtc-rv8803: add tamper function to sysfs for rv8901
  rtc-rv8803: extend sysfs to trigger internal ts-event
  rtc-rv8803: make tamper function configurable via sysfs
  rtc-rv8803: extend sysfs to read ts-event and buffer status

 .../devicetree/bindings/rtc/epson,rx8900.yaml |   2 +
 drivers/rtc/rtc-rv8803.c                      | 778 +++++++++++++++++-
 2 files changed, 778 insertions(+), 2 deletions(-)

-- 
2.39.5


