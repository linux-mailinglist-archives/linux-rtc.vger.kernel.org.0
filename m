Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 051E4107DDF
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Nov 2019 10:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbfKWJMp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 Nov 2019 04:12:45 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45253 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfKWJMp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 23 Nov 2019 04:12:45 -0500
Received: by mail-pf1-f193.google.com with SMTP id z4so4843194pfn.12
        for <linux-rtc@vger.kernel.org>; Sat, 23 Nov 2019 01:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nFWnZ2FzKgCugRqBg/uYXPf6ir4D9ZNbegmDxIANaBc=;
        b=Mnq/CPg67245rt0O0RTErKu+VYBd2ZvWhwQ/uoMlCI7ImEe5pY8ObKxBl0+xgfRhTc
         me3BuXygdTGG3ro9w/pyaEgrlDRgV3rmOnoX4qfJLu+7HHaV8ediuHfTtLuBGd0BqdxW
         zamkQ8ggBYTEjQfiBbtJ+jlJD76iiWgxSvcfcRu1U/9OV3JP5F2m2OYadb/I8RQlCaBh
         4V+H9FnZqcRQG/d1C2wzPHnHQyHfQea5l5aX9d6VT6CzK91lL7uKr72Fb7MPcPSDSPwY
         shyjzZe4lnYxOKdUN+shjBG/o58AdNGkCN2VaovKnJfdcM+F5zjHvC/BLkUGM0w9vriR
         NxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nFWnZ2FzKgCugRqBg/uYXPf6ir4D9ZNbegmDxIANaBc=;
        b=QQv4jKlG7dO/wYTD3SIIAgMkSeHMT8Pzkux+FuHHZ/Htm2zbhcz9c2ivjw3jUl5kVr
         Iz/2ATGMUStpld0WuRYDkuJlAxZEStq4d8XXwaAHJaheCwUCCxBNzo7/1rjrIf2ktmEE
         l4qLJ8TZ1bxMMuPTTRrf6JdXmwAisNi+PvaL/Hgf1CYH/qCptGlNkt70i3LMt1cgzpto
         rJHnkPIDlAzicIsiSqDHzhxtlJMzF0s0cOCyKk8Pv8BFCtDyizGw14hW8ST0gQVz6lmu
         HTPAmFlWTCAv2C9JqhUM2r0gGJ7aWEHH2xVE0Qc+3CPrzDDlgEnh46niH8i+mLrXH3kt
         XYQQ==
X-Gm-Message-State: APjAAAVcCnz9781jTZle9wekmzhtwgdTXLRHuuzpJd8o8oPmztd67aFy
        TL/gmhvQKcKNPSMhxGGPShYp
X-Google-Smtp-Source: APXvYqx6EFSXWWe+GwkEWeFzMjRzLFjjpvt6eVALFEUIzt6CWidstOEpu6c0MIu6Zb92GKrRek7FWw==
X-Received: by 2002:a63:90ca:: with SMTP id a193mr731484pge.417.1574500364749;
        Sat, 23 Nov 2019 01:12:44 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:e0b0:dddb:81ef:e64d])
        by smtp.gmail.com with ESMTPSA id a19sm781641pfn.144.2019.11.23.01.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2019 01:12:44 -0800 (PST)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
X-Google-Original-From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, david.paris@st.com,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] rtc: st-lpc: Remove struct resource from struct st_rtc
Date:   Sat, 23 Nov 2019 18:12:41 +0900
Message-Id: <20191123091241.1905-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

struct resource in struct st_rtc is not used, remove it.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-st-lpc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-st-lpc.c b/drivers/rtc/rtc-st-lpc.c
index f1c5471073bc2..51041dc08af4b 100644
--- a/drivers/rtc/rtc-st-lpc.c
+++ b/drivers/rtc/rtc-st-lpc.c
@@ -41,7 +41,6 @@
 struct st_rtc {
 	struct rtc_device *rtc_dev;
 	struct rtc_wkalrm alarm;
-	struct resource *res;
 	struct clk *clk;
 	unsigned long clkrate;
 	void __iomem *ioaddr;
-- 
2.24.0.rc1

