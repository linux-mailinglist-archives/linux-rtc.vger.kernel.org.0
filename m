Return-Path: <linux-rtc+bounces-6418-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MgWoGRXj7GmNdQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6418-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 17:51:49 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8614A466CB4
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 17:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBF013009522
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 15:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE3A2D3A69;
	Sat, 25 Apr 2026 15:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CX3smKdd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC0B14F70;
	Sat, 25 Apr 2026 15:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777132306; cv=fail; b=bQxrjJLmqYC+A6+Xz+V+kWuIAbyvvg4zJ/4hmGzpvvlVXtUfa7QWJ53voUvcVxpyC+hoslXCPFl8JfqvLpTE+fAceKMh4hfyRlpwnFsQ66GYxSxQ52IhUOmOX0Y9/537WfIcqEW50WERghsHRa0YUIP5LlIJcI86BAoRmrT6qjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777132306; c=relaxed/simple;
	bh=gUxeMeW4Hfw1f8k8xWKVHEqwLKy/QKjZhZydgZfYiOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kr9axot3XX3gyOWqpACO+3253sT9Y5SwSrCekmgiUeJSAM8m21cyExpeLg6wrWGwjo+GD1pk4GhQVvNuf6hfxEa3CVqoDvl5MTRk5kYt9K7xMX4pSYxdBvwFdtsTXm1ARgDQjNE0+AvqSuZmMUPRB6osvwa31RsMLbdoeyBOXFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CX3smKdd; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WB8UvyNMDDzR5pPiK31BCqsH/7g5nJx8x+C844WiIcW1IMNpqUCYpmG2EYfONA8aP/Y+NS0ub2bbx519FJPdtJ0zRSr6ZPkIO+iItYi3Q6BCDnnW3I1rQgkuOT+MhZrYnyiTlHUPNW3AgKc+ZzVI4PlZ83wLfyzT6dmLwGGjWvpHIKK8TWspK3UsI1DZWW9oWNyws5Hxna91iqaTmaqfGk3gTPZ4fTrJvYnXhsNx1xmc2HyTOgWfx6TJFRjbPWlNOXpWaNObS3Z8MLDOCirE603e3ZxIx9bFcjkLvYCS6Hlo7AZ2YLcaRF9vQF7tTQOQOapVuwTPSa4xB3H648Li7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgLPNY1mwTRtNHDgct6ujuu84+CN1chjenKtp8sAv2A=;
 b=iPB89I3GvhCu1Lk2Zg7ofJHVgGdVHTFe2Dn1LurGICFdRQ0Z9k+F0RtyfF9BtZF19B98Hl72Oq1vGTbW+/jvLTk6VjP7M7MbEUkjEe3bpr5QXhpb4K1PnNxHGYR5w/nG/eX0eRmg09or3qjI2ksHfEiPIQ4ggKz0svvrs4FcD7LJ5sD6VNk7dveAxSqNZAzPuwr8yM/5Ssccv8G/hpmJOkXGTcLkQU0ppl6ymqkAHXxJgKCoV7oiKeBo3gVcV9F3rfCo53p7TVPdjzQmuUam5rzzsMs9ewNWwtOnxEKXih1ehD21mjZ1KY5V2jSslBuLiPVhkorpX1TOT+fQ+l9qCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgLPNY1mwTRtNHDgct6ujuu84+CN1chjenKtp8sAv2A=;
 b=CX3smKddvxnV9iMlvrGKPZGJtKlQtLvT4U9bNAd8QGa3CN0yRI0BiEWtZ0FYGQPApCPJ6E1Mf4i4TuO6CFaybzUdFCkJeWtmmwoaSrhTYaZ+XeVwJhKHySe7jYmyjhQZsPRj8WYxiHo9Pr8c61PA7mrjxKTbG19d6YdCXsglWaU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYCPR01MB7315.jpnprd01.prod.outlook.com (2603:1096:400:f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.24; Sat, 25 Apr
 2026 15:51:42 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9846.022; Sat, 25 Apr 2026
 15:51:42 +0000
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
Subject: [PATCH 1/2] rtc: isl1208: Fix returning errno as irqreturn_t in IRQ handler
Date: Sat, 25 Apr 2026 15:49:58 +0000
Message-Id: <20260425154959.2796261-2-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 815cc159-34af-43be-c21f-08dea2e28aaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jbB6D8ia+7GbxYfHVVEf8E1KT1tFnE8wjImGlkGPLqcKV+RKcFxcBAbEReH7PwkaK+GDhy/0QRmYr4E2uuALI3RZ3vqei8SvORHGDsqWf6r/s/PpOiBe1FPjvTjC1rsG+XAJyomeiB9kY9mIpIrsg2Sz33nGdn2nkKyL6FHWXoft0T0MZ3NlSY7/lrxQTnR9Iewo4gJDiX+urAUJBTMm/ULBgMj2pV3f7g/1jlQkfDuGvKj0PSCunKmwVO/fAGcVoE8Q2BSokJ44mwMK9/AxSI8I3c7KpjmtcVPF7SmTrJdtD0p03WI+9AL2DHi2csFmR4bOdFqIg/Y+wPBjOnsVTOeXY/riFYv0Qqmm2nJWk/LjZOtOv2sZ6QYyswHm6CDRlqfOISjt9bO/k1+njVXTJR4rwRcmE17gwCoCxNFN/tffix6wnn5ONvbC1hz6sWiE2EiDaqqn+/Daj3Nkaz+yoxT5QEEOx3tCEGgRf80j6tr+u0IkxDFl1izriVweM9wqyl6kW3Skf5Keb+9cCagAukksEsaUdqm2mslEoAywY5jCNdXhEhUIVdaS9OHR2/K0gk5HglzhMgRvwMoKPyR6Ex52g4gRIxQkjTgflxCpRsjGBPrwtY23If21xrP8Wvjvk5oVxSAlDiaCUaJ8REWeVhgPO/zhUyJj1VvRl88vO77klOM6z57tDvcJQiMhp2JSwwfdqXIwoXQT3/5sQIbnhzHsobh9SiZVHuUwsC22q4KdSPjkq3uV37tgIUvAjR1UtlVU22Kyq+zxPBy7I9+bq9sjRKVGFiffZCOGmfkW6LQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xaEPHCtH43QuVrFZGIH5QqweIoL1mW/vF1CGwQXp9cEwMKFEIkbS+NmNubC0?=
 =?us-ascii?Q?xGMGzXKNkxGbBzqT3TuRcl13yJkbn5dEcddK9ZPZ1Lna9NGkwEIduQgp+St4?=
 =?us-ascii?Q?09L4EQzkpUIS8QdIT4WFdx8rpty9qd2X6/Pd2zvOKC73S/Fv8+DUfaI5ENTw?=
 =?us-ascii?Q?nhWHM0hgFc175OblndBlSP+Q2f3+yunMB+Aa8TeWXTxCk4BXiD/8aYMf02fD?=
 =?us-ascii?Q?ajKZWehF0VITkVlACY+p/YQ4jOwqJLuUjud1g4alyCVOMBd9SHKGu5il6ubZ?=
 =?us-ascii?Q?CykIkQinR0fmkzgmJAr6UI3JeejcKZZW31LgUNvK3YeWJw7WJZAjqZlVXWg3?=
 =?us-ascii?Q?cUtv/nT7hLhvRJScztoUWty0ey2pn3GCvVpLdX7MpyJzNvuYD79gyivRNW6F?=
 =?us-ascii?Q?6QwyCA4YZVd1rc/9zxMyQf+EGBI1xujno176zh/7yFwX3/AP1nL1LqBBzIYL?=
 =?us-ascii?Q?XziYWKfVpMHAU5fB7aEam3w249KuYQBeEqG85NKWfan3PathLLp96crfEUng?=
 =?us-ascii?Q?X1hv6MThn4RHg74CvXoqT1+FAMy/yYj+v+UIf30EqN4a18BaYBnCnzO9us41?=
 =?us-ascii?Q?2Fw1wxX//cbxCUJxg0sGgUweoxCMNtQJOBtP0W2pqS6A8Ozho40DjKx2n3XH?=
 =?us-ascii?Q?En1i+Gc+X1gbEer7WDXIkkLxEKZGXyh84B69Wekl2HeBKWT28deDNQpeQnyT?=
 =?us-ascii?Q?Ldw6WGyn4/xVNb9ZvKqhGQNGBBunQQnqNHKFE5wsBHL+OaGov7zG7WmC0S2T?=
 =?us-ascii?Q?NuCBlyIS2/RE/5mjVKFqWrLuUcscXPMCzXoqcdmzphAYc52EwOP7VTKYF2cM?=
 =?us-ascii?Q?9Ml5fcRwQxqjs+Z5SE3HxcHfCJzviCh/8C9DU2doAskhPLEAnbWeXiHMBbls?=
 =?us-ascii?Q?al4M0gwL5uejhdCfyDVekbu9bNIdR8t9abmT6i8L+539Hwi2JERuMLurDOSN?=
 =?us-ascii?Q?U+eUGl0dkhd/4jRjSHF9YGVC/SDyniboAN6U3VQD5OGmNP2Lv0KO/AYvcaK3?=
 =?us-ascii?Q?4V0SnvmEi9OsG7hjIPlKvDvur7T55BmaN2uBHKi5ZPw1n6NDQgMQoPJJVIiE?=
 =?us-ascii?Q?dglna/xoQX+LIBAzuq6rj3yC7NXnCP6+Lwx8AFIMNzudFvE+wx4d5LgF/mLX?=
 =?us-ascii?Q?NsNK9irvNQZA8ce3HZT9jS9OyQGo8G8BORV7zIHsZUoIHDevEBRZbNFaCIsL?=
 =?us-ascii?Q?MagNWiS0EfTDipfVUdQY26hQQ6zsnxb1grNetGXdPG0TeXHPQQCobxVU2W5s?=
 =?us-ascii?Q?rozOcUhwz38ljAD4/xHY1wsC9jkqhNqwcQhabn/69m8vAxNkMNmNVW6E07C1?=
 =?us-ascii?Q?o2A5u1z/reaDOIcBxbsRCjnm1359WUIAtpOrAL8SLuWduDf/O8dIuMfnGtsp?=
 =?us-ascii?Q?vFlaVj2ZsXx4Kw1lRDYpCbIdlv/L2sZg0cdJHtSqcDpuPo80D5ubXAjm+SJ/?=
 =?us-ascii?Q?XIIKQUElyFtF2jNhWfWfMjUyXJKBuuvvnEj6dHi3qaA7JqYT+Whg8f8dRRY7?=
 =?us-ascii?Q?DHi11SERsc4WvYLS1bPaCsrtZwnQbhlwEGsrHI1GWk2WewlzLzwfnEaoCiPU?=
 =?us-ascii?Q?ulJIP8kYl8g8GhD2oZwxypEAB2nek6zGd7IbyvHAZxw2SK3DhI4SWQtHS1Hk?=
 =?us-ascii?Q?S3wcxtRgy57eAeUVUQ4AkMu0bLbBSFwrLIbCZEys23Zj9ddWAONKQdJ0Wba/?=
 =?us-ascii?Q?73qx0sry6dpIuIR/TAQTu9gJiNXgPqryRulsK6YiFIutIabQ65nsMsd4U6nA?=
 =?us-ascii?Q?oN89pFOeIeGGDa4PgDUVeF5QIvRsuo8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 815cc159-34af-43be-c21f-08dea2e28aaf
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB17371.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2026 15:51:40.8113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qxm8JCLCo/7NcN9hdN683tkcS3BtKqOnjNrrq1dXZ2v+QKskkxhnHgM1regGNbuUvpHqEDolOHvHY54fej0ETobni5hrJKhlc9TPzX9ZZR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7315
X-Rspamd-Queue-Id: 8614A466CB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bluewatersys.com,linux-foundation.org,pengutronix.de,diehl.com,vger.kernel.org,bp.renesas.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-6418-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid]

