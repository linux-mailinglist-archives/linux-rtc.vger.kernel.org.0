Return-Path: <linux-rtc+bounces-6582-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EtoME4rlF2pLUwgAu9opvQ
	(envelope-from <linux-rtc+bounces-6582-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 08:49:46 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A485ED64E
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 08:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B745E30EB9C5
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 06:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F819342C93;
	Thu, 28 May 2026 06:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Z9I3jHxG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA32A34250E
	for <linux-rtc@vger.kernel.org>; Thu, 28 May 2026 06:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779950914; cv=none; b=VUrZIBtDx9K0cS9E3mMTgzS4hqBIQ/tBY594QK+4TlsGi9Ru0VszJ+ke/CCAsRbyh427dhjIoLdJyp5vh+xL4IyOAFwEJFBw405f2S5SBPVxpS3J+VdTvOQRg+NEsdn9xjS/lC4bpEkoHnRbuX7JS48x/T8d/JnMdQaNE7r2jOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779950914; c=relaxed/simple;
	bh=OVYipeSrPi0x9S6evFYUzyubrHv2EiGt+bINl47YVrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KL2MtPRqVMOtkFwKU54uPK9F+NcAF1teprrBi3McoSf4mASf0+LV48EoVeNja78z03tRgPj8ddq3Ip/eL4hxxeXJ1nxRzlSuTz58fDZobcvM9gguRvIrC+Xavwfqzxj7R6+elyGEBxqE4aRt77Sf2cjKf5r1nU2S3238RDIGnhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Z9I3jHxG; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-44a74032ff8so9257244f8f.1
        for <linux-rtc@vger.kernel.org>; Wed, 27 May 2026 23:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779950911; x=1780555711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1DBeLjdfuvDOOOxi8Lum39+iPU+m01m3AbRKR5wF6U=;
        b=Z9I3jHxG2ZQZ93L+xOcCbxMYKyqG4DFg77Z1CK6UzAMQsYQdfn68aRDGtfgixZ8i04
         aqSuQUskgjRJlX8JSQOki62WpW5wu1O6Kdyx2Jqn9eRcI3FeUsrjJSxINIsA/Sne0r7y
         mRWI67f+YscvfsmmS/4gyqsiqNTB7jH3yXXU+/HQahuuhFD8mip+HUnUKlxBKuHOBsor
         FG7SWCJ23WOB4spBbmmc13Z3hATJA5QC4u8leQldz48pxl+U+9Mj+p6nZalxoxv2Q675
         bD8YkoVd3rgXIiYDcQjwi4cXjGnG2Fjf50SQ7ncCLpQBXkD2+VjVDmP9OuXSTp5OM1F6
         w6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779950911; x=1780555711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E1DBeLjdfuvDOOOxi8Lum39+iPU+m01m3AbRKR5wF6U=;
        b=GIizsnNlYp9J0bbqRfxByKEWdhSG49mWtgTYwfrp2Oqm+L5iBurVt/E115QbHdTV2B
         EBfWML6Tcc6FmbWwcsQ/H9XL6mYk+Dm2YK73ky864F0CgCax5Ims13PUvJzdWXgcDjzY
         1qZiCqjI0SQWlW1ypH4vCljsTqo0x6CEjLFJD4bbddXzOUpDefaNF7cpelwzwEeW9P3Q
         s8n6dqLCc925og5LYvbaYbdfDinPJYLE6LnaSSFeMPWfTPaObNkvORio8ieMWzOSOk+N
         UcgX36xrapTGPXEAt+hp6zx7S+GvWwmUwMItONvxe8MsKlKQetkSv9+LKEH2XKgg4Krh
         EfvA==
X-Forwarded-Encrypted: i=1; AFNElJ+TrN7S9+rZ94AyO45VvRrL8PfOLu6HAjvpvgBWgWORBw8kb2l7K1sOJLzwJlsBYM7e0F/nTH3+Em4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZCQWc+qCJUTl4DZUVxYmwqUn2rXv2/2CI92ow+B4VoNYzzb4H
	B9s5rGo+jsAT1xq4v7DRkTSBJevahF7qusI2L4+4/d2H6lQ187Hrrp2XeaovwZfGZ48=
X-Gm-Gg: Acq92OHBNiNp1+xc/KQLSkZL7F3Slxo1mo+pFm+46tRHnEUxyShwKIW0ItRic12W0A5
	2YYnjmFSpDDXRBvtQSTmuW2cb68BolPqK0MofcCYzK6kjhfLl2YBAgMIZYZnXQprcrLBglHjK9k
	YnuLMpkYL00scWkjVNjC6DBP90OR2yvjfyDxGagSL3e17BwKNAzpbwnR5/vWtVx2DK7/1EdFRZS
	+3+ikDWryIhHDGfY9lLsywPeqEpxxx+e5k/yECwAf6V07fTL+ZI3sdUBpzUvvnrfDu2eZLDmzt+
	nuh6KbnxO8rIawU8grmnvT9w4vzWCpRPnD4EHgybjfOnQtu4xS+dCYCYPPt+XLsGt8MBhxcr0q7
	5gdUxfoNq4K+sLG+iYWowDCJ8ATMW1RUdkvhVo8o7CabFPSwNwCGTqxQaHY+kycUwmC6MTm9ICP
	dMDymYGysLErsmzT7D+0iAzsA+3tl6+0J/NlyIa/0bujZUOxdYPo07HAQAc14S+RP6/LJeccqY4
	NRvog3YnQ2F2QmZxIAwIMr6OQ==
X-Received: by 2002:a5d:6f0d:0:b0:45e:9421:4ca8 with SMTP id ffacd0b85a97d-45eb36acd7fmr41633580f8f.28.1779950911454;
        Wed, 27 May 2026 23:48:31 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ee2a12a69sm4706827f8f.16.2026.05.27.23.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:48:30 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-rtc@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] rtc: Drop unused assignment of platform_device_id driver data
