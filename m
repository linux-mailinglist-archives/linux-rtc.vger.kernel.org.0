Return-Path: <linux-rtc+bounces-5008-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E94B92E00
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Sep 2025 21:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEA151906D30
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Sep 2025 19:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C686927FB2D;
	Mon, 22 Sep 2025 19:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aaTux2sE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC0225F780;
	Mon, 22 Sep 2025 19:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758569777; cv=none; b=Yofv/RC8qnZT0GnBI0YIXNQfomukvRggdE3jWHUpROerkpWOyiV6M9TVs881L3YbK/AUZUxMwQa3lCv+lS/TI5nqxHbwyzZ8Vm8UJvq8zvXn7Tg27neqXU4e5jb2/LdrHm8Q4qej3da927jiimqRtShH9Kek3g5zUSRyC9X9KsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758569777; c=relaxed/simple;
	bh=/d0WtFypLkBlpphRnMqS1gnElWSINaCGF5SNfO7P9qE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRvdIgxdw1o9gqVsb/e0jnuAe9v7sQnBYikdWzQt2U0ydO6jvuh1vyLhzp21Xwe65sxfriAG51vlmgW8CQi8pl5oRvs8QpW94FDeL0xCQRk0PFZHwoqGgV8StAUOqVtJC4cyDG+8nxIQYJ24Jvn7arR9CDlJE/vu6m6R+WIKOJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aaTux2sE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F01C4CEF5;
	Mon, 22 Sep 2025 19:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758569777;
	bh=/d0WtFypLkBlpphRnMqS1gnElWSINaCGF5SNfO7P9qE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aaTux2sEDKAgqBt+VJtv0jvf3k8Bn3M3UnCI5Wsq7WUuE5IVk5fNh15rzVRLc85DH
	 Nq3hsf1RlmuwpSLxoAPpzwEWYFZwTD6zdJJeoPcOTQ0sRXMmqUeWXpUKCG7ReFsn2E
	 HHk+Dqw+ulmOsX7X/lCxmJLF0N7Vt6ooSmv7Oq6I=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org,
	linux-rtc@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Elena Popa <elena.popa@nxp.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH 6.6 65/70] rtc: pcf2127: fix SPI command byte for PCF2131 backport
Date: Mon, 22 Sep 2025 21:30:05 +0200
Message-ID: <20250922192406.350816259@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922192404.455120315@linuxfoundation.org>
References: <20250922192404.455120315@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

6.6-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Bruno Thomsen <bruno.thomsen@gmail.com>

When commit fa78e9b606a472495ef5b6b3d8b45c37f7727f9d upstream was
backported to LTS branches linux-6.12.y and linux-6.6.y, the SPI regmap
config fix got applied to the I2C regmap config. Most likely due to a new
RTC get/set parm feature introduced in 6.14 causing regmap config sections
in the buttom of the driver to move. LTS branch linux-6.1.y and earlier
does not have PCF2131 device support.

Issue can be seen in buttom of this diff in stable/linux.git tree:
git diff master..linux-6.12.y -- drivers/rtc/rtc-pcf2127.c

Fixes: ee61aec8529e ("rtc: pcf2127: fix SPI command byte for PCF2131")
Fixes: 5cdd1f73401d ("rtc: pcf2127: fix SPI command byte for PCF2131")
Cc: stable@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Elena Popa <elena.popa@nxp.com>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/rtc/rtc-pcf2127.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -1383,11 +1383,6 @@ static int pcf2127_i2c_probe(struct i2c_
 		variant = &pcf21xx_cfg[type];
 	}
 
-	if (variant->type == PCF2131) {
-		config.read_flag_mask = 0x0;
-		config.write_flag_mask = 0x0;
-	}
-
 	config.max_register = variant->max_register,
 
 	regmap = devm_regmap_init(&client->dev, &pcf2127_i2c_regmap,
@@ -1461,6 +1456,11 @@ static int pcf2127_spi_probe(struct spi_
 		variant = &pcf21xx_cfg[type];
 	}
 
+	if (variant->type == PCF2131) {
+		config.read_flag_mask = 0x0;
+		config.write_flag_mask = 0x0;
+	}
+
 	config.max_register = variant->max_register;
 
 	regmap = devm_regmap_init_spi(spi, &config);



