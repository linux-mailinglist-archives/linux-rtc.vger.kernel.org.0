Return-Path: <linux-rtc+bounces-6171-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GL8oKHfKsWnvFAAAu9opvQ
	(envelope-from <linux-rtc+bounces-6171-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 21:03:03 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B8C269C2C
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 21:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC4F8304804E
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 20:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D4038553D;
	Wed, 11 Mar 2026 20:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="rk4/0bnb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E6433122D;
	Wed, 11 Mar 2026 20:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773259366; cv=none; b=j5uijiPnjbLw9hWSCvpOK3ohuFqlnoyb7xrziST2MyCYbHLcCuO7dGRHC26LQV9UvvQPC12mALGShAGwD9CLkNN0jfnT7tBSeo3V2SIeu3JQ0e4ucIFVk5gltN7ekTLyOhiJzheo7x7bYYhTTnlDm8TBeypwC+G2fdVQXgzRy9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773259366; c=relaxed/simple;
	bh=i6c3mDCRRAjDlXJe0nhjFm58gq3hSdjpXNhPcl7vufw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H3MMGl4c6JL/c1EpEW7f5Gs1P3C7icE9dBBfosCgQ/nRZK4Fn4Vgw7+UbeiQpS0SZwItWa72PVq2NTaNmTHLN/DRxcOdsJLvV0hQf11w3mEXep4eze22C/d8BAwJYlymE8QB7HGPDV23TYcmBVVpr9nY2O8TvlRPpaP+isciU8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=fail (0-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=rk4/0bnb reason="key not found in DNS"; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:subject:date:message-id:reply-to;
	bh=kH/fXf9SndV/fPlnXEWo7nT5oBnL6RleSNAFNGbN6cA=; b=rk4/0bnb2p+TWi5PVDFLCbyX7q
	aiSbKa0JazaVAypeyHmla59JiDvtPPFDlkutq4TPulSed4suvCPZoypukbvuVLl1SnqePzEgVDjH0
	NDtM+/l/3tKxcF2izH9FH5FZKuxbh8lSlGqKW98Bgc2jS49r9NwOcxvAjH/WWOkcf6M4=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1w0PlS-000000000Lu-15aP;
	Wed, 11 Mar 2026 16:02:42 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hugo@hugovil.com,
	bruno.thomsen@gmail.com,
	giampiero@sferalabs.cc,
	p.rosenberger@kunbus.com,
	antonio@amsobr.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH 2/4] rtc: pcf2127: add pcf2127_pwrmng_get/set
Date: Wed, 11 Mar 2026 16:02:28 -0400
Message-ID: <20260311200237.3531981-3-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260311200237.3531981-1-hugo@hugovil.com>
References: <20260311200237.3531981-1-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam_score: -1.0
X-Spam_bar: -
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6171-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[hugovil.com];
	R_DKIM_PERMFAIL(0.00)[hugovil.com:s=default];
	FREEMAIL_CC(0.00)[vger.kernel.org,hugovil.com,gmail.com,sferalabs.cc,kunbus.com,amsobr.com,dimonoff.com];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[hugovil.com:~];
	NEURAL_HAM(-0.00)[-0.630];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dimonoff.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,hugovil.com:mid]
X-Rspamd-Queue-Id: 22B8C269C2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Add common functions to get/set the pwrmng field in the CTRL3 register,
used by pcf2127_param_get() and pcf2127_param_set().

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
These functions will also be used in the following patch
to add battery low detection.
---
 drivers/rtc/rtc-pcf2127.c | 42 +++++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index e2e9746027348..0605295026564 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -213,6 +213,30 @@ struct pcf2127 {
 	bool ts_valid[PCF2127_MAX_TS_SUPPORTED];  /* Timestamp valid indication. */
 };
 
+static int pcf2127_pwrmng_get(struct device *dev, u8 *pwrmng)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	u32 value;
+	int ret;
+
+	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &value);
+	if (ret < 0)
+		return ret;
+
+	*pwrmng = FIELD_GET(PCF2127_CTRL3_PM, value);
+
+	return 0;
+}
+
+static int pcf2127_pwrmng_set(struct device *dev, u8 pwrmng)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+
+	return regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
+				  PCF2127_CTRL3_PM,
+				  FIELD_PREP(PCF2127_CTRL3_PM, pwrmng));
+}
+
 /*
  * In the routines that deal directly with the pcf2127 hardware, we use
  * rtc_time -- month 0-11, hour 0-23, yr = calendar year-epoch.
@@ -337,18 +361,15 @@ static int pcf2127_rtc_set_time(struct device *dev, struct rtc_time *tm)
 
 static int pcf2127_param_get(struct device *dev, struct rtc_param *param)
 {
-	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
-	u32 value;
+	u8 value;
 	int ret;
 
 	switch (param->param) {
 	case RTC_PARAM_BACKUP_SWITCH_MODE:
-		ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &value);
+		ret = pcf2127_pwrmng_get(dev, &value);
 		if (ret < 0)
 			return ret;
 
-		value = FIELD_GET(PCF2127_CTRL3_PM, value);
-
 		if (value < 0x3)
 			param->uvalue = RTC_BSM_LEVEL;
 		else if (value < 0x6)
@@ -367,19 +388,16 @@ static int pcf2127_param_get(struct device *dev, struct rtc_param *param)
 
 static int pcf2127_param_set(struct device *dev, struct rtc_param *param)
 {
-	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
 	u8 mode = 0;
-	u32 value;
+	u8 value;
 	int ret;
 
 	switch (param->param) {
 	case RTC_PARAM_BACKUP_SWITCH_MODE:
-		ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &value);
+		ret = pcf2127_pwrmng_get(dev, &value);
 		if (ret < 0)
 			return ret;
 
-		value = FIELD_GET(PCF2127_CTRL3_PM, value);
-
 		if (value > 5)
 			value -= 5;
 		else if (value > 2)
@@ -400,9 +418,7 @@ static int pcf2127_param_set(struct device *dev, struct rtc_param *param)
 			return -EINVAL;
 		}
 
-		return regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
-					  PCF2127_CTRL3_PM,
-					  FIELD_PREP(PCF2127_CTRL3_PM, mode + value));
+		return pcf2127_pwrmng_set(dev, mode + value);
 
 	default:
 		return -EINVAL;
-- 
2.47.3


