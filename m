Return-Path: <linux-rtc+bounces-6173-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YA+XIXvKsWnvFAAAu9opvQ
	(envelope-from <linux-rtc+bounces-6173-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 21:03:07 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F70D269C3B
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 21:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92DBD303303F
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 20:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE0238657E;
	Wed, 11 Mar 2026 20:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="CRU0b1h1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C688E383C65;
	Wed, 11 Mar 2026 20:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773259367; cv=none; b=qsdSe05Ay+lKr9XQFHSMybAuJy5MQKZf9OW99JQOBpcfjgGLHTR1mqhg5fMVI4bt9Pru/7EDZ7JQ2UQzjY9a8smTfUusHZ/5QTKo9lLujFeioxWVFU5s1R4FvDbIhZuOIDxEV1LgwRzV9CjVea+LZyAOO8xxnv4+W+MynXBzV3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773259367; c=relaxed/simple;
	bh=+oyOOuubtL4cIX70d0LAvj0kGjY4txSxUdqc6gVOyXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+LKnKHu3tblHy47LluFJK3zV6lYyj/ZUsvqu80H1/GI4VNpuQnApfyhY89eqxs8Gl3rFnwi1IoH4ObA3gUoLFmolmJCiuYWs4K4p4cSe58FFXUYs5OFYJbwEBwn1dpi4y6DYLE/QsiMwuq0moeXTQcit6i9JiIkC3lRanta/Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=fail (0-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=CRU0b1h1 reason="key not found in DNS"; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:subject:date:message-id:reply-to;
	bh=RvsHrnN6d5fqKPKo6DShPnzp5ySUgxQwHxzhyFA5Rv8=; b=CRU0b1h15fpnnWL+1qkErhNbDe
	VVpqRlZsezkbhNo3bKR80iJtijAg484oxOmKJ9SjF9kgRIvFRg6gkKUDh/I/6irVk5gCYCcA4yK/o
	iVHNusG6fpWRBwXZDDmRszX0S+NaiY9TCJl7HaaYHZhWyyWfDQ1RYN8KIrbq3ypNQL40=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1w0PlU-000000000Lu-2ZTU;
	Wed, 11 Mar 2026 16:02:44 -0400
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
Subject: [PATCH 4/4] rtc: pcf2127: support battery low voltage detection function
Date: Wed, 11 Mar 2026 16:02:30 -0400
Message-ID: <20260311200237.3531981-5-hugo@hugovil.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6173-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[hugovil.com];
	R_DKIM_PERMFAIL(0.00)[hugovil.com:s=default];
	FREEMAIL_CC(0.00)[vger.kernel.org,hugovil.com,gmail.com,sferalabs.cc,kunbus.com,amsobr.com,dimonoff.com];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[hugovil.com:~];
	NEURAL_HAM(-0.00)[-0.566];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dimonoff.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,hugovil.com:mid]
X-Rspamd-Queue-Id: 4F70D269C3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Add support for parameter RTC_PARAM_BATTERY_LOW_DETECT in RTC_PARAM_SET
ioctl to enable/disable/query battery low voltage detection. This is
especially relevant on the pcf2131 where this function is disabled by
default, contrary to the pcf2127.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 drivers/rtc/rtc-pcf2127.c | 60 ++++++++++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 0605295026564..05b08867ffcb3 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -364,12 +364,12 @@ static int pcf2127_param_get(struct device *dev, struct rtc_param *param)
 	u8 value;
 	int ret;
 
+	ret = pcf2127_pwrmng_get(dev, &value);
+	if (ret < 0)
+		return ret;
+
 	switch (param->param) {
 	case RTC_PARAM_BACKUP_SWITCH_MODE:
-		ret = pcf2127_pwrmng_get(dev, &value);
-		if (ret < 0)
-			return ret;
-
 		if (value < 0x3)
 			param->uvalue = RTC_BSM_LEVEL;
 		else if (value < 0x6)
@@ -379,6 +379,14 @@ static int pcf2127_param_get(struct device *dev, struct rtc_param *param)
 
 		break;
 
+	case RTC_PARAM_BATTERY_LOW_DETECT:
+		if (value == 0x0 || value == 0x3)
+			param->uvalue = RTC_BATTERY_LOW_DETECT_ENABLED;
+		else
+			param->uvalue = RTC_BATTERY_LOW_DETECT_DISABLED;
+
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -392,12 +400,12 @@ static int pcf2127_param_set(struct device *dev, struct rtc_param *param)
 	u8 value;
 	int ret;
 
+	ret = pcf2127_pwrmng_get(dev, &value);
+	if (ret < 0)
+		return ret;
+
 	switch (param->param) {
 	case RTC_PARAM_BACKUP_SWITCH_MODE:
-		ret = pcf2127_pwrmng_get(dev, &value);
-		if (ret < 0)
-			return ret;
-
 		if (value > 5)
 			value -= 5;
 		else if (value > 2)
@@ -418,13 +426,45 @@ static int pcf2127_param_set(struct device *dev, struct rtc_param *param)
 			return -EINVAL;
 		}
 
-		return pcf2127_pwrmng_set(dev, mode + value);
+		break;
+
+	case RTC_PARAM_BATTERY_LOW_DETECT:
+		if (value > 5) {
+			value -= 5;
+			mode = 5;
+		} else if (value > 2) {
+			value -= 3;
+			mode = 3;
+		}
+
+		switch (param->uvalue) {
+		case RTC_BATTERY_LOW_DETECT_DISABLED:
+			if (mode != 5)
+				if (value == 0)
+					value = 1;
+
+			break;
+		case RTC_BATTERY_LOW_DETECT_ENABLED:
+			if (mode != 5)
+				value = 0; /* Enable battery low detection. */
+			else
+				return -EINVAL; /*
+						 * battery low detection can't be enabled if
+						 * battery switch over is disabled.
+						 */
+			break;
+
+		default:
+			return -EINVAL;
+		}
+
+		break;
 
 	default:
 		return -EINVAL;
 	}
 
-	return 0;
+	return pcf2127_pwrmng_set(dev, mode + value);
 }
 
 static int pcf2127_rtc_ioctl(struct device *dev,
-- 
2.47.3


