Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 751812AC0FB
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Nov 2020 17:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730396AbgKIQet (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 Nov 2020 11:34:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730394AbgKIQeZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 9 Nov 2020 11:34:25 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908CBC0613D3
        for <linux-rtc@vger.kernel.org>; Mon,  9 Nov 2020 08:34:23 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id r17so5446756wrw.1
        for <linux-rtc@vger.kernel.org>; Mon, 09 Nov 2020 08:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3Mc/WCoimyInKv5OttzkuOMxxCwc3vdp0zrJE14cUyg=;
        b=gMWiuTB1fJUCC8XR6i+z/VLugKtN4pCLum34HuJFGXtvoQIiVO2S2GtKo8oSk2oyyj
         acCJJlzXYYsXpzUDpXWKFVXVP2UHY+VGPam3AvlzZicLpwQAsq9U2dPV/TnvJBAzMaE7
         Zu2KzElBbJZ/+Q22uz7XSo/zpp2cyTT+xL0PNLU69rlA1EVNlcOK+Ce8BwcSgtTriZPM
         wN17n2n0pNzW6Mbo7BAA6qnuGCwS1RhwiX0z1Q0onGzdB62BydkZJBju38ISiMwO8Qm4
         BUJ1pGVwrfH41SZ++jlBVRcemZafb6Q0XdLpqVwHH1KhBObNM/f1tFK+2Kt90ePy9Brw
         bvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Mc/WCoimyInKv5OttzkuOMxxCwc3vdp0zrJE14cUyg=;
        b=rehsMEw2br/hFgfDkhalCTe+uxCujRdI/hNz8+fkt9PYq6ICVb5KWvxnaFSzveTdpr
         h/XeyA33wowbXoAoKAA2mRE8k3QSjJOmaqw52vFy2TOcT9/bRN75N/N9+UlKOJwhZl8+
         Uxx4UnWoAB8xO7FQ3KGcH6pBX8tqVvXDpTp00s2BeM55/2UoUzMGcHFddiutYHJoaciY
         RJM3Vh0j/vv++Z2oZGTa/REJ051vSpg7hESrSemVDuqKLE7BniCE4W+u2ElyXkHgalxq
         W2L8r5JQvia8PHBZGJFtqNGSGOnlIKLDx9uHNa8gGKCRfADQ9MDiRdivZ+BFBFU+wvhH
         3wog==
X-Gm-Message-State: AOAM530+rrRYykmYG0f3nHljPM8dZmJZ4pZMnBCgGGrmQJiZ+UmNtjOq
        toCTHxVlmlqwF98UuDT13kKPGQ==
X-Google-Smtp-Source: ABdhPJy8ElPMhrg0WMHEclZVVgQClMFRPAkDY7reSfJUdDpF/sAIijxOPDWSrWQK2Sxku0uymdtw/A==
X-Received: by 2002:a05:6000:36f:: with SMTP id f15mr18757371wrf.78.1604939662403;
        Mon, 09 Nov 2020 08:34:22 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id 89sm15072542wrp.58.2020.11.09.08.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 08:34:21 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 3/8] Documentation: list RTC devres helpers in devres.rst
Date:   Mon,  9 Nov 2020 17:34:04 +0100
Message-Id: <20201109163409.24301-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109163409.24301-1-brgl@bgdev.pl>
References: <20201109163409.24301-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

It's customary to list all devres helpers in devres.rst. Add missing RTC
routines.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 Documentation/driver-api/driver-model/devres.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index bb676570acc3..6ffc0f07404f 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -411,6 +411,10 @@ RESET
   devm_reset_control_get()
   devm_reset_controller_register()
 
+RTC
+  devm_rtc_device_register()
+  devm_rtc_allocate_device()
+
 SERDEV
   devm_serdev_device_open()
 
-- 
2.29.1

