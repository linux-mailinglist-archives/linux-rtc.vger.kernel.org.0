Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BAA832F197
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Mar 2021 18:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhCERo2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 Mar 2021 12:44:28 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55658 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbhCERoW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 Mar 2021 12:44:22 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210305174420euoutp013a708424c352b8970c6f1ef43cef6ade~pg0HxZjlG1781017810euoutp01N
        for <linux-rtc@vger.kernel.org>; Fri,  5 Mar 2021 17:44:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210305174420euoutp013a708424c352b8970c6f1ef43cef6ade~pg0HxZjlG1781017810euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1614966260;
        bh=GwpU8QJI1bN2R5uX44MsImk7ZGBt6pMMfyKJpdxBdfc=;
        h=From:To:Cc:Subject:Date:References:From;
        b=nrakZ5phTmF14ANKwrtiY8DbwOctwPEFK+1lDg34n4l4OgLVeEIPDp3tGz5SAXvZP
         lj9Or/Nul80ZFk2z6IyhZH9OuaROajzMJTgm/ZBDoymNqV+3OiXpReTMhu3aAp4DkI
         jXDa+BlXjVlQfEmXlsKupitN+YKUJZyLnV8Zd+hE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210305174420eucas1p110cb156faaa1734f71b51965e6628c58~pg0Hf2lFT2583125831eucas1p19;
        Fri,  5 Mar 2021 17:44:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 23.09.45488.4FD62406; Fri,  5
        Mar 2021 17:44:20 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210305174419eucas1p1639ed3bbcbc37ab3e3619e9c5d1e1629~pg0G_3TkC2829328293eucas1p1-;
        Fri,  5 Mar 2021 17:44:19 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210305174419eusmtrp1286bcaee6adb4c3572c10f8d7ec446fb~pg0G_NiV_3014530145eusmtrp1n;
        Fri,  5 Mar 2021 17:44:19 +0000 (GMT)
X-AuditID: cbfec7f5-c77ff7000000b1b0-70-60426df4ad49
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id E9.4E.21957.3FD62406; Fri,  5
        Mar 2021 17:44:19 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210305174419eusmtip1eecd032862d0733267318458ea6eee0c~pg0GwbrBR1244612446eusmtip1q;
        Fri,  5 Mar 2021 17:44:19 +0000 (GMT)
From:   =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     =?UTF-8?q?Bart=C5=82omiej=20=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH] rtc: ds1307: set uie_unsupported if no interrupt is
 available
