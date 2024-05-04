Return-Path: <linux-rtc+bounces-1117-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5F68BBEC2
	for <lists+linux-rtc@lfdr.de>; Sun,  5 May 2024 00:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7C7DB20FC7
	for <lists+linux-rtc@lfdr.de>; Sat,  4 May 2024 22:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7942584E13;
	Sat,  4 May 2024 22:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="VSZyDH0T"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D162BAE8;
	Sat,  4 May 2024 22:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714862673; cv=none; b=XxT42EKvQKFrGLLtJg1Um9FUEuHOItIS+2EIb57+6gf8FiyXC78dwpXIsMgLyFarAqqIXEIzxIQfvsT2S483ysaTWsLe9jGpLjKMG0bziEnpX1YrzIoIZD1QKItquIlv8Jf5kAzXlDEoXnyVLVYHoYwTc15kBCpikFeleSahlME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714862673; c=relaxed/simple;
	bh=ChFP9soZFQfzF6V++qD6V6h/Ebfb4+XVe7SS9h8/Gpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nyWy5GsU6hqkPltW9F7Agqh+RAs/zScR1Vdr0bokTeXhr/BvyD2P5xoV3XDMmwd5WAMd6UAuFkbFXf4FGilU8Su+5+GVbEYVWcpPv3K1jjXgPh81aDopeTK7BIZpH+7Xc/qXk5U1sQqtcExnmmv01ZF1yOH9UNflO19Wc+7+45c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=VSZyDH0T; arc=none smtp.client-ip=80.12.242.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 3O6BshQVn10G63O6Cs9BN7; Sun, 05 May 2024 00:43:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1714862600;
	bh=wWdMEMOIhPw6ppUn56CQKuUZeJb+o7tGdksRBeMqDTA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=VSZyDH0T9T59uX3IKpq+l1xEvpEF0bAD/lH5CJFjzVFLNhxgYS/ys5kwHvkdsJ4DH
	 b3DbVvZPyPAzu4wMVtRkS6coaACZrxKzwMa/yJOVPWIilfP391FCWgXybxbh585x+d
	 I5R3mpKnoMPc/9vd+HXRtp9Qw72FAcMnt1xYvr7xFHvC1jXEYLCit83P5x9iuICSgV
	 85ZxmwInjkdu0S5mlabpPDaqDDZRlY9uYnfoNlSU1DzVQSVppwZBr6HJZuTsnTZwWI
	 yaNaCUPzZz8A6wZhiFQPf9IeSHvlEcJ+QYtuVO4B4/qpMu4JkFJIVGyI9DeSPQC+9M
	 VIAYhZk85KEhQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 05 May 2024 00:43:20 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: rx6110: Constify struct regmap_config
Date: Sun,  5 May 2024 00:43:07 +0200
Message-ID: <833a7f612c0de9dcb1179a0b75b189c237a335ac.1714862560.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'regmap_spi_config' and 'regmap_i2c_config' are not modified in this diver
and are only used as a const struct regmap_config.

Constifying these structures moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
   text	   data	    bss	    dec	    hex	filename
   8896	   1554	     32	  10482	   28f2	drivers/rtc/rtc-rx6110.o

After:
   text	   data	    bss	    dec	    hex	filename
   9536	    914	     32	  10482	   28f2	drivers/rtc/rtc-rx6110.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/rtc/rtc-rx6110.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
index 834274db8c3f..af6dd6ccbe3b 100644
--- a/drivers/rtc/rtc-rx6110.c
+++ b/drivers/rtc/rtc-rx6110.c
@@ -330,7 +330,7 @@ static int rx6110_probe(struct rx6110_data *rx6110, struct device *dev)
 }
 
 #if IS_ENABLED(CONFIG_SPI_MASTER)
-static struct regmap_config regmap_spi_config = {
+static const struct regmap_config regmap_spi_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = RX6110_REG_IRQ,
@@ -410,7 +410,7 @@ static void rx6110_spi_unregister(void)
 #endif /* CONFIG_SPI_MASTER */
 
 #if IS_ENABLED(CONFIG_I2C)
-static struct regmap_config regmap_i2c_config = {
+static const struct regmap_config regmap_i2c_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = RX6110_REG_IRQ,
-- 
2.45.0


