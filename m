Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D65F416636
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Sep 2021 21:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243018AbhIWTvp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 Sep 2021 15:51:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:49078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242861AbhIWTvp (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 23 Sep 2021 15:51:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F0826124B;
        Thu, 23 Sep 2021 19:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632426613;
        bh=Tdn7yW29qd1bAYfhNOtKmgLbY170BBzRxN2af+z4rQc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QrhlATSwh4UHxZ62VMYD6UXtlPr1UXbo8G5DL9ykzsOIeHqx4xLhQpWMJ6Q6Fo8eA
         pHqmNUhCZkZzbfbaUnJhjedISOXyRYpeKu6u59cIzs6292d0PndvuLyAepV28GVB20
         F0715NtSwglfF72svl+/v+lEzFdLzdWylb32BuFBiNXfjXETO4jJlDTWefLKWACD54
         mGpaXQ7U0ddUSLiJgLy8G2T7YEGDMjmj/BwUJK5qveOMWjDERgCccXOu36RK6ozbrA
         T1xFHjp+qFUtLvUkR25ty2zDwweUn/xCfJG+EQGxHc7FP2TJl1eW/yKXLSSBAZKn0x
         jlibWdA3xZoEQ==
From:   Mark Brown <broonie@kernel.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 1/3] rtc: ds1302: Add SPI ID table
Date:   Thu, 23 Sep 2021 20:49:20 +0100
Message-Id: <20210923194922.53386-2-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210923194922.53386-1-broonie@kernel.org>
References: <20210923194922.53386-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242; h=from:subject; bh=Tdn7yW29qd1bAYfhNOtKmgLbY170BBzRxN2af+z4rQc=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhTNo/6nXXtcGoLSNXFGj99Po8mY8PIVKuTss5nhLo pR5uuLeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUzaPwAKCRAk1otyXVSH0KqbB/ 41YZucJz8j18gh6BW5L2Hli9JwLSsVTxZKaVJhRYU2COE0cgjZT5i21TPabWhvO0h9d0SC/UkHHtfc FIG2pcjjilBRPk80lROTmMQ9SXwI8F3TSoAA6pCIXR2Ba4rscffQa+epXDD/722TUINtdC0l6Dx8vF ul5yDVTIdhkSrDpLBZran4guFYCwYwG4cmb4BihNfKf+UaXvxEkIciF4HXam+c+XsMg0ZT2RllRVxi u9Dmj0Vys067rCz7nj8ZM1PGcHEkzANVbYKs+PXOQ0LNftY1AllSZCLi9igcaYpnU8z/tt/bRZRLqB LQWSX63/1Ee/eXTfHy9EX/EawFmvUu
X-Developer-Key: i=broonie@kernel.org; a=openpgp; fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Currently autoloading for SPI devices does not use the DT ID table, it uses
SPI modalises. Supporting OF modalises is going to be difficult if not
impractical, an attempt was made but has been reverted, so ensure that
module autoloading works for this driver by adding an id_table listing the
SPI IDs for everything.

Fixes: 96c8395e2166 ("spi: Revert modalias changes")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/rtc/rtc-ds1302.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rtc/rtc-ds1302.c b/drivers/rtc/rtc-ds1302.c
index b3de6d2e680a..2f83adef966e 100644
--- a/drivers/rtc/rtc-ds1302.c
+++ b/drivers/rtc/rtc-ds1302.c
@@ -199,11 +199,18 @@ static const struct of_device_id ds1302_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, ds1302_dt_ids);
 #endif
 
+static const struct spi_device_id ds1302_spi_ids[] = {
+	{ .name = "ds1302", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, ds1302_spi_ids);
+
 static struct spi_driver ds1302_driver = {
 	.driver.name	= "rtc-ds1302",
 	.driver.of_match_table = of_match_ptr(ds1302_dt_ids),
 	.probe		= ds1302_probe,
 	.remove		= ds1302_remove,
+	.id_table	= ds1302_spi_ids,
 };
 
 module_spi_driver(ds1302_driver);
-- 
2.20.1

