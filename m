Return-Path: <linux-rtc+bounces-3990-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D10A98A5B
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 15:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 316973B7701
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 13:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2B085260;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqxZv2Ef"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6804145BE3;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413453; cv=none; b=DVxmNq0hQpz5dw49R01GM6zEBEumid712on6P+HJg9g9WnyXNjOHYfYoYZYSalo219+n1SWPLiCEiWbaQFf+2GqbkXYsiBY0odKlpz6Qu4yojvf84yPRJXqhiAkcqj3E+KP7J1HfmqeT/Vahuhq4WFm6JJbuxkhQYvkB4l94djQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413453; c=relaxed/simple;
	bh=aolTElc2asxbcGiU749FOSq36fzHZnwwMBiG+tiek3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UrwGC+sY/56O/evBaXIxA1GwMreTB5ehQzbfOAor9wBbs47J1YTAwKkKVFJfbSsG/GH2BsuOG3cs2SP02VaAW6yODdhUXYiJG9RbcVQ5gO2763hUtf+fDa9bUiFZSmfVuN5LUN33VABLvmmOl3pFhCrthc5Qcx/jU1biLKmKkFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqxZv2Ef; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4F8C4CEEB;
	Wed, 23 Apr 2025 13:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745413452;
	bh=aolTElc2asxbcGiU749FOSq36fzHZnwwMBiG+tiek3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gqxZv2EfN9+1OYcB41mV1mPzEJ/Z7hjD0as6JlMsuHZmR0sfamsuYUEfKb7ynPD7W
	 pZFENstXYG2/e9Z3uzMX4jpeVkiKwZmuXpDfJtsn01/1JMG8+FMyq8uR5p++soICwF
	 NpmkqmuvLXokBco0aFl0om9IINh6iKWCaDBQpN+rfhEfnIInrZqVbDN3QIi7bb1Xwf
	 se/aU59dyajw3CLDan1lk8kVYvNfiyjxb/Oaw0A6S0H5d3vL7LjH/8bGsmOR8/TmO7
	 TeDXWF8CPQiOQUZeSZ785oHr9lQVN1vJzsiUtHomHksFowMqHcaVNYVe5d93gBNpg9
	 fO/1EDDzcVTpw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u7Zls-000000008AZ-0xOH;
	Wed, 23 Apr 2025 15:04:12 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sebastian Reichel <sre@kernel.org>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 1/7] rtc: at91rm9200: drop unused module alias
Date: Wed, 23 Apr 2025 15:03:12 +0200
Message-ID: <20250423130318.31244-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423130318.31244-1-johan+linaro@kernel.org>
References: <20250423130318.31244-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver only support OF probe so drop the unused platform module
alias.

Fixes: 288d9cf1764a ("rtc: at91rm9200: use of_device_get_match_data()")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/rtc/rtc-at91rm9200.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
index f6b0102a843a..643734dbae33 100644
--- a/drivers/rtc/rtc-at91rm9200.c
+++ b/drivers/rtc/rtc-at91rm9200.c
@@ -654,4 +654,3 @@ module_platform_driver_probe(at91_rtc_driver, at91_rtc_probe);
 MODULE_AUTHOR("Rick Bronson");
 MODULE_DESCRIPTION("RTC driver for Atmel AT91RM9200");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:at91_rtc");
-- 
2.49.0