Date:   Fri,  5 Mar 2021 18:44:11 +0100
Message-Id: <20210305174411.9657-1-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphleLIzCtJLcpLzFFi42LZduznOd0vuU4JBlc6BC2WXLzKbtH+bhm7
        xcYZ61ktbh5awWhxbPUVNou1R+6yO7B5zFtT7dG3ZRWjx/R5P5k8Pm+SC2CJ4rJJSc3JLEst
        0rdL4Mo4+PsvY8Fm7orep/2MDYwLOLsYOTkkBEwktqx5ytbFyMUhJLCCUeJ8+34mkISQwBdG
        ieMP/CESnxklXl8+w97FyAHW8XSHO0TNcqCa46IQNc8ZJQ5sPQnWzCbgKNG/9AQriC0iUC0x
        a+NZsA3MAvsYJXbem8IMkhAWCJCYtfgKWBGLgKpE87K5jCA2r4CVROv0s4wQ58lLtC/fzgYR
        F5Q4OfMJC4jNL6AlsabpOpjNDFTTvHU2M8gCCYEtHBKdt1cxQzS7SDxafY8FwhaWeHV8CzuE
        LSNxenIPC8Q39RKTJ5lB9PYwSmyb8wOq3lrizrlfbCA1zAKaEut36UOEHSXW3rnNDNHKJ3Hj
        rSDECXwSk7ZNhwrzSnS0CUFUq0is698DNVBKovfVCqivPCQ2nfzDPoFRcRaSx2YheWYWwt4F
        jMyrGMVTS4tz01OLjfNSy/WKE3OLS/PS9ZLzczcxAhPK6X/Hv+5gXPHqo94hRiYOxkOMEhzM
        SiK8tvccE4R4UxIrq1KL8uOLSnNSiw8xSnOwKInz7tq6Jl5IID2xJDU7NbUgtQgmy8TBKdXA
        NK1f/cHZtK+SfK9jroQ2pzvdflz0XKtYKKH60UxjlV2Na9sb1s9L6f4xsd1r51SW2viMjzou
        DTdvrVFNU152Kjtcpd66m+f540luRhXnj0x+d2TPXJ52+Uvy2abPNF0fF6yZ5bsvWGXZrnt6
        XMvtDedNYjr96znHk7iWb4yPY3ufpVi6syYynth5+8b97nVrI289Xns8qeznvRW+D7ZJcB34
        ccoz/fray96Pd0X4MB1xv359+7I/12dduihxtZdp28WH530CJ7x7pJklOqHhwMp9U8yMgz9e
        3f5I5ufG/gtPrGKevzCbFW0SKO20nbv8df7CsEDRfkNFi5e3lnhwbamZWrjI4cHznFMidyJz
        FkxWYinOSDTUYi4qTgQAWJn8aZcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLLMWRmVeSWpSXmKPExsVy+t/xu7qfc50SDM4+17BYcvEqu0X7u2Xs
        FhtnrGe1uHloBaPFsdVX2CzWHrnL7sDmMW9NtUffllWMHtPn/WTy+LxJLoAlSs+mKL+0JFUh
        I7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j4O+/jAWbuSt6n/Yz
        NjAu4Oxi5OCQEDCReLrDvYuRi0NIYCmjRPOlhUwQcSmJlXPTuxg5gUxhiT/Xutggap4yShw9
        1c0KkmATcJToX3oCzBYRqJW48O8WC0gRs8A+Ron9RxezgwwSFvCTmD5XHKSGRUBVonnZXEYQ
        m1fASqJ1+llGiAXyEu3Lt7NBxAUlTs58wgLSyiygLrF+nhBImF9AS2JN03UWEJsZqLx562zm
        CYwCs5B0zELomIWkagEj8ypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzAeNh27OfmHYzzXn3U
        O8TIxMF4iFGCg1lJhNf2nmOCEG9KYmVValF+fFFpTmrxIUZToA8mMkuJJucDIzKvJN7QzMDU
        0MTM0sDU0sxYSZx369w18UIC6YklqdmpqQWpRTB9TBycUg1MmmmX1iYsZg14E5WtliXe/2ee
        xzSF/plBN56xW35Tz6ue/qR+34qPL6/cszTmnmYTHJZi/KhlxalNuZn8ikz67IbNE+pPswgF
        /pbJ3zQjbeJLf9a5It8nOq0KVdJo9lBkUXpYZWXBvPLheUNvn0Jt6XOlOatOLP466VL7vItv
        33RIfOJlTmUI/Xe+PYLlH8eXd/Zsc6tfhkxLeP5P6W76Lsey+MlmMtsW/SibsfOhs3VE0B/e
        xpyD7+TSzwrfXrtUIn760eWtH9Y58eVVvU957jS9ZH3tjwOtk08Gud26IPzR+Umg5PL+jkvH
        dJcu4Ilm2KPdpPz5iPuBHeumbzo043v5Q+ZT/9PM37NJ8oqEKrEUZyQaajEXFScCALOEMCEQ
        AwAA
X-CMS-MailID: 20210305174419eucas1p1639ed3bbcbc37ab3e3619e9c5d1e1629
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210305174419eucas1p1639ed3bbcbc37ab3e3619e9c5d1e1629
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210305174419eucas1p1639ed3bbcbc37ab3e3619e9c5d1e1629
References: <CGME20210305174419eucas1p1639ed3bbcbc37ab3e3619e9c5d1e1629@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

For an RTC without an IRQ assigned rtc_update_irq_enable() should
return -EINVAL.  It will, when uie_unsupported is set.

Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
 drivers/rtc/rtc-ds1307.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index cd8e438bc9c4..b08a9736fa77 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1973,13 +1973,6 @@ static int ds1307_probe(struct i2c_client *client,
 	if (IS_ERR(ds1307->rtc))
 		return PTR_ERR(ds1307->rtc);
 
-	if (ds1307_can_wakeup_device && !want_irq) {
-		dev_info(ds1307->dev,
-			 "'wakeup-source' is set, request for an IRQ is disabled!\n");
-		/* We cannot support UIE mode if we do not have an IRQ line */
-		ds1307->rtc->uie_unsupported = 1;
-	}
-
 	if (want_irq) {
 		err = devm_request_threaded_irq(ds1307->dev, client->irq, NULL,
 						chip->irq_handler ?: ds1307_irq,
@@ -1993,6 +1986,13 @@ static int ds1307_probe(struct i2c_client *client,
 		} else {
 			dev_dbg(ds1307->dev, "got IRQ %d\n", client->irq);
 		}
+	} else {
+		if (ds1307_can_wakeup_device)
+			dev_info(ds1307->dev,
+				 "'wakeup-source' is set, request for an IRQ is disabled!\n");
+
+		/* We cannot support UIE mode if we do not have an IRQ line */
+		ds1307->rtc->uie_unsupported = 1;
 	}
 
 	ds1307->rtc->ops = chip->rtc_ops ?: &ds13xx_rtc_ops;
-- 
2.26.2

