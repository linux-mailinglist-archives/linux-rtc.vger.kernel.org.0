Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88EA6416638
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Sep 2021 21:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243023AbhIWTvv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 Sep 2021 15:51:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:49150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242861AbhIWTvu (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 23 Sep 2021 15:51:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46D8761260;
        Thu, 23 Sep 2021 19:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632426618;
        bh=fqBLRMxo5wOfLyC2Jpdr8PAqf1Bnwi8AgyLLbfopNwE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KnFTWf5EZXXe0xs0Lfr3+JgSqecYSjvEcxR6wgHoc+rISGcZT6G9wt0jPEMb8w/X/
         LZp/BkKJ/QJf6iW4PGLjVm4tYyknX0fzH5pL05SwmNw3U5Mi0HWpegbgxVKhvbzhWB
         YPXCtatQuMBKTyXN5dO7Rq54fA/vvCPqpDv5TFD6CdGOn/zmKw3bSuscfxrk8NmP+0
         SkfDc/CW6boX9Oo696SHhCurpGBNmtCXKbr+9kjLH7QmqGxCfdywgX2JssBOPbYWU4
         1RFNwk9rwCgtQqacOkMmHdGJoDPRbyLJ+HEaXW3uMOf4Dge3djGVV+xddqEBJaJ68F
         A3SqyzCBfZzww==
From:   Mark Brown <broonie@kernel.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 3/3] rtc: pcf2123: Add SPI ID table
Date:   Thu, 23 Sep 2021 20:49:22 +0100
Message-Id: <20210923194922.53386-4-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210923194922.53386-1-broonie@kernel.org>
References: <20210923194922.53386-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1298; h=from:subject; bh=fqBLRMxo5wOfLyC2Jpdr8PAqf1Bnwi8AgyLLbfopNwE=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhTNpBjwrCv2yv06keqKNfOVjSPhZ0GsR8ytpp2Gjs abyOMMeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUzaQQAKCRAk1otyXVSH0EDHB/ sEwpO7FRlXOOkU8l6pBNfsY9UUkV30H17QVLxh+RKCvfD5N7EAky4ZUs/qLumLGqmoZQ6cYsjJ7ElF tNwCj0sMaCz4EmMJwRjgZEdUVjKfJlnpSJ2/YHhJTiKu9C3vvkv1jgyfJ3nO1O4BIYLQr/PRBr7eQP Agja+PKV5ba6bLOHde8q5Z1pa+AjrdSpM/sfRyJg9EOB16yO9i/cmIe9Ue7HCwNKYD1qdHspaujwKC F5XzXzscp7dwT6/mO/RUdhLCADjOoZn3rLiO+50819tb+Ujs3qiALYw3Y4yldKlB3pFi6SB/egfpIK OfbP77meUcS/ymjwi9rQnJzXK7QBeZ
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
 drivers/rtc/rtc-pcf2123.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2123.c b/drivers/rtc/rtc-pcf2123.c
index 0f58cac81d8c..7473e6c8a183 100644
--- a/drivers/rtc/rtc-pcf2123.c
+++ b/drivers/rtc/rtc-pcf2123.c
@@ -451,12 +451,21 @@ static const struct of_device_id pcf2123_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, pcf2123_dt_ids);
 #endif
 
+static const struct spi_device_id pcf2123_spi_ids[] = {
+	{ .name = "pcf2123", },
+	{ .name = "rv2123", },
+	{ .name = "rtc-pcf2123", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, pcf2123_spi_ids);
+
 static struct spi_driver pcf2123_driver = {
 	.driver	= {
 			.name	= "rtc-pcf2123",
 			.of_match_table = of_match_ptr(pcf2123_dt_ids),
 	},
 	.probe	= pcf2123_probe,
+	.id_table = pcf2123_spi_ids,
 };
 
 module_spi_driver(pcf2123_driver);
-- 
2.20.1

