Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2C518FAA4
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Mar 2020 17:59:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727572AbgCWQ7G (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Mar 2020 12:59:06 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:55793 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727532AbgCWQ7G (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Mar 2020 12:59:06 -0400
Received: by mail-pj1-f67.google.com with SMTP id mj6so94067pjb.5;
        Mon, 23 Mar 2020 09:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=MkMZMykbgF51hxSABpWkLu0UuWfliY17yizyDulcCcM=;
        b=QCbfDq3oGRPAht0bz7pdwG+/s7C98PKYTgvx+f2gGttgL3j94ZBhT9VL1y3AyXV2/t
         YK7CFNjn8ohLePWY6p3fS6YkesPObEjKA3jkqdzqutT8VwWUDnjTs92sPrkjc/G+GgNN
         1tKm/ocwkDewgY5mWDLBTr+vk1IlAJ9yic4vGuDDthow5Du1/P97gVz3yLk9/YpgVqHI
         3668lPUzzGJe6Cbzk7nQXaWtPgzDVjyi7IuPzF8PyOq1zJqX9eiAb1hSE9gwGCu1054O
         m1NyTfperrPY+PxgKI+bTeGN3FtJxIUkTsRJC+GHkgRmye2C/lvH5Cs10amyOvTuR41G
         bYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MkMZMykbgF51hxSABpWkLu0UuWfliY17yizyDulcCcM=;
        b=tFIPoNsi3K+Oy7/LD9vdMn9Q398jsspGkSNPhlIgzxecEXfXfxBI9pxU1pmR66BhBs
         OcuZmVjYlaj6z7i0rimzRr7ic42b/eKbEmYrgSdXOZ6FZQd0b1AFS5KokI2HeUe8Prxp
         zF8gPdEx7xYSVddqh+KP7O628rrZ1UTIO2NeWSWMjI7ohiNOIcHgsV8O9eZVDidd0q9m
         JH1kvDpPzjyqLr9KPUXfAbh9MeElj3CiHieKhEUKYe/Ky/yB123wxcOCj4FvWO0jlnPY
         uv/v/ftNVF64kBn+kCB3GslZum7n3H4+511YuSok8sK4InvpuNHyBeFBJFk1GzMDRFKW
         4t6A==
X-Gm-Message-State: ANhLgQ1HbgaV8EG/mmvw0ZWFhWSQnPVXpRWGFq02svvicKi/YCDMSd28
        VCiHkS4qb0iyN+uuq/1IVv4EW3D/hD4=
X-Google-Smtp-Source: ADFU+vs1Q/9+egtKpJHm+AazcP4CHnerPBhcb0v+FGKXydoGo9weENr3jlCM/BYJJyBIQhg2nn4S7A==
X-Received: by 2002:a17:902:a9c9:: with SMTP id b9mr6852442plr.274.1584982745320;
        Mon, 23 Mar 2020 09:59:05 -0700 (PDT)
Received: from VM_0_35_centos.localdomain ([150.109.62.251])
        by smtp.gmail.com with ESMTPSA id u5sm13820361pfb.153.2020.03.23.09.59.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Mar 2020 09:59:04 -0700 (PDT)
From:   Qiujun Huang <hqjagain@gmail.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiujun Huang <hqjagain@gmail.com>
Subject: [PATCH -next] rtc: remove set but not used variable 'np'
Date:   Tue, 24 Mar 2020 00:59:01 +0800
Message-Id: <1584982741-648-1-git-send-email-hqjagain@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

drivers/rtc/rtc-fsl-ftm-alarm.c: In function 'ftm_rtc_probe':
drivers/rtc/rtc-fsl-ftm-alarm.c:246:22: warning: unused variable 'np'
[-Wunused-variable]
  struct device_node *np = pdev->dev.of_node;

commit cd49b579e705 ("rtc: fsl-ftm-alarm: enable acpi support")
involved this unused variable, remove it.

Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
---
 drivers/rtc/rtc-fsl-ftm-alarm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index c572044..0f4142b 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -243,7 +243,6 @@ static int ftm_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 
 static int ftm_rtc_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	int irq;
 	int ret;
 	struct ftm_rtc *rtc;
-- 
1.8.3.1

