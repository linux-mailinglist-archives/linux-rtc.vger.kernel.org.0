Return-Path: <linux-rtc+bounces-2099-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E430A991B83
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Oct 2024 02:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BD4B1F21BA6
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Oct 2024 00:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7649442F;
	Sun,  6 Oct 2024 00:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="m6Gk5ffH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966E22582
	for <linux-rtc@vger.kernel.org>; Sun,  6 Oct 2024 00:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728173771; cv=none; b=L20SHxoQdcwDudHVgo1XjO05dmop0lYK0TLGv8lS+dftE3DNHOqt6FpIH8W4vnimHJrEH8w0bWN5jklU5BODVXBCPOtTFexXoCl2ejPIF1krhwS+1KEHt3dj+Cc3TCa8oM71bTJLwIYBeb17gsmrTb2+P8HwtwDU5xGQDsDXAJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728173771; c=relaxed/simple;
	bh=SNBxoV1rx6uFdlVgmTwwErdFQ5cAR0hkFCq8CC88gyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BrmMBMvPiQP8Hp0EM4eIsrUvDTL/Zfv7VFYblyRYY59OpCIUNM4OUu5YRCPR92Mkd3LQVGCMCwDrtrMJWVKS5ghriytDhwe5Jk5st15FLMkg1oumLqKbA82GL/ncVDuXtOziwYMqO9eajPowR+u8toXQMaUx7uTE7z+W86z7U2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=m6Gk5ffH; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20bb92346caso20804465ad.0
        for <linux-rtc@vger.kernel.org>; Sat, 05 Oct 2024 17:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1728173769; x=1728778569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ATYw0gTgPQjnSXPvhq4TIhUlRS9Y7ceSuAlHJE+uPHc=;
        b=m6Gk5ffHncL6K+7CCmjEXMlpiH9LU+95M16pnNatwGqiU3JIPzWoAhkKQszAI0SHeL
         01pJ3CBfxRe3BjegiNLk1RR/roZ/06eQfwdFS9QjO6A5iyjEA6hRj8EFXCCePYZkQNP5
         uv/ca0CEmoJc8tcgDr282d/8IHHW7dvOnEsq6EfnHDl+QxSDCx+a6HhHSnesr13rcfAA
         oKQUsvCjAWHkiyKsXlBKImC80OCbU4lYbKw1TxmgE4n3OtqI0YTpIRco0qBPIpeXSdap
         bcX9fnx0ejHFM9BA86YoZ//Aj/Gw9+Ji6GFIeGZURX8KIZX7frj3IE9LFygTa+cXEX0D
         KcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728173769; x=1728778569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ATYw0gTgPQjnSXPvhq4TIhUlRS9Y7ceSuAlHJE+uPHc=;
        b=fGndFgKAp6xrdCjhtv9DyAnN6rJxbbbzdNW5X3pln2oASL20zP6ha/bwskzFJe0jcZ
         Xp4rT/mtG7Sv91FhFjqn62Lbw7dTIT5nfzFQWjItHLSPqk/ECW+rpgAYkM7/I2Ncn0Z9
         ViB030dl/L2Qs1T42kCZL/TQYvUWDWMr2CDbxqdsWVtzog2P7QnD8dRPqM7hsKZlkrsC
         41en4NY2C872O3zrBpk1DIuuYiikszzn6+mc1323zB9XlvkoIrADtwYqqO+oZNk8DpiN
         WsYqQM1V5kq1EsChgcr8yeod9EVy5f8dLouWJpCN8oNzVuwJSKk9S/Qv/BOsJ89WxqHW
         dUiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1qG6rV6eJChGfokoBKvk4f3LS3jgy/NsnH7zVgfCjJ/wr8zZTfJDcaN1/q5OgX8i2x9/tqyByLFI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2m0UKHDD0/SECMYx0C5/GyX7/RZFBaHoUlFDVzHGijX39cq8y
	r8oQvbrGisMmAf3voLG+CyR+L3Xj6I+5370fhqnGu6lXte1hGC95FysDZYtFxE5xVpZNg8pxgA=
	=
X-Google-Smtp-Source: AGHT+IGGWRUojFmci0UIq/ow6y0T5+wd0QojcdIZhftIf4PjECAcDzsFAmXC8zdXQtzaDdHFCmkqcA==
X-Received: by 2002:a17:902:e751:b0:20b:5e34:1842 with SMTP id d9443c01a7336-20bff5517a5mr114758455ad.25.1728173768654;
        Sat, 05 Oct 2024 17:16:08 -0700 (PDT)
Received: from localhost ([2405:6581:5360:1800:5ccd:eb23:b5da:b9df])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cec92sm18231435ad.101.2024.10.05.17.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 17:16:08 -0700 (PDT)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] rtc: rtc-mc146818-lib: Use is_leap_year instead of calculate leap years
Date: Sun,  6 Oct 2024 09:15:53 +0900
Message-ID: <20241006001553.7430-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The is_leap_year() for determining leap year is provided in rtc lib.
This uses is_leap_year() instead of its own leap year determination
routine.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-mc146818-lib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
index 651bf3c279c74..ce4d68de05831 100644
--- a/drivers/rtc/rtc-mc146818-lib.c
+++ b/drivers/rtc/rtc-mc146818-lib.c
@@ -232,8 +232,7 @@ int mc146818_set_time(struct rtc_time *time)
 
 #ifdef CONFIG_MACH_DECSTATION
 	real_yrs = yrs;
-	leap_yr = ((!((yrs + 1900) % 4) && ((yrs + 1900) % 100)) ||
-			!((yrs + 1900) % 400));
+	leap_yr = is_leap_year(yrs + 1900);
 	yrs = 72;
 
 	/*
-- 
2.45.2


