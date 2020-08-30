Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B737256CBC
	for <lists+linux-rtc@lfdr.de>; Sun, 30 Aug 2020 10:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgH3IKj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 30 Aug 2020 04:10:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:55512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727855AbgH3IJn (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 30 Aug 2020 04:09:43 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58F2620714;
        Sun, 30 Aug 2020 08:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598774982;
        bh=UHrlQ3jb0To1Qcfdx1uid0gHlvTRA2SrFLLJNnU3YHg=;
        h=From:To:Cc:Subject:Date:From;
        b=OlkPhXmtxIm25KwszEbSZVLc0+Hx2wObPtXFQBxan067WH5HuM6BTXsKszrD7Jsev
         Kdd1bzxImfgZf90dYSbseFET9yxx9TApEEdoOzGeVxIz3N3rVCaJyKTlHI+lrQz2ik
         ZmeYnojRo3xAVYJq/e5Fb4dVJMDQi13nVlLPBiJE=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] rtc: s3c: Simplify with dev_err_probe()
Date:   Sun, 30 Aug 2020 10:09:37 +0200
Message-Id: <20200830080937.14367-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/rtc/rtc-s3c.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index e1b50e682fc4..24a41909f049 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -494,13 +494,8 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 	if (info->data->needs_src_clk) {
 		info->rtc_src_clk = devm_clk_get(&pdev->dev, "rtc_src");
 		if (IS_ERR(info->rtc_src_clk)) {
-			ret = PTR_ERR(info->rtc_src_clk);
-			if (ret != -EPROBE_DEFER)
-				dev_err(&pdev->dev,
-					"failed to find rtc source clock\n");
-			else
-				dev_dbg(&pdev->dev,
-					"probe deferred due to missing rtc src clk\n");
+			ret = dev_err_probe(&pdev->dev, PTR_ERR(info->rtc_src_clk),
+					    "failed to find rtc source clock\n");
 			goto err_src_clk;
 		}
 		ret = clk_prepare_enable(info->rtc_src_clk);
-- 
2.17.1

