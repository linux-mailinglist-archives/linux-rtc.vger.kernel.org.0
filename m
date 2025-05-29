Return-Path: <linux-rtc+bounces-4202-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E62AAC8340
	for <lists+linux-rtc@lfdr.de>; Thu, 29 May 2025 22:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0895F4E1125
	for <lists+linux-rtc@lfdr.de>; Thu, 29 May 2025 20:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C335228E5F0;
	Thu, 29 May 2025 20:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="jwc4lhal"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174AB218AB3;
	Thu, 29 May 2025 20:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748550575; cv=none; b=U5T2Kj0plLstiMlY0vqQy1WYsBQx8w+uf5jYVEA6IqRhUEqhHEZSvYkzBulO2p0uvupwaoptodchAc/j/l+bB0lg+/8gnyUZSzPbpOwLKXzYtyf0+Uo0ep9p/9bO09vrErbkcvJq1tAFsdE0kzXavr9PzRRn6udb2unz228P8YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748550575; c=relaxed/simple;
	bh=rAjeOMdG5cObUVQQ8/MeFIE1ckwj7tXKoE6KJ1ho04I=;
	h=From:To:Cc:Date:Message-Id:MIME-Version:Subject; b=GlmcTEoAaCH0DuzJASWKvBfa7ODsjIAwYFq0v7GhzZY9K+uV2GUBXGwzxy+zQg135+wW6o8GMaq/oFwLQd8+iSjolFq2pVVHPyvqbuK4bhWtrc+Y01w+twyf1ETiF7yrIegyu6mCXqBtvkMTPqDpC0cBzQHtT8+h0G1KcKQNexc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=jwc4lhal; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=cGpOZ37oUywAFbdjZoqBpZeSJcqvhzQfs0Mw1L7sNtY=; b=jwc4lhalKA1PucheGSK6IdvnH9
	BO0fCmGjazfCtxLwSLiaMAr5uE9lFzdNBerD/UV66J0zyG9hxrgSixLjan9YyWWQajQQpvZ8Vq9iX
	7GXtlIH/6Hsiy4IC+M5wKX4ePjFtuUtsTjwB0xWq1BZB+B6fbYKyrDNzunZSHcJcv8rE=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:43532 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uKjsY-0004fF-5V; Thu, 29 May 2025 16:29:30 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Cc: hugo@hugovil.com,
	stable@vger.kernel.org,
	Elena Popa <elena.popa@nxp.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Thu, 29 May 2025 16:29:22 -0400
Message-Id: <20250529202923.1552560-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] rtc: pcf2127: add missing semicolon after statement
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Replace comma with semicolon at the end of the statement when setting
config.max_register.

Fixes: fd28ceb4603f ("rtc: pcf2127: add variant-specific configuration structure")
Cc: stable@vger.kernel.org
Cc: Elena Popa <elena.popa@nxp.com>
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 drivers/rtc/rtc-pcf2127.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 31c7dca8f469..2bfebe3eba0c 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -1538,7 +1538,7 @@ static int pcf2127_spi_probe(struct spi_device *spi)
 		variant = &pcf21xx_cfg[type];
 	}
 
-	config.max_register = variant->max_register,
+	config.max_register = variant->max_register;
 
 	regmap = devm_regmap_init_spi(spi, &config);
 	if (IS_ERR(regmap)) {

base-commit: c7622a4e44d9d008e0e5edcc46c71854c50cf4a8
-- 
2.39.5


