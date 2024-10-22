Return-Path: <linux-rtc+bounces-2264-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4069A9BE3
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Oct 2024 10:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E65CBB20EA3
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Oct 2024 08:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB7414B08C;
	Tue, 22 Oct 2024 08:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b="mFrxkvfO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2092.outbound.protection.outlook.com [40.107.21.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0790D347C7;
	Tue, 22 Oct 2024 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729584132; cv=fail; b=pQ1YOwhNtENHAc3A5VCQcwpKfk4CYEOb+Mp1aFpuHeARkqbvFcIaGdvLNuTfhyFCoHEZ7Ywox1+4Zbp40pMpoRnRpUpNeVJaRypk2uDZ+Q7Xry6Y2TWpoylQ6+AqP0vG7SkdTMpHWtlOHI0rYqB8dVO3g9lDKBQuJzFSVDoZh4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729584132; c=relaxed/simple;
	bh=pYE+/IYjvuP5I8ipToclpnqwR0/K5p/MxWqSI8/E0CA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GrnEPJimsuUg3KlQ9ywph1XTEmPj9GuWcWsNa32t5I4cEcbzY09G5Gy9jXL+cPNTNa75ZGs4+kMr7bhsW8UkxM85BE5iUtYNCmQQXTaLCUqSFvb7nEjmAyMEJINd5UTHu2Vyx1mFsFkUZ9QMtNY69ZDiUBiKSVjF/vG9RL4bLz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com; spf=pass smtp.mailfrom=kunbus.com; dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b=mFrxkvfO; arc=fail smtp.client-ip=40.107.21.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kunbus.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDOK5ujaQ4XSmA31/L1KXTwNuHRsZcDC/SBrxChT0JR7mTBIzqFiaBwCP/ElXHs4dH8ecHA7u2REItLa87pl0mcmuoTzseheNyci56yTeIkuVMEaXJQwPgVcp9vHENhMkamqJx6NqxAJ1a32TcnYiSDHNnBrchHL/cJOkKZLa4OH3xbpT7+hil64t7VtG1sjy5UtLFOQTJ2jL6pUNK0G12LVWITBdWGEbKIkBw1AfOCqhTwoB026op5DrbSBepjQbchuTC6+6hOayH4CJyQDTYo4XjhO4vwyNzBBgLcptqoyG1dzZGoerKFd17+HDSM0kSXc3GRPacO3RXgzAK03Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIJS5NIWvNPSjeP7mm8E59M7kl14n2nFcIHK1jC4SR0=;
 b=FLToXikVbui6zzKLP5o0rEOrpjk/zssdATlrZx55z9AjbTpnvEIm/pBZkAk9z/rXVz3XN/N9xz7KF4oG9SAtZsA9PbwjBF8Sc7Y+WowkGK9IL600YtLUBkXvzjnmYLCxdpdDeFcbyq2bXAscja9aFJkH8PSjwenQiwla5XlYusgDi+fjshPBnSMkrOVz9Ay+4CP1jEvpP5Q+c/mAler+2k4eoPVCCIzBIqTkTu7klYA2PSFj/itPles5jGDJbV86z7asdP7PTmfe1JMHbw68O83U5y20+XW+6W5OBZEvenwS2cYquw25wtIADjynZp71ZcvcwRD7Ska1xUW03ZQ8Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kunbus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIJS5NIWvNPSjeP7mm8E59M7kl14n2nFcIHK1jC4SR0=;
 b=mFrxkvfOZDOZECYgY29yZSshqDCnIRW4tcUp/X8P8Ciy7b2leBpHiZkiB8uboMKuzyhTszK4VvC9dX9FcN3OrkGJljEjvBtNPLAFT8NxSfrp8tOByzMAZmV56wBGjHZMV/wLU6IaXVZbIdNfyB/sdZpnYHVjpxL1Z32ppYhgWF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kunbus.com;
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:160::8)
 by AM0P193MB0497.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:16e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 08:02:06 +0000
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90]) by AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90%3]) with mapi id 15.20.8093.014; Tue, 22 Oct 2024
 08:02:06 +0000
