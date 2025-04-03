Return-Path: <linux-rtc+bounces-3756-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CD6A79F5A
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 11:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E51283B638D
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 09:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4503B24EF9B;
	Thu,  3 Apr 2025 08:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a0/vvPQJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BC9245022
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670770; cv=none; b=BWnf+4wH79OvAEgbJCbyCYuWZFjJljH85IGj6VzAIZBRiWac6ddF1tNxxkjxKqqxCPatRjsc4T+vAZQPD7zy2uxnAJYW8nlX8CVW1AA2iBUYgqG9HPeke2YcM0ypLcPbzn7c/5/CdeFJmU9WfUW0pFoxyuRnyDQedDuw2mrcXos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670770; c=relaxed/simple;
	bh=OstHPLtut+rInIwPbWUGG5F4uJhc1s8p9YL3Yn+eQfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0WDOMgipry7Hs6Yw4i7SMjwZvHeOvHqS9+3YrhDqIp7Vqmi2euyzjdpswLvDlcSCjBKG7KP5lkLdef6JyugEOqaTVUjzwjbF91z6OzKzQ/hUSCNqZ9fq74s73KuDP9ZfpUCswbnBWff0WpFmaPSbeFQfh1cSraUyKpPCMxNTlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a0/vvPQJ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso1322393a12.0
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670757; x=1744275557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zOrAobgqux207RdFFKdVSyI3bSrdsl4WaNtosICsko=;
        b=a0/vvPQJ3FYrLA2YsMerto3UUJnPQNJcOSWbV78Xf/+9Y8scEybfd9wx0+nCwPBjoT
         9/g7VDYzXVO9oOuheWQnlDIbcN/gyuvKFotrrLuYDNMTqHBxN4G/uMdq9/q/6qTA/191
         a/M61ijIigm/uAaspNgGatMc8MBxlgAnooBdaorUGW1MyYIO/s2diRzqEqhIL4zkp15w
         lPlxAocEKnkg3gRWneFoJLiKJLxH4MSsDNJJ8ygZwZzwHi/YCxLkJp8+dzFR4+iRh2JT
         Xy4DnknyNT/9pW8Uzfwn2akXdYNcWkNmA2LvEXFWAp4d7/jhXjk/K3UQCnU7eZBcHWFo
         BGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670757; x=1744275557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zOrAobgqux207RdFFKdVSyI3bSrdsl4WaNtosICsko=;
        b=c+Pz9Aa94emMg1Spqe6LO9uGam9nHEfOHdawXzAEVVPehVO5T7ZC7l29POahDNhlPf
         fnLaC/WRsFTFJMY9uHYLjAJoHWRrHr9J0ganFqZj8wXwha7rwVTk58XVT1/vpTBpTf6P
         SlPFmzdorrYMaEpTwXGvUoyi5AWvc1fn28Y3Fh4y+/XadJeFlp2SS0Ij6jHP8LgEOtYA
         SLXG0o++2eX4cmavEUAfwN1XI1CiVDOLA026pfsImmgYFEm2Q/noFOzFR78qKrWsgweo
         rhSdnGw3upIF/48SWl3SHINIXNgs6Ymi2zwpd5HA0BjhNFnX/2OM8RFmi+vKJkJ04RG0
         Tqng==
X-Forwarded-Encrypted: i=1; AJvYcCVY4hqJHJXYoMr8QmLhuFbRsILwVNDGqgdVz2k64pKp2R6gjVKDMq41FflXjZFPOmq0FoYcD0SdDf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuOBVYGEE4FYgXpkR7unFRYpgefB8wcCh9MFuOWPAnbKIGK19A
	OIEPyki12qgSYZKzuIPxQ7dt1DBdBqrvisxHQw7O2AERcIoZsPPPy18UjMFmM1k=
X-Gm-Gg: ASbGncv3xmXWklBStIOjYgL/BUp/9uvCvNWX8E6gdZQuGWP+7+0ds9N0GhChjV+UYzg
	J7M4nfw6YeRDKI2lQ0C1nWHc1dm3amFOcEQLQUtm8TyQMvu80YKH6hSQilmbIHcItT88PcFX6II
	lw7UeLysELC+BKtRmIMF+ryUI85EhCw05+LRmNzb7/2x2mGIwWM0BqEG/73Zr2JL8kweiJXAvTY
	MRX84NoOgxoYraaW9uGDmoPMViVlNtdk7Bj8a8rSSehLswfzGKe6MndheOK1IcFl6S1YgNAKCvv
	vgvznecZIEkiWuXslSnec1j40v2pwIO3rbOVC9yqlTAPMGXn0dx26nGHNQdCp0LUyL+jDs+adA9
	2csE0lq3uq2YIciNaMe4Y4meEyH66
X-Google-Smtp-Source: AGHT+IHsXg/hWI5W6L2JAbs5tQ+hU9M5VZLzhEtJEwJ8sjShCEtp9J7Km89nFH/JtsSi3gQsvsWdtA==
X-Received: by 2002:a05:6402:5114:b0:5e5:bb58:d6bd with SMTP id 4fb4d7f45d1cf-5f09300645cmr1255191a12.10.1743670757293;
        Thu, 03 Apr 2025 01:59:17 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:16 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:20 +0100
Subject: [PATCH v3 28/32] rtc: s5m: fix a typo: peding -> pending
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-28-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Fix this minor typo, and adjust the a related incorrect alignment to
avoid a checkpatch error.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 0d8783577bab4f4ebe61050dbd68387d970773bd..7b00e65bdd9c25b3426f92355f8ea36e66c3939f 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -243,8 +243,8 @@ static int s5m8767_wait_for_udr_update(struct s5m_rtc_info *info)
 	return ret;
 }
 
-static int s5m_check_peding_alarm_interrupt(struct s5m_rtc_info *info,
-		struct rtc_wkalrm *alarm)
+static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
+					     struct rtc_wkalrm *alarm)
 {
 	int ret;
 	unsigned int val;
@@ -451,7 +451,7 @@ static int s5m_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	dev_dbg(dev, "%s: %ptR(%d)\n", __func__, &alrm->time, alrm->time.tm_wday);
 
-	return s5m_check_peding_alarm_interrupt(info, alrm);
+	return s5m_check_pending_alarm_interrupt(info, alrm);
 }
 
 static int s5m_rtc_stop_alarm(struct s5m_rtc_info *info)

-- 
2.49.0.472.ge94155a9ec-goog


