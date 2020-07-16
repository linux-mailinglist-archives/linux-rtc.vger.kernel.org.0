Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C776221BFF
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jul 2020 07:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725844AbgGPFe4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 16 Jul 2020 01:34:56 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:44728 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgGPFez (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 16 Jul 2020 01:34:55 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200716053453euoutp01534fb19f3c0b398d8acb0e034e58525e~iJM-fzTyO2545225452euoutp01S
        for <linux-rtc@vger.kernel.org>; Thu, 16 Jul 2020 05:34:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200716053453euoutp01534fb19f3c0b398d8acb0e034e58525e~iJM-fzTyO2545225452euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1594877693;
        bh=EGLc4jkc1p5rrc/cUS9Dk6+hoxq8FAapraXELs8U8Yk=;
        h=From:To:Cc:Subject:Date:References:From;
        b=pkJRdwlywNZOfIBN3JXF/kklO+tuUuGweGXhVMq/U7mO3d/vnxWWsOw2m88838wN/
         yA1xa6lI/HuNhw8ThlvxO3wCqCJFJwvP59h3Cj48t7MXdwUqDIziOz7H5eN9myU6QB
         4wCBIlPlBtdHHLDM3VHGXucZnRMRkTU7eDCWVO+E=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200716053452eucas1p1998bcc0b74f0444a037798bc2fc0f003~iJM_9bvEt2631026310eucas1p1-;
        Thu, 16 Jul 2020 05:34:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 10.CF.05997.CF6EF0F5; Thu, 16
        Jul 2020 06:34:52 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200716053452eucas1p24dedd4565b90817c244724b1c52a8329~iJM_fcvKb1179211792eucas1p2P;
        Thu, 16 Jul 2020 05:34:52 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200716053452eusmtrp2b5e8aacbdfadc8bea802abc185a7effc~iJM_e1aSI2921329213eusmtrp2T;
        Thu, 16 Jul 2020 05:34:52 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-d7-5f0fe6fcd8b8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id A8.D0.06017.CF6EF0F5; Thu, 16
        Jul 2020 06:34:52 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200716053451eusmtip13e6ec436521e9ed6ef5c0a86da09c260~iJM_DLazq0093600936eusmtip1I;
        Thu, 16 Jul 2020 05:34:51 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] rtc: pl031: fix alarm support
Date:   Thu, 16 Jul 2020 07:34:38 +0200
Message-Id: <20200716053438.3498-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIIsWRmVeSWpSXmKPExsWy7djPc7p/nvHHG0xYrGyx5OJVdov2d8vY
        Lab8Wc5ksenxNVaLy7vmsFkcW32FzWLtkbvsDuwe89ZUe9y5tofNY/OSeo++LasYPabP+8nk
        8XmTXABbFJdNSmpOZllqkb5dAlfG1D8LWQtWsFdM3XiDpYFxFlsXIzuHhICJxLP6LkYuDiGB
        FYwSj7vns0I4Xxgl5h2YzgjhfGaUePt3M3MXIydYw47rF5ggEssZJXob3iG03Dj7DayKTcBQ
        outtFxuILSKQLHHm8Ws2kCJmgZ1AS+aeY+li5OAQFtCT2DE7GaSGRUBVYt75X+wgNq+AjcTH
        59NZIbbJS6zecIAZpFdC4D6bxK7DLYwQCReJdYe3QxUJS7w6voUdwpaR+L9zPhNEQzOjxMNz
        a9khnB5GictNM6C6rSXunPvFBnIFs4CmxPpd+hBhR4kle16BHSchwCdx460gSJgZyJy0bToz
        RJhXoqNNCKJaTWLW8XVwaw9euAQNIQ+J3RfWgS0SEoiV+PTmC+sERrlZCLsWMDKuYhRPLS3O
        TU8tNspLLdcrTswtLs1L10vOz93ECEwIp/8d/7KDcdefpEOMAhyMSjy8Cj/54oVYE8uKK3MP
        MUpwMCuJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iFGag0VJnNd40ctYIYH0xJLU7NTUgtQimCwT
        B6dUA2OirJnhvomB/W2x72ZtqNRNND0rMaess0q5ffafeJ2rxg3/KpmXNZ7cl5OptCttJlvf
        ll8HllkFsju0TJe4JspnzKW7Lejx/K39SQ8OLf/7/PbvtKsOtdMn9EVc/ZJ73Uhy/W2lvswT
        9SHn9Qq1Xgu9ql0Zt8NmXfCS5OCMFRsSvAT8VnJaciuxFGckGmoxFxUnAgCmzfPBBAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBLMWRmVeSWpSXmKPExsVy+t/xu7p/nvHHGzQeZ7dYcvEqu0X7u2Xs
        FlP+LGey2PT4GqvF5V1z2CyOrb7CZrH2yF12B3aPeWuqPe5c28PmsXlJvUffllWMHtPn/WTy
        +LxJLoAtSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8u
        QS9j6p+FrAUr2CumbrzB0sA4i62LkZNDQsBEYsf1C0xdjFwcQgJLGSXufb7LCJGQkTg5rYEV
        whaW+HOtiw2i6BOjRNPvOywgCTYBQ4mut11gk0QEUiVevj7LCFLELLCbUWL3xVdA3RwcwgJ6
        EjtmJ4PUsAioSsw7/4sdxOYVsJH4+Hw61AJ5idUbDjBPYORZwMiwilEktbQ4Nz232EivODG3
        uDQvXS85P3cTIzAUtx37uWUHY9e74EOMAhyMSjy8Cj/54oVYE8uKK3MPMUpwMCuJ8DqdPR0n
        xJuSWFmVWpQfX1Sak1p8iNEUaPlEZinR5HxgnOSVxBuaGppbWBqaG5sbm1koifN2CByMERJI
        TyxJzU5NLUgtgulj4uCUamBkcfeb9uVXrZhc0rvTnA2PgnYWyfrMUhEzWr5qls1NbZvjR1RF
        krY5lYrHcNxscl3b9089xW/1NjXDE9MqZmddK719rubau58VK+UDZZKlf7Lr+y5WKPqV0b//
        aJvzo903z73dmDbl9XvOIwddnsVvNqlt6+mdOO3BA8FVq9njY3Wl1xxW9E1SYinOSDTUYi4q
        TgQAE6oRHVsCAAA=
X-CMS-MailID: 20200716053452eucas1p24dedd4565b90817c244724b1c52a8329
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200716053452eucas1p24dedd4565b90817c244724b1c52a8329
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200716053452eucas1p24dedd4565b90817c244724b1c52a8329
References: <CGME20200716053452eucas1p24dedd4565b90817c244724b1c52a8329@eucas1p2.samsung.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Commit 75a472845196 ("rtc: pl031: switch to rtc_time64_to_tm/rtc_tm_to_time64")
adjusted driver to the new API, but during the conversion a call to enable
alarm irq in set_alarm() was lost. Restore it, what fixes alarm support in
the PL031 RTC driver.

Fixes: 75a472845196 ("rtc: pl031: switch to rtc_time64_to_tm/rtc_tm_to_time64")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/rtc/rtc-pl031.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
index 40d7450a1ce4..c6b89273feba 100644
--- a/drivers/rtc/rtc-pl031.c
+++ b/drivers/rtc/rtc-pl031.c
@@ -275,6 +275,7 @@ static int pl031_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	struct pl031_local *ldata = dev_get_drvdata(dev);
 
 	writel(rtc_tm_to_time64(&alarm->time), ldata->base + RTC_MR);
+	pl031_alarm_irq_enable(dev, alarm->enabled);
 
 	return 0;
 }
-- 
2.17.1

