Return-Path: <linux-rtc+bounces-6420-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGB3Hjnj7GmNdQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6420-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 17:52:25 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0EF466CD9
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 17:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8FEC301C8BE
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 15:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2E3352C28;
	Sat, 25 Apr 2026 15:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="r1Tdv5lw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE3934E762;
	Sat, 25 Apr 2026 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777132309; cv=fail; b=OEuKgJJX5aCg5oY0C4Qh1qBNdWgtVXxrJK+uyL6tj2+6OzSWNO41h5haeTEgtRIRVP0bV/rrpR/qgPJbF/sA65qc6wBhqC++cEEYO5o5UX/z9GyRkHjkvw496UKV2PxPpULaskvZ0uBinZqjHhxHITozWOzFrJxzyiPfNUV4SPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777132309; c=relaxed/simple;
	bh=CM4wAzX+r6s+6EDSYxgeT54472zsMUUpOxkQhborR1U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=turDRIYsII9n59jOcFcz1fFRp1+Aw7NYhXh4E+gLECpJY9dwOhKsvbw63KVKnHZ7s4RT9OPQH98bagvrPNCN0OWhXOnHonEfgdVXr2acniaJI/HXxF5siU3N3H8UtMV8ungjFeHHmtReUmtyn+04d9f3xh35RygmdvB/MEXR60g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=r1Tdv5lw; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuiV2FUgfxNmaBAecTizd7BQRGnz5wMaZp+dFBfdhbjGaeD3pB6dpbPv+zzevBkCrIhcJEMQC9UjARtyhU3lj4eZUjMJIW1cuvp4qsJzL8CwWYcMM6MXH55t5iK6l0Wb9Yh8kmFtchGwdEQP1b68v1z/0shIT8dUECirIRVXSSsyYuKSHxf2Fli9EIgk6RTdYM8+2fh+ddy7JqvC/0P0pzCDt7jK7g59Qe9nDMbIUkQ48qBTO/9lAPXFO0exh2pA9/OfqyVyZLUrxan7LnZlbhgN7ApLe/sB6LhJTJuyUvneEUsOxOerBu+KCP/BMxvHJ8ssAh0Scp0cCkF6dBjBhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFJJFHTRyhmbloymNaKNtGQ4bzz6gtQVghHc4aWsHFk=;
 b=Be+yutiCWVDkJEDcpLiOW1fJoYIVb7vnHicQXlJRAUcgji0b8PAsb8nCr9pj1HslXgaoYnJlF8We4d7MhpPm4Ke2Bw5wfK4SYZ2u2WBOIgJYN8CRMUUX1vbIS1nIpDr+MXQm7kAQvzK9lFbEYSmkFJbwr0Vc7MpMP6jj2D+AQeC+ubF4rEz6VZHYBeWn0ucwdgxJq4OJ8O54VcdLQaV35tX5Q0DxXoBHViFcTyQCoOg4LeOtJ8zdSxxtxs4S0F7Lqu5J4lSZ4DsYznTu0EM8Df+3B2w/zhh1d+VNAWsGujN/l+s+L/WMdT+GwAZYRl0JEzlC77j17vTkghvUyZTAkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFJJFHTRyhmbloymNaKNtGQ4bzz6gtQVghHc4aWsHFk=;
 b=r1Tdv5lw1LVEv91/1dXkdHUXonldThMIro5inCGsEi8cFQ3WmnYxes4D7gBmAmOG1eylwXBJRpuq0y9vwkZQHuX0VSV3hpJwzkypQjjQ4926mMKWfEp1MBhDbmwpFS/AAqTyuTAHTj7I0q70m5m/wER4GbjbM5MUBBcch/w1azE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYCPR01MB7315.jpnprd01.prod.outlook.com (2603:1096:400:f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.24; Sat, 25 Apr
 2026 15:51:45 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9846.022; Sat, 25 Apr 2026
 15:51:45 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: alexandre.belloni@bootlin.com
Cc: ryan@bluewatersys.com,
	akpm@linux-foundation.org,
	m.grzeschik@pengutronix.de,
	Denis.Osterland@diehl.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH 2/2] rtc: isl1208: Balance enable_irq_wake() with disable_irq_wake() on cleanup
