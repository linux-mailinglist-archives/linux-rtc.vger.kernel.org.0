Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10ED6416637
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Sep 2021 21:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242987AbhIWTvs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 Sep 2021 15:51:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:49102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242861AbhIWTvs (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 23 Sep 2021 15:51:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F73760F6F;
        Thu, 23 Sep 2021 19:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632426616;
        bh=8HtiBQ5AD19W8yoB1BVHaJ4vwD+zF6PcopgDUBOGhuw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z4/tNFkw5C+GSZswgbilpDfZV2bn1skXKjVd8w9zaWXp3+GSVndUaLygHlGlBBe6v
         ieH1G6hmoIYTftJ97A4KOQJt/rWhjCffE2GBNNIGKvZbrKLofgtOmLcouAWtuUGyox
         N7GCS78Kfuy2LzGV/Qm8g4ekG1Hy5nrHDhNK44jdDVaWMUldLTWi62ZrzOeNQFA+jy
         5wMMnvLNKgdlT2RNHkElUXGaD2F0uVYdT8Da9y4BFUflVnWfUbT03W8GyVhCeGXK4C
         kWPXj0imBgFYyNKBUNwOZo0VaX/CWXCvITEPGSDY25aPgNpvGWP+gkAZwyJJ1hHbD1
         I2YjKRnZjh5rQ==
From:   Mark Brown <broonie@kernel.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 2/3] rtc: ds1390: Add SPI ID table
Date:   Thu, 23 Sep 2021 20:49:21 +0100
Message-Id: <20210923194922.53386-3-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210923194922.53386-1-broonie@kernel.org>
References: <20210923194922.53386-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1206; h=from:subject; bh=8HtiBQ5AD19W8yoB1BVHaJ4vwD+zF6PcopgDUBOGhuw=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhTNpA2JZ4HgE9B1ArPj6q0FfKWxANowQPYCXFN2Qp mqZk17yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUzaQAAKCRAk1otyXVSH0HqLB/ 4piTwRITjvHRBcA5ZdgqfCvRvIgocB3Ggw/aXXVv5y2jdBamHs3DS6LRm6CSyxynBLCwPf/qLI1T5d Kfrl2CqDHNqLcsaApfFPWunJbZO8I6TXxGBmUZ0UJJpneA0OFtAoNhTHMx+apnwJb+UQ4iupr6t27c WGDleNqaM8DsBH0zQjLDaeSxBgD8HShOsjdlDnFPJzBaBwnfIaIBElG8iFDTalt6r0Y1pwWUYL7WXk PB9/xfHM8qt9aK0GC2QQsx+DOiUXUPMX3X7IR9Plg5GQ5Bj9Q54LWtWrLKGwsttO4wgZEvMba6R7+r nk8UbHcFl0r83GEvq3eaaWxd57hdpu
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
 drivers/rtc/rtc-ds1390.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rtc/rtc-ds1390.c b/drivers/rtc/rtc-ds1390.c
index 66fc8617d07e..93ce72b9ae59 100644
--- a/drivers/rtc/rtc-ds1390.c
+++ b/drivers/rtc/rtc-ds1390.c
@@ -219,12 +219,19 @@ static const struct of_device_id ds1390_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ds1390_of_match);
 
+static const struct spi_device_id ds1390_spi_ids[] = {
+	{ .name = "ds1390" },
+	{}
+};
+MODULE_DEVICE_TABLE(spi, ds1390_spi_ids);
+
 static struct spi_driver ds1390_driver = {
 	.driver = {
 		.name	= "rtc-ds1390",
 		.of_match_table = of_match_ptr(ds1390_of_match),
 	},
 	.probe	= ds1390_probe,
+	.id_table = ds1390_spi_ids,
 };
 
 module_spi_driver(ds1390_driver);
-- 
2.20.1

