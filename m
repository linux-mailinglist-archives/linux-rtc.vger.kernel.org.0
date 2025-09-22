Return-Path: <linux-rtc+bounces-5009-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA2CB92FCC
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Sep 2025 21:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D1C91907C77
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Sep 2025 19:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318D43164C1;
	Mon, 22 Sep 2025 19:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RbFFrKVp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D9B2F0C64;
	Mon, 22 Sep 2025 19:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758570067; cv=none; b=cmKlSkOatEQVEqBI8HCwsPjHO3pgv8fYaafezOTCYGrYLqVlfrqmEwxFmEioMY74JzIqwwnNnkSG/5Ihp6Rh29ndwSa3vXRe/uUg0KzXedZrg9xWk8/wv/1s4PQFHSeUWr4gx029grPbYGJT23ALunC3AHxXda/CxhFc5D25xFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758570067; c=relaxed/simple;
	bh=SRhHrV2S9rUSzuo7jqkPNtHl7ffetxoJuc2VsVvymGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jLhtbYvFBd88MOfv6zAdIkrK+9TIVkNll+b8TNVeixOTBcGKonFMqjO6T5mV78ei7CpzjnFllMcKQgpqyWckI4ON3p46oQYLSMT7lL0fpytMxTOTqhUq6pfkxTYF2QyYFxcDKZWCzVM19YuTH6xBqfhVh3P4xU76bVCPQhzklg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RbFFrKVp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852A7C4CEF0;
	Mon, 22 Sep 2025 19:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758570066;
	bh=SRhHrV2S9rUSzuo7jqkPNtHl7ffetxoJuc2VsVvymGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RbFFrKVpjKHS21aaoz5VMBxHYvsAGKIh8NwE0f+UY/e69V/KMyT2rKG9CZtGnMMdS
	 DJjdsVG3zq+iuQ7bK7uocizLASWxBNm+tR8QN6n13dgJvDQmfTvh3rz/NBudBZd4w4
	 3lDrwkxR3GemsBg9mgrK7C2QFLmGTS2X4efl4Lag=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org,
	linux-rtc@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Elena Popa <elena.popa@nxp.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH 6.12 098/105] rtc: pcf2127: fix SPI command byte for PCF2131 backport
Date: Mon, 22 Sep 2025 21:30:21 +0200
Message-ID: <20250922192411.442964825@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922192408.913556629@linuxfoundation.org>
References: <20250922192408.913556629@linuxfoundation.org>
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

6.12-stable review patch.  If anyone has any objections, please let me know.

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