From: Philipp Rosenberger <p.rosenberger@kunbus.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Philipp Rosenberger <p.rosenberger@kunbus.com>
Subject: [PATCH 1/2] dt-bindings: rtc: pcf2127: Add nxp,battery-switch-over property
Date: Tue, 22 Oct 2024 10:01:20 +0200
Message-Id: <20241022080121.1594744-2-p.rosenberger@kunbus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241022080121.1594744-1-p.rosenberger@kunbus.com>
References: <20241022080121.1594744-1-p.rosenberger@kunbus.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::10) To AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:160::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0P193MB0738:EE_|AM0P193MB0497:EE_
X-MS-Office365-Filtering-Correlation-Id: e3ca3bde-02c0-4c06-49ff-08dcf26fd21e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5zvkdMJj1N06+/dSwMR9syvagkbo2bppiL1Ao0nVM2yDthONRdYDsAkossfF?=
 =?us-ascii?Q?IJ/y1tdTDMeB+G9xApsdN5jVQZ+Ci1iQSV1rgnaqo69uWDPbt6VQNhPnpqH5?=
 =?us-ascii?Q?TvaTK6Yn2iprTlAw9IYvHtAv0ZqblKz/896ni0xjKdz1vaRWLK3XnXJrUefz?=
 =?us-ascii?Q?nc6F0YcrEFqjFNl2ZBOdc+U4SIGGNhi0qD9/73jt1ttFdqHT1X+St36NOiZU?=
 =?us-ascii?Q?9Iax/DYBPXzmfAX12n8trSDiMETCt2IhNeXPPqpI2pDLDmrAna1lOxbxsMTk?=
 =?us-ascii?Q?E5iq2f8AwFtQrAyVRm85r6mds+8TVaXyNDdqwjPyS0bTi3zk/HbZgsEzEi8i?=
 =?us-ascii?Q?qv/XasCKp8oVHQiHypHgTkKgJvltU9ATjZJVQ3XDX7PQJ2nquVt3XA956v3w?=
 =?us-ascii?Q?flw4s5SsExIErP4ncJ74MW1MEdXl8YzHyCRxqJr4wc0vq9eGa0EHK3tiOBZ4?=
 =?us-ascii?Q?XX28Zh8oHEQprf2Y82LJ2Ni5RJKwwbqzUQHOckKTzFVdonZGRve1HVYydx0e?=
 =?us-ascii?Q?haP4jlhKqjqHFsMxFXJniuFh7AlhewLaVK9ldPVhl4KDOkaE5CqYSy62zHri?=
 =?us-ascii?Q?ZWnZDVYnbSNX4ToiU5fEMggJBiDIfRRzk+N+HQ2WUcse5gcrOcmc92zAuiJt?=
 =?us-ascii?Q?ISdVNiVIH1deYFQKV31aKQyr3+3JQAYno7QF+/OKMBj8rbWsQCme3Jx0C3+d?=
 =?us-ascii?Q?7VBf4vxr6fc8I5vx6CdT4knKtTRNxH/UwYdKAH8eQPyNpHU47qIfRSLhG61/?=
 =?us-ascii?Q?eDRg8QV+LuXqfbmmnS2W9O5lxKNxZjItPzBVhp4jAHud/dDRWG+2s6+SLU6T?=
 =?us-ascii?Q?g2XwVl5/LXsO1QpROHHIU3BEEHXMDC2fk7FTdoOaWLMMtomUjTz7IK/95Q5N?=
 =?us-ascii?Q?+cHG5YT0eP7qFQjZ4LT34ppoANkaY7FTxANXh5fGGXfi9ha059+liAfGqLrx?=
 =?us-ascii?Q?Kh77116GjMtkN0MAxB1MskbkFN6GRgNGqWKry4nWjd3Z2BqFNYO/YdXmiTL4?=
 =?us-ascii?Q?ppZPkafXmd5af/TjOu7i6SFMfANXd07VbGdiiTf2A31dOOZlT+kAtW6slshv?=
 =?us-ascii?Q?P7xx7ods86U4rGpMl6yFBLICs9F7g5/YJopvd+igTYiW4Uhd/lBFelvLFTiv?=
 =?us-ascii?Q?WMLcZCdqHnKzr/I+LCounE897flu/26R9RjeU49XUQKbOzLb7g7dnHKjSE2F?=
 =?us-ascii?Q?T3dEYqYEzu+aJPGV2qMViukPjEs9PnltXfJOT0gkmlRRrEGgIN5uSGXtt5xZ?=
 =?us-ascii?Q?v42fQ7/Y22qyotVL8lHT01gkc2cS0XXWVrtZxhfZjQyIN3kxLrOdeaVdn2qm?=
 =?us-ascii?Q?f0yebifOaJDvLfpHE4mcbguW+VI+P6rnQkvXNh1gJI4IMn53PnYQt08WE9ph?=
 =?us-ascii?Q?1USPUFw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P193MB0738.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NOZ7VuzjoKPmgR2ynCgugYg7ZhAZ3tTeeEWNQI3FKbrguwKTqO5pZHIRmpc5?=
 =?us-ascii?Q?Lg6xQ9+KyKraCJkvsUIw+d2vTiHuE+H4ZDOALs5LWZlJ/Bf2grE0lFLy0mVg?=
 =?us-ascii?Q?/PkqRg+W4JJgtbvlxWw8KnBBTkNyZloZV+2RrnmU48GXA4YfBLPO0KjNATiK?=
 =?us-ascii?Q?95y5T3VviB/1m2XKXvEIb4ooKm51lVUpvM7eNf0nR4KGJYi+HItA6Mgk6pS/?=
 =?us-ascii?Q?OQ9P4inJ44etZ0C4FESaxPzvEwiKtfiV4lWanbr3sJrFm14yMfE5A3CUEG27?=
 =?us-ascii?Q?uhVoqmXh2SworI03fgBx+PRub22M2UocJtswsWYIWJg3E4eD3VBhJXUZYIaq?=
 =?us-ascii?Q?FBKTkYz814EktTm75v87DCoF+VlP2HmtYM34arigM/EtFVhfozlIDCJL1mSd?=
 =?us-ascii?Q?Si6HzDJ9A8bEiglMx9/PS4a4bRkflj4brrJgnCxiMLayNnXGX3Jz/LH25qYW?=
 =?us-ascii?Q?A1uvzwqpiJTDH3AL1yZaFAxXD+XapHLPJNwJRbAagAVEHra6Pu7nu5N2Q7pV?=
 =?us-ascii?Q?B9X8BnUgKoazwgb2II/0PMadUavWUWqUvDOkKk6PQpzw2mzXHdE/M4s0wshs?=
 =?us-ascii?Q?/xWo7GIpQPMOTypJHaVnXHur4372qBmFvg1tKY8KJHuOnSqAZX41P46n7WTh?=
 =?us-ascii?Q?NTPbfIRb6pokHzoOxiL5VMoiuxePLaBK/MNmynIEtjrAS4MapTCyGPcpykdj?=
 =?us-ascii?Q?ecCQ5Z2jaJPfCZwykOg2MxCoC2wYVnnhfQ9pcHmOQN9SZ5llMiy1glQIcJm2?=
 =?us-ascii?Q?b2c7PP1+Yn6j5HU9lPwJmtsgOukhsChgNMSQxbnnwhHAZ+yfaSixQlESwL/U?=
 =?us-ascii?Q?g+gwZmLkepdMzKLihG8en7AqZO35gz5LIOUnc97T1bGAoh/Lig3rCuSr4m0g?=
 =?us-ascii?Q?bDG4vMeMGOXPMRRiEA1eMH5gEXAICdoOLxBWF3kG9wx87jI6g7v1G1Lj8DE1?=
 =?us-ascii?Q?TIF6K42k+yjzennSc0RK63N76IazA3wI6AU/Xwiv073Yb1+/9FwAsOVklLtQ?=
 =?us-ascii?Q?VUr/qrEc5fi6rPJ9xkYKjNmOlotLRuBnxLaN5iY38IuiuXe1TnOjCvySwpsl?=
 =?us-ascii?Q?xVU03uCtDR51aVtPVm8zxjVeVmKx7XgtqfT0pgsz0uT0Hey44EqFSkKh2Ypd?=
 =?us-ascii?Q?XN99dk9gu+/GmfCUhE64Ua7ZPG+hQgvixiTwbUtwx8mnQpT5F20WmhnQRmnl?=
 =?us-ascii?Q?2tvc5IyPyu7dnJ3qBIK7uAE4uieGq6bnIf+oKZ1zraS1J1OfaYxww6HtJPeF?=
 =?us-ascii?Q?sWtoatz1ku3UrpTjhnyXunZtg6VXKv3KfZXhhp3dhtk6zZwDNYXZtHp3TSrJ?=
 =?us-ascii?Q?bGlNmMNMwKFUVxyN8DEcFTSKcUSg8VDbPDMGdobyYn7vWWUJ35V3hOKbUVvt?=
 =?us-ascii?Q?9DsO63jQKo883v3uiwF3D2IfgSRfUayFsm2Clta7Ql854diGgBp5Jforno4C?=
 =?us-ascii?Q?oazgmMi/OPrCE8E99/5kyDWdMuTO7Wa/yxTXwmCw9wVWFaHCZxq/OsQdjBAI?=
 =?us-ascii?Q?aiz5iqqsVXl0tktD9MLGcmYeiPTsQrUuasNqqAyo0iCkYsHmhUcaUQ9sYMX4?=
 =?us-ascii?Q?ZCmTtKupJNqZ2UwGqHi4YB4zkVcetD2ZedpupK6S1VXqQG7csOHREm+6GlZB?=
 =?us-ascii?Q?EQ=3D=3D?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ca3bde-02c0-4c06-49ff-08dcf26fd21e