isl1208_rtc_interrupt() is of irqreturn_t type but two paths
return a negative i2c errno instead of an IRQ_* value:

  - The SR-poll loop on timeout: `return sr;`
  - The post-alarm cleanup path: `return err;`

genirq's note_interrupt() casts the return to unsigned int and
flags any value above IRQ_HANDLED|IRQ_WAKE_THREAD as a bogus
return, logging "irq event N: bogus return value X" each time it
happens.

Return IRQ_NONE when the SR read failed (no progress, can't claim
the interrupt) and IRQ_HANDLED when toggle_alarm failed.

Fixes: cf044f0ed526 ("drivers/rtc/rtc-isl1208.c: add alarm support")
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 drivers/rtc/rtc-isl1208.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index f71a6bb77b2a..c93998c53e7a 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -654,7 +654,7 @@ isl1208_rtc_interrupt(int irq, void *data)
 		if (time_after(jiffies, timeout)) {
 			dev_err(&client->dev, "%s: reading SR failed\n",
 				__func__);
-			return sr;
+			return IRQ_NONE;
 		}
 	}
 
@@ -666,7 +666,7 @@ isl1208_rtc_interrupt(int irq, void *data)
 		/* Disable the alarm */
 		err = isl1208_rtc_toggle_alarm(client, 0);
 		if (err)
-			return err;
+			return IRQ_HANDLED;
 
 		fsleep(275);
 
-- 
2.25.1