Date: Thu, 28 May 2026 08:48:10 +0200
Message-ID:  <9ec7a174605a17dd19c011ee2253de28d09b02bd.1779950275.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779950275.git.u.kleine-koenig@baylibre.com>
References: <cover.1779950275.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=OVYipeSrPi0x9S6evFYUzyubrHv2EiGt+bINl47YVrU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqF+UsIynkgOMyv9yXvwy9kAQHjiZBMxY3tgd9h gH17Hu0sCWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahflLAAKCRCPgPtYfRL+ Tn+WB/9Mpf/BWNknwnHZoGhap6Bd/KnlhhFDyj8jk6j4mpkip9ETFJb7hRzcQFgjGBjJXWYMUT2 sXbVA7QBBG2N9pTm1p/NZb71946QdcSWxrJ+sM5XnufYEQ228EKftqSbYntHbOwA4ruC2dwoJt0 7pVHQhdyQFT52+d0g1Nw1a12U4q5GOKjmzxW2FEs2okUB8Eu+GfYfe6BXIRlNfvEeFNWFRO3pkv XiQXyTyFGpT8NgFu91CXrZRGFNhAyAdBWthN7PTteuKMaqisOJuDwwNiqfMZ+Ie6n7jP0ZFFWdo wWb3YSveITFP97CQSeQvtDSQRL94Z97kNdSdJTi6cb5ObhpU
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6582-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,baylibre.com:email,baylibre.com:mid,baylibre.com:dkim]
X-Rspamd-Queue-Id: E2A485ED64E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The two drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignments.

While touching these array unify spacing, usage of commas and use named
initializers for .name.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/rtc/rtc-cros-ec.c | 4 ++--
 drivers/rtc/rtc-max8997.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
index e956505a06fb..f3ecd017e2f7 100644
--- a/drivers/rtc/rtc-cros-ec.c
+++ b/drivers/rtc/rtc-cros-ec.c
@@ -388,8 +388,8 @@ static void cros_ec_rtc_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_rtc_id[] = {
-	{ DRV_NAME, 0 },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_rtc_id);
 
diff --git a/drivers/rtc/rtc-max8997.c b/drivers/rtc/rtc-max8997.c
index e7618d715bd8..89203c92e2cd 100644
--- a/drivers/rtc/rtc-max8997.c
+++ b/drivers/rtc/rtc-max8997.c
@@ -512,8 +512,8 @@ static void max8997_rtc_shutdown(struct platform_device *pdev)
 }
 
 static const struct platform_device_id rtc_id[] = {
-	{ "max8997-rtc", 0 },
-	{},
+	{ .name = "max8997-rtc" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, rtc_id);
 
-- 
2.47.3


