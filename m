Return-Path: <linux-rtc+bounces-5037-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EF1BB36CB
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Oct 2025 11:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50D881920FD9
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Oct 2025 09:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF4F2FF641;
	Thu,  2 Oct 2025 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2xFFwXK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420B52D24B5
	for <linux-rtc@vger.kernel.org>; Thu,  2 Oct 2025 09:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759396701; cv=none; b=J6Tqvd8df+sQ2WaRlLtft2FkPFdsYw8OviVwDcE7uJxau+cCB8wmPD0Gv/JVRZJWkmX8Z+sZactEH9Nja8aNDOxpqqOxEuRJS6C/kY95susSKkOtF/SzG2WYbsFy9Q4CpQU3I+QXiTLyfDhadqtqOhcLIFXukEjAsW2UK/Lh1KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759396701; c=relaxed/simple;
	bh=fwR4gcFZHEySQdpc2QlbEaLFRlsqeReMKUqp/CWmTrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RpNwFpB00qMqTkftAioXPRyCSZKvnPwoqOCtih0c59+nvkzs4JN/K6qKszOyyAIYS6FtzbaGOIMs/o4ipItn9VqsRTRvdXZK33znsS2GkNWsYo4y5014DRX3fDn5eypuf/hlCnZwzLolhMG+u4+ym8gEnhYKHy1i6OflJG9lku4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2xFFwXK; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57ea78e0618so891459e87.0
        for <linux-rtc@vger.kernel.org>; Thu, 02 Oct 2025 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759396698; x=1760001498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q9NSRzfL4JdrQq47LWXvgJfS/TUzqrHF9LSvRcz8FpI=;
        b=b2xFFwXKsTZfuInKIT/QqU+bydAeafjsc+em8vT2KTxB2nDx0Nit8KKvHi8rrucK+r
         +Bc7hxNabgYF1qZ2Vp8AB+wTreEu+/tVFoDMYqy4uQIRkFiUeZJm/DTub2gqUoOmOWkq
         aspXRMoaXoM1csi86PtrzTCyqB1Gh8mx6OXU24NsgOF2nSWoDbYuSOTqvsVH4QO6MA7v
         rxfBUdveBWBjdPwmc1qpPnVFKHr/VAqEw9SkFYpJBPU+Tyrog8jJb5vAq17IwYLwonvQ
         S9hUGkZaBPsw2QydaFpPxrfkKvTP1WNn5E99/onJqkBR9XKnQldw1fj8kqpCyg82RzXJ
         rq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759396698; x=1760001498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9NSRzfL4JdrQq47LWXvgJfS/TUzqrHF9LSvRcz8FpI=;
        b=Abuq0l5T3EooyYlAfnd1eYpaRKLZVTV5ndKPrFpO0P8Hc+hnJfdhb6rLQWpSgojqZn
         X1toNuMDBf13SoZLAOyhgBvPFet5DT/YAr8PiorejoT2yP2m07EUE9h0x5BSRWmqIo9z
         7/6hwJz9+1O7CB4ljhPLujYgU9ZTwLGvkHFhzjmlahiXTdvUbFGCGfyq7JIwvImNf/rG
         /6ev5zfgIAIB51vIcY01iZOAF+zClnTHTzxe/Scf4jvolHaozi6WXrXty+H4fsB2O/Xy
         yTym3lNq6C+GiR1hjj2QewU/mOi5bRaD3iMj/D0o7U8Y8ns1i49roFqxcx2j02gwyBO6
         Gs3w==
X-Forwarded-Encrypted: i=1; AJvYcCVC3BbOchPhByUsCQIqZA4ysjYV7h3s8EKyR0mmQtOg7Qkuhn5zR9+23dFX/E6CivUlaUPiXJwu4EQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYS6TDIy4TLA59Eib1624F6cW63DM4qAYQC2PiqYBC0PDoe28Y
	2u0q7hJR8tzhdwdCbsh5OdrV6IhFUazaWNL84TWphqP0XLX8YIGYhz77MC+ZxiqPJm0=
X-Gm-Gg: ASbGncuRLQlajS1T/VlpFi2Y+XNqCUXjqPpuVQQaoaqm3WH+5LLXZC61msc1df7XHyv
	u4ee34zqN8HsiXvEfJrAukSpoKI5AEbV9bwUdKX2STXl5HRfIMBewxllUWZY7cdisMEKoaNugwy
	70eB9/wzlY8Di24W5BjAHLJSud5kxoCxYJqZItEPIXjXL3yH+Yw9eLH2h+4nYbWqB90yqnPdnZ1
	aS9yD5vicSPj6RvsPQOnOjH1Spgz98Z026+8/b2VXoqdn3vsUMQ00UjeagTz+7eiJYXSflAQHs3
	04ZwaJTwgmS7ZtaYV0F38r1JpVzmT+2vOFTrEMI1VmjyIsXAru/OZeWf35zBK5+9RprBbf11Gg4
	WYN/MZ+oNsKJAmwrCTZBY1937spnFsrUAKoD4S370cvXpd3ih1grF+penzeOvU4lW0Atwkv0fGd
	ew46YHwa7qnwWPk1tf8UOFmqhRxhsDINhnus9tQVQF
X-Google-Smtp-Source: AGHT+IEdX+6suUdGlkRNJI4CNMgiicWrGVGzkTvMWFFHsr6NunDdGKG/io4TUM6huaaCOQXxmkCBkw==
X-Received: by 2002:a05:6512:138d:b0:579:f4b3:bc3c with SMTP id 2adb3069b0e04-58af9f8608amr1960758e87.55.1759396698025;
        Thu, 02 Oct 2025 02:18:18 -0700 (PDT)
Received: from localhost.localdomain (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011af75dsm657471e87.126.2025.10.02.02.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 02:18:17 -0700 (PDT)
From: Alexandr Sapozhnkiov <alsp705@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>,
	lvc-project@linuxtesting.org
Subject: [PATCH] rtc: fix error return in pm80x_rtc_read_alarm()
Date: Thu,  2 Oct 2025 12:18:13 +0300
Message-ID: <20251002091815.11-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexandr Sapozhnikov <alsp705@gmail.com>

The regmap_raw_read() function may return an error.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
---
 drivers/rtc/rtc-88pm80x.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-88pm80x.c b/drivers/rtc/rtc-88pm80x.c
index f40cc06b0979..44d324c3101c 100644
--- a/drivers/rtc/rtc-88pm80x.c
+++ b/drivers/rtc/rtc-88pm80x.c
@@ -148,7 +148,9 @@ static int pm80x_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	unsigned long ticks, base, data;
 	int ret;
 
-	regmap_raw_read(info->map, PM800_RTC_EXPIRE2_1, buf, 4);
+	ret = regmap_raw_read(info->map, PM800_RTC_EXPIRE2_1, buf, 4);
+	if (ret)
+		return ret;
 	base = ((unsigned long)buf[3] << 24) | (buf[2] << 16) |
 		(buf[1] << 8) | buf[0];
 	dev_dbg(info->dev, "%x-%x-%x-%x\n", buf[0], buf[1], buf[2], buf[3]);
-- 
2.43.0


