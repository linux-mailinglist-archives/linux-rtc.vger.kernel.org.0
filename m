Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307AD26908A
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Sep 2020 17:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgINPqe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Sep 2020 11:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726306AbgINPq1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 14 Sep 2020 11:46:27 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32123C061351
        for <linux-rtc@vger.kernel.org>; Mon, 14 Sep 2020 08:46:07 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id y15so564749wmi.0
        for <linux-rtc@vger.kernel.org>; Mon, 14 Sep 2020 08:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qUo9FGy3DJ1HIJTn23pZSHLPlWdvQkOdenBVqoTjpIg=;
        b=K3ZPLBWVRVTSIxU+c7mMndyVpQPPXct3b6XnpbxZZ+1OsV5CZ86Cdyb2PBnxowJ/Y+
         VbsblkgEKxUK0gyyj+jkmXOT+qkmI35yeO6gFXV/Xh/n/hUOrUkqWRVvhP8qrvopD30l
         2gf7eKf8JiTl9yuqyI/lFQ2Y5bRkP1RQzbxJcaemkk9ouzBSwebxvDqwuj8Y0JIQq5MK
         Ay+yw5QRt955hKqyzVsax67gqvEQmEx1z6ndBDh7DVxn2x19NxR+IcfBkYNavx4fHBt3
         e3lJF5pqze78diidk4IGPwJL5iEybfP75JFs1Za6RSWgNwaWuoWCxhyYeYR0WppXJiJO
         sO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qUo9FGy3DJ1HIJTn23pZSHLPlWdvQkOdenBVqoTjpIg=;
        b=Rwzh69xB/5WrwQXQ+J4qdwNNmQQwkXxQv4+2aRrmiHHood8u+99x6e/ImAuTelkG9n
         4y11xwoSEPaZRdNueK/0mkibliymkpphMglSxUsvGLkb6wdkt4qXabSSv4bsWTfLTyfb
         McT84Ep/GicnFedeU77k3VtpCi13XoshZ/mAjSLfuDyi8c+VYU12r4JJtwdbvr+ZWW4y
         jJ2aGGqxpQT5HdbLqnKhEI+IpxsJiJUhmj0zPCLVfQz5mizArncLEnYJZQxKlUgPxiHY
         HF+P95nESX0XWU6Ntyt2j25gTzjJ9+yRGDUv67ZHP7quD/4smV+74t1shPWQ8LX+MxhG
         L6yw==
X-Gm-Message-State: AOAM532XrZxRg8NyeDPOhl9b2cjbrtASeeqiWYV1wtuqgo3M2hi+ufsM
        L4i2yiQulSt5GiVyqZq+ZN3fWA==
X-Google-Smtp-Source: ABdhPJxxxKyyRa5aJn/A7LZ7NnBJdKU5wwFQ5c5WzMjAF0Dqio7hlGKF8IpL9IFW0tJ+Ci2qpZY35g==
X-Received: by 2002:a05:600c:204e:: with SMTP id p14mr20196wmg.182.1600098365916;
        Mon, 14 Sep 2020 08:46:05 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id l19sm19510448wmi.8.2020.09.14.08.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 08:46:05 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 02/14] rtc: rx8010: remove a stray newline
Date:   Mon, 14 Sep 2020 17:45:49 +0200
Message-Id: <20200914154601.32245-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200914154601.32245-1-brgl@bgdev.pl>
References: <20200914154601.32245-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Remove an unnecessary newline after requesting the interrupt.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 08c93d492494..c6797ec0aba1 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -454,7 +454,6 @@ static int rx8010_probe(struct i2c_client *client,
 						rx8010_irq_1_handler,
 						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 						"rx8010", client);
-
 		if (err) {
 			dev_err(&client->dev, "unable to request IRQ\n");
 			return err;
-- 
2.26.1

