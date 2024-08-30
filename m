Return-Path: <linux-rtc+bounces-1810-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB153966276
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 15:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EDAE1F26F8B
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 13:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239BC1B5815;
	Fri, 30 Aug 2024 13:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cESEC9vG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F4B1B4C29
	for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 13:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022979; cv=none; b=Dw8FrJU/8dffRHcFcszYyJ8nzXG2aaQnY2lbi6YCeFhyhZHkjm8X/IzR5GsE/0Vr4KwL0uVS7qSuQinUUBK9bR2W1VsbntCED0NdUz9Y/SMvKOfy/9jp3Gpjybci3NNBaCXi4mF9HOvXBZtKneM+nJFd96ryFWu030wxLca8y38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022979; c=relaxed/simple;
	bh=d8WVePSthW+dxNncbWzycUowwJpITS4AMD6P6eg6HFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nq9vE0zesRb0iszmGo8PGGO9uwhBwNpiRj4L3QHb0fKBxdPGAwgf2boUY+XKsY7T6oEr48te1ciba53FNHEnp3oyTM+DA3VALbZw96o8FVzwKyL8+iaF3iq/OKmzajgdsfapeHZz2mJ4ZLX8GcdounPgdvsYeg45hcnpKiCpYQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cESEC9vG; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-374ba74e9b6so61877f8f.0
        for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 06:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725022976; x=1725627776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iop8qqO9jUR8G5l7F3wNru9rj99Z66kVWofgsuIec1s=;
        b=cESEC9vGQf1G6itm3a/lOG0+UjmBw0Nk1SegWTZQ7FTJf+/g+HKpiDnxAtQeWRfbUC
         CT9kjOIOG3BzZrAqqy3X0cwrdqsj51KWa+W0SgHTpbR+l8mCk1sOT6LwShlwGLI3zGnW
         vY83neW2T9V76ghaqUmte3jwKue9NW+f5LpE6Pp34tpWGe7WjfQnQNY6htOJfhxO11kB
         PL81/0s44UsRGg5zyXPtiRYAEti8CYMFYbofSrLqAKaLy/Gp8WZJs2eFgnXVrvLROulp
         Jszert7N+MEJ3TZZ6vMJStCSP/63uAU/f/TO2q62/PMmh/Vnf1FKTLMvB70f5Kiju0Qo
         u+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022976; x=1725627776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iop8qqO9jUR8G5l7F3wNru9rj99Z66kVWofgsuIec1s=;
        b=Ti2utYXpJUmSH/wHXvdShcIJ5TFtDuwz/aOCoXQ1xi+2bugZWk03mpp8whJowiXCFA
         Sl5Ig1L7Hv8LIz/lry2EAc8+f09wZNdXHtIgylWWeHrxWUEw61Mrd3ZQmiyT4FiTZH34
         g1uRIBVAbKeUAkypKoDlpNlvL4LCES6Px5zB+X/TWpluwgJdDSROP9fcedDR5tDM2ggy
         YStYspkZjORBASUoXtc/qPMajIdAZmYK9hKkGllN0lkJVsCyHRygI+W+WChebevZHPFa
         x+a4rRJU2KeSYOotBgLyhH3ZJ/MSmfrLI9/NOWbNrjd5lUKm+N9ApZVPyjbKTnuXkHJ2
         IWNw==
X-Forwarded-Encrypted: i=1; AJvYcCVTdSTWgZYpS0puSE/ZEFotjObwiXm7QLzIoWGdq6HJT4W93Ny2N+8M5V/ue0q+25GV4uhybIaeJ1g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7RcJOFeoh7z2Ab64xzAIxpsr521k09ZREJdYHErJQhRQm5L3p
	Zmv8UUDp3qD15owsHtJ0UE6JXw/QDEQLH1KwptDu8OiaRpbne2pRqG9DUbiBqwE=
X-Google-Smtp-Source: AGHT+IFISbcD0awVc8lknv+LxPpsY6H/AUOiGEDJsMkyVLmTSYhBZOirNNAhX9KU4dogrvwFZ9Xx1Q==
X-Received: by 2002:a5d:5351:0:b0:374:ba2b:4d1c with SMTP id ffacd0b85a97d-374ba2b4ea9mr332013f8f.31.1725022975647;
        Fri, 30 Aug 2024 06:02:55 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm80361785e9.47.2024.08.30.06.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:02:55 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 12/12] arm64: defconfig: Enable Renesas RTCA-3 flag
Date: Fri, 30 Aug 2024 16:02:18 +0300
Message-Id: <20240830130218.3377060-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable Renesas RTCA-3 flag for the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 465b70a06c33..40165e06c98f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1215,6 +1215,7 @@ CONFIG_RTC_DRV_IMX_SC=m
 CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
+CONFIG_RTC_DRV_RENESAS_RTCA3=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
-- 
2.39.2


