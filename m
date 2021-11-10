Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D58044C217
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Nov 2021 14:30:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbhKJNcr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Nov 2021 08:32:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbhKJNcq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Nov 2021 08:32:46 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7296BC061764
        for <linux-rtc@vger.kernel.org>; Wed, 10 Nov 2021 05:29:59 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id h12-20020a056830034c00b0055c8458126fso3977106ote.0
        for <linux-rtc@vger.kernel.org>; Wed, 10 Nov 2021 05:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7OP6MCz09rURM8nnqMHgNshjXdtmJaHUfXAtp8CCNs8=;
        b=p+aV14dQYKxz/No0s3MQgM+2YfgeA1UMMOCZTBHpQqHfc9GkFtUd7uEMSVObtXKIfi
         ezib9ZaU6Y94QDWQ8LkcvKVvnt8MF5kimHTFXaOOqD0oD8azFlzhSOzJYpfY5rgqsbh4
         kGrt/1VNDxPmIjaWWaW+hr+lKgzDtPMNzJ7kqWLOriOHTqb4njQAYhU6JECrPhPcdruy
         0lwE69rU2ntwPUd1Pfz6EeoCV3z6PdkV3ulA0dkSczidHetJaIy4V2+iMIv8PW9wB3Hb
         MxyUy0fnmcPAaENP37yjVhSwdeAimvc+1YlSctF3sJgc7JovsBpIRtW/4dewc+AJjUAo
         LsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7OP6MCz09rURM8nnqMHgNshjXdtmJaHUfXAtp8CCNs8=;
        b=uwUcfJ1Upby7FNm7BEcSVgRxRNX+pN3UsU1g6sBrL+3rseZeqRY23vkPduy3EGizmd
         iNkk50w+/vu5siFW9C3QPMFNsO17h8LI5GlkEP5Ik1MKQ4YBxrt9dhWr/ecEq9NqNKs8
         wg3wsiPnuzYhDZK/HxEUqOEv2Kc0Vo+F9L26cj7yETDUeyuIWTKEWPWyn1EnD4HZJ8lm
         D1lEAqMUoW2pdcjFHri86X7Rz+5LVpDGVa/Lk945/4AqP0n5f7WUEVqNn9/WIvi8CvJM
         4fwBxOFSc/NG0JOcZaB6GTcZUD6gqg6Tg2FFdMUT5Kold45EyVbZB2DanRoobCt10E3q
         jdtQ==
X-Gm-Message-State: AOAM533z/8sOvJ96/NWdXYW1NnciY8UEgBNprD0QWcDbwqnsw/ruOIqm
        jtI6fBrcCrgCCyQ4U7mZGJ4=
X-Google-Smtp-Source: ABdhPJxL3LxiikA+2+SQytJE5dtCow5/cC4UPs9U/hr+E2bxsgYX05G2aoN2LiOCpa9c8lyzvcUzIg==
X-Received: by 2002:a9d:71dc:: with SMTP id z28mr12923740otj.244.1636550998850;
        Wed, 10 Nov 2021 05:29:58 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:bd4f:acc1:b596:17e6])
        by smtp.gmail.com with ESMTPSA id q5sm8629676otg.1.2021.11.10.05.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 05:29:58 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, otavio@ossystems.com.br,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] rtc: rv8803: Add support for the Epson RX8804 RTC
Date:   Wed, 10 Nov 2021 10:29:46 -0300
Message-Id: <20211110132946.514825-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110132946.514825-1-festevam@gmail.com>
References: <20211110132946.514825-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The Epson RX8804 RTC has the same programming model as RV8803.

Add support for it in the driver.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/rtc/rtc-rv8803.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 0d5ed38bf60c..f69e0b1137cd 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -55,6 +55,7 @@
 
 enum rv8803_type {
 	rv_8803,
+	rx_8804,
 	rx_8900
 };
 
@@ -601,6 +602,7 @@ static int rv8803_probe(struct i2c_client *client,
 
 static const struct i2c_device_id rv8803_id[] = {
 	{ "rv8803", rv_8803 },
+	{ "rv8804", rx_8804 },
 	{ "rx8803", rv_8803 },
 	{ "rx8900", rx_8900 },
 	{ }
@@ -616,6 +618,10 @@ static const __maybe_unused struct of_device_id rv8803_of_match[] = {
 		.compatible = "epson,rx8803",
 		.data = (void *)rv_8803
 	},
+	{
+		.compatible = "epson,rx8804",
+		.data = (void *)rx_8804
+	},
 	{
 		.compatible = "epson,rx8900",
 		.data = (void *)rx_8900
-- 
2.25.1

