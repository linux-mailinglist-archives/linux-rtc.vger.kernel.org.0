Return-Path: <linux-rtc+bounces-6274-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNDEIzdOzWkWbwYAu9opvQ
	(envelope-from <linux-rtc+bounces-6274-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Apr 2026 18:56:23 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D6B37E406
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Apr 2026 18:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3FB43004C1F
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Apr 2026 16:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381C645BD4E;
	Wed,  1 Apr 2026 16:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3gdAdsK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A21477988
	for <linux-rtc@vger.kernel.org>; Wed,  1 Apr 2026 16:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062384; cv=none; b=q89Bs4iEjBRXnxds4dIFVAru2gQBeHaYPpfDIYWJl5AKojJZvpUdddzQVEfgzFTMbuuCBNTmSZTNVWoPpvqLL7I5fkYH/QPPVspfRwnZlZb79xPKDENH1GmWCDpUEJCo1SSAKo0psQFYDvZFz+ThNKZC9zpNzAG1lFUo/urqwII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062384; c=relaxed/simple;
	bh=O/d5nTuCQSyawDHyeFxfGQr1z4wgMwOJQ5lFyp3385Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PUtkB7REgKl0uH0uiEBUn219082CwieIxq0KT7z7763XtBh+eZ5OaCcVF07oWUEyTxogcjgtHcaNZbIm0oXsMvFgOuPQgGS54mfhhA6O3Td7lAVy813orInp6B5k+fkigy+Xi3EzHtJqEaoqqQYkn6jGCw4vbOfT+lUMqu9EfVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3gdAdsK; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so9707e87.1
        for <linux-rtc@vger.kernel.org>; Wed, 01 Apr 2026 09:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775062380; x=1775667180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YFr/uSECQBqNskioj5ShvHktlZ289MTrhS+Qpu8jFIA=;
        b=J3gdAdsK+K19DltRuHtBgG1ATdhzy4prpKtddOj8enc2gZC+zOfvezuy68C9oB1Ch/
         2G9xKPz4/TN2hhyQA55FJtibzUGPWcrCAH+ivJ5Ngl8s5MnXjs8ieo+xXKkbdOVUG8PN
         5LeU1av4PbIHTHJMo9Dxd0gzKF042MFD0kNqf/d+xxc+Tnw9p1/l4TQtAFfntQrfQn78
         lWz6596y9lUQ6CzJEfUCbrPBRd96eCcEi44l/2uIXAKZHma3+dZgJLxBRX/Es3nPCkxO
         vVS5mhP9OEbFVrQgqUGFRlJr+X7ApHm8mLnyh7Npbu7e4T1iPCB7OoC/Ibd4CQqmlILh
         1/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775062380; x=1775667180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFr/uSECQBqNskioj5ShvHktlZ289MTrhS+Qpu8jFIA=;
        b=LWb8BunU/CAKp9/ETfAcU4x06eKbFKF6H4HY+whSQVLWSEF0DyNM4h4GLbJOc+ldub
         +oQnIAA7+5d7Gwia4IXqsCXYcnRuDdKTVbyN5xr8+d+S8mOJRm8j+9JS/LdXXgmJrfu0
         47TQu9XbXRQ2KMaQU4OnehnVKwaJee8j7wwdt9UNj8aKSueSG8wGlkzpZn01cJAA4FUE
         ZQsBagV6w+B4/YOVu0M/u0BAV1j949/4jlJ3A8B11oKT0V6XC7tjN6fjMXcmsctxLzja
         pn2WNfllBwOQ/OISoidJfT6ZSevYhliK70Yc02bKE+RGFzvbxVgjm84COO/fIyq6hHYc
         s8pw==
X-Gm-Message-State: AOJu0Yx+EX0/ZA9JtR5gjRhzZWd/QKA0hnRr5zR14dh8RVM8SsOuzVtR
	pp8YWRjBN8wxTXHZKFFrxCu9nvuI2zVUwWCNn6LEJT8SRb95pzfcQJYYOaiMdsPmlU4o/g==
X-Gm-Gg: ATEYQzyeznea2G0uoK/n7ToyFmlmaW/soGy5dSHdFo4/OkuGfpsczKKX+J27W9rtsgy
	IUg4W7saAgTPzJsUCn/Yi9VOlFKgWIEKfIjR01Ou+jVgGgwRin8zqhvP60+Ma9dN+V8RGb11+qD
	uXOMfgJ3mjQ+U6z0+92q2au/ouCearf6rrBBz2CPEZNsLhrPg/TSH/pb5+ysXC5VBGwfdV/kX82
	SaNYnMrTRUpOwxd304AFBnosWLEm2F/FyMUaxQScCTm5AsAVSsVZJIrmb7gI3d8IYJaT/48aDVq
	rkyFpA0lq/2Z4BzvDiNo9ZdIeDPH5znPJz0viMzmD9s4iA88MiWKbYRIR/SjCEGG270mUFdy64O
	3dRzThzUMwBKEQbXqQ+GIUSD8CuFRP9HGKjWj9+inBtQLew7jGvHsOawgi73BhdAoSdTtJIx28Z
	ExIdS1AvHorEbhWGb4fcOZxeqDQVsJUq4r8di3Ea8=
X-Received: by 2002:a05:6512:1282:b0:5a2:84a3:9b41 with SMTP id 2adb3069b0e04-5a2c1f0d6a5mr1800721e87.16.1775062380248;
        Wed, 01 Apr 2026 09:53:00 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccbecsm63358e87.62.2026.04.01.09.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:52:59 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Steven A . Falco" <sfalco@harris.com>,
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 1/6] rtc: m41t80: Remove deprecated and undocumented compatible strings
Date: Wed,  1 Apr 2026 19:52:40 +0300
Message-ID: <20260401165245.936428-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6274-lists,linux-rtc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,harris.com,mba.ocn.ne.jp,towertech.it,linux-foundation.org,gmail.com];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-rtc];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 06D6B37E406
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OF match table contains legacy compatibles "st,rv4162" and "rv4162"
which were added 9 years ago for compatibility reasons but are not
documented in the binding.
Remove them as they are no longer needed after the device tree has
been updated to use the correct "microcrystal,rv4162".

Fixes: a897bf138c9b ("rtc: m41t80: Add proper compatible for rv4162")
Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/rtc/rtc-m41t80.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index b26afef37d9c..155eded2a921 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -131,15 +131,6 @@ static const __maybe_unused struct of_device_id m41t80_of_match[] = {
 		.compatible = "microcrystal,rv4162",
 		.data = (void *)(M41T80_FEATURE_SQ | M41T80_FEATURE_WD | M41T80_FEATURE_SQ_ALT)
 	},
-	/* DT compatibility only, do not use compatibles below: */
-	{
-		.compatible = "st,rv4162",
-		.data = (void *)(M41T80_FEATURE_SQ | M41T80_FEATURE_WD | M41T80_FEATURE_SQ_ALT)
-	},
-	{
-		.compatible = "rv4162",
-		.data = (void *)(M41T80_FEATURE_SQ | M41T80_FEATURE_WD | M41T80_FEATURE_SQ_ALT)
-	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, m41t80_of_match);
-- 
2.52.0