Date: Sat, 25 Apr 2026 15:49:59 +0000
Message-Id: <20260425154959.2796261-3-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260425154959.2796261-1-john.madieu.xa@bp.renesas.com>
References: <20260425154959.2796261-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0117.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34c::20) To OS7PR01MB17371.jpnprd01.prod.outlook.com
 (2603:1096:604:43e::6)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|TYCPR01MB7315:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bbab269-519e-4d2e-e929-08dea2e28d2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bbLFwHgy/2d4BkC+SUwprs4ve66XfZz7Vh4rOBDpSbPuSIloj1mbhVCNJY4M1v6hC5KA9+p5T5yaQ5kaDXxnXh9HqHCm1+OuiqCyT7mQdNq12nikYOw0Gyl+z2ciHZ1fymso6LRsjZCug2XruSW1mOREKjjyQr8uqmUqQUMiZEIqFDvc0l9qA1CNDmXiGbF5n5aaJlyH8cu9ywrxkLmQwaMaxfp/njEB6zPWpVqmew0sUelmCYkNePcQUW06PB5D5p0c4JgAPKjVwehC11HxznFxCnlxmtwBqiKK9opneh301NBrGB2xgvARxkp6EAtCwRxy9u5M35N7IPa2GdgUBZmT4RZt7F/rc8jldvAsnmyC9DwDX3vTU8RMAh++VoWyYBu+hRv0D+B3sI/A3YskTQc/3R4GbaCV4fUZcCxBh4v9aMChdOwR0QwSbjXt5N24Sgn3BAg50YnfymQszfPBd57tPDK1oOZ1AoHbCduTpLfb5ZN0qvK4bTY+Mf7jnLA7F3Qn5w4MKacTGninbzwPXJwvTPXld6fZcDXf7I/Oj+Jek1ATGv5CU6X1MtVcMMgeAVERIp8l8NKd7NaJUGFsf65SZJNX6s+qMGLA2XBI77RWERu/8cBI9zrjxD6eMY9cCAlF3I3N+0Zs4gHkWg5vMmV8nUu/s11deeidc2rEedBXNNjbSrTCTQvcIVDJu8gghh9FUZFlB6dFyOaLgkmyIUkM6FrZAUpmVM+VbieuHbwQJGzyt6KywTVLbEh6MBAR6EF11f5dkaQBMbe+9lTF2M9ZvVfA6N0suNTFBDBxUW4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bpguTUGHD7WYMSbK4KWDd9aHLTlCArzYpx/CPxndkTD4DEe4rfZWzT3eLpN/?=
 =?us-ascii?Q?2wDNtAUEM5ny/KWkFw+rX6jdr6+OLpl1zvx+qEKbbKBHTNee+6QoCzFywOLm?=
 =?us-ascii?Q?nh6XQcddgffZBK+7XU1zxWJ4ifmwOJb9mrs9r1G2od4CeyjjYulSV+PvK+j7?=
 =?us-ascii?Q?i+2b9yMkEOTGYT+NSYa9P0Cj4VCTk03c6GY3tL8BW/WtOOLQsOr7+vPyLCxO?=
 =?us-ascii?Q?/J2latV81kmtrtftb2469WXayfDaCgHDFWhV8jjWZehP0i1sjNjCbdUk0nEe?=
 =?us-ascii?Q?8sdWCBpsHsdbS6ywCNg0t3yTuuolu6NfFOV0UcpopowmDG6lmsMIpmQol3Cr?=
 =?us-ascii?Q?9EVSIgP/MVPPxwlhjoV166P09L5lo3cAWXtE2OO2MLXFajHYwSW4scYZ6FVL?=
 =?us-ascii?Q?I0Brr2zlSV4heiZefpL7hKPP2Hp3Sof+38VQCKICOsgy31igI3WXRM/pmEpx?=
 =?us-ascii?Q?Gi206vnarcsS/9JN4PnVIVCmeSzQhVVcyWp6Ew2qvgrqXUF0Dlqw3GJ4jSdI?=
 =?us-ascii?Q?eFVvIII3cmVOh+eSBHOchv2QzFJ6ahjYzRG8V6EoXEJEXVI4Rn/LaA2XQqN6?=
 =?us-ascii?Q?ex0H3JgbkS27Fns3FtDx1+AbAdNquwvq3/cjZ7puwTK56k8ftgDxdpj0Q1KT?=
 =?us-ascii?Q?DkSb2YLq4knMuNOMuZyPpXAJpBdxvD5E4FZ3vkTNAwpa2ybWt78/S5Xwutz4?=
 =?us-ascii?Q?pxa8ObQcclWKD9YhvKv6GZk58Ka9EFVmQuZ4WiJmzVW03zDb92OZ9TwNkPyY?=
 =?us-ascii?Q?2MyWMNAJRi+UKMfVcGGebaLOzpvPBZ0PBSU7eVDnKWXW9I7c5eHRmkJ2pPmO?=
 =?us-ascii?Q?539KRYGVkqtMOCVKBcQyfebx+JOGPbqsueN3ltYM3/PPTssNdbg1PI5iHSce?=
 =?us-ascii?Q?4XgGkz2miuvILdIOG+s5yoW2cuTUFLfv+ntvMDXG+XjaYF7QVsH9Y5oShZOo?=
 =?us-ascii?Q?tBFWzX7P4fcA5nC9r62BuDO9jhCyt+QGEXMNujgaxO4hTGjvV+r+6vtDgOHD?=
 =?us-ascii?Q?52BVew5DKQIs3V+OyOWhxSDzPy2iB14VvASQuzUMm1+otDOqsfkyYysVvufo?=
 =?us-ascii?Q?LITW0uQ6tl2/ZUvFitTpTbqHO+YbiOZjP1n6mBRlIk9MdcT3bMfPfU2IUUL/?=
 =?us-ascii?Q?syIELMNjMQvjl38X4zXSWgXnZ4O8ZoCyi+sj1ZbL6vpFP/bp/jeLzSiMAccN?=
 =?us-ascii?Q?nP8CswHTj9O2J/nja0KgVdaTe5ZAWxZv/pzc7pvnl4OAAEwQhEGmXiCZAT3h?=
 =?us-ascii?Q?aY4weSySw6oTvv1/1oY0oLfMk4rIpy/bmFwm/fK+bHTvGujZ93c171hhiMVe?=
 =?us-ascii?Q?VhQA5VniJ+okz5KmR9yDpZ+/i7Fkm+nTc/l0IHZcVFOelWIdcks6JEaaBWhY?=
 =?us-ascii?Q?T0XkE1xee/d8YFj8eSIVQ7MIt+D5HqMuM83jDwt8OZUOIf6/3V3Bb2li4W7k?=
 =?us-ascii?Q?UnabqGq1PfwctItl2e3nfbxw5GnjFGg+zOQhJO23zNNff5hkqeIILINYGOse?=
 =?us-ascii?Q?ZTQm5o8/FOLUCgTWWcoh4QDdHlZsfg9TGGGeU/d81q6clp2lI3chJSyOewm1?=
 =?us-ascii?Q?deglwvBAfd5GR86rWcqkKTtMO7SyoEqcOD6RzzYUbt6oef5sGzE8MaHS4hMf?=
 =?us-ascii?Q?T3OYtyV7znfRsYYdzOBZH27hHwuuT5zXBvPG4Q3gr5NwFAQeDI67+vE/J2bs?=
 =?us-ascii?Q?wd4dEBbuPqqWR1iOaH5giwYYigGeYV5jow0sr0mMsp9lV5Sn/kye2J3qRkhD?=
 =?us-ascii?Q?SHn+V1UILz1bGM9uutQPwNYwmJ3gRP4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbab269-519e-4d2e-e929-08dea2e28d2a
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB17371.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2026 15:51:45.2056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtoHuc8tG7BDGLv0TtlloekeJx/7txxDcTdPRklDI7MwK0jiHxxM03AEC9m6v+AaT8QSZEnvc2Q3eClhUq9na4GkN1NrSdpN4h+KUxqkmdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7315
X-Rspamd-Queue-Id: CD0EF466CD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bluewatersys.com,linux-foundation.org,pengutronix.de,diehl.com,vger.kernel.org,bp.renesas.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-6420-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