X-MS-Exchange-CrossTenant-AuthSource: AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 08:02:06.1190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ODndw1vBsr99Ik65PEu3M4+ji8kmD6wudgK4oEEs5YCphds4QN3PkfHhXus3J5DMrzFtquwodzaIMEzyz9iSCMRVZuRLUtXcgVsdr640LFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P193MB0497

The nxp,battery-switch-over property is used to control the switch-over,
battery low detection and extra power fail detection functions.

The PCF2131 has a different default value for the PWRMNG bits. It is set
to 0x7: battery switch-over function is disabled, only one power supply
(VDD); battery low detection function is disabled.
This is the opposite of the default of the PCF2127/PCA2129 and PCF2129.
With the nxp,battery-switch-over the behavior can be controlled through
the device tree.

Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
---
 Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Docum=
entation/devicetree/bindings/rtc/nxp,pcf2127.yaml
index 2d9fe5a75b06..5739c3e371e7 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
@@ -30,6 +30,16 @@ properties:

   reset-source: true

+  nxp,battery-switch-over:
+    description:
+      Battery and power related configuration. This property is used to se=
t the
+      PWRMNG bits of the Control_3 register to control the battery switch-=
over,
+      battery low detection and extra power fail detection functions.
+      The actual supported functions depend on the device capabilities.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 0
+    maximum: 7
+
 required:
   - compatible
   - reg
--
2.39.5

---------------------------------------------------------------------------=
------
sps
Smart Production Solutions
Nuremberg, 12 - 14 November 2024
Visit us: Hall 5, Booth 228
---------------------------------------------------------------------------=
------

