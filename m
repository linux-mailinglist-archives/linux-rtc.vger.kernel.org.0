Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 247492CBB59
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Dec 2020 12:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729602AbgLBLO0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Dec 2020 06:14:26 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47413 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727209AbgLBLOZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Dec 2020 06:14:25 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201202111334euoutp0212570ec03f86693b804ff1487c309b64~M4fYaDlUc1608616086euoutp02L
        for <linux-rtc@vger.kernel.org>; Wed,  2 Dec 2020 11:13:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201202111334euoutp0212570ec03f86693b804ff1487c309b64~M4fYaDlUc1608616086euoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1606907614;
        bh=xmrBZT9PAblDAQ4lFT7oqHGPc2pHJzj/SjrNxGbO85o=;
        h=From:To:Cc:Subject:Date:References:From;
        b=A/cS5O9evZhGwSjx3cyuXJ/YA2Y/J+7TuK+6euODgaMhH02bj3HM894fTo98+VNoy
         Xwm93Df50+n1o3e6DpcFPlXu21D9n5dF9QGZXir3o4USuSMMwLCWZybIlMkEGYUB22
         xa8+V1tCu/Zo2Zy/BLzwOsXbezIbuZkjBfHL+RvM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201202111328eucas1p178dd8a6f2d433b5e7c97923ddc1d232e~M4fTV_Wa40216502165eucas1p1j;
        Wed,  2 Dec 2020 11:13:28 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 3D.56.27958.8D677CF5; Wed,  2
        Dec 2020 11:13:28 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201202111328eucas1p25b7a68b4fe94addf6088cc3ad4bedcf1~M4fS0nBfc2390323903eucas1p2h;
        Wed,  2 Dec 2020 11:13:28 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201202111328eusmtrp28d714f322085be8fb44a35e60d742960~M4fSz3ntr2916129161eusmtrp27;
        Wed,  2 Dec 2020 11:13:28 +0000 (GMT)
X-AuditID: cbfec7f2-efdff70000006d36-20-5fc776d8faf0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 08.8C.16282.7D677CF5; Wed,  2
        Dec 2020 11:13:28 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201202111327eusmtip1c96926d5adc1fe6c3e8f721c59434203~M4fSUNQt71371613716eusmtip1T;
        Wed,  2 Dec 2020 11:13:27 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 1/2] rtc: s3c: Disable all enable (RTC, tick) bits in the
 probe