isl1208_setup_irq() calls enable_irq_wake() after a successful
IRQ request, but the driver has no remove path that balances it.
The driver is devm-only, so on unbind devm releases the IRQ -
but enable_irq_wake() is not undone by IRQ release, so the wake
count for that IRQ stays incremented.

Each rebind therefore leaks one wake reference; the leak doubles
for the chip variant that has a separate evdet IRQ, since
isl1208_setup_irq() is then called twice during probe.

Register a devm action that calls disable_irq_wake() per IRQ.
While at it, check enable_irq_wake()'s return value:
on failure, propagate the error rather than silently registering
a disable action for an IRQ whose wake state was never enabled.

Fixes: 9ece7cd833a3 ("rtc: isl1208: Add "evdet" interrupt source for isl1219")
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 drivers/rtc/rtc-isl1208.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index c93998c53e7a..1de80fc9c9c9 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -822,6 +822,11 @@ static const struct nvmem_config isl1208_nvmem_config = {
 	.reg_write = isl1208_nvmem_write,
 };
 
+static void isl1208_disable_irq_wake_action(void *data)
+{
+	disable_irq_wake((unsigned long)data);
+}
+
 static int isl1208_setup_irq(struct i2c_client *client, int irq)
 {
 	int rc = devm_request_threaded_irq(&client->dev, irq, NULL,
@@ -831,7 +836,15 @@ static int isl1208_setup_irq(struct i2c_client *client, int irq)
 					client);
 	if (!rc) {
 		device_init_wakeup(&client->dev, true);
-		enable_irq_wake(irq);
+		rc = enable_irq_wake(irq);
+		if (rc)
+			return rc;
+
+		rc = devm_add_action_or_reset(&client->dev,
+					      isl1208_disable_irq_wake_action,
+					      (void *)(unsigned long)irq);
+		if (rc)
+			return rc;
 	} else {
 		dev_err(&client->dev,
 			"Unable to request irq %d, no alarm support\n",
-- 
2.25.1


