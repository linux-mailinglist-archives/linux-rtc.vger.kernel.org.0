Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08C4E10C202
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Nov 2019 02:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728315AbfK1B4o (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 Nov 2019 20:56:44 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:46314 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727432AbfK1B4o (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 27 Nov 2019 20:56:44 -0500
Received: by mail-qv1-f66.google.com with SMTP id w11so9709272qvu.13
        for <linux-rtc@vger.kernel.org>; Wed, 27 Nov 2019 17:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UT47JVtv6T5wr+7MLrmWqlrQXnuUlrgJNXN7E5T5sys=;
        b=HCHAanvEibF4gLoVTZEabDNNsQ+jkOCBde/T5I5Su82NoeZxwYeCe17HQNBAd5ilPo
         6b8uq1gJm0emuK2Ienir+jwuIVruASZrMe6giRNJus/WPbkMyssAoWmTpZg0ePanUcxd
         cvp1yb/pLNWwdYs7a+SJCf7u6HPirQz755QbUY3hAq1At7olBhnzUNtb5Kesz0FtrlDh
         fDXPA5YrWjfqXqKVmzVkDHbbhhrK4XYNPUGSbB5emPAoPOhztNGaSdGABkSuX9qeY0IB
         +UCOFjB1QNt/9DGVwQ2ip8rTJp56g2WhCxtWotuK6YjPIb42Dcpp528AmCoZ0J0Y7ARR
         ADeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UT47JVtv6T5wr+7MLrmWqlrQXnuUlrgJNXN7E5T5sys=;
        b=USNpnfTnTanjaEagMrmUzZTD+6S3Whhf3ybQQwWH8TpuaoBbWHqQ67tk3Er8La0YmC
         1jQA561I8zMLduOqwFkkho9ugj4eTEyjexrq6xnIlrjiGGbHlTB1VFCfOKOmlIw+nKpF
         fajraBvmE7QVw1GQanrPtpy3hn7JSdyPTijge1PEi5MnQdHBjybLdGOeH9R9FyvWOOAK
         c5Bq9dwmOHMCnsO3+XnyYzR1Tvv1FKk/5I4b0wvav/YlpxAcDwEKXKn0f1hex5/S+JaO
         2jt6gXTHt+sJstmv5mfh2zd6GKme6i7seMtKXzUThyHxsaGsgkf683XjvYAVDoF9KG0R
         fKHQ==
X-Gm-Message-State: APjAAAX3nHRoX55NkBE92+K3Pgsa6eWUuy2I+yve1lw9ixmnunj6q5si
        tdWmyoXoiZ10mcgQglS5FKU=
X-Google-Smtp-Source: APXvYqzKsiYoMGLbxLXyn+006SMyekaUrqoQqT+kINo7IudkHkLJMXyhfs77JG4zKadUEQHslaxzZg==
X-Received: by 2002:a0c:d6c8:: with SMTP id l8mr8635589qvi.44.1574906202287;
        Wed, 27 Nov 2019 17:56:42 -0800 (PST)
Received: from jfddesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id m27sm9064572qta.21.2019.11.27.17.56.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Nov 2019 17:56:41 -0800 (PST)
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     git@xilinx.com, linux-rtc@vger.kernel.org, michal.simek@xilinx.com,
        champagne.guillaume.c@gmail.com, maxime.roussinbelanger@gmail.com,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH 1/2] rtc: zynqmp: re-use rtc_time64_to_tm operation
Date:   Wed, 27 Nov 2019 20:56:12 -0500
Message-Id: <20191128015613.10003-1-jeff.dagenais@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This allows a subsequent commit to spin_unlock sooner.

Signed-off-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
---
 drivers/rtc/rtc-zynqmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 2c762757fb54..cb78900ec1f5 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -94,7 +94,7 @@ static int xlnx_rtc_read_time(struct device *dev, struct rtc_time *tm)
 		 * RTC has updated the CURRENT_TIME with the time written into
 		 * SET_TIME_WRITE register.
 		 */
-		rtc_time64_to_tm(readl(xrtcdev->reg_base + RTC_CUR_TM), tm);
+		read_time = readl(xrtcdev->reg_base + RTC_CUR_TM);
 	} else {
 		/*
 		 * Time written in SET_TIME_WRITE has not yet updated into
@@ -104,8 +104,8 @@ static int xlnx_rtc_read_time(struct device *dev, struct rtc_time *tm)
 		 * reading.
 		 */
 		read_time = readl(xrtcdev->reg_base + RTC_SET_TM_RD) - 1;
-		rtc_time64_to_tm(read_time, tm);
 	}
+	rtc_time64_to_tm(read_time, tm);
 
 	return 0;
 }
-- 
2.23.0

