Return-Path: <linux-rtc+bounces-3697-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC0CA74AE5
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 14:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEE0E7A60C2
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 13:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9197523A58D;
	Fri, 28 Mar 2025 13:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4SRp9az"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A9321B8F6
	for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168685; cv=none; b=rqloHT2jvTgj5/CeR23t43XlAiVntLIBYE6hdQzYnp4TEldsxQ2g7rZfBg4M1NoL22HFlxPK+YgDc8+VoY/cinBWtNu+A9ti0NiLkQDMmMjJQozJGDEa/AxK/WC3dJk05Om7vQ9WcIw1jv6ttTA3me8FX9PIS78Xpi78lNgWr20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168685; c=relaxed/simple;
	bh=OstHPLtut+rInIwPbWUGG5F4uJhc1s8p9YL3Yn+eQfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F4Qv5welejLxCgAsWlLNR5cKC5uiGYzV0Rq2x63+pUMmMF2Jzb6gbwHnRYkw8IJEEEoSy8MCTaH2x3jgmLZq/ws0GgjHAAxPFkORx934vWqeYIcfJybeHER2JUH8d2RwY+KUfMulxDKA4a+M509rFvhvwdUvmW7iBlHabUkIvYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i4SRp9az; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so3979938a12.2
        for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168669; x=1743773469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zOrAobgqux207RdFFKdVSyI3bSrdsl4WaNtosICsko=;
        b=i4SRp9azeCw6ildaDM+Jt1ptlEfcVSNAp2jBSKX+I1dZarZ08fJs3bxXIKf0hOgbWh
         ImmY3aB2kP0NihUk7KJdIVezaSIchjQKw9cWDpSuuwu8rCQmd3F3BfWSqKJXalorYhn+
         6WeWWXwAlhG7hYh/I2QQoioykshyYGWsfqO0Q4HxJTUuYow+pAh6xz62s9VR5oCZcFQy
         wJmAipyT4KmD8/rMys7Nx12AfQcOcpkzOtPaWwKPmhIx6ULE8OP0RBCRYMtMD7MgMlLB
         AYw/5IB+1oGEreWhGr4KV+WB6DG2GThA7wBLwI0Khscwqjp3SS0M//P161dMvQs/rlHA
         aj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168669; x=1743773469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zOrAobgqux207RdFFKdVSyI3bSrdsl4WaNtosICsko=;
        b=H+Y4UFv0BAnrv6i1kjqpX9BlXqox4L+6I1pJAM1w4qPCXiSdtuqflbyrU1WXJzbRe6
         0n3oQX4sXbzzaCL3qW1sSxu5zcf/XBJPSYF17jm0Gj8MBdP/vIIWO8xvPAJJxzeNXw47
         a//WAeyfW8zSr5WP1mzsneAsZcpq6qQJijo8Go8chWxCdBFrhMXHl8hk+ayDXpboz4Vp
         6Mi/rMAv9iaA4pCQuFnuQ0pF+4O64aAwDxF14/UBWD9wd9Lla9MNA8ZyqY/l/r13YxdM
         2HfQpD6zHr9ZPNcP1jG4SuO4KYUpjir4E6RpTp0XIjbQG6QDed7+3K88845s4dER+pBi
         /U0A==
X-Forwarded-Encrypted: i=1; AJvYcCWN73/QYs9ITUuVTn4KQAFcu+D9XwUNh3f6LbyzmwQWVTCo9auJutFSeLu6Fdv3+DTQH96GWn8XsZU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ppqUfiE1LSCEuhK2clFidZWqd0psEsRD2cVO1rNdFXFzH2P2
	h0C0w40zCzKId0O8rc1rUvtt/1YrCbIFCJLo7r1k2srv8RzMRdu0WpkGazoGkSw=
X-Gm-Gg: ASbGncvMfTHyNBbnknutVJh7vOuGpUNhdqQ0tRnSVSxFkfEAxfTd86PB7PrZLuIM+7E
	fJNgUTSawWQSIipqyqK7n00vHQfXe9BpjN1R+EDgP8wlo+UHKpsYLslmRPJ4zfuGJocZFZ+t3no
	7/mvkkUHR0MZ5garS41NjvSb5SYWvOw0CpoN+SoSCQnqGUEYttqiZGUbebpz9amUySTK5wGLHti
	aCA2yflY4xI7ekJTTwyKEknMj3p707j5aBFhGkn+hgECcCjaz75Oc0GZsLoQPxuv3rORCKOBBpL
	hYOp2hgQU/Z+CzvNbj2FkQCv1sO28B3G8/xBxa2YRQdUVkU/nCwI0y1cm0CzDxgA1hgp5GInhz3
	hNUCtqGqO8Lh6Su53CM2kxN81Dtnj
X-Google-Smtp-Source: AGHT+IGPOuJOhetnhPLDwYjmYCFkw94wWYnGaOGbWSLs66EXrE/s58NfpYkGGvWXaz4pE2WTKd2LXg==
X-Received: by 2002:a05:6402:40cc:b0:5ec:c7e4:b6ee with SMTP id 4fb4d7f45d1cf-5ed8ed2ff84mr7735639a12.27.1743168669063;
        Fri, 28 Mar 2025 06:31:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:14 +0000
Subject: [PATCH v2 28/32] rtc: s5m: fix a typo: peding -> pending
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-28-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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


