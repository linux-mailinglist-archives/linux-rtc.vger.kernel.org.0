Return-Path: <linux-rtc+bounces-4646-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E09DFB1DEFC
	for <lists+linux-rtc@lfdr.de>; Thu,  7 Aug 2025 23:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AC897244A6
	for <lists+linux-rtc@lfdr.de>; Thu,  7 Aug 2025 21:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4EA24DD17;
	Thu,  7 Aug 2025 21:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uP00vviV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2A8256C87;
	Thu,  7 Aug 2025 21:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754603051; cv=none; b=meVLcXt9rmoCmjlc0xKZtAcrHYn8QU2bw6CoBNQt7PyxNLHEPPP/D5fydq7Dinr/byQiuUY5ilSB0UR9IGOZl9XuY1yVijzdwIY9FH7sbso0Tb9ot7R4qV/jS9fI60i4Z0dpFBoAWeQUfKe/25aZfw3RWquriVRAOHgY+OTAA4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754603051; c=relaxed/simple;
	bh=cervNNlF5gv9C3k/GLvN0Wsja0/9hrdczxGq23K2GVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bAuNi2baerY8V2t9xKDclgue/Or9oE9ntIrP7ao0CO9nLZCGAxx9EGACuBf3CJDM6TrrvIxO82Ikg4akI9DmNXTekRqkbLSOPJF1UOxooxCPJH2m835210SR1ElYynKVXBfOSkHTbatTmGjJuxL5ulfJgeuo8Mbna9fJbqiCdro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uP00vviV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCC6C4CEEB;
	Thu,  7 Aug 2025 21:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754603051;
	bh=cervNNlF5gv9C3k/GLvN0Wsja0/9hrdczxGq23K2GVE=;
	h=From:To:Cc:Subject:Date:From;
	b=uP00vviVWj2/p8y/O2GbEydgRapCaIGmYCNwwGBbjQnGTkg3E4mlxj7y5ECGFCjFP
	 PIaH5GQ9QzYKe0Fsxq/wQymnv2U2D7TDURg7txhuFo7z9DxaDh2/BfAbIU5RrbA9zw
	 +mFpJvR5Tboi2igKkkzBepXzzvNu9+vVkX4+ZsEYqvA+VWCgzT/OubHK0Q+P+SGi++
	 psXsihiDHMlUzpq55W4fy7msdU0II3TZF0sj1ZmCYpOQjwxNsM+uIdMTdAe23jdDj9
	 bFQPQibMpGoQPZwaLcR9OP4bg0C5KlIB7NzKKc/QQfWd5bN5wgL3CzBMtzMUUBKPTD
	 gLOatRzoj/BpA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: timer/rtc: Remove duplicate st,stih407-lpc bindings
Date: Thu,  7 Aug 2025 16:44:05 -0500
Message-ID: <20250807214406.4172668-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "st,stih407-lpc" binding is documented in 3 places as it can
function as a timer, watchdog, or RTC. As there's already a schema for
it in watchdogy/st,stih407-lpc.yaml, remove the other text bindings.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/rtc/rtc-st-lpc.txt    | 28 -------------------
 .../devicetree/bindings/timer/st,stih407-lpc  | 28 -------------------
 2 files changed, 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-st-lpc.txt
 delete mode 100644 Documentation/devicetree/bindings/timer/st,stih407-lpc

diff --git a/Documentation/devicetree/bindings/rtc/rtc-st-lpc.txt b/Documentation/devicetree/bindings/rtc/rtc-st-lpc.txt
deleted file mode 100644
index daf88265df32..000000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-st-lpc.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-STMicroelectronics Low Power Controller (LPC) - RTC
-===================================================
-
-LPC currently supports Watchdog OR Real Time Clock OR Clocksource
-functionality.
-
-[See: ../watchdog/st_lpc_wdt.txt for Watchdog options]
-[See: ../timer/st,stih407-lpc for Clocksource options]
-
-Required properties
-
-- compatible 	: Must be: "st,stih407-lpc"
-- reg		: LPC registers base address + size
-- interrupts    : LPC interrupt line number and associated flags
-- clocks	: Clock used by LPC device (See: ../clock/clock-bindings.txt)
-- st,lpc-mode	: The LPC can run either one of three modes:
-                  ST_LPC_MODE_RTC    [0]
-                  ST_LPC_MODE_WDT    [1]
-                  ST_LPC_MODE_CLKSRC [2]
-		 One (and only one) mode must be selected.
-
-Example:
-	lpc@fde05000 {
-		compatible	= "st,stih407-lpc";
-		reg		= <0xfde05000 0x1000>;
-		clocks 		= <&clk_s_d3_flexgen CLK_LPC_0>;
-		st,lpc-mode	= <ST_LPC_MODE_RTC>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/st,stih407-lpc b/Documentation/devicetree/bindings/timer/st,stih407-lpc
deleted file mode 100644
index 72acb487b856..000000000000
--- a/Documentation/devicetree/bindings/timer/st,stih407-lpc
+++ /dev/null
@@ -1,28 +0,0 @@
-STMicroelectronics Low Power Controller (LPC) - Clocksource
-===========================================================
-
-LPC currently supports Watchdog OR Real Time Clock OR Clocksource
-functionality.
-
-[See: ../watchdog/st_lpc_wdt.txt for Watchdog options]
-[See: ../rtc/rtc-st-lpc.txt for RTC options]
-
-Required properties
-
-- compatible   : Must be: "st,stih407-lpc"
-- reg          : LPC registers base address + size
-- interrupts   : LPC interrupt line number and associated flags
-- clocks       : Clock used by LPC device (See: ../clock/clock-bindings.txt)
-- st,lpc-mode  : The LPC can run either one of three modes:
-                  ST_LPC_MODE_RTC    [0]
-                  ST_LPC_MODE_WDT    [1]
-                  ST_LPC_MODE_CLKSRC [2]
-		 One (and only one) mode must be selected.
-
-Example:
-       lpc@fde05000 {
-               compatible      = "st,stih407-lpc";
-               reg             = <0xfde05000 0x1000>;
-               clocks          = <&clk_s_d3_flexgen CLK_LPC_0>;
-               st,lpc-mode     = <ST_LPC_MODE_CLKSRC>;
-       };
-- 
2.47.2


