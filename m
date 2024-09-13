Return-Path: <linux-rtc+bounces-1979-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B38DE977D72
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Sep 2024 12:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8148288245
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Sep 2024 10:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F17B1DA2F9;
	Fri, 13 Sep 2024 10:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="huaAeVWN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB141DA112;
	Fri, 13 Sep 2024 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223364; cv=none; b=AeJn3REIti0q7CkmYfP0eIZXUINVS32yCAysm0nBwvCIgzQoZ752IlDVN55vGfzIKwRnNn5GWqCUwwo/ZeqtvQ+NdIJs0Vv5ukRTGctrtGPDQ49TG+fjvfMUHd1igafPHUJaKYVCBuJglOmi89tOE0lmeJSXtO5+a6G7CHpDHqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223364; c=relaxed/simple;
	bh=1oXD4NzVC1bjitr4jBpT8V7XG4g08+jepLpFv68RC5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U2STdpmcaH/gVQUZZVs2URu7Bquy5gFXuPn4oqu+6LXCqOKUt9vRbvrW+KFS5jCp+VPWKk9wWWDTAJEwF31Xq6Ada/+HUjt07ztIfDzYON8vlTiH4JKa2Zgj3+p7E7XBi1GdDXBOKZrTnXtNVTyl8XQRUxwhaZozslwAmRUGV/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=huaAeVWN; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=fKWpOn1LSJqL+d1QyUQwAruHGeHxwd3osLSyeITf/gI=; b=huaAeVWNDeeB1GyOSvYGoC5W71
	CRaoEYa0W4OojAO8q6NoBan1/LpH32sprDx3Ra4IoBm0rSiuFgy5hhTjlp9JdoS6r1UjDvEMKCEB3
	FpoNDpfMAJaMzkgGu6zHneu3b9RmyJaoWmj2XQqWidMylpwBp2rtxDUmmHFaTZ9GQ29WakQAUb8TT
	yamJOezQMpCWiEnKGFD92RbxXrG4e0W8Xo7DKivg2nF9qUX1RDAKOsUoTywMfohAKrBjOk5MclvMQ
	T1eBn/JuI3kEc7JhYvcS4GgCi2b/XQz0LsXKk0vODWsVlk+rFHRV6RJXdKWLKxkfI+r9Teu3X71ZS
	XdpIoYGA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sp3YF-0006Os-RL; Fri, 13 Sep 2024 12:29:19 +0200
Received: from [80.62.117.18] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sp3YF-00072R-0G;
	Fri, 13 Sep 2024 12:29:19 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 13 Sep 2024 12:29:14 +0200
Subject: [PATCH v2 3/3] rtc: isl12022: Replace uint8_t types with u8
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-rtc-isl12022-alarm-irq-v2-3-37309d939723@geanix.com>
References: <20240913-rtc-isl12022-alarm-irq-v2-0-37309d939723@geanix.com>
In-Reply-To: <20240913-rtc-isl12022-alarm-irq-v2-0-37309d939723@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726223357; l=1110;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=1oXD4NzVC1bjitr4jBpT8V7XG4g08+jepLpFv68RC5o=;
 b=BSJemiw0uCbOxTEeFBGp3qPpj8wtMCfMBaW+pi14jb+0o6cTwDlD8UyEpqckE0CMzz2amx6F0
 gnjmF1oCy65AL4FyuxPU9tt6MUbi7CtduLB0KEBpTBE79ZTGYMDYg3V
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27397/Fri Sep 13 10:48:01 2024)

Keep coding style consistent, by using kernel integer types instead of
standard types.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/rtc/rtc-isl12022.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index 8001e3c5da76..9b44839a7402 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -172,7 +172,7 @@ static int isl12022_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct isl12022 *isl12022 = dev_get_drvdata(dev);
 	struct regmap *regmap = isl12022->regmap;
-	uint8_t buf[ISL12022_REG_INT + 1];
+	u8 buf[ISL12022_REG_INT + 1];
 	int ret;
 
 	ret = regmap_bulk_read(regmap, ISL12022_REG_SC, buf, sizeof(buf));
@@ -209,7 +209,7 @@ static int isl12022_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	struct isl12022 *isl12022 = dev_get_drvdata(dev);
 	struct regmap *regmap = isl12022->regmap;
 	int ret;
-	uint8_t buf[ISL12022_REG_DW + 1];
+	u8 buf[ISL12022_REG_DW + 1];
 
 	dev_dbg(dev, "%s: %ptR\n", __func__, tm);
 

-- 
2.46.0


