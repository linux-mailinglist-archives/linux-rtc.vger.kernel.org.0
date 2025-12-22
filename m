Return-Path: <linux-rtc+bounces-5600-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A36BCD4AC1
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Dec 2025 04:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE64130062EB
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Dec 2025 03:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72509326935;
	Mon, 22 Dec 2025 03:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcHeJWgH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC95E2FFFB7
	for <linux-rtc@vger.kernel.org>; Mon, 22 Dec 2025 03:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766375836; cv=none; b=srFFQrgE3mhrL4KLV4n9CZNBzBnozmIv2/oF4I8cAztVVzI8XmBb5MzR/kU1L9q3KCVIEtp3gnEExqYMjy2G6linFnLnCteSUR/OsjCr4ZDMXSBGxfzL+VMWgR6MPrNEh3zF0foC8P3a4CtknNd61MdQVQhfqLgaFscHCZa3Adg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766375836; c=relaxed/simple;
	bh=BvVajLp1vUvXpZFR+I7tRHBL1m6EdtzuKWN2bHn2q7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jc4gE5n7QKVlx/1qSUsxuT4pBxyeztwI8xBuSITwNXHdPIHTG91anIwW1VDoyEuq1+lHMIDAKMxdPhVw9WyoJK4+CXNPNVNEOnzb3W5eQycFW7H0KHd09aetYj8AogQTggkjrRodsrnJ2hgeO3fLSKNKqx5TA+9hQy+zBXu7ynw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcHeJWgH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477563e28a3so22144835e9.1
        for <linux-rtc@vger.kernel.org>; Sun, 21 Dec 2025 19:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766375832; x=1766980632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=POVz2j0cbg6XGxLUTiSFT4ESlAnY5GZTQTAeqNVRf3Y=;
        b=TcHeJWgHVc0iMgqqyF0XyCNqPzOIJoZlTMzMsMWWLyYEjqRH/KiT4gp0f6PoRarVK3
         AhOCDzLTteTd5Q6OiedCPhm3TkcrgqPPA4H8qGfdNSCTxRU2keozutKtlAg0avdOe9QA
         Iz2NqhvmvVvBwY4h7c2KXp200TQOjsZloMpDlrHCEjijkZNv3dRq+gt9oMNgkd+5zM0g
         y7Ne3DrW1IZuCWv0AzsTUCG9rC1vMIMe5n6QYqnCTiQk/co3ZIb5ZA+v8134jVnNB0zb
         pUk8/vrg3d61dJY6yEUDX2Q2yFKfdadwEK92s35VfqOpvY09hzBcIL1cZBM/x17drQlp
         6Cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766375832; x=1766980632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POVz2j0cbg6XGxLUTiSFT4ESlAnY5GZTQTAeqNVRf3Y=;
        b=WcFlXp9vVqzCGe1EjTIPm3gmmXew1eKQjTxdIfUfvN4UGwY8S29rJwTLFF+8/FTF4X
         0T0NpkANaI/f1GNp0/M1PAwk3UUPPppOzTGzbF3MaJyAN4+65gHDGdQG2QXT4DFMLhj1
         oCeEQtgsBOQylMf83hAqambMC615L9ULsn5UcKs+Cyk8ndU11sppgBaaXDAo1mhmhhmd
         hpK4pRi58JRjna/lKahnVZrjsaiQAm3wSe4MwQIVjCAnciJXOk7srUTiE1nfNvQdbvVL
         0lkC69Gz7+l7WXM7XNKnFB9iFOhPa73HhGNrmCkRKD/n4nv80K8EhvCvebfSVc/TbPs0
         mz7g==
X-Forwarded-Encrypted: i=1; AJvYcCW5rYzm45W8fycJy7Hh3e9WF3PPV9cMKqRJxNzl4XviHLXi/HSOJ3uJzrPxrkp+K5XWLWrWIYjqWqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJraSrAcjEVl1s5J/8yXsj7gvNrbtHFSeDnJtwt2RppPUdRhAU
	aK/oIrDw6JDVbmvEPyqqMgmBpgW0+GsfC3o6bp2Oz8yFv/SQMqS/NYVC
X-Gm-Gg: AY/fxX4uFTUkoUf6NxZCchGLk3Q/qrd7mTB25T4vvTSpV9bDtzhAFfhXyHKr41av/89
	dkmEz8/hXpm9WGxSHP/fuMmaI06YyWIVR4H06sNM2+X8g3fodpECbnzt/d/6AX+XFnMN1j5gTSD
	cnp4xZAfuV5MiiEuhR6pJ0IY+dOAA9pDA5we9lxq3gYk3Eo1hhC8NUSlWcKA1f8rVa7PHxQw2EY
	N2QAzE4Osqb1mc452JKagSBkWyK+OkKX6b+YO1Cikjn3CKja4pk/6l1iT76UeQQG/NdmXZoIdgK
	zrWuIMXRlr+GHqyknbGl4z54NDuj51OarcVrrXvHZF/yybyxguczBFuH9PxeJJeCJEgHWaIL1zR
	gXXwTAOyxsOb1ZC4sBRmDpoJfklhA029dg8E2hIUrN4FVVMTwLD+G8njVczLa0rAZNtvCYZaSkV
	KoNVH7jf02WDze52MNsEytjyoYitIeBjwJEEoT4XKJbWn4G57qWLy/RCYtnZw/Bp8eQLt1WU3pc
	tMOTHRcGEStcKNVb6N7sg4R4o6wwV8g/kGhiIVKtNPqnHWLvr42rfeffH+9c3kiY58B/QDLWuRQ
	/Ek48nFY82GqLTcBPh0=
X-Google-Smtp-Source: AGHT+IE7ko0ygEMyIcM1Wh7JNh26YiuOuGeHMGQPgUYUsjTSE697CX1T1j7cEmKQoqskY/OQp3mw4A==
X-Received: by 2002:a05:600c:22d4:b0:477:a2f7:74de with SMTP id 5b1f17b1804b1-47be29990e3mr111391915e9.3.1766375831762;
        Sun, 21 Dec 2025 19:57:11 -0800 (PST)
Received: from cypher.home.roving-it.com (82-132-221-81.dab.02.net. [82.132.221.81])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be3a4651bsm87474075e9.7.2025.12.21.19.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 19:57:11 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>,
	Shubhi Garg <shgarg@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] rtc: nvvrs: Add ARCH_TEGRA to the NV VRS RTC driver
Date: Mon, 22 Dec 2025 03:56:48 +0000
Message-ID: <20251222035651.433603-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NV VRS RTC driver currently is only supported on the
Tegra platform so add a dep for ARCH_TEGRA and compile test
so it doesn't show up universally across all arches/platforms.

Fixes: 9d6d6b06933c8 ("rtc: nvvrs: add NVIDIA VRS RTC device driver")
Cc: Shubhi Garg <shgarg@nvidia.com>
Cc: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/rtc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 50dc779f7f983..50ba48609d74e 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -418,6 +418,7 @@ config RTC_DRV_SPACEMIT_P1
 
 config RTC_DRV_NVIDIA_VRS10
 	tristate "NVIDIA VRS10 RTC device"
+	depends on ARCH_TEGRA || COMPILE_TEST
 	help
 	  If you say yes here you will get support for the battery backed RTC device
 	  of NVIDIA VRS (Voltage Regulator Specification). The RTC is connected via
-- 
2.52.0


