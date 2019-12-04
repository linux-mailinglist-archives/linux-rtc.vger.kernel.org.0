Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F54C1137ED
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Dec 2019 23:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728427AbfLDW7g (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 4 Dec 2019 17:59:36 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34988 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728053AbfLDW7g (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 4 Dec 2019 17:59:36 -0500
Received: by mail-lj1-f196.google.com with SMTP id j6so1246302lja.2
        for <linux-rtc@vger.kernel.org>; Wed, 04 Dec 2019 14:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fWFWwBwf+/qh+51W0/5NvwSpZAa60WDVVrFmxyCiGJ4=;
        b=Q6GV4YFOrgQ5c+9IP5s9jGSWSfuhhOjW/yNKX4ZiHcEjqxqfxWUePFNfp2ITT6DEpk
         B5ke8aPhR/KfHVKaMWJ3LmN/B72Bxn9H5yk0XLZ2305rveH4Iwga33Zjp1acqyODPQFE
         JzvwcjC5Mtn1Xm91MqeB/FMsqUkIOeSO1qvO3zDm5uCpj2RSu3ZsCztbdu+fgGBVlyt+
         OWuGmt96UdOAjif5Ii0UhfaSNgTW47N2tO++mnSsaPbLA1B1WfC69pEBRK2bPxqMtrsD
         fiSVCRsrExfRPCwMxfPK7ICBn9ynW7usSPHrcRAMLJB/nO07kOyB5wjy9L0rKmBRplqn
         uv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fWFWwBwf+/qh+51W0/5NvwSpZAa60WDVVrFmxyCiGJ4=;
        b=ABCoYBfYce7RdHcbUngytfq1hjcS5xmg6mF/IzNT76QAXfh5rwjVd3PM0ns0/I2Nbp
         OWjheVzI9oVJnFHgb/IHnR72f933wH3HVafv4u3yi0XFigw+Q5C6Rbkz+X+RMSey6EIv
         gZdUVHQikomYCf/21JTS2TFy/RHIenSpTu/ZHKE1b/UlEhki/8NBqEPAHHULLBwdFAEH
         yf4B9jYAWCZNADMnARovGZiJhP+pqjZYnrlGt3LB4+A2cgomd5bYjV6ArstB0nQ9NQhH
         RaLAcb0/WXYe9h9TmSx50DSSGXNrEO65ECbCG80/429Nuj7P0B90Cl/JW+/VB8D3djfh
         iwYQ==
X-Gm-Message-State: APjAAAVBx9br4rTuX0J6Uk2uqzAbCSNyNjY2qCMalSRfgZ6NreEgiymo
        GmWO5Doo/4lQdX6iqOf7R2l6mA==
X-Google-Smtp-Source: APXvYqxEqBG4MusBCBt0f+STRiBuyZvdoWR1urmtC87SC8C18KEH2/CYvMW3eTWDuk4ahL98GCrRsA==
X-Received: by 2002:a05:651c:2011:: with SMTP id s17mr3374796ljo.43.1575500374246;
        Wed, 04 Dec 2019 14:59:34 -0800 (PST)
Received: from localhost.localdomain (c-21cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.33])
        by smtp.gmail.com with ESMTPSA id y8sm3964358lji.56.2019.12.04.14.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 14:59:33 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH] rtc: ds1343: Do not hardcode SPI mode flags
Date:   Wed,  4 Dec 2019 23:57:31 +0100
Message-Id: <20191204225731.20306-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The current use of mode flags to us SPI_MODE_3 and
SPI_CS_HIGH is fragile: it overwrites anything already
assigned by the SPI core. Change it thusly:

- Just |= the SPI_MODE_3 so we keep other flags
- Assign ^= SPI_CS_HIGH since we might be active high
  already, and that is usually the case with GPIOs used
  for chip select, even if they are in practice active low.

Add a comment clarifying why ^= SPI_CS_HIGH is the right
choice here.

Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/rtc/rtc-ds1343.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
index fa6de31d5793..105a2fd93583 100644
--- a/drivers/rtc/rtc-ds1343.c
+++ b/drivers/rtc/rtc-ds1343.c
@@ -484,9 +484,12 @@ static int ds1343_probe(struct spi_device *spi)
 	mutex_init(&priv->mutex);
 
 	/* RTC DS1347 works in spi mode 3 and
-	 * its chip select is active high
+	 * its chip select is active high. Active high should be defined as
+	 * "inverse polarity" as GPIO-based chip selects can be logically
+	 * active high but inverted by the GPIO library.
 	 */
-	spi->mode = SPI_MODE_3 | SPI_CS_HIGH;
+	spi->mode |= SPI_MODE_3;
+	spi->mode ^= SPI_CS_HIGH;
 	spi->bits_per_word = 8;
 	res = spi_setup(spi);
 	if (res)
-- 
2.23.0

