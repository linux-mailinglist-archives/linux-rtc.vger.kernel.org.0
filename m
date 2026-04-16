Return-Path: <linux-rtc+bounces-6358-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGhDNYnw4Gl4ngAAu9opvQ
	(envelope-from <linux-rtc+bounces-6358-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 16:22:01 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 909AB40F81B
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 16:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 863CB302C74E
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 14:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73413DEAC8;
	Thu, 16 Apr 2026 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="MeYkFXFz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671033DE452
	for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2026 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349317; cv=none; b=Qf7+DlvrsQ0lJgGwFFflk1qXjc6lnhf10BqLqj8CP4Oo7+ddX+I6xuqsaccAjRBuWDQjJcVGGoDpQ0Vtcs7EF5ArR7ogVdTISiwpTG7dDuDRqWKSAMisKMyfh/LTF6mMO+9lCD0cZCA9jyl00AUBw5om3GOStwHq4fvIo5diINk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349317; c=relaxed/simple;
	bh=mAjT45WQhnjtVyYVvBf2pQ/QyrbZdt2tiyZOsc7r+ck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CkTK+G7+jsMqkOuAxsalxAmwGlQ5Uv5xRYPqfB6ilKJlBhL1H0ADuCS+LXyUdJVgjdQDfa/pszuXIOPBlEpo9ZoN00QWd1M9lp4r0BS352/kEsKGV2BtAznCX4rbdFoERMSBtQmcKJ3F8tbcbZw+Fk8N8M1iH6kB1Z7JjWDPSvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=MeYkFXFz; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12711867ca1so724359c88.3
        for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2026 07:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1776349316; x=1776954116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uFu1DzNio6n1RumPdBhDerBBGIlEwFQJz0L3Q0gtmOw=;
        b=MeYkFXFzjahrrawyt3Wj8LV9F13419NKFXYxp7KELlqqAIViWf80rbMZRtl0pQ2tTA
         omYiOW4Uto5VpDELQPgEnVAlQnniweLcW9wE8bD0dtZ0mtbz7+HFy0nZhkwPp+LBr8Vj
         hi21UVyqnddWeKjExdxOMKLcV/wRSzZGgbAy5SlX0dTqtl51RpMHi7lc513Cn6rDkpfE
         whdpkk3VaopkKGaSV1HLygQB8bcKAu6OgRCLwJytYjLtUleP0a0roU53HJffnCWqBbBy
         WrEK2L/rmJdw8WI8kgGUickkw3DLs8ZlI+Dx9cjilXKRGxrk9nZV2TLkS7OLmMsB8BIr
         baJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776349316; x=1776954116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFu1DzNio6n1RumPdBhDerBBGIlEwFQJz0L3Q0gtmOw=;
        b=YG1EUE/0we9fRA5T0oHBaTk1CdKskekrNVC4X0nFsStpC+yj7FSmjjPBEGFP/OY/GW
         AkUejm4d9+rNuNeMufRNNG+cyXEyDKb+mXrf7+0f++ak72NytKJOt7FDIGiLcRiRhKI1
         dyraFRGFvfGJjNTswZtlQsW6FvfLGlqBRDPgFWEKP3lVVDWCXu7TVel+eEIL/6dHNhxb
         dHp5W167BbTi6d+FQMm6EaT5uzB80tZWFpP7qDtErGqCxMK9NCFD2rQ93lXVaL+79iH9
         qzFMT7fH8hJYOolkxAz3WH9aBfX7fS689lC+5JTXwUXiQMZ5cqUNugOcdTwJ1EoKcVT3
         PxQg==
X-Gm-Message-State: AOJu0YwoxkVqO7akeoNdXazDiBM658xDmeeGBuAZdIwJZ3TOhC5IRCdU
	373OnPNoBo+Y6Xan4EWnQ4CABfkJBeoNQ/6zz2yk3FLjYfO3dugip9a4BB0DF+lPag==
X-Gm-Gg: AeBDieuDsJ1CWPM7VjSd/E4WPLGllcSLCeTsutVJCnCprCiwrq1NxvTOCFe6Llj5e8I
	EoWtfrWqb8Q83F0J7dhuBPH+dmIzbgZ7EAxlmvk2NOQiwOSxk2QiR8w8ycsoDnpW7N97J2mNa05
	evbn6N6n3zWb3O7ecOLKEVghZZsKFYIHM7KKK9fULPR61MU02mdJxVMSrva4uWsoezdL+2xnD82
	SL3uzbI/sHAl+yHnP7nEcd5dhg4iyH4QQY1+bZZ2P45FlBEPhiR4rbot/uVwnt/eKjDkss6w88P
	69DTnfAynGUI21jQFUCTkYXNGUzQM6zZRLTEJDlw7maOx9gGZMYQHAJiDyKxmffmYErvh3d2zTg
	F7XvtMId7eNH5OyvgC+o/MsH8Snsn0PbpCW9xXHnKKEPMAYoOSujtW40StOlOnfGqrfhZ+sPxst
	lVN4uxigZHnL4qw0c/M6T3v4d6Ih+iy+1u0nf6hkYeKAZRi7Vnf2bY4oczm/8=
X-Received: by 2002:a05:7300:7495:b0:2c1:7ca:cec2 with SMTP id 5a478bee46e88-2e193539dd3mr726559eec.8.1776349315133;
        Thu, 16 Apr 2026 07:21:55 -0700 (PDT)
Received: from adriana-schoodic-rtc.sjc.aristanetworks.com ([74.123.28.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c605851sm7577478eec.9.2026.04.16.07.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:21:54 -0700 (PDT)
From: Adriana Stancu <adriana@arista.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Adriana Stancu <adriana@arista.com>
Subject: [PATCH v3] rtc: bq32000: add configurable delay between RTC reads
Date: Thu, 16 Apr 2026 07:21:51 -0700
Message-ID: <20260416142151.3385827-1-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arista.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[arista.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[adriana@arista.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6358-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[arista.com:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arista.com:email,arista.com:dkim,arista.com:mid]
X-Rspamd-Queue-Id: 909AB40F81B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When the RTC is used on systems without a interrupt line, userspace
tools like `hwclock` fall back to a frequent polling loop to synchronize
with the edge of the next second.

On the BQ32000, this aggressive polling can temporarly lock the register
refresh cycle, because the continuous transfers prevent the hardware from
updating the buffer. This results in stale data reads or select() timeouts
in userspace.

This patch introduces a delay before reading the RTC registers in order to
provide a sufficient idle time for the hardware to sync with the register
buffer.

Signed-off-by: Adriana Stancu <adriana@arista.com>
---
 drivers/rtc/rtc-bq32k.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/rtc/rtc-bq32k.c b/drivers/rtc/rtc-bq32k.c
index 7ad34539be4d..edce95eb328f 100644
--- a/drivers/rtc/rtc-bq32k.c
+++ b/drivers/rtc/rtc-bq32k.c
@@ -16,6 +16,7 @@
 #include <linux/kstrtox.h>
 #include <linux/errno.h>
 #include <linux/bcd.h>
+#include <linux/delay.h>
 
 #define BQ32K_SECONDS		0x00	/* Seconds register address */
 #define BQ32K_SECONDS_MASK	0x7F	/* Mask over seconds value */
@@ -89,9 +90,17 @@ static int bq32k_write(struct device *dev, void *data, uint8_t off, uint8_t len)
 
 static int bq32k_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
+	struct i2c_client *client = to_i2c_client(dev);
 	struct bq32k_regs regs;
 	int error;
 
+	/*
+	 * When the device doesn't have the interrupt connected, prevent
+	 * userpace from polling the RTC registers to frequently.
+	 */
+	if (client->irq <= 0)
+		usleep_range(2000, 2500);
+
 	error = bq32k_read(dev, &regs, 0, sizeof(regs));
 	if (error)
 		return error;
-- 
2.51.0


