Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4BE107DD8
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Nov 2019 10:02:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbfKWJCj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 Nov 2019 04:02:39 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38413 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfKWJCj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 23 Nov 2019 04:02:39 -0500
Received: by mail-pg1-f195.google.com with SMTP id t3so4205039pgl.5
        for <linux-rtc@vger.kernel.org>; Sat, 23 Nov 2019 01:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PIzcYlAk6YSZHIwi9WpRps7/Iir5GlfKykqs3HRnpYs=;
        b=zyxjlJ1r+VEs6Bxl2chDMfiRARGjGhKJLgQ7ZLN4/Qgsa0Fl1r+u+UkioCaCM0eg4F
         HcqFVpfNf7TPy3+Vx8Z3lLyQWvIupWDay7sV/jNSK+E4gMjmdai46OOFgAOCzq8AQHOz
         rvSVhLElJQLWBkEUpJe6dnieoyHzFzTtEH8OD6ZWp8snZsxb7nJqU9l/k2vwUnjX+Aom
         JCayk6bALOuKP1t92eDJHayjj1PG5QJk7ZX72BnvZABw37SX1EhYIkpKsdErdm6rtGtJ
         CbhmEE6fA6pSiK4ytciWc94hyhgr7jJqExPavnpqUhixgv1GjkpuO4m60cr+sCbTHf9T
         iTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PIzcYlAk6YSZHIwi9WpRps7/Iir5GlfKykqs3HRnpYs=;
        b=ZRLtR2lIVsp16JT+mK6BnMw4j4diPpmSMAHqAKyF49z6UqobMV5QVISwRI27vmSTtS
         USrcS/CZAwCtHrkifQGIrnDdu3WXjZMdAo7zMIgVz0KsY08uW/rD7pSjrSD+ihOnEWWx
         UJ7c2B9GdwvK3e33jYmxNTXe3YQzF7GBlasURJAp9Ah4wQ4py/1YvqS84jQb93oe+Rns
         K74edDh/s5eets45mEWHOXEYSOx+MqWRRbu4k8jVKYgesgslcLnjgq3+Sg7+porfNl1+
         QdmDpF6dCRTbx72x3kbHJ2R3ClIaZTHtfN5V5bKM/Kjx44vIul2/e9VXDE7B/lfwbhcY
         w7Dg==
X-Gm-Message-State: APjAAAUFebdcMI282M4rD0mny4MPDKZYD+G1IRn3+ytlstCx5n+mkFBC
        HFeP7nJzmympzwyDyDU92zg3
X-Google-Smtp-Source: APXvYqzaD6Q8VZ8beXIB1oRhcLxg6E0/m3+mDgNpNa96fbF/MeSDRs2qqDm4OcpSG93h3Wy+N0CqGQ==
X-Received: by 2002:a63:591:: with SMTP id 139mr21089259pgf.0.1574499757917;
        Sat, 23 Nov 2019 01:02:37 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:e0b0:dddb:81ef:e64d])
        by smtp.gmail.com with ESMTPSA id z11sm762443pfg.117.2019.11.23.01.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2019 01:02:37 -0800 (PST)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
X-Google-Original-From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, rsahu@apm.com,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] rtc: xgene: Remove unused struct device in struct xgene_rtc_dev
Date:   Sat, 23 Nov 2019 18:02:34 +0900
Message-Id: <20191123090234.32180-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

struct device in struct xgene_rtc_dev is not used, remove it.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-xgene.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-xgene.c b/drivers/rtc/rtc-xgene.c
index 603c4e444fd06..96db441f92b3e 100644
--- a/drivers/rtc/rtc-xgene.c
+++ b/drivers/rtc/rtc-xgene.c
@@ -34,7 +34,6 @@
 
 struct xgene_rtc_dev {
 	struct rtc_device *rtc;
-	struct device *dev;
 	void __iomem *csr_base;
 	struct clk *clk;
 	unsigned int irq_wake;
@@ -144,7 +143,6 @@ static int xgene_rtc_probe(struct platform_device *pdev)
 	if (!pdata)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, pdata);
-	pdata->dev = &pdev->dev;
 
 	pdata->csr_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pdata->csr_base))
-- 
2.24.0.rc1

