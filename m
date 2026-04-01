Return-Path: <linux-rtc+bounces-6276-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIjbNhpQzWkWbwYAu9opvQ
	(envelope-from <linux-rtc+bounces-6276-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Apr 2026 19:04:26 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C16137E5DC
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Apr 2026 19:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1960330470FF
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Apr 2026 16:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15D736C0DC;
	Wed,  1 Apr 2026 16:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fw7BKlpO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9641147AF57
	for <linux-rtc@vger.kernel.org>; Wed,  1 Apr 2026 16:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062389; cv=none; b=hx0rh8P1Czn1esElFMAJTdlAmscyJz/uaRCRkW9T8g+Pum+aiuqiZ3Qo0O3brwpyREE0SJ+UzEzAccT5csxIPAcPPe3+e/B5iHAaBpV+RBQIjX04zY7n2Qqu5EIKFzcDdtp9ADAeeHjQSEftbRYgDGYLPp/+edmN2ZTdWfmYKrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062389; c=relaxed/simple;
	bh=g/zVUUapVCTZlNTIrMjEefGfohNtrc3i7ad+TVPFCvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4tnNZ9sUkFC+0bMRcLEebm8EAxffEkn39MUCxGJF5K1dYPTp4pe1CbS8YByGR9foFbkvu/PjCbSMXXKyiwjyzT64EJTr7ApISXRGNvUqZC2VOJGxHo/VBkCUrVKkU04HecECY/yiFicewAqrID1JTSkDKb/7pS5X8oBeGLyKaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fw7BKlpO; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59dcdf60427so7687323e87.3
        for <linux-rtc@vger.kernel.org>; Wed, 01 Apr 2026 09:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775062385; x=1775667185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEAh9NgRc1Zf0vnP313XVWBxaUdmOPKhIUVepf7x5+0=;
        b=Fw7BKlpOtUCAb2LW2vH128rZH92wne82m/hqME8kipFKZDSSMvUEVLwlBN8jgsCEgX
         7ifOVjqHRtkpYAaYWDxV6XbsjNxAv9wCjdCQHwDv/WHclyHRMi1UV5tCXbRGmQ3u4pIA
         D9lgFYhKZT4rRdRMaUf6dcWhiBBljUFFXKDH4/bzNX2GOwmRVE21nfxRMyKj6NQs68Mo
         2FJNp06xm5BCz2DFYIZDXzX/Xn4d1Rl+SC9Mu3dV4CXtIokp73101YDhlEfdHzkB45fG
         yfbSM0ndoMBMa94z99DxuERO0wCx5krG9Lx8OlWmTBhdnOzQLVcflWD6NwOxQdVHG7oM
         TL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775062385; x=1775667185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DEAh9NgRc1Zf0vnP313XVWBxaUdmOPKhIUVepf7x5+0=;
        b=JQhUP25Ti8aLkosXGzGnU2C1PrvIjGO1GsFx3TTzY0D7mKpzrl3XTyOHtMXMm9eE7E
         vQv8YEiGqU82ku6Z3Z4tqZNbymyxQ1wLyvKB0IGWwUpvBKhQ4rpq/HP81iNnsIsk0clQ
         iSiAdnx+Q7Dh3w0YWGpx8Ffv0x0g8VCb3SAcDinP0urtJIXF2akgbDiucfnhWcONadX5
         tCJdD41pX2Bv8jPmabFJmuOY+j2ctPcUvUywyghEg337GS4lz4xDCTOt+31aVCi1UiWV
         wiA51UvJvDADEvzDcER2vDljS25INzMewEMic/d9VHUXgcOdgznaAzbWNJcrS6xShQ0v
         oFmQ==
X-Gm-Message-State: AOJu0YzD/QZURT7vsKKek/iWfWK5tEUR/TpbfJz750eUrGjfUxxfNVBs
	+LzWkOTVT7dFqxr91MjwDB+X/+IrJ+UmmzeLkg0I4y8dVaCcIq+kzYxIgsNTdFwvy1Qzug==
X-Gm-Gg: ATEYQzw1mEGFpa18k1s9Mmt7Fce2orzZjDAUl/LjB2Z856fk06E50OI5M1Sm9oeirT3
	9j+YeSAzAzw914nEZV9SVraJJdqlorpKXDYW37vaa5xTsQtE562HJfSIim/aB6EaOZHYHcNL23A
	dVJDyczOS08KSmGgBXCA9HV2RZM1xYMjHKDxsB06PGi4OZBhPgQpDidXSZy4Fhe+TlwcRIiB+fi
	Ju+XLVbu/tdBo8skfXXfR+/oGq2hEnKSJMhTiG738uZ33oED8p24Mx1dG4mt8B3sEbQARZDyGDa
	FbTxd2NokycYSFCLBeRvXRmGXnld7Yol3zRyTsmSLQGLwifVaMUI/iJ9dlPHf+C9VDD8nFT7JOK
	Rg4wjsHbLB8H3RzSBZUliFOUKKP4qAhbuDd8QhgOt/Gm4rK4UfxsqHt0+yqo7CPALt8a6hsmo7+
	0uFomNET6vAntmUK5z90Y3KKhdfqwyvKGtuCUupOjhud8UYqrclg==
X-Received: by 2002:a05:6512:1291:b0:5a2:aec9:95f8 with SMTP id 2adb3069b0e04-5a2c1efa104mr1609821e87.17.1775062384933;
        Wed, 01 Apr 2026 09:53:04 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccbecsm63358e87.62.2026.04.01.09.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:53:04 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Steven A . Falco" <sfalco@harris.com>,
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 3/6] rtc: m41t80: Fix watchdog resolution bit handling for chips without extra resolution
Date: Wed,  1 Apr 2026 19:52:42 +0300
Message-ID: <20260401165245.936428-3-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260401165245.936428-1-eagle.alexander923@gmail.com>
References: <20260401165245.936428-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6276-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,harris.com,mba.ocn.ne.jp,towertech.it,linux-foundation.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-rtc];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0C16137E5DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For chips without the extra watchdog resolution (i.e., those with only 2
resolution bits), bit 7 (RB2) must be cleared to avoid invalid settings.
The current logic clears RB2 only when extra resolution is present.
Reverse the condition.

Fixes: d3a126fcf9df ("rtc: rtc-m41t80.c: add support for the ST M41T65 RTC")
Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/rtc/rtc-m41t80.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 52f398107d35..11ef8195e786 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -658,10 +658,10 @@ static void wdt_ping(void)
 		i2c_data[1] = wdt_margin << 2 | 0x82;
 
 	/*
-	 * M41T65 has three bits for watchdog resolution.  Don't set bit 7, as
-	 * that would be an invalid resolution.
+	 * Chips with extra watchdog resolution have three bits.
+	 * Don't set bit 7, as that would be an invalid resolution.
 	 */
-	if (clientdata->features & M41T80_FEATURE_WDR)
+	if (!(clientdata->features & M41T80_FEATURE_WDR))
 		i2c_data[1] &= ~M41T80_WATCHDOG_RB2;
 
 	i2c_transfer(save_client->adapter, msgs1, 1);
-- 
2.52.0