Date:   Wed,  2 Dec 2020 12:13:17 +0100
Message-Id: <20201202111318.5353-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTYRjmO+d4zlFaHDdjX2YGkmlWWwuNSRYWUkuCrJCkkrXawSSdtTm1
        pDINLyPDylvLTLqYTJc11Myi5tKpCbOlecEZXsAi2zTtpq2Vp1P273mfy/e8vHwkyh3GvMl4
        RTKtVMgS/HAPrME8a1nXn9ImXV9UFSC+Y31DiHMclYT4YWmtm7ir6wEhNlf34OLSrmeIWN8y
        RIQTkvKadIlBl4dLLtXpgKSkfBaRzBh8o9wOeITJ6YT4FFop3HLY49hH+0vkRBmR5nw7CzKA
        000DSBJSwfCCPlYDPEguVQXg09lKjB0+Azg0UktogPv8MANgZq2cwUzgdZ8NsKZ7AGo7byEL
        iXbjDGBcOCWCGrsGZ7AXFQ6/OO1/nkUpx3yHvgZjBB61B75ztWLMHhjlDwcH1QzNocLgiMaG
        sW0rYPUDI8pkIfWTgC+cJpQVIqBttAVhMQ9+aKsjWOwDfz2+ibCBLABHLHqCHS4C2J1ZCljX
        JmizzOFMM0qthrVNQpbeCie1dsAeZjHst3syNDoPrzSUoCzNgbnZXNa9Cmrb7i/UNr96/Xc1
        Ccy99ujv5WLhgF5HFABf7f+uCgB0gE+rVYlxtEqkoFMFKlmiSq2IExxNSjSA+U/Q6WqbbgQ3
        PnwSmABCAhOAJOrnxcFcLVIuRy47dZpWJkmV6gRaZQLLSMyPz9Fdr5FyqThZMn2cpk/Qyn8q
        Qrp7ZyArp0NMPXmOr8Pqxglhc7d+onFzbH5l0PiTuuC8MteE9LtPrDXTsijupbOkK0tUHu7N
        23lGeMS3J3U6ZmZH3m3e1I/FlqykyVb/AHn70pj3XoaToXiTNdDYEcrz3IDlNAh2nw8yB9e3
        W8eP9+HZCn4n0rv9bqHrAlcrjgmcyl9rK8KnI9X7XPb338aio/YJVM0bDxnN2xzZE/uji5/1
        K9ckj96F4QXluvpe09V65dDz0grr47MdBVnC7GbHksyEXUH5IwPV5y8/jMzhiATQQHUXjWUM
        F4eMyfeeK0R7pQ1p0elRcj4nbM7XvDxtLqLGv9uYcTCgmO/U74pplSzzw1THZKIgVKmS/QZ8
        KXT+cwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGLMWRmVeSWpSXmKPExsVy+t/xu7o3yo7HG3z4x2ix5OJVdov2d8vY
        LTbOWM9qcf78BnaLY6uvsFnMOL+PyWLtkbvsDuwe89ZUe2xa1cnm0bdlFaPH9Hk/mTw+b5IL
        YI3SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy3jz
        9hRTwRz2ij/3fjI2MP5h7WLk5JAQMJG4dP0OYxcjF4eQwFJGiSUrf7FBJGQkTk5rgCoSlvhz
        rYsNougTo8SFxx+ZQBJsAoYSXW9BEhwcIgJOEgcvJ4DUMAt8YJTY/GcH2CBhAX+JrtP/WUFq
        WARUJW7fLgUJ8wrYSDzsusMCMV9eYvWGA8wTGHkWMDKsYhRJLS3OTc8tNtIrTswtLs1L10vO
        z93ECAzAbcd+btnBuPLVR71DjEwcjIcYJTiYlUR4Wf4diRfiTUmsrEotyo8vKs1JLT7EaAq0
        biKzlGhyPjAG8kriDc0MTA1NzCwNTC3NjJXEeU2OrIkXEkhPLEnNTk0tSC2C6WPi4JRqYOrP
        XiJfHacUFLnzVSK76XoHxpMbXVcZsPnOFtdtVFPs3y2xM7fR9HR6Q3J4jrfa+iD3OgaOIq+m
        vAmfZ7g8nHXv6Z0LZ3lto7asvRAmpKq1YOnU7AORAjM3LVEwsrjqqz3z4SmVY/pFd/ycHXqq
        1LtaQvQ22ShePxu6TbF5Y8bynF3rfS50qUZeFYx4b+xUkPctXeCO4CmzJeLvlfK4s6P1InJ2
        3nI9xGzxe+q/b/byvNpT21t/fNn1t/FqsOBWj7O1s9bNtF4nlC2tlP/vkGrPxWPiN83/TCo7
        y3/AffnL0C6GsmWKqx429CpGVHlmL7PtENnZ83xy5wb2NQuqU8Q+NLxY91Iy0vmZ8+XZSizF
        GYmGWsxFxYkAstkmaMkCAAA=
X-CMS-MailID: 20201202111328eucas1p25b7a68b4fe94addf6088cc3ad4bedcf1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201202111328eucas1p25b7a68b4fe94addf6088cc3ad4bedcf1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201202111328eucas1p25b7a68b4fe94addf6088cc3ad4bedcf1
References: <CGME20201202111328eucas1p25b7a68b4fe94addf6088cc3ad4bedcf1@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Bootloader might use RTC hardware and leave it in the enabled state. Ensure
that the potentially enabled periodic tick interrupts are disabled before
enabling the driver, because they might cause lockup if tick interrupt
happens after disabling RTC gate clock.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/rtc/rtc-s3c.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 24a41909f049..16a326e95d46 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -503,6 +503,10 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 			goto err_src_clk;
 	}
 
+	/* disable RTC enable bits potentially set by the bootloader */
+	if (info->data->disable)
+		info->data->disable(info);
+
 	/* check to see if everything is setup correctly */
 	if (info->data->enable)
 		info->data->enable(info);
-- 
2.17.1

