Return-Path: <linux-rtc+bounces-6553-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGWNNfrPDWo53gUAu9opvQ
	(envelope-from <linux-rtc+bounces-6553-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 20 May 2026 17:15:06 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5CB5909B5
	for <lists+linux-rtc@lfdr.de>; Wed, 20 May 2026 17:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 050D130D0DB2
	for <lists+linux-rtc@lfdr.de>; Wed, 20 May 2026 14:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4B83DC4D7;
	Wed, 20 May 2026 14:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="nFjbw4BS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011058.outbound.protection.outlook.com [40.107.130.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D09B308F15;
	Wed, 20 May 2026 14:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288565; cv=fail; b=PQ+NfHxU3rZVRT4DazTnSw5GqsS3waiPAB9l40xUv7PB+r5r/XrU12T5NHMtDGZv/7H6oHuNCQE+uJz6cwyysz7zZXHFq7V+Qd6M5AkoCPuc6fpVqxnZ4+6hL8rhiQjTkegPvFLdrXTQDhJML2TBxLu/ID2+hlFHBqglb8ZdKmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288565; c=relaxed/simple;
	bh=R5hd2r/lJ0pTaze7xYhCvmRnWTRf7JbYHG/3CMl+rb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=izKdeCKRp1wYgIxoNVnfuVZ2feJc3xNr2p9pD1CfMs+SsvUjltGH2bSssX0wzosIvfvus0koEAvmSbvy0FZIK/9fXWBrOrEWN6xiFMf9OeskNdd2Gavwm9r37eT26DTefoRU+J0hzzEbPvSGZqEywOmoSlc+yz27zpPS8tEcdW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=nFjbw4BS; arc=fail smtp.client-ip=40.107.130.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNqMp4v9WeFV/FA/oLMTdKN2DHB+ha8YUkEz49P6Oi+zbmB1Ybr09cLEgGSwzMndCY7Esw7lu7hk9GGu06ZKbn4uJ9OY7tvYEIRIieDScaF4ZQODYe1NDc9cJ/yS4nhanBHov32CYQJgxrz4NfOAZYRjnUyTSgilHdJjRlzEEJHMVIvjPJx1qnfiskIytwSMQqA9SibcdFi7oqQdsKugMBwHNsHItlPzIAMyf3rLKyLqDjGrJlMEYIxQbnn1Lo0GqF8A4kBH15gjQR45DYYSYx5osdLWdtrN3misGF6nYPIm6tuD0ZqcarK7xRpvyMMmLJzUMfZ/8YeT1JD7TUjBwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1ijghcxDp7bFCPkYrH1JU0aclMhZ9XTJujYTXfVTQ8=;
 b=SUxyYLJyLIU/lxnvpc2pA8aKP45s9neen190VhMlzHito796+qU62YrV+35HnxI04WY/+nsy4OffN2V474gzUSgdBC8S9s5pesBQznwxAxic5DPgU/G0Zr24wDLxq+tPhmPlrJlUoj+y1iy28UHFP0AfgjQ+Q/hmrT15rTLK8NJfjiFK7nHxUHPDSz7S+ijd0a2zVIIdzGBnhW/xXg7cC4mrwwXU26PdFpkGMvYJLEo82vfzpCs2M5SMrLo9mtnBM2weEj8DnnHwgzLKUyeTw5FA6d0YhsOinRf6QsM9t3QQGqxuYlkN1XCRojBzsk3HMz5V37tmzQFDtZ1nYp4hIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=bootlin.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1ijghcxDp7bFCPkYrH1JU0aclMhZ9XTJujYTXfVTQ8=;
 b=nFjbw4BSo/cqJvddUNIAUTNgbFr/G4sTol1JNLyM9Y0WgVXY0zE2yuKPgZ7copv7U6FwcJED+yY7TNFvhjPxMgTcY7PKjtdxn1SFC4sgn4+JzSFzGT763JO5gf0soNIRJXRtQoacKDRw48K2eWTspOJbWH6O1/Q7SQIVPW7nfxI=
Received: from DUZPR01CA0311.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::12) by VI1PR02MB6095.eurprd02.prod.outlook.com
 (2603:10a6:800:18e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 14:49:19 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::c2) by DUZPR01CA0311.outlook.office365.com
 (2603:10a6:10:4ba::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 14:49:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 20 May 2026 14:49:19 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 20 May
 2026 16:49:17 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 20 May 2026 16:49:17 +0200
Received: from pc62507-2516.se.axis.com (pc62507-2516.se.axis.com [10.94.180.48])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 6F630699;
	Wed, 20 May 2026 16:49:17 +0200 (CEST)
Received: by pc62507-2516.se.axis.com (Postfix, from userid 13629)
	id 6BFC24208843; Wed, 20 May 2026 16:49:17 +0200 (CEST)
From: Fredrik M Olsson <fredrik.m.olsson@axis.com>
Date: Wed, 20 May 2026 16:48:54 +0200
Subject: [PATCH v2 2/3] rtc: ds1307: Fix off-by-one issue with wday for
 rx8130
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260520-ds1307-rx8901-add-v2-2-e069ea32e1db@axis.com>
References: <20260520-ds1307-rx8901-add-v2-0-e069ea32e1db@axis.com>
In-Reply-To: <20260520-ds1307-rx8901-add-v2-0-e069ea32e1db@axis.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Fredrik M Olsson <fredrik.m.olsson@axis.com>,
	<kernel@axis.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|VI1PR02MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 21443ea9-9bf6-4d01-f4d1-08deb67ef922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|22082099003|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	J4TnERVxqx4x/xgJWKCOZAJhyqR9n4XUPAELZzKKCKdf5y6AXsOv5kRbzDcKtBIpV1+cdJkvpDRjZuI9DZujY2oLujw5kTketqXYTNie4AuuDs2B4CDq4TgE+T1zA/BZsrxYYVe5ARFlFWst1KHg+PxdLDUzG90xGt3g5sPAQCSwtoo+oCjy3QKza1vtX6GzNlM9dEhuDl9IYJ38i7pkluEUcUTfUzD7wowCEdzCbTTtqAWZW8/EkpSXzrhLJlUgpQ40vNtJrG7QwEV8es+1SdbxFRccFny6v39rHM9k+NqMLGSfHCQJ5T+EyZsz8VXXWdde6FJLKek5xZiqwpRAkIZg1AdDxnkbpWe7ex9IxOVA5FxaAxnNrqK6aPDFvoLhPB9v+7N9DRh/DTtgqNWAUHg49HpScU9t2W/RZBamiE5a/mtJVHd2ZKdmKp3tXusD9V7epfF2dEQwvBYo+ZrPbx7wRidvPYpwQ4AwnmocRMwVaPyNhHJBO43o8NEvFbgq94deqBJqD5QVpaAoKqJiso/FKwvY1LyXjgOCPL/Q3SPDp7d44Uuqw/6Rc/r8PQ3FpBlgH/VgsAwKlA1yLY6GC6Ad3BOdaP/Ka2johRpfobjBDfrpY6QeLqniaMWgVO3hPJoKcCwEv6zfPe/X/X8Jnk6pALLh626oSATKXpG3V8zw8ZoT5bDQIbZsY+ZaQ/gDz6FsOZeQWcjvH2nSy5TSkzRYoo6UNnzFkWKSaKc4ILI=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(22082099003)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eZUn7V9KBIFZ3PoIDvNI709Tt9gxl3KRPjwp6JWMlZNyJg9bwfamkDUM6vrkywbz1FNjv2L+Rm0JyZTP2lPbncYF9WGutpzyP878JHguheVXlbwiHoQAeqtu0vRwl+O/gh8yzUV081gDoOAWd8i+jewyD7pc5wlkaL9cWhOK/np1YtXAOrjJmXuDaqrfC2NcQocRuM/V0Pd3K7ja+txg2476d7NzKQtEZfVkAXYfABJYfTJoGl7a6Pwx9Rk4Zi5T3QO8TmnlOxkZd1CiDXZcrVJKoeP214nqmGKs721ryx0JUuIyh9HSTKSGhqbtsSXJ5cLCVDwlsAIioFLCpcin00lXlzJWgk3ShDhvwjWpl0U5WjUdrMIWuVsJQTGdUzFb0pykHw8OKreAUX4nJbXzqyfiG+bmchCE93DYchcZKySiY/erpl9Mwg4b0aAq8m0r
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 14:49:19.4633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21443ea9-9bf6-4d01-f4d1-08deb67ef922
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6095
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[axis.com,none];
	R_DKIM_ALLOW(-0.20)[axis.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6553-lists,linux-rtc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,axis.com:email,axis.com:mid,axis.com:dkim,mail.toshiba:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[axis.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fredrik.m.olsson@axis.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1E5CB5909B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RTC represent each weekday with a individual bit set in the WDAY
register, where the 0th bit represent the first day of the week and the
6th bit represents the last day of the week. For each passed day the
chip performs a rotary-left-shift by one to advance the weekday by one.

The tm_wday field represent weekdays by a value in the range of 0-6.

The fls() function return the bit index of the last bit set. To handle
when there are no bits set it will return 0, and if the 0th bit is set
it will return 1, and if the 1st bit is set it will return 2, and so on.

In order to make the result of the fls() function fall into the expected
range of 0-6 (instead of 1-7) this patch subtracts one from the result
(which matches how the value is written in ds1307_set_time()).

Fixes: 204756f016726 ("rtc: ds1307: Fix wday settings for rx8130")
Reviewed-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Signed-off-by: Fredrik M Olsson <fredrik.m.olsson@axis.com>
---
 drivers/rtc/rtc-ds1307.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 7205c59ff729..bf42c250ea7d 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -308,7 +308,7 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
 	t->tm_hour = bcd2bin(tmp);
 	/* rx8130 is bit position, not BCD */
 	if (ds1307->type == rx_8130)
-		t->tm_wday = fls(regs[DS1307_REG_WDAY] & 0x7f);
+		t->tm_wday = fls(regs[DS1307_REG_WDAY] & 0x7f) - 1;
 	else
 		t->tm_wday = bcd2bin(regs[DS1307_REG_WDAY] & 0x07) - 1;
 	t->tm_mday = bcd2bin(regs[DS1307_REG_MDAY] & 0x3f);

-- 
2.43.0


