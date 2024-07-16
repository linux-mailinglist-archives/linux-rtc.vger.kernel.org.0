Return-Path: <linux-rtc+bounces-1519-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BE4932421
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 12:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12DCCB24342
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 10:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC51419A865;
	Tue, 16 Jul 2024 10:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BlLLwGcN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1B519A86B
	for <linux-rtc@vger.kernel.org>; Tue, 16 Jul 2024 10:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721125857; cv=none; b=StTxA+c0EJPDHLO7n96wely7xCuWFkGIDzjSOAKEeDPWfvAmO+LL1a6+W2fOw9/h7Bju4sttIS2z5LzgHsrJNk3KVuwaD/Aryk5NtGKJLtMLtg1SWQCR/NQn0sREKSzWNk+mlb2vQNKhY0f0RwpwK+i3zle57NT392cimZCW9Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721125857; c=relaxed/simple;
	bh=JipNE+kqEQPBn7Jx4UqjRRUM4WXbboTrnyw0mDx93KA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bnltxiJ2z11daXeTEA2EzcKiJ7ZxIBYRgdQoncaJ+CRy/e2qn5F5Cn7P2s4yADeI7m+b5yInriiEiPDuPDdvsq6KiovRKVT9xF0dglImAYLCx7FQI0pzU2YB7/GDZVXxwOjFxgYV2A4gRBNBHzpAonT8F764p42ZYMbOX+srlV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BlLLwGcN; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52ea952ce70so5629999e87.3
        for <linux-rtc@vger.kernel.org>; Tue, 16 Jul 2024 03:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721125854; x=1721730654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAXdKc5Z+02xSdGxMpcMXF7UJmX+WtkbTbyJ/hK50W0=;
        b=BlLLwGcN5mUmW7Fw/0UW6QIyETSGj7d8hXPmhMifppK3O4TM/M+3EpH4Y77Z91LIdG
         +QKUxlUrAU1YA41ly59IxsHMDk7eP90M+7f69/ecHBwsB6Aqz0N9jeGCcx139e7BY+vK
         CFV6zL3sUklGCCH2yqsmLI03eMQnthm68cm0vKDc8n5/X8yiQ017VilaZ84Ahuh/whCk
         lmuaCVmj3xW2dxeEBe4DZ1609eaQij4OkDnbuXC03PqtIfFpZunUDlG3AQaScWe0kAJp
         8XRUxU5xSZMA9SLEfRnf2g6fhQ/SDo3En9Vsftai6OcnphvLeGwg9TmRF77lQIiCphEY
         TtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721125854; x=1721730654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAXdKc5Z+02xSdGxMpcMXF7UJmX+WtkbTbyJ/hK50W0=;
        b=vfiZO0dOrK2dEBOxZjjbBozosu/zwWycXCiako+fCq0Tqlil1ITcFTYpofxRwcgepM
         pk8T20AAGZcpoLHE7fplqHmUljxkWG1PGDn7oougkfJDlDUdBFWPcJiMraKLvQOYYJcV
         Nlp5JjOA7W2LOnaWUsiSXOCYERDUjaJH37ugJX9uyHweDv+6/Vww1E22DVQ4/NUAio9r
         6dPS+6bUrZG07R7kL+t98BQMQOt7dgMX3LF8aMdFtEQ6ehguENCN3lD1rGaNyfrVDYOT
         juH4eNvld/ajQD01WblXAWlrxq1DrdYk0VdpNEFmBHW6ONv+DgavdhqOfRv1CUteW7e4
         5GJw==
X-Forwarded-Encrypted: i=1; AJvYcCU0aFCAysGnKzYyQ5Fg+JkP2YN5895l7i16mN42F41wxefHEvYDbIFMyx36fk45RbJdGfLafcHI9hj10vetDh2VfJN1Q9Pz2WJm
X-Gm-Message-State: AOJu0Yy4pVvQs9y/ys03iBJ49q5Lt/Aj460wFEBaR5Ze2pT9LFZNsa7z
	pko5ShTvnVXdE9cErzqmHrdgNyGFnqJrh9WxpMy7kwFRorsGzMTuYhqcyKnkqt8=
X-Google-Smtp-Source: AGHT+IFbkiHtNVlSjCVJf3cVxZfgoUXWPkU+uRJ0BzsW0f977HEVh4lCus0KUh+9d9jKXgqmMYtbgA==
X-Received: by 2002:a05:6512:3c8c:b0:52b:c025:859a with SMTP id 2adb3069b0e04-52edef1cc52mr1084908e87.2.1721125853907;
        Tue, 16 Jul 2024 03:30:53 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e77488sm121546145e9.9.2024.07.16.03.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 03:30:53 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 11/11] arm64: defconfig: Enable Renesas RTCA-3 flag
Date: Tue, 16 Jul 2024 13:30:25 +0300
Message-Id: <20240716103025.1198495-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v2:
- none

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f35fd006bbbc..e90578659447 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1213,6 +1213,7 @@ CONFIG_RTC_DRV_IMX_SC=m
 CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
+CONFIG_RTC_DRV_RENESAS_RTCA3=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
-- 
2.39.2


