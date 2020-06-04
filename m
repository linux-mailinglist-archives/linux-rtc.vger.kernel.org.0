Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB4061EE888
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Jun 2020 18:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729641AbgFDQ0S (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 4 Jun 2020 12:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729540AbgFDQ0S (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 4 Jun 2020 12:26:18 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0BF8C08C5C0;
        Thu,  4 Jun 2020 09:26:17 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id r9so5845756wmh.2;
        Thu, 04 Jun 2020 09:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k/oJM651C1XJTfZwXFxFAzJKWVgKNmEBHsFFiuGKzgM=;
        b=d3UuazT60KaKwUwL5O57+a5efQX6R1MsdvN9jCbcd6fi4GmPvpnc+W+eBUvofLXoqg
         lZyMOHAMBp8KOqxqdZC0HtZS4namge1E2uAyjyJC9ot4Elftu5Is4G8BpZnLZ6hQmii8
         TVCwOxJIvNp2tuKckVAUK+gHaB86W0VBdAbDDy1d3KdcQwmygMiTffJ/py7SO7YpzwGY
         i6dnd03OjF5Waj110LglLOV3mmZ2M6e3UQhYUKlqKTmfSPVlHUa7vjS8B4T5OWquhdfC
         18CltNKV09rOSnUHyU32HRmsaJrDTs9olaSCI4DvYRgi1dEy6DcRX30s82jugP/8Ijja
         MxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k/oJM651C1XJTfZwXFxFAzJKWVgKNmEBHsFFiuGKzgM=;
        b=KS8cD3KSUFt8OcE541SPAl4J2DWFKA4Mh/JNMB+IUgeri33pI6NL97EILl9urKjvQ2
         c//+LiYT99dZGXRC9wxXZz0Q7qVo0zfS/SL/6rh8HV9pNgfiiCFfx2pvfUSt19ytKQdN
         b4z0kzGmH24w4EjtGEadDtsY4gWJSC9gzkM1Sbr9XZYpzZssUxsTvB/XvrAcKs42WkTB
         3+kymbHnUFF8lnmpKauHuE5CdTlDsUAH57Q98P+0KlR5Ya0+4c2w4O56S+fzPswFDran
         ktReEAGpds0wJ75Xp9nRzME0m/uiw36hTnFqxyHG+8cbetJo4MDwiY6y117tSUXlPkhi
         ubbQ==
X-Gm-Message-State: AOAM532Bg5cFbEMTMiNYUve9as4OTUohbUL1WaLfQadoFTflef15CToG
        ue/17OlfcWq2OOO6yUemUTzv4T9F
X-Google-Smtp-Source: ABdhPJxxZE2MCOE9HZMY1UfQWfLN7Cknw8JqMOY2ua6JKOI2nB9JnTDXENVzVWFwSqnUNaNX5lVQcQ==
X-Received: by 2002:a7b:c10d:: with SMTP id w13mr355890wmi.81.1591287976434;
        Thu, 04 Jun 2020 09:26:16 -0700 (PDT)
Received: from xps13.lan (3e6b1cc1.rev.stofanet.dk. [62.107.28.193])
        by smtp.googlemail.com with ESMTPSA id x205sm8707027wmx.21.2020.06.04.09.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 09:26:15 -0700 (PDT)
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     martin@geanix.com, bth@kamstrup.com, bruno.thomsen@gmail.com
Subject: [PATCH] rtc: pcf2127: watchdog: handle nowayout feature
Date:   Thu,  4 Jun 2020 18:26:02 +0200
Message-Id: <20200604162602.76524-1-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Driver does not use module parameter for nowayout, so it need to
statically initialize status variable of the watchdog_device based
on CONFIG_WATCHDOG_NOWAYOUT.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 drivers/rtc/rtc-pcf2127.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 4e50d6768f13..0f7d0a9a2d18 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -441,6 +441,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	pcf2127->wdd.max_timeout = PCF2127_WD_VAL_MAX;
 	pcf2127->wdd.timeout = PCF2127_WD_VAL_DEFAULT;
 	pcf2127->wdd.min_hw_heartbeat_ms = 500;
+	pcf2127->wdd.status = WATCHDOG_NOWAYOUT_INIT_STATUS;
 
 	watchdog_set_drvdata(&pcf2127->wdd, pcf2127);
 
-- 
2.26.2

