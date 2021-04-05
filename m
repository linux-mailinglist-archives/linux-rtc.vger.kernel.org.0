Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA2573542A4
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Apr 2021 16:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235763AbhDEOOW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Apr 2021 10:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237330AbhDEOOW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Apr 2021 10:14:22 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BCE1C061756
        for <linux-rtc@vger.kernel.org>; Mon,  5 Apr 2021 07:14:15 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id x14so11537955qki.10
        for <linux-rtc@vger.kernel.org>; Mon, 05 Apr 2021 07:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XQ3qISi/YWIUN1m0Dyex7VkqXyU0ufbTkMmNL7pVVu0=;
        b=Tcf7iUIsleVVm1KpPVBoneGqEUaIP1PPLCB9nMznmjwtc0kFKTsk5ZQKMNvrqM+kpR
         DHSywJEXFqxXS2Kfb70RAWBcwdafJyPqceTCSdRMB1b3QEzsEwjW1FR3bWL0m8HcYMOM
         NI8CAR+otgqWsnpAFoiWUv7LywpT0kVPdRY7mTn3iZF8/kNuiT73eHpZY+FXHzRRlJCU
         vALUPYSM/mmqzX2JoGN8Ax57CU/UB6l7n1dxHMYtwrqPb3S6ezZDVEYAMj0Ep73vupPs
         naQEnQUiChL3o+9qfPDJB9k2kJmxAJfAMpemXqdIfcA27G6lDQdblY169XjoXQ9cdOia
         fyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XQ3qISi/YWIUN1m0Dyex7VkqXyU0ufbTkMmNL7pVVu0=;
        b=dKU/ndXg+G+onFgNqttijUUQNsi9IScrE/to9Bb9gRNRwgq9IzHkbr+OZQs2GP5owI
         civV+H1SArNRVdG1Kl0Lxp3F9n7stHXytXoDkVutNuD10WFr2aciDlkWRGd+K00NqW69
         yMq4EHlbAnDMUvmh/lAyVlgPz/7W1GdLBniPGPhot5ALGxrjeehI9HfWZiNM3Fwzw9NH
         w20V3zDQ7KDBtDJ7HPWhwQPeRgdtZ1nAx9nsceBuDDjzWrv2ncq32HzBqHykAJu7QEUa
         aoSSPdzGF6x89FbPaSroQa4TKFe7mxIq4vrziAo1dsVDO0veAnaX6EgepnC1d4vFXHpL
         Hovg==
X-Gm-Message-State: AOAM5335jOMY6VVYo+IhbvB1DlKp+aP09nimBrNgbGFEv4kYq8MQTR0m
        IvS9Qtxa+Yqn/5A8NXG9mWg=
X-Google-Smtp-Source: ABdhPJxO3M2T4dTV0hOcDSFJpnOjSnS2eMUL7SVuMpUVGrLWXlrupaphcfQqXcyJowbLcdOI9wqxtA==
X-Received: by 2002:a37:a08e:: with SMTP id j136mr24449443qke.266.1617632054646;
        Mon, 05 Apr 2021 07:14:14 -0700 (PDT)
Received: from shaak.xiphos.ca (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id h14sm11970633qtx.64.2021.04.05.07.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:14:14 -0700 (PDT)
From:   Liam Beguin <liambeguin@gmail.com>
To:     liambeguin@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, panfilov.artyom@gmail.com
Cc:     linux-rtc@vger.kernel.org
Subject: [PATCH v1 2/4] rtc: ab-eoz9: set regmap max_register
Date:   Mon,  5 Apr 2021 10:13:32 -0400
Message-Id: <20210405141334.3884528-3-liambeguin@gmail.com>
X-Mailer: git-send-email 2.30.1.489.g328c10930387
In-Reply-To: <20210405141334.3884528-1-liambeguin@gmail.com>
References: <20210405141334.3884528-1-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Liam Beguin <lvb@xiphos.com>

Set regmap's max_register property to allow users to dump registers
using debufgs.

Signed-off-by: Liam Beguin <lvb@xiphos.com>
---
 drivers/rtc/rtc-ab-eoz9.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
index 2568984fb8d3..379a231f673c 100644
--- a/drivers/rtc/rtc-ab-eoz9.c
+++ b/drivers/rtc/rtc-ab-eoz9.c
@@ -260,6 +260,7 @@ static const struct rtc_class_ops rtc_ops = {
 static const struct regmap_config abeoz9_rtc_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
+	.max_register = 0x3f,
 };
 
 #if IS_REACHABLE(CONFIG_HWMON)
-- 
2.30.1.489.g328c10930387

