Return-Path: <linux-rtc+bounces-1470-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5870492D8D1
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jul 2024 21:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 899851C21F52
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jul 2024 19:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAF6197A61;
	Wed, 10 Jul 2024 19:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="A7ZmCc8l"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp88.iad3b.emailsrvr.com (smtp88.iad3b.emailsrvr.com [146.20.161.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF07F197555
	for <linux-rtc@vger.kernel.org>; Wed, 10 Jul 2024 19:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720638722; cv=none; b=K6VV/cNviL03b2oEohaWp+aTcChCciN4BSMIfwKNVs+8HIZwdh1Y4UqQbhDmr70xD+4i60l+QrEB5BewPriG7MeX7ZQbURIu2EbeMVkOoGIv/XsnZuee5DrFfyVHHXsKjqGlxWECydU8K9KDoGeN6SVjCFD/ecX1y3bR6xOWlPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720638722; c=relaxed/simple;
	bh=HoXdi8YDPzKPfOk1K5QZ/YKUnApGodxvc1GCh+obPAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mhpSiarLhfT6iAXUSuwzHpVWeG/7gtteq4Ni+CDhvsy5aRxBjozEYUT2zBpc0d/sjpF+rqBHPIlx7KbKmSM63R0KJlTxfZBHvcNCAnBAb/trYthX/ndeE2lOKy10QPIn969nsMXCWtLLn+IrrVNRYE79dWxNpP6+y/IIktaOTJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=A7ZmCc8l; arc=none smtp.client-ip=146.20.161.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1720633977;
	bh=HoXdi8YDPzKPfOk1K5QZ/YKUnApGodxvc1GCh+obPAw=;
	h=From:To:Subject:Date:From;
	b=A7ZmCc8li9EupPTQhsSsAfWXZ10ZKV0ajZ3P6AGlhKtifUZavAL1wXVjDUbILoOxL
	 14xV39isjJN5WoT7gzx06zxypGTHvsSzmBHj7waYdV34bw6g2XOTQbhUt2gLlX2qIw
	 REz+SVd+4g2KMx85vYfdYHYZnaySs09S63BQfBZ8=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp20.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id D7C82A019C;
	Wed, 10 Jul 2024 13:52:56 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Ian Abbott <abbotti@mev.co.uk>,
	stable@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>
Subject: [RESEND PATCH] rtc: ds1343: Force SPI chip select to be active high
Date: Wed, 10 Jul 2024 18:52:07 +0100
Message-ID: <20240710175246.3560207-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: cd498383-a11f-45b4-a4c9-74a0458dea8a-1-1

Commit 3b52093dc917 ("rtc: ds1343: Do not hardcode SPI mode flags")
bit-flips (^=) the existing SPI_CS_HIGH setting in the SPI mode during
device probe.  This will set it to the wrong value if the spi-cs-high
property has been set in the devicetree node.  Just force it to be set
active high and get rid of some commentary that attempted to explain why
flipping the bit was the correct choice.

Fixes: 3b52093dc917 ("rtc: ds1343: Do not hardcode SPI mode flags")
Cc: <stable@vger.kernel.org> # 5.6+
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 drivers/rtc/rtc-ds1343.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
index ed5a6ba89a3e..484b5756b55c 100644
--- a/drivers/rtc/rtc-ds1343.c
+++ b/drivers/rtc/rtc-ds1343.c
@@ -361,13 +361,10 @@ static int ds1343_probe(struct spi_device *spi)
 	if (!priv)
 		return -ENOMEM;
 
-	/* RTC DS1347 works in spi mode 3 and
-	 * its chip select is active high. Active high should be defined as
-	 * "inverse polarity" as GPIO-based chip selects can be logically
-	 * active high but inverted by the GPIO library.
+	/*
+	 * RTC DS1347 works in spi mode 3 and its chip select is active high.
 	 */
-	spi->mode |= SPI_MODE_3;
-	spi->mode ^= SPI_CS_HIGH;
+	spi->mode |= SPI_MODE_3 | SPI_CS_HIGH;
 	spi->bits_per_word = 8;
 	res = spi_setup(spi);
 	if (res)
-- 
2.43.0


