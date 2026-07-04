Return-Path: <linux-rtc+bounces-6894-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xNbPIwp2SWoE2AAAu9opvQ
	(envelope-from <linux-rtc+bounces-6894-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 04 Jul 2026 23:07:22 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C361D708750
	for <lists+linux-rtc@lfdr.de>; Sat, 04 Jul 2026 23:07:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nokia.com header.s=selector1 header.b=d3rQfTgt;
	dmarc=pass (policy=reject) header.from=nokia.com;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6894-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6894-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48DDE30210F9
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Jul 2026 21:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE48280035;
	Sat,  4 Jul 2026 21:07:19 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013062.outbound.protection.outlook.com [52.101.83.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EBB22425B;
	Sat,  4 Jul 2026 21:07:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783199239; cv=fail; b=FMxLPkURyeIP7BqtcfHH0J0qztFypJcJm95A70UmXpjzv010Px+Eljv4cDs4ztXAKGqMWW9At39mc4yrqpIJIaKQzfMqrF/viFRLqjSgpQq57iWpGE5MheIMO1VYFzAmnMJdAAj5GLCKCyAez4hITXQdWvyl1pT6wxF8JguZor4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783199239; c=relaxed/simple;
	bh=e4tfg5wD0lNyZ4HjyTqkK+2gqw/1kZ3KsoDbjhduSM4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=c/dPq58P6I65WzaLFWkw6iLB3k9/6LrguGD/+k3NcGRbfGPRIN7uqb8dAcz48CbG2T4bc6mV8OEkr8BpZWAsnR44EbvDd8vzG5XLwENadEVKGDkZdERWgqj1nhcL1wAEjWhEp8S3nzvuPE21iaUgBsBFAZk24VQYzh/LU6smx5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=d3rQfTgt; arc=fail smtp.client-ip=52.101.83.62
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byGmyFEfjsukVXcMfwQQmWPoDvXxQvvAWoB50hIBWaQEVugxOa01aTBXi33VzxnSQf7OgIcMtERfSLp76yLSiQgHsew+Pl5LG1p3I5q6ZddZMjubT7rHoRP3CTJIHOinod5CFqULFYM+zt8GGczbq7F76IFCP1kGRPbINvgcDW8ajUtYqs6um/uiYPAY3xlVJk4S4bA5oW61Kgh2w8tw48AjVHZc+oZuq6N2ZofpLlKhEVxXh+4bOKl6ghuVDjLU2FGaqAgM8fCcVnqxaH4lWWnWYcioewPKdhwpmo90Zw7Jw5CNrs6TxgYHqWeIp8r6RqUizjjTGr+5WO/NSmdRwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTlbqW6HvmzKRYbPo82Bp5ZDhbwSG4iA+3hMl0qNjOs=;
 b=ZpwYqIweajJvLnQS+eJxD1f0r88bscfw6ILEDWy+7j8kqzz+7NODMqeIjEvXSS28kuzPcbvERwqVEx23u4ZTQztqOOIMyOTdcwICI90PExUw6iGAkTnlLt9dQyWS1kJZ5lWGdCnivmKzW8bGEFOAXpTpQ54rG78QvZR1HR1A8I4gbbrwY/MJz6hKqJql4B+mXOo4SwCI7xfDjuytKBfVR0DbQyKBtCJQzVApDFVqEwRsop9I7bePQpB4E2X2PArvTrh6a9LV/RmYKdNtgR+PpHuqburNzuSqHmzWEj2ZrGxcyRBldYMAnEg8IlTZmVR4QgHxDD3wVEcA4kgN8PP44w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sTlbqW6HvmzKRYbPo82Bp5ZDhbwSG4iA+3hMl0qNjOs=;
 b=d3rQfTgtlZxbnAuolhSRLTYPMT1tNg8fKt4Kp4pCxVHs5K8gXKhOB6kFHBDej9WOnTxNXt8A5k6mu60XJpTJSijzAygvYiOGn4AjTR9wj0GcIyX8z5ZqAmq8IY0XYcNh+wqTa1WvdRuRYdtpB2Naa8oF7dNygH0pvR+L5Sdd01gliXYQWAIm6d26mYRF6wYpTCA+4qRbKXHMq1Bw6xk77cF03PnBgcrvZz8Gx3uyWynzeCkGXrRhx6BJChTzfD5Cc2QQJ7rENjntWBHV/pyUzIAaX/9N9GsyrIJ1HqHcV2IslD/mo6+wAbwVXmw+U/0tol8cv9B5wV/mJDLlZQsOLg==
Received: from DB9PR07MB9272.eurprd07.prod.outlook.com (2603:10a6:10:451::20)
 by PR3PR07MB6684.eurprd07.prod.outlook.com (2603:10a6:102:2f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.12; Sat, 4 Jul
 2026 21:07:15 +0000
Received: from DB9PR07MB9272.eurprd07.prod.outlook.com
 ([fe80::9571:982e:7fcf:9e62]) by DB9PR07MB9272.eurprd07.prod.outlook.com
 ([fe80::9571:982e:7fcf:9e62%6]) with mapi id 15.21.0181.008; Sat, 4 Jul 2026
 21:07:15 +0000
From: Ioannis Fountzoulas <ioannis.fountzoulas@nokia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ioannis Fountzoulas <ioannis.fountzoulas@nokia.com>
Subject: [PATCH] rtc: armada38x: do not advertise update interrupt (UIE) support
Date: Sat,  4 Jul 2026 17:07:10 -0400
Message-Id: <20260704210710.658574-1-ioannis.fountzoulas@nokia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH5PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:610:1ed::16) To DB9PR07MB9272.eurprd07.prod.outlook.com
 (2603:10a6:10:451::20)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR07MB9272:EE_|PR3PR07MB6684:EE_
X-MS-Office365-Filtering-Correlation-Id: 16efc903-eff9-494c-da11-08deda103929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|56012099006|11063799006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	49m9eHH74keGohF3BmiefcaJzX1mXEeTq/BwRcbAba9DLcBrB6Xkmjea4QbshH+BMmhTYhlgbvRdVf3g+ngE3q38Ufw4uTcTZX+dhTf3KMhlGxLmVOzsA6N67HZBx+bx8q87NHe6Ns1VFAtnmG4g7gZ3kMU73e8lvulDWh1Q5yWZlg8Zwa2aoOoqeZ20J6QBcG9pcoQlbJ1LpUkn7Rs4slfXW0Eb+Pb5tKfDRAYB2vEY5twVsX2+70X+kdgcHZMdAIT7D9k72LwMGduPdLEFVkQHLv/jeK/F2u33Ca6nNygr2q7jYzYa96Sw3blot+fQsHYCl7bxkZbyxFEDJNO85HdPQJrlEWwnaol9R5qWpdZc4deY9O3/mHdYpxrc1YadF6DnBypbKk/LhVPQuKTSqX3fROsNgP277Oy8+CpqV24qBD5U0HVlqCov0Ry/Xm6DMeXVbzLb6wlNl4yygt74TMixChg1vbhJr8x0uhclu0VtZkgvrnVRA7rOX/ypuGqBAzcQm9clWK/g9LqFALhcUWgF77y30+QR7KDWXOk3LUN6NByuBF+gQSqkxOaTUKbEQImLlWNq0EQytLuUiJ8Z8W7dYoRyZze45LdHtFGMwncJgr1A0RJ400LDw2HCNix2YTGEFwxY7MIyJfZasz2yRmrwmeyOam/H+t4nhi2ob10=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR07MB9272.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(56012099006)(11063799006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b6QH/wDpn7DRKazX8TFRgURQfh6D91TGYcPuKS1pjiaUPDUCwbUMCGEr+jfF?=
 =?us-ascii?Q?l+s4WhD3L8gqjh5gTpce0V030FVpY4+zRwhJK7IQUNL9cvpO2IlwDpUrUCTo?=
 =?us-ascii?Q?kQaHIxWI7t2DQgaCwz0h4VBGPfewAROg6yWVKk/SNAN+DcXBz3dG/WUO91lB?=
 =?us-ascii?Q?I05q0XwZDjTUCVeqNc5xDOud0Q9xILu5ZkuNH1QU2yW5DYjLMa5U9Oi1KFBM?=
 =?us-ascii?Q?FV1szI8n9NsYSDYX80mhpfRKJDqS+NHmvK6hinnehx5ruogQB3Bo+DsOGztr?=
 =?us-ascii?Q?m6mLeFzzksu/qyrBlKWTiYsjmY+FXpO/akMPN9dm+/y/2MLhgFjnFWKaBzIB?=
 =?us-ascii?Q?5dwHY0fYCv9m/C6evTzw+v4iYNywoTxTN0Ue+heXvQ5UfTVst5zRVKIz8oSj?=
 =?us-ascii?Q?618Cnp4mu/A8Umsl7SeQb2Eca0QANC8x2zdb94KSS6oko/0PG/BglNdpHyeY?=
 =?us-ascii?Q?HRtVxG5+5mNpKlykCNbcI14jPqO/CxMTdyNESYa9VNADdmaf/RgTFdumdlCz?=
 =?us-ascii?Q?FXnJHPcKkyOvIQOGjkeNNwvZ2GwWQ9kagcUCYAkrMS3OhJAVKr48OVo0ytpg?=
 =?us-ascii?Q?Bfk0R6cfjDBdxlgfCDd+Z4NReDa2KykPLdNnuycyT/CtMmtiSG6gwMEI0Yzd?=
 =?us-ascii?Q?b1pU5Hs+n/Eq/jz5HhnQqnbjl3+rtIGlmpf6e8mdPGAtyZDZqR2BVhoFwupc?=
 =?us-ascii?Q?qqeoMt6A5HyQXP5NEPjloom1Hza4hjaLfWxFSQn0uKwltYSHx8M6qwpaGi9Y?=
 =?us-ascii?Q?BH5mMUiuPILmBPm890kFaaNjJRU9Ro5o6UQWyCcD8sMxRawpYie9fMwlmarQ?=
 =?us-ascii?Q?I+uutk5zLUgmbdnXYr93b3xOhkECJaw4jX9O7dFHqNr1KGPhh70SbAPpOJ72?=
 =?us-ascii?Q?CfsbnqvWzDNN+nGHoeQ3ucr4IiKl9gJdoEGV2FlUQsUdlyjMWAX2dPBc8dPU?=
 =?us-ascii?Q?m4p30hFkLYryEFgX8JUaWOHwUwzzMTI6FBHl5tjzVaxK/08DtHHQMaSpuho5?=
 =?us-ascii?Q?0JovDtt7PVRthMCgketIr/zFnn8otQWlT8bofFroy3DSIZbt1DdodByJOZT0?=
 =?us-ascii?Q?aB5bDoh6wpdLOWSm/HkHaMxzqc6P+DnR22fNpfEQnf700IFCQgtelcK6/3sg?=
 =?us-ascii?Q?gR1fMkA3C+EEcK4pJYaUwsxZi8M9tEZgS2SXQgkxVghpd32YyK6vQVVKo/qT?=
 =?us-ascii?Q?toWyPRCZL5ENpg1Sd/zs2xLkxunICs7+wQAeqxKFzUjSh+Sq+GH+lbXvXJBR?=
 =?us-ascii?Q?95FTb71Xt6M8yka2NwzCU3gMy5KK4Jibey0OIL/o7oWyJxKnP2p7Tf3HWjTL?=
 =?us-ascii?Q?EUn/DHiDN4+1ztYUDzOcPkdgzzsxwB1s1OzAbXgy8h9PKcUWGn1FIqvwfIuX?=
 =?us-ascii?Q?3lvNCMw/kz8H1xF86ui6Boz+kGtrT8vo+PUiUbFxwQu8TXxptvV20FwanZW2?=
 =?us-ascii?Q?DZwwW2cFWWKIi3seUyQNX67kA9R0pCrT1/CNM5u9Zf9rjkJw76PFQYfap/mo?=
 =?us-ascii?Q?N1SyjBIAyIrsdnNeYUGQyc3LbovqAnNpUQS3RQ+Uxv8bn/WyB3wwoqxFLQJt?=
 =?us-ascii?Q?Y0guOvn1v5NB8obYq7M+e3D8Vpvqno/H7J6VxLCzpqpnX7oVaalP4Q/33ULy?=
 =?us-ascii?Q?oBdb8sjyAN7TtuHr3TfU9w4MnGJEb961uatBHqpA6Z40mz+KF54ncDZTh6mi?=
 =?us-ascii?Q?TqVgjTBOv/t2XR4bz8fPURWMdKTo9wY1czNpHsVcX0IzAKstOT50ygq/QTnW?=
 =?us-ascii?Q?NWNP2z0Ff4JYQE2ZpkK/ID3ZrP9nahA=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16efc903-eff9-494c-da11-08deda103929
X-MS-Exchange-CrossTenant-AuthSource: DB9PR07MB9272.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2026 21:07:15.0939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtyDdO9pqt2R9coE037xEtjn74ZuWCuYd0yjB9flG6x41umcd8yY1vbT6pqCzfL+j6ximpramXRZkweNq41lm5lmx+xzXNMZbAFcLrQHhqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6684
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nokia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nokia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,lunn.ch,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ioannis.fountzoulas@nokia.com,linux-rtc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6894-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:andrew@lunn.ch,m:gregory.clement@bootlin.com,m:sebastian.hesselbarth@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ioannis.fountzoulas@nokia.com,m:sebastianhesselbarth@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ioannis.fountzoulas@nokia.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nokia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nokia.com:from_mime,nokia.com:email,nokia.com:mid,nokia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C361D708750

Problem:
chrony enables RTC update interrupts via the RTC_UIE_ON ioctl to track
RTC drift. On the armada38x driver this request is served by the RTC
core's native path, which arms a 1 second periodic timer that is
re-programmed on the alarm and serviced by rtc_timer_do_work().
If the RTC time is then stepped forward by a large amount while this
timer is active, its scheduled expiry ends up far in the past compared
to the freshly read time.

Why the CPU hangs:
When rtc_timer_do_work() runs, it expires every timer whose expiry is
not in the future, advancing periodic timers by one period each pass:
	while ((next = timerqueue_getnext(&rtc->timerqueue))) {
		if (next->expires > now)
			break;
		...
		timer->node.expires += timer->period;   /* += 1s */
		timerqueue_add(&rtc->timerqueue, &timer->node);
	}
With a large forward step (seen when the RTC starts far in the past and
chrony corrects it after the first NTP sync), the periodic UIE timer is
overdue by the size of the jump, so this loop must run one iteration per
elapsed second before it can exit.
It never yields in that time, so the workqueue worker pins the CPU and
the watchdog reports a soft lockup / RCU stall, after which the
board reboots:
	watchdog: BUG: soft lockup - CPU#1 stuck for 48s! [kworker/1:3:432]
	Kernel panic - not syncing: softlockup: hung tasks
	Workqueue: events rtc_timer_do_work
	 rtc_handle_legacy_irq from rtc_timer_do_work
	 rtc_timer_do_work from process_one_work
	 process_one_work from worker_thread

Fix:
Clear RTC_FEATURE_UPDATE_INTERRUPT at probe time so the driver stops
advertising native UIE. RTC_UIE_ON is then served by the poll-based UIE
emulation in rtc-dev (CONFIG_RTC_INTF_DEV_UIE_EMUL), which delivers the
1 Hz update notifications chrony needs without ever queuing the runaway
periodic timer.

Testing:
Tested on a Marvell Armada 38x board (ARM Cortex-A9). Before the change,
stepping the clock forward while UIE was enabled reproduced the soft
lockup (about 1 in 4 boots). After the change, rtc_timer_do_work() runs
zero loop iterations and returns immediately, chrony still receives
update interrupts via emulation, and no lockups occur over repeated
reboot cycles.

Signed-off-by: Ioannis Fountzoulas <ioannis.fountzoulas@nokia.com>
---
 drivers/rtc/rtc-armada38x.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/rtc/rtc-armada38x.c b/drivers/rtc/rtc-armada38x.c
index 245290ae1a8d..da036d819649 100644
--- a/drivers/rtc/rtc-armada38x.c
+++ b/drivers/rtc/rtc-armada38x.c
@@ -526,6 +526,14 @@ static __init int armada38x_rtc_probe(struct platform_device *pdev)
 	else
 		clear_bit(RTC_FEATURE_ALARM, rtc->rtc_dev->features);
 
+	/*
+	 * A large forward step of the RTC time makes
+	 * rtc_timer_do_work() replay one period per elapsed second and can
+	 * loop long enough to trigger a soft lockup. Do not advertise
+	 * native UIE; RTC_UIE_ON then uses the poll-based emulation.
+	 */
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtc_dev->features);
+
 	/* Update RTC-MBUS bridge timing parameters */
 	rtc->data->update_mbus_timing(rtc);
 
-- 
2.34.1


