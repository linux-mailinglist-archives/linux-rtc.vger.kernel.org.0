Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36BC7270C48
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Sep 2020 11:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgISJqn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 19 Sep 2020 05:46:43 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:47456 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726307AbgISJqj (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 19 Sep 2020 05:46:39 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 94376AA78F333804EE86;
        Sat, 19 Sep 2020 17:46:35 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Sat, 19 Sep 2020
 17:46:27 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        "Neil Armstrong" <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC:     <linux-rtc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        "Liu Shixin" <liushixin2@huawei.com>
Subject: [PATCH -next] rtc: meson: simplify the return expression of meson_vrtc_probe
Date:   Sat, 19 Sep 2020 18:08:56 +0800
Message-ID: <20200919100856.1639319-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Simplify the return expression.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/rtc/rtc-meson-vrtc.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-meson-vrtc.c b/drivers/rtc/rtc-meson-vrtc.c
index 89e5ba0dae69..e6bd0808a092 100644
--- a/drivers/rtc/rtc-meson-vrtc.c
+++ b/drivers/rtc/rtc-meson-vrtc.c
@@ -65,7 +65,6 @@ static const struct rtc_class_ops meson_vrtc_ops = {
 static int meson_vrtc_probe(struct platform_device *pdev)
 {
 	struct meson_vrtc_data *vrtc;
-	int ret;
 
 	vrtc = devm_kzalloc(&pdev->dev, sizeof(*vrtc), GFP_KERNEL);
 	if (!vrtc)
@@ -84,11 +83,7 @@ static int meson_vrtc_probe(struct platform_device *pdev)
 		return PTR_ERR(vrtc->rtc);
 
 	vrtc->rtc->ops = &meson_vrtc_ops;
-	ret = rtc_register_device(vrtc->rtc);
-	if (ret)
-		return ret;
-
-	return 0;
+	return rtc_register_device(vrtc->rtc);
 }
 
 static int __maybe_unused meson_vrtc_suspend(struct device *dev)
-- 
2.25.1

