Return-Path: <linux-rtc+bounces-5164-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 358D6C0AB42
	for <lists+linux-rtc@lfdr.de>; Sun, 26 Oct 2025 15:51:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 346D23B3100
	for <lists+linux-rtc@lfdr.de>; Sun, 26 Oct 2025 14:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2182E8E05;
	Sun, 26 Oct 2025 14:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VnZgauy4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D294026ED43;
	Sun, 26 Oct 2025 14:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761490245; cv=none; b=K4mLlOAAtXkEa1aMO39FYmL2aVRMkEZUiXUtPm/cPlQBHBJWlNO4V75OaUPrV55KQ/f3GIN3VpLfE2ZR+ldDy6NfJbmg0CWRlI/6GrtjDYxPijfm3TCk6Pe4lTnu4vlFZjbgtCGwQthDUaNH5sa0lAhQhZATqELrxqMLeGig9w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761490245; c=relaxed/simple;
	bh=6EL4BIkIFXb8V8v4goekeU7ZK5PKoghbsgccWKboCRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wl00p4Fj0mSs/RV3hRYdE0JnfA00CtvHx59AQmjuv1Noqv94Vq6kvcNBGsl4BnSkFpJ3MzGoh4jzIvzF5Bsi8kEYEXN3VMHmgJskQ6tB2JZT+C9PbZfW9HsCaZ3sSAcspW9zYQrCugWEaYq6q837J78Ca/6RRNLMR8PvEdwiCUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VnZgauy4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5E3C4CEE7;
	Sun, 26 Oct 2025 14:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761490245;
	bh=6EL4BIkIFXb8V8v4goekeU7ZK5PKoghbsgccWKboCRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VnZgauy4u+PMWPcwiZ1wROjX0y8mpjcuf5XilT6lGvWYlRR25+SLYrdluscpM9so6
	 8rdz32W/LyyePAKU3kel4xGBjm/mC0dEi768yiei+X4yHAK4e8mENObB3Svnxkkiw5
	 1OCggcTbXMFFqA0uOVEjHQLviliZogVeQoflxdBp+y3OlsfdkPb/zBipoBHg/b8Yd1
	 exZkm8rvRQ+0cWm0n8yI/WO42lKjmpn8kwke29Y8VKkbgQ5OHwfb+rStUll554an4P
	 Tzd6S8lbdRYkAIJ3s4b2tpdAL1wF/awzXGfocXDjFnKIw9ZapkfCVDFJZqeyXMUqH2
	 /Wbd7DnjCPlJg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Josua Mayer <josua@solid-run.com>,
	Bruno Thomsen <bruno.thomsen@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.15] rtc: pcf2127: clear minute/second interrupt
Date: Sun, 26 Oct 2025 10:48:58 -0400
Message-ID: <20251026144958.26750-20-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026144958.26750-1-sashal@kernel.org>
References: <20251026144958.26750-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Josua Mayer <josua@solid-run.com>

[ Upstream commit a6f1a4f05970664004a9370459c6799c1b2f2dcf ]

PCF2127 can generate interrupt every full second or minute configured
from control and status register 1, bits MI (1) and SI (0).

On interrupt control register 2 bit MSF (7) is set and must be cleared
to continue normal operation.

While the driver never enables this interrupt on its own, users or
firmware may do so - e.g. as an easy way to test the interrupt.

Add preprocessor definition for MSF bit and include it in the irq
bitmask to ensure minute and second interrupts are cleared when fired.

This fixes an issue where the rtc enters a test mode and becomes
unresponsive after a second interrupt has fired and is not cleared in
time. In this state register writes to control registers have no
effect and the interrupt line is kept asserted [1]:

[1] userspace commands to put rtc into unresponsive state:
$ i2cget -f -y 2 0x51 0x00
0x04
$ i2cset -f -y 2 0x51 0x00 0x05 # set bit 0 SI
$ i2cget -f -y 2 0x51 0x00
0x84 # bit 8 EXT_TEST set
$ i2cset -f -y 2 0x51 0x00 0x05 # try overwrite control register
$ i2cget -f -y 2 0x51 0x00
0x84 # no change

Signed-off-by: Josua Mayer <josua@solid-run.com>
Reviewed-by: Bruno Thomsen <bruno.thomsen@gmail.com>
Link: https://lore.kernel.org/r/20250825-rtc-irq-v1-1-0133319406a7@solid-run.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES
Clearing the PCF2127 minute/second status flag in the IRQ handler
prevents the controller from locking into EXT_TEST mode when firmware or
userspace enable MI/SI for basic interrupt testing. The patch simply
defines the missing MSF bit and adds it to the mask we already use when
acknowledging CTRL2 status flags, so the interrupt line is released and
register writes start working again.

- `drivers/rtc/rtc-pcf2127.c:45` now names `PCF2127_BIT_CTRL2_MSF`, the
  documented status bit that latches when MI/SI fire; before this change
  the driver never referenced it and therefore never cleared it.
- Including the new bit in `PCF2127_CTRL2_IRQ_MASK` (`drivers/rtc/rtc-
  pcf2127.c:97-101`) ensures the IRQ acknowledge path clears MSF
  alongside AF/WDTF/TSF2. With the old mask, once the second interrupt
  hit the device stayed in test mode and ignored control-register
  writes, exactly as reproduced in the commit message.
- The actual clearing happens in the existing handler (`drivers/rtc/rtc-
  pcf2127.c:792-794`), so no new logic is introduced—only the correct
  bit is now masked off. PCF2131 handling remains untouched, so the
  change is tightly scoped to the affected variants.
- This is a real user-visible hang (persistent interrupt line, inability
  to reconfigure the RTC) triggered by a plausible configuration, while
  the fix is minimal and mirrors how the PCF2123 driver already clears
  its MSF flag (`drivers/rtc/rtc-pcf2123.c:70-78`), keeping regression
  risk low.

Given the clear failure mode and the tiny, well-contained fix, this is
an excellent candidate for stable backporting.

 drivers/rtc/rtc-pcf2127.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 2e1ac0c42e932..3ba1de30e89c2 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -42,6 +42,7 @@
 #define PCF2127_BIT_CTRL2_AF			BIT(4)
 #define PCF2127_BIT_CTRL2_TSF2			BIT(5)
 #define PCF2127_BIT_CTRL2_WDTF			BIT(6)
+#define PCF2127_BIT_CTRL2_MSF			BIT(7)
 /* Control register 3 */
 #define PCF2127_REG_CTRL3		0x02
 #define PCF2127_BIT_CTRL3_BLIE			BIT(0)
@@ -96,7 +97,8 @@
 #define PCF2127_CTRL2_IRQ_MASK ( \
 		PCF2127_BIT_CTRL2_AF | \
 		PCF2127_BIT_CTRL2_WDTF | \
-		PCF2127_BIT_CTRL2_TSF2)
+		PCF2127_BIT_CTRL2_TSF2 | \
+		PCF2127_BIT_CTRL2_MSF)
 
 #define PCF2127_MAX_TS_SUPPORTED	4
 
-- 
2.51.0


