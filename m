Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2051E4194C1
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Sep 2021 15:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234495AbhI0NFv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 Sep 2021 09:05:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:46560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234454AbhI0NFv (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 27 Sep 2021 09:05:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE1AB6103B;
        Mon, 27 Sep 2021 13:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632747853;
        bh=XhDmfGBIAm78Yx1bOSfDGor0lEcFkq0GhvjaK6fIAyw=;
        h=From:To:Cc:Subject:Date:From;
        b=gECzdWTnmApJruLqRrCSc1Ua3jpmz6+uPl7VETySQw4JKiVIQSxNVlvJRrF1YH2Lf
         hUs2sLm6Tm0Zk9U9q10feEDgS4FXCtdLj9vUy55Jjzcw+unwchH1hgBtdrIRAR0T30
         cpu9wVjT5JDpIv+9TEwCTp8q34pnbrxwEqMD2HcdXHsByJ9kn2s2w6kZauKLcha6Vk
         3GdoiBC1M9VoIowhdvqt9Ec79vyALNwgJWS9VY5EYT6S/RDsYJeWAOrfmqYSBV6yfL
         ItEUPSqAxw4Pr1nbh81P3xp3julS6kLpplFxrTiX6zQwZ50ONV7ie2gA648Bv5j3fm
         QTFIpVVuRiDfg==
From:   Mark Brown <broonie@kernel.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [PATCH] rtc: mcp795: Add SPI ID table
Date:   Mon, 27 Sep 2021 14:02:40 +0100
Message-Id: <20210927130240.33693-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1219; h=from:subject; bh=XhDmfGBIAm78Yx1bOSfDGor0lEcFkq0GhvjaK6fIAyw=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhUcDi052yiiY/AyKveE+KVrJo2+Ld5z9GOs05QGT0 Jk1js4GJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYVHA4gAKCRAk1otyXVSH0JYKB/ 92tDg+OE7sND+KFGKiWbhijOZoQPwrizLi6YxXcE4dOVVb84forKswang318CBZ1YddcgWKsZqCX9J iM8WDNARvbl0w0EKe/yyDbILWU91QTHhxWXEkscAgnqxRNJs/0QRNvNGH9JP7ZU9F7/QC+Iggu102u 2rjKjImU8tT7OI7qSDb6/RxSZtzUiXv+XBJCYN6M8n7KHY6f3CQWNahPn8w+J2y1vwAc7LHs6uxCTN CBI3VWJigOU5k9Gn7ld4Pt9TBy+WzAbbxpFlhD8HnX2ptL30cKU3abc6FNjbC0vVDu+wr/Thx3itCj XBjzf01YG930GuxX/hS5TZ9rrHhOHa
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
 drivers/rtc/rtc-mcp795.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rtc/rtc-mcp795.c b/drivers/rtc/rtc-mcp795.c
index bad7792b6ca5..0d515b3df571 100644
--- a/drivers/rtc/rtc-mcp795.c
+++ b/drivers/rtc/rtc-mcp795.c
@@ -430,12 +430,19 @@ static const struct of_device_id mcp795_of_match[] = {
 MODULE_DEVICE_TABLE(of, mcp795_of_match);
 #endif
 
+static const struct spi_device_id mcp795_spi_ids[] = {
+	{ .name = "mcp795" },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, mcp795_spi_ids);
+
 static struct spi_driver mcp795_driver = {
 		.driver = {
 				.name = "rtc-mcp795",
 				.of_match_table = of_match_ptr(mcp795_of_match),
 		},
 		.probe = mcp795_probe,
+		.id_table = mcp795_spi_ids,
 };
 
 module_spi_driver(mcp795_driver);
-- 
2.20.1

