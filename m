Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95E19F3CCF
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Nov 2019 01:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfKHAY4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 Nov 2019 19:24:56 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34110 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfKHAY4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 Nov 2019 19:24:56 -0500
Received: by mail-pl1-f196.google.com with SMTP id k7so2799387pll.1
        for <linux-rtc@vger.kernel.org>; Thu, 07 Nov 2019 16:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dxGkLl0txDSPVHDpFQHHcARZeMcTTmVGugSLhAA/rSY=;
        b=t2ABnA0lVKrBUldUNOlSRCAwEcBfTTWRbt3KEcXn50VlFOYHNuFmnGOFfMeWQo0NsM
         uMgMcLJD7qqk8hgaK36B04h7ErX3UZCsbmw9oYvIzCNFSMOBDn41iMeoy2+RaUXi4Hd3
         JqnVc1VAeN/k/1dsQcQS/oMa1VZhKZTbq3DUrz6PJ/qV5lc4sNsf7DQZsl5payAMOqFY
         syP6qITSA1Te1h0/DUZwijI3vjr3WeQ+uoB5dULVmkyrfy+0/z9Q/AbYvcpiQfgLzJ1z
         +w9RKcLIaRQSc+icViFJTedKTvNo32boTJIIy8evqFEjPKqS+6A1xoRjcZkQkYe9QO2I
         Fglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dxGkLl0txDSPVHDpFQHHcARZeMcTTmVGugSLhAA/rSY=;
        b=LuhdoCetcdFUfTGO9vRWxKXvRVEdzXuRspKilBC6+TJw4QYs+ZGPcJlKi1GFN39A+w
         0qtCnoQ9N7h5ZDnWSytkvWGBKqFAvuNIdQrE+OLdlwOgZo6CT65CxEZsgVayHj9r2aEi
         hg241WiC8fkHvNXVZQ0n22bCdiZPBy80Rwfth11H/jEJQDT+R1oJ48uAah4EGKp6BZWI
         vKkIFbphyqgmcT//rJHnk/pyrAFuoyFEsM319Ycyl7mVDFmzuB7cremkVDCugNY5VfrY
         MZLmo84e0XY8qpslhIwl9EbBzKps/MibA11AynalOAcwGz6ZRg3/L8AxHmiRdbvHYuSz
         jeZQ==
X-Gm-Message-State: APjAAAVVLUbd9aWpxMfYRB+Z+tiKt+0QFisM9CiR2JoAqauthMbcbk8x
        mB9MI0LyZb4YPWaPg55waUF0
X-Google-Smtp-Source: APXvYqzsjZi06U6KDjZpY5SN94Oh6dVcbFbUWZaLZOfgomMVn72UFfZTYmPlp4YxyMypd9mD74+ZuA==
X-Received: by 2002:a17:902:8ec7:: with SMTP id x7mr7237123plo.88.1573172693933;
        Thu, 07 Nov 2019 16:24:53 -0800 (PST)
Received: from localhost (b152239.dynamic.ppp.asahi-net.or.jp. [202.213.152.239])
        by smtp.gmail.com with ESMTPSA id 19sm3919189pjd.23.2019.11.07.16.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 16:24:53 -0800 (PST)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] rtc: pcf8563: Constify clkout_rates
Date:   Fri,  8 Nov 2019 09:24:49 +0900
Message-Id: <20191108002449.15097-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The lates of clockout should be marked const. Make that so.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-pcf8563.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 24baa4767b11..3c322f3079b0 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -390,7 +390,7 @@ static int pcf8563_irq_enable(struct device *dev, unsigned int enabled)
 
 #define clkout_hw_to_pcf8563(_hw) container_of(_hw, struct pcf8563, clkout_hw)
 
-static int clkout_rates[] = {
+static const int clkout_rates[] = {
 	32768,
 	1024,
 	32,
-- 
2.24.0.rc1

