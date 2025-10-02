Return-Path: <linux-rtc+bounces-5038-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5DFBB36D4
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Oct 2025 11:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB4A47B0EB1
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Oct 2025 09:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828BC2FFF97;
	Thu,  2 Oct 2025 09:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Id7XSuOy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E642D24B5
	for <linux-rtc@vger.kernel.org>; Thu,  2 Oct 2025 09:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759396709; cv=none; b=NcU9IGkIeml6hSbUw2uehYN2JBJWNeCCaK7gGgOKD6F+4vhj5e9narTe3Ob5r36d/yjIMtIH13TrYngvMBr0RhD2SXKopq0B+qjfhFLs/G2uYjPv6f+7xmnuwO62n8HwpdFFjLEkuZ9b+yiJU8JlI4lVJWFQDGn1q0KfAMFw4o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759396709; c=relaxed/simple;
	bh=9U35PDJp1zrgjJiWpV+8ufBKcQePZ3+RIEP1cmNj3rI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YQ7nET8A577W0xMpYRn7/+oX1lb/VLAB16txpqJKiN+QO+uzc3aMETOE9WF+3tZfMHomkVLa4V78VK6FKev4T1fRmeR0l1l51XH7KLF3klci6jzCmjuMGkpGLjvvXuLd7WKXHiWSIss6bgTF3ymnHzigEo6DqoaCiNmDkjU+1oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Id7XSuOy; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-36453927ffaso7589031fa.2
        for <linux-rtc@vger.kernel.org>; Thu, 02 Oct 2025 02:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759396706; x=1760001506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xz5/F4IItgfEhyo+NSCQ6fvJsiViiC5LvbwSU7cY27o=;
        b=Id7XSuOy8YWXOocR/QbgHtgXWUNjS/e6H5j5FQorjG+PxlsnJmHutTSxZ4Qx6t9d38
         yiac5VZgfumY5wckPzl2+MiWKbEG+Cpap/+gAt1GlbmY1wTltBvNgXIPVhe0nXYNnRo+
         GwM0Bak4dEakee/YoPPgGJ6Fd3//lQNwMKfh8zyLE9/7aUQe5vLcX2ZX4fsBvMLgfjxt
         r4uzQgs4WVrAOS9V3Z8w4piACEsSAkdE+iD213tNWyRvvVbLr4/sai2ndMgeQo5BC5RN
         Uql3eujrNNMYdrWlrD9yxMT4dY2X9zCqaEOOcoW6h4mtMiMD+l5Ryj9xPE9SsWxkVSEl
         AIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759396706; x=1760001506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xz5/F4IItgfEhyo+NSCQ6fvJsiViiC5LvbwSU7cY27o=;
        b=CkLihkZTR7bkl0jKUJAcraNB01Qe34xvHVK4JWc9DDWjWh4SUmudxI7+OuyNaIF5If
         uGJZEqq4A0u9ejLu26rkTjE5gIdJd4EU4wmyTz7eyES3/JQVsd5wWujlvaH5M+SbrO+7
         QMhZkv/ThMjkXYTkbGxSrcvPv+lOsTmUT7aXojp43DXBr6KZErNS98MYaDp9HrHeBvLQ
         CdE6MHlDueoCS0cJHWM5leJB9MSr/11tNkOB/Hn4ARBvom+L5ix1sgPiHGv3SaNLKnJe
         R4RM8YOQNzenVRIcz8KZ8LdqnvOblioo7y/FkeOUHpPBbqjVwCHLKX4U3kLJYNxyufMS
         0EZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDRn61EYOC1d3oxdzL2ifHNYrhIBb0rIRt9RfGfuUonA4ua3btVW0i6lfjA/YIP4bpkud28rhRcvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU0oyA18S+qubfBegYnnWq/9TLdk/3H4FBXUiymawfFmzPgTL6
	jCjf5XczdMQOkb3pPN1T93/5FNQ4dhg7EII1OM7F7ZY4Z6rylIu1XR86LbU/rdNMguo=
X-Gm-Gg: ASbGncul8ON7D3y4Z7GF0O7apqYSCMAsZ/Mo5n+oteDV4uLMUWt/Pg7d2FlTqnjmUzs
	xISi9i4vQlqF8RFJaCxIQb689dau1uK/HDlIm0vQa4u1cHEVkzcEllJHnWKu+cEF1gZKrQ1k+co
	0JAtjAC1A/L42mRKHwnkrZKIVlgu0D2VpSjG4s0dz8eYEHSDIwX3ACDRulS0zn6sgGVxjoYfrPh
	d8so1pLlW96k5S/2oZgZoh9y8epS1/fsLPlhxjPBldbI7+/Q5HT/3u/U+85nZcTfddGORxudGqd
	kt9hZx0NEBDEYXQSClNnLImSPvUi2IrujmF7Z1KYuec5wIPCqZ/ztcNQ0gCHaOvV3kwASAvHy2G
	L7BPWzWueoJHmNm454oYf/eFcswUuUKzKA18wLMLYCS7EtQfTsjryVIGAYadBCFjVZwD0gEE+rC
	E8b/fhXe4mNtWjBnlatcO80Jt5VTG7pS44N1C8QfHFKQwhcjbpJI8=
X-Google-Smtp-Source: AGHT+IEsEbkjF26VGfwy0fNXoRs8b/ceDtNpzv9IlF9R1X8BqwQs4C7h5k1eJzdW9Lq74h2nNU6fQg==
X-Received: by 2002:a05:651c:b06:b0:336:718f:75ac with SMTP id 38308e7fff4ca-373a7115d9fmr18501671fa.4.1759396705668;
        Thu, 02 Oct 2025 02:18:25 -0700 (PDT)
Received: from localhost.localdomain (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba4bbb7csm5255191fa.47.2025.10.02.02.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 02:18:25 -0700 (PDT)
From: Alexandr Sapozhnkiov <alsp705@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>,
	lvc-project@linuxtesting.org
Subject: [PATCH] rtc: fix error return in pm80x_rtc_read_alarm()
Date: Thu,  2 Oct 2025 12:18:20 +0300
Message-ID: <20251002091822.26-1-alsp705@gmail.com>
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
index f40cc06b0979..3651dc8436f0 100644
--- a/drivers/rtc/rtc-88pm80x.c
+++ b/drivers/rtc/rtc-88pm80x.c
@@ -153,7 +153,9 @@ static int pm80x_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 		(buf[1] << 8) | buf[0];
 	dev_dbg(info->dev, "%x-%x-%x-%x\n", buf[0], buf[1], buf[2], buf[3]);
 
-	regmap_raw_read(info->map, PM800_RTC_EXPIRE1_1, buf, 4);
+	ret = regmap_raw_read(info->map, PM800_RTC_EXPIRE1_1, buf, 4);
+	if (ret)
+		return ret;
 	data = ((unsigned long)buf[3] << 24) | (buf[2] << 16) |
 		(buf[1] << 8) | buf[0];
 	ticks = base + data;
-- 
2.43.0


