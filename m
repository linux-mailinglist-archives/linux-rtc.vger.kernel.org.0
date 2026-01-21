Return-Path: <linux-rtc+bounces-5818-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHq0CoO3cGlwZQAAu9opvQ
	(envelope-from <linux-rtc+bounces-5818-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 12:24:51 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E4655F49
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 12:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3DD46960CE1
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 11:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B311747D947;
	Wed, 21 Jan 2026 11:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="mSkMXvzM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com [136.143.188.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EF447D920;
	Wed, 21 Jan 2026 11:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993496; cv=pass; b=qmbx0UAlAn+MkcbLOJ7t75U2y9ssvCdRZCYgwshPoFqv9GOaZ/tHn5D+WTyJeqiRMWitKyNatBGhKd3u9qM1SQ4nonxDHPJ8hSnjBwWL9zvPNFOPE+KJK0+A8YCyzeJlSaaITRkfrnZncBfcbX+gQ9rhA/F8hx1KPvVSr3U6Fdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993496; c=relaxed/simple;
	bh=SE3KCwAGdCuYIMUpUjVkwvvnkVL1syEZpjMdM6ORN2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mkQIlkD5SBdngA46iN/QVZXzJb9eaKaYPBcb3RLyeVkI+x+1YyMcHIIoW0tRyJSNunHpyptfwMMW6BVjRoqcvAfVJREhU5cti/PQ0ngY8W/CHN9KeDf66GTHrNNvvzQ9taNc1TWC+n/MKJyqRZj2q0JdHS3JnaiUhPrxlznITOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=mSkMXvzM; arc=pass smtp.client-ip=136.143.188.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
ARC-Seal: i=1; a=rsa-sha256; t=1768993480; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=U33vu7XTEIYnxNSHVFZUqS2pG/Gpyc9ErTZRdQLff9Xht602lfg0z5pnw4AwyTkfMH39KPa8XqTyaShouSI8MlhyjUrI6pmd6GiIA4MQRWh1c8Pax22LofyS0lBct5C1yoZcER08mgUfKwIt8pDh3rF+z9sbfiy+rqhuGbevnZ8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768993480; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NBVXFEdaRJcEH9atfPBKtguvTBweusReAnDHX35/2Us=; 
	b=e8FiM8Qtqsc5GJaw51cbBqeiYu0yl9Kpn9RhUdnS1XCGuiwxVpLQwrmT2sVQH/P2mrhJ7WZKLpaEN9Ijl6Nq7j1gSeQSLXkj0KKHvI9UxUJ6noNAxcMeiramPnQGUXGdzzx9etGE/xQ6hwslpayu9wv2fpuBJfktLza0I/4PrGI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768993480;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=NBVXFEdaRJcEH9atfPBKtguvTBweusReAnDHX35/2Us=;
	b=mSkMXvzMKCUW3GyUCnc2/eZsmCaLWZf/Ww5TJbnZgJ23hrYvwssYnitkEdSLBY1S
	h7n6E77YIwfPMhexn9zfkVJMtfruCD9ya373pjlmnxpOuvR0WjdttUgGWBljHhLKTJx
	6/C8eugEkdhRzsUicjMjQ646Y6a72nEXz2PSQkOU=
Received: by mx.zohomail.com with SMTPS id 1768993478453725.0311405076129;
	Wed, 21 Jan 2026 03:04:38 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 21 Jan 2026 18:59:12 +0800
Subject: [PATCH 6/7] rtc: sun6i: Add support for A733 RTC
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-a733-rtc-v1-6-d359437f23a7@pigmoral.tech>
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
In-Reply-To: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768993386; l=1343;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=SE3KCwAGdCuYIMUpUjVkwvvnkVL1syEZpjMdM6ORN2A=;
 b=+oew59MDiDNmLqVNHNSZRel5WMMQ8wzQ4Ax7fokTiWUGO5MTiRDxhQyHSanz6R7PE3FDXKsE1
 V56D26wPYD8AlSwWH93Pq9IG7p9gktp+y/S18aav2ViWHcDX693hM8v
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[pigmoral.tech:s=zmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,gmail.com,sholland.org,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[pigmoral.tech];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-5818-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[pigmoral.tech:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[junhui.liu@pigmoral.tech,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pigmoral.tech:email,pigmoral.tech:dkim,pigmoral.tech:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: F2E4655F49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RTC in the Allwinner A733 SoC is compatible with the H616 in terms
of its time storage and alarm functionality. However, its internal CCU
is different, with additional DCXO handling logic.

Add new match data to register a new auxiliary device for its CCU part.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/rtc/rtc-sun6i.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index b4489e0a09ce..a58d9c6b917c 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -865,6 +865,11 @@ static const struct sun6i_rtc_match_data sun6i_rtc_match_data = {
 	.flags = RTC_LINEAR_DAY,
 };
 
+static const struct sun6i_rtc_match_data sun60i_rtc_match_data = {
+	.adev_name = "sun60i",
+	.flags = RTC_LINEAR_DAY,
+};
+
 /*
  * As far as RTC functionality goes, all models are the same. The
  * datasheets claim that different models have different number of
@@ -883,6 +888,8 @@ static const struct of_device_id sun6i_rtc_dt_ids[] = {
 		.data = &sun6i_rtc_match_data },
 	{ .compatible = "allwinner,sun50i-r329-rtc",
 		.data = &sun6i_rtc_match_data },
+	{ .compatible = "allwinner,sun60i-a733-rtc",
+		.data = &sun60i_rtc_match_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);

-- 
2.52.0


