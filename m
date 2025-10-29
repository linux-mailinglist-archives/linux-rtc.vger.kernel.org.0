Return-Path: <linux-rtc+bounces-5216-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE93C1C886
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Oct 2025 18:43:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8E12188E822
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Oct 2025 17:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E556C23D7DC;
	Wed, 29 Oct 2025 17:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tKsH2VvP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F9B1531E8
	for <linux-rtc@vger.kernel.org>; Wed, 29 Oct 2025 17:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761759799; cv=none; b=N3a/o6H0msTL65We1PLF07Q+8rkjv9ilURj8dakL0/rqen/VjIQnqKqDcTlEwZZtIF0CxCq59u8HvW2RiHhtXbUfPJoR8TCB82gcbG3wLBpYx2Pi7ht2wbumAyPz+JjPtV1b4MjspVW3JF7/YVNGAGtTNZFRJmbrf7QTbgIv3HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761759799; c=relaxed/simple;
	bh=hOwZ1hwb5BjR1Sp70e6W1oH6pblkuA/yLI6KZE6rSbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pkKICldqyh4ydylUkVCTFtP83rzsDB1cx8rx8wwqEk01p63n0Qfoe3/PG7rHB3m3pRklCsH6lYbMe48YjGxS6fnNV4n59faOdyNpREiLdxxHXE8gO7OrPafEpiH5ZvgCOHem5QIuRt+tpejokCbQBIBCCNbbbgFzaju+2PrV1Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tKsH2VvP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41BB0C4CEF7;
	Wed, 29 Oct 2025 17:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761759799;
	bh=hOwZ1hwb5BjR1Sp70e6W1oH6pblkuA/yLI6KZE6rSbo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=tKsH2VvPiFW6m0D56nd3CV9cLN407X7LJprg3vqFtkax4bo5biHEcuQu8sMJoWx78
	 4R+HQ9rb89OtFDzW0jtbKiWro3xilpwAdATBgLPCE+rgS3wtBYXeSWu7RrEEvevaKS
	 7K6Pm2h49QxcQl+nJm9pws2vGiMqK5+hApRVIJJHQSX38j2f2O85ATmrIn2RqxQ8Bh
	 PsIFQntJTzK5CYhon5moOsHs7x4KutYqH9GoWbuKRn2Fv9IV8sUGq5PnzR/Uo9KXnd
	 y2RdXEcM/w0l3o3W1Z9OGgaRHRAvdJMDnQPR2bE8Mxs0x+h+/I8FYIkG+K6z3Jz2pl
	 bpfKOfZc3OtfA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE4ACCF9EB;
	Wed, 29 Oct 2025 17:43:19 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Wed, 29 Oct 2025 17:43:53 +0000
Subject: [PATCH] rtc: max31335: Fix ignored return value in set_alarm
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251029-max31335-handler-error-v1-1-da97ca96aa04@analog.com>
X-B4-Tracking: v=1; b=H4sIAFhSAmkC/x2MSQqAMAwAvyI5G7CpdfuKeCgaNeBGClIQ/27xO
 AwzDwRW4QBd9oDyLUHOI4HJMxhXfyyMMiUGKsiZglrcfbTGWofJThsrsuqpWDlPTTXWJTUtpPh
 SniX+43543w/2N+6kaAAAAA==
X-Change-ID: 20251029-max31335-handler-error-65a286c74289
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761759834; l=1078;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=1BKS2Ndg0HMhFDdXt1yUI/b5ADQ2RqQ+F4B12oS0kX8=;
 b=Eq+1R27nniIPn6SsUvGJdTY3x0m2RmXZy2+hmBFARrlpd+PcWUj0ULUcFTTbGZ2z9dYQX+iEJ
 od9AZ3zlClmD0li1Y/3En9CTaGl+OZOEoTxsvF03eP0YjCjZVRzWbeq
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

Return the result from regmap_update_bits() instead of ignoring it
and always returning 0.

Fixes: dedaf03b99d6 ("rtc: max31335: add driver support")
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/rtc/rtc-max31335.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-max31335.c b/drivers/rtc/rtc-max31335.c
index dfb5bad3a369..23b7bf16b4cd 100644
--- a/drivers/rtc/rtc-max31335.c
+++ b/drivers/rtc/rtc-max31335.c
@@ -391,10 +391,8 @@ static int max31335_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	if (ret)
 		return ret;
 
-	ret = regmap_update_bits(max31335->regmap, max31335->chip->int_status_reg,
-				 MAX31335_STATUS1_A1F, 0);
-
-	return 0;
+	return regmap_update_bits(max31335->regmap, max31335->chip->int_status_reg,
+				  MAX31335_STATUS1_A1F, 0);
 }
 
 static int max31335_alarm_irq_enable(struct device *dev, unsigned int enabled)

---
base-commit: 9db26d5855d0374d4652487bfb5aacf40821c469
change-id: 20251029-max31335-handler-error-65a286c74289
--

Thanks!
- Nuno Sá



