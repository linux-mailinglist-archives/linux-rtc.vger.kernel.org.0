Return-Path: <linux-rtc+bounces-2502-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 602D89C4217
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 16:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE4AD28875D
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 15:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5279A1A2557;
	Mon, 11 Nov 2024 15:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b="qqmuWuzU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2107.outbound.protection.outlook.com [40.107.22.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681551A00D1;
	Mon, 11 Nov 2024 15:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731339739; cv=fail; b=KI7c4h8cNm+Zj7WafQ6Z3COpy6xIwuRWnjbjjyk1KwlN2YtARXY440yEOcc7e6oI+gk3ujCs+ovijYa0Zfclxu0U0h9TwmPltG7OiyDsN4ZeaaX40Q/2+1Kch5HjE9Q+R4rAmR0pfppoSKjBkeuG9L2EKai6cMtBGrrc/RBTuJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731339739; c=relaxed/simple;
	bh=kzh/FvD+sgQ1Ulj0p831AGtdz5II/UlAYJk4dDs+ckU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i/B/o0OT/W0aay4TsfyrtzAJAfX0Thh2fTgBLncXHF/d9w6Wq7u5sVPHazDtJoUfi7HeMWu+KXzsw0H5fJfH1yrYPsqP+7/ExA8HKI4wtIQzjrLm23F0nOjCo7GbiIlBlcJ1hWRq5VjNpMUC/zqkF/wXQNcll/CLchzv8r+OdNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com; spf=pass smtp.mailfrom=kunbus.com; dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b=qqmuWuzU; arc=fail smtp.client-ip=40.107.22.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kunbus.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsEhJkixyNyxgVlpQh825rMSOA26toN9XgvxI5ug9qX0b/zitAksX/V67XkYk0g8Z9Ex+K84otJ4iDc1rjJvHtLbcDNnOMvbrUvRTlTeuzEGJKpIbj/lyOd2oiiOUJS2gDLa8ibtk6JOq8Qk5nuLmPV9GKI1FfZzFElXKADPnIs8C1Xtd4O64KR1twVCqSk6iO6csUiXlIKy08O8MvgwfsYjsMtvaJRyH4iUCVqDvgNASR5P83EfJsr4EyuCpr1NLpM2NAdOuLcHTavcUnx+mDdV5mAA1B55tG9G8fd4mYAhQnnNG8lOtfaxAhN4S6YPfobIyh1DTzoWEaQ50kpvBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBwozDiUGyxWl0PurQJhwHBzn+GsyRVrQI2TOZA3aAY=;
 b=qp1YSCOR2GoY6/xTWrFYC/V8lH6+U8ISr9/8Y9EOaqiWiSvVjZtFwzRdlTlH1DvlXBewr8k7LEq2M9nmxvaE1WrNJpOb5i76GT7M/njMXDbblSMLYp8VkIUy5UTSHbTWAGskuiUS7wZA5piCOERNyILO5hS/iFKKqb3yK3LwBNnRx4ds/GoBYI+Byf12THYQudu2BUZ7oYLRbOOQXMTQlJ0uWxiA+HFrC+Ev3Df1SQYMoW0RoaUdEDWNrwVWaLKwWp5+WNJYug1nnD2oAgOoPzbKmGy6fuB2wUYD8lvkgbKNIIjBG1AYm9jZGPPH8Io3xTheEkZUQ+RBnjKMleNHLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kunbus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBwozDiUGyxWl0PurQJhwHBzn+GsyRVrQI2TOZA3aAY=;
 b=qqmuWuzUI28GJ82WOfs3UwRc6/m2PYg7I5oV+Q7/mqHaKJXjhezxkOJ9hz0UoHUCintS8TnvkjTtijQkXxsbkzWMSBJ3CfWSHWopacTjudKexySkEt2xIIkpW/FEzpn/bBwyhK5ewZfsefwCDqVPNgQdrkMJDvFZwLGmlcsK7H0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kunbus.com;
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:160::8)
 by DU2P193MB2001.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 15:42:13 +0000
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90]) by AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90%3]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 15:42:13 +0000
From: Philipp Rosenberger <p.rosenberger@kunbus.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	=?UTF-8?q?Thomas=20B=C3=B6hler?= <t.boehler@kunbus.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Philipp Rosenberger <p.rosenberger@kunbus.com>
Subject: [PATCH v3 1/2] dt-bindings: rtc: pcf2127: Add nxp,battery-backed flag
Date: Mon, 11 Nov 2024 16:41:43 +0100
Message-Id: <20241111154144.163604-2-p.rosenberger@kunbus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241111154144.163604-1-p.rosenberger@kunbus.com>
References: <20241111154144.163604-1-p.rosenberger@kunbus.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:160::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0P193MB0738:EE_|DU2P193MB2001:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a80ab09-3147-43f0-21c8-08dd0267696e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?otGPgqK5kK/UmVRZjTXtNiQBHAWWUFkvhTt+12GCjC4fT5gX9v1S+Jr4wfRR?=
 =?us-ascii?Q?oGpe9/DerEPoQdWnhcNOotPvMuk1EJHnJ94NjaKjsHCDhrIa/Yto997akD1c?=
 =?us-ascii?Q?eeEf2pAufP0KPO7g2QS1hjsrEuE7swLoA/AyT2ZMrq8Vr8SDoXxo8594AzOQ?=
 =?us-ascii?Q?8RgPp9tiFVI1Y4H25UUWuNVOJprcxe03ffSA7BhjCCf4uGtcSWjh/XJuPEqT?=
 =?us-ascii?Q?O1QMRezLrr8g+TPe2c8bzB6gEizadKWIpk5pTMevj6pXiXLqh9fxriqNaPFZ?=
 =?us-ascii?Q?6fS9d0zYted/fyZv3A9jcrIUCAWPR7HQngH+1qPWPnVO88Oe5+RufRYKFG6j?=
 =?us-ascii?Q?IUR4HhWoUE5wAS/RTZeMaHExrnElhlxo9grE0VyjUAfIfoWDknHM7C/7M/b1?=
 =?us-ascii?Q?HRNwh8eVeMuvoCmJFIn2bCy91Lh30BunbQcKlna8xWDueugCFdN5ORCcw+r3?=
 =?us-ascii?Q?/Qo9/Nic7CGwUwa2Q7Xhp0xdBz0obGlnYwpppSV7qJV4164IELwVqMLJ38Hu?=
 =?us-ascii?Q?zZNeN79egxTje5etRLjY15zcvEb4q49vFK0aIp6wH1prpRlzL7aA2ujWNQ8W?=
 =?us-ascii?Q?rk1iUUOQJq9PY+HFSgUbWjEC2oI3R4lG1ALhm/Jk0BQBD4f173X4+X2koAEV?=
 =?us-ascii?Q?0+D4gNbEHEcjS6jIgO8hia3msoVhdsEJZ6fydqc4C35Eqgx7qDD4OUpwKc+4?=
 =?us-ascii?Q?YPLTwpL1iK28fuk5Twjj2YicaiHUCP504ukQIY72kEWfQP/qhJTpHTEdgmsl?=
 =?us-ascii?Q?q1Jg+ibKAhThCebGkmf9IAMGfXXBG5YRGJRRgZCF0ijSKpaJBBpgN217bs1V?=
 =?us-ascii?Q?kw5wm0qbw/rqUTTj/o9++7Yn9kpoHi3GPaeCz7YNG+hItkg+KSmGNZ9szHqY?=
 =?us-ascii?Q?/o5FXW4Za7Rp9S0/RRhTtx4a/m8H2tpwR7qEobcucl7KVWEqmcnTr5DxH+zx?=
 =?us-ascii?Q?EkdVmuoCtIIAR+boznPTSDYmTBo634bTjGEteMTRurBJz58dxmi8v3hGQNrv?=
 =?us-ascii?Q?oM4WYrtTQTQo8Z6Xre/fGLbpePMcPTM2NukIcwNDB2XeZ+qFqFrrUl+aDNc0?=
 =?us-ascii?Q?Csf7YhCgIaVWGMc3Y1xxjmDjp20UvO2jnB7mlsrdnsOiyKtnGWjBW5EV//67?=
 =?us-ascii?Q?rLvcTBjB1ZmCHwDwtXg3hnZ0buzAYhoVPlkATTp3EuSqukmPiJqe3ePLAMLC?=
 =?us-ascii?Q?zhA2paKhRb93do2R6t/zPByx4vQRH3U2vqAZzpJl8dno3rrn/c8tF4j5w9mY?=
 =?us-ascii?Q?sK5YSEipygPIgIewI+XP7VpJdyvLunBUIRfb6J7eekrCd58jEPG4vYBf7aeo?=
 =?us-ascii?Q?BoRBIj+yAUXVmJrkkSOvHQm++zJ75Tz3Z2Ec2S1hOIblx+xnvliTILOxcSWd?=
 =?us-ascii?Q?lLr3aLs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P193MB0738.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YnE05HOcVQVqGYAM30sr0DJ1+pRzRAGo8LwpC68VOCrDcH6WTLpfPp//cAbP?=
 =?us-ascii?Q?C7jvzRB5MCpFNcePATV6nj4s50xPth/S1WmcSXeq7FI+fVDpGVRKBWP2gLAn?=
 =?us-ascii?Q?mY+XNHJ2IQ9rDHsrmuFwlROPdTw77JwJx3x641qzbp46biAHDiWayzpNORc6?=
 =?us-ascii?Q?EGjEa7IHj30jQDOKKstEXmf7iiiCzCwMdrQW6tYuY+6EFGwjsUCO0VInA2/P?=
 =?us-ascii?Q?j1DRkcRqWsK3PSR2EuozWklWmWxQU4gZLDzp9vmcyhdTvib01pgq6O3J9fYI?=
 =?us-ascii?Q?vV90UZM22lPgUb+6GrAAK4Bj9BLXXo/TZWRdGdWeO2uJYB2Pdo9D4uACbJUV?=
 =?us-ascii?Q?B3i2yIZV2vpSGVEaseY0R7Ya23bNnMxyl3zgtZsfjS8TnIKtsWTosu3Ck1dj?=
 =?us-ascii?Q?Q1BSVM5cfDcD/U7AjguvYid0wSAY+0IqJPGS4L5YiWUFA4Q4357bT5mJqvTT?=
 =?us-ascii?Q?1VitOFZ3RybbouaujBJyM44kieA/O/voqeO2Q/XNQb9HE8CZXWcBWUWM+XEQ?=
 =?us-ascii?Q?P6I8q6hzI6MbaLCGsS/r0Rq8X4FJMDX4jF/auUHR97LssWa4MZOntXtC5OtP?=
 =?us-ascii?Q?wV76c3rygO+d5jbnMeeELZ5Pyi2zcnX8ibsoq7dt3rZlyy/NGVvvZvqKi4Z8?=
 =?us-ascii?Q?hqkNyWY02mLv9pRE5GUcrfKWXHePKyN0P5b2v69J4JMpmbGe0veqsqwY8Fus?=
 =?us-ascii?Q?nKWtvQcFA5B7cy/9OoL1ucFpNfatwXHbqhnc51US0hVWI4NfQodQ4klXYjgn?=
 =?us-ascii?Q?MQF81hqKvuDHBEH851iuUOUqFBRL5oT28ztWygj90iamv1DMOs0ImUqGpkZi?=
 =?us-ascii?Q?N0UupA876OJo66l8S7fqK7sivQWB1gG1pHE6bVPJc0GFLWRDvDabkV+PFqI+?=
 =?us-ascii?Q?Vap5VNwMH3mMJpOAA4kDOvXfZjxJpansjHpEEt/z1e6wPnZNGsk3vVynUijs?=
 =?us-ascii?Q?bS1zl9SqSUgJ1NYKd1BNM0VEx7ckuHlYSrH2ulHOVDJCNrIiA0Miz8z9o8Gn?=
 =?us-ascii?Q?EPFDywwGYz1QFfnjNVi5LaVTQQIgioxi6CNRv3IjkEsc94xLgNTlT9GHjYsw?=
 =?us-ascii?Q?ByX4xFjsuEjnu194hAtWvgpkV9yCCkkRJclPTed62Ecq+2dRAdIauPkJOSHf?=
 =?us-ascii?Q?ic1LffGpq4Ahb0mkVKnpVDnAoI0iYc5r1YnFwbNFXw07VQAqUL4ZEAGlUIP8?=
 =?us-ascii?Q?vT8crb3tYASEB8n0rYbT/ArFYuc42qT42CKMK8HDpmisKPfchQtjSHzDbMRa?=
 =?us-ascii?Q?Fs2wc+LBTBL/ggzNI143kpDifPKUiMtjhenyT+Vi/tY4VAGKh4MGjnWpW3Mi?=
 =?us-ascii?Q?Rxpb+5RbkHbd3xBXy5936r/W+WGlokS2xX4kLmgwdGSA8mtMu9Ds+FJFEyM8?=
 =?us-ascii?Q?9EWWHNbdOT7Vep0mu9YiMIfzUUwqidA5AiXk/UC1k2irt5vYNg+Zy8AzxzIf?=
 =?us-ascii?Q?WXusUp+1NfSaXHO0gScpo9wRugJ7cthjGhlsUnY204mWNyhY5EMFHeLYTkex?=
 =?us-ascii?Q?SwWeslXLDM/VK3w6JEqptkwiGlRH2NQQk2lUg3nKQsUM3QgDZWsLKlP+DWiu?=
 =?us-ascii?Q?6A1kwzz3skIdY4mYWNVZ5muaZrezI5jBrvZGoURK3OJ2lbvw5May/9UhkIMf?=
 =?us-ascii?Q?kQ=3D=3D?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a80ab09-3147-43f0-21c8-08dd0267696e
X-MS-Exchange-CrossTenant-AuthSource: AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 15:42:13.1603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRrzmWVnSiJ1uepv7IbSBWDFnRazLJfU/CEQuDB6X/Xpo6kFfX7qt0Ditzsj47tGDYELlc/ZzXPQZdAqwnZ8e7Lm7uLfH8pC6qeZM4VGf3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P193MB2001

This commit introduces the nxp,battery-backed property to the
nxp,pcf2127 Device Tree bindings. This flag indicates that the
RTC is battery-backed and forces the driver to enable the
battery switch-over function, but only if no other mode is already
configured.

With the PCF2131, the battery switch-over is disabled by default.
If the battery switch-over is not enabled by the bootloader or
firmware, this property ensures that the RTC can function correctly
when powered by the battery.

Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
---
 Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
index 2d9fe5a75b06..87ba16346fb4 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
@@ -30,6 +30,13 @@ properties:
 
   reset-source: true
 
+  nxp,battery-backed:
+    description: |
+      Indicates that the RTC is battery-backed. This property forces
+      the driver to enable the battery switch-over function, but only if
+      no other mode is already configured.
+    $ref: /schemas/types.yaml#/definitions/flag
+
 required:
   - compatible
   - reg
-- 
2.39.5


