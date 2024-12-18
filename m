Return-Path: <linux-rtc+bounces-2744-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FFF9F6E41
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Dec 2024 20:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A658316BD0C
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Dec 2024 19:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853CC1FA826;
	Wed, 18 Dec 2024 19:35:11 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EF2155382
	for <linux-rtc@vger.kernel.org>; Wed, 18 Dec 2024 19:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734550511; cv=none; b=Jfxm/7Z1iZHBLMKM8xL5rTZ0GlmZFT2kOgfH0ZDFnf8fLihaSSylGW1VQ8JDyvnvij5lmP0SiFa5QjJQHcyDGy7uK0g2fvE+0PGkxJLTuRjG6bOBC1D54tQ023epSEAYLCUZqbalf7WjK1DggMHTbQi92ijtyrMNrqmlfmKEFmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734550511; c=relaxed/simple;
	bh=Tj2tjAHMjyKgVq5q0IlvmBu2hhLwyyw8bJovgEGc7TQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ddrxwlSwXhJxChfP9ZGuuAbr+Nr4LAjsL3l+A8zn2CR12uKCNgHodPEnDyo9Bm+8VSCNEy/mV6zFzLD7m468kBoj/5GasfJrw2HAjS42bN6ZlMn3/odHoVS3gHuuKT0CR+21ssehiZN6x3geLV4X3R8QskYO8jTZvINQU0h5JJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tNzp2-0004M9-IW; Wed, 18 Dec 2024 20:35:04 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tNzp0-0045Dc-28;
	Wed, 18 Dec 2024 20:35:03 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tNzp1-00DMke-1D;
	Wed, 18 Dec 2024 20:35:03 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Wed, 18 Dec 2024 20:34:58 +0100
Subject: [PATCH] rtc: pcf85063: fix potential OOB write in PCF85063 NVMEM
 read
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-rtc-pcf85063-stack-corruption-v1-1-12fd0ee0f046@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAOEjY2cC/x3MQQqDQAxA0atI1g3MpNbaXkW6kJjYUNAhM0pBv
 HuHLt/i/wOyuEmGZ3OAy27Z1qUiXhrg97jMgjZVAwVqI8UevTAm1v4WuivmMvIHeXXfUqklPjR
 oG6JORHeoj+Si9v3/h9d5/gCoRvqzbwAAAA==
X-Change-ID: 20241218-rtc-pcf85063-stack-corruption-9f0f401fd227
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org

From: Oleksij Rempel <o.rempel@pengutronix.de>

The nvmem interface supports variable buffer sizes, while the regmap
interface operates with fixed-size storage. If an nvmem client uses a
buffer size less than 4 bytes, regmap_read will write out of bounds
as it expects the buffer to point at an unsigned int.

Fix this by using an intermediary unsigned int to hold the value.

Fixes: fadfd092ee91 ("rtc: pcf85063: add nvram support")
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/rtc/rtc-pcf85063.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index fdbc07f14036aff0399c15adf71d89a30fe7e2cb..905986c616559b87826d1102dbc25614f7dcbcbb 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -322,7 +322,16 @@ static const struct rtc_class_ops pcf85063_rtc_ops = {
 static int pcf85063_nvmem_read(void *priv, unsigned int offset,
 			       void *val, size_t bytes)
 {
-	return regmap_read(priv, PCF85063_REG_RAM, val);
+	unsigned int tmp;
+	int ret;
+
+	ret = regmap_read(priv, PCF85063_REG_RAM, &tmp);
+	if (ret < 0)
+		return ret;
+
+	*(u8 *)val = tmp;
+
+	return 0;
 }
 
 static int pcf85063_nvmem_write(void *priv, unsigned int offset,

---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241218-rtc-pcf85063-stack-corruption-9f0f401fd227

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>


