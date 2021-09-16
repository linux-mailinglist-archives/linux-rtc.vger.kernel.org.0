Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA5740E377
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Sep 2021 19:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245551AbhIPQss (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 16 Sep 2021 12:48:48 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:53282
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244507AbhIPQql (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 16 Sep 2021 12:46:41 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D75303FE02
        for <linux-rtc@vger.kernel.org>; Thu, 16 Sep 2021 16:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631810719;
        bh=Bsa8JOGGCKGqD18D4sehfiJwGit16PjwUVoBvcbwuaE=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=FOFao9op70RKIETayHtyeTujsjwJlRD796Ak1KKguLOI6LnEXXtlK4Rfy6V333ys/
         FK72QFGK7H/Iv8FjQbNCUiRiOPb+SWCLgHc/jSUtWmTM7TnhAupdGvaNLbOu28ZiG8
         oImL7ezfjZCoEbv4eQlcHQ7X6p3VMiGj2PgrA6I8xvNWm/Hw0f+8EwuPQo9HJFQLMY
         1BBDBj6hMulWHY3xiZLeGsWhAHBHU4iu5Mm0xDbsI8a6q9p3hUEMv1+m0XA62v6FsC
         +9eTQR6dE23RrfNBbOx4eHZeiT5NmSL1D5b6idYA0sL/5EJ11fO9mMdnF81H+0/K3P
         LYbQ+KYksu0Zg==
Received: by mail-wm1-f70.google.com with SMTP id y12-20020a1c7d0c000000b003077f64d75fso3366582wmc.7
        for <linux-rtc@vger.kernel.org>; Thu, 16 Sep 2021 09:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bsa8JOGGCKGqD18D4sehfiJwGit16PjwUVoBvcbwuaE=;
        b=5+9Kz43E1LWp7XNUfzqs3RfIGKfnqZr7LwOJ2hx+bNIvVjlOXd6+9MPbG5O3PpE6nM
         6MtEv7YFmrNZ/dw3zN892gR9v7IDuK9IibJICoQrfr3N+uPhQ9OGC1rfc6WqWX1t2+pY
         d0fAsaufQyqTZAkL5sjRwcFEOobfYNM5BcKLZYrkYPPCzXPLY1sTzf9VdD4KT50jiIep
         1MpcXC+8VMIplh3mPmT8agHkzXK4Hyp2qyK7xaC0dlOo2ZLtLGM3dOHzcR5eFFr+tEZK
         1GyQDZVtpNcFiI98MBUnp/4E3wNGMpP0/isU8MDlY+pAX9USP9C7ReyKbh6l9anYS5Ms
         gvJQ==
X-Gm-Message-State: AOAM5300Eeo6NOfFWmSgAtQ1Zsk+GVKFTyAbbb+7L4DbRik2XHGnGGd6
        tvo5S2AR/34qwdSw2vrDAPnAcSHfNF9fRzr/15R4Cl5I7vehOwjBNupSldrdqI3xBVYOOoSFPNM
        O2eXD7iCFX9FZ9PasfS2rq+vox2HUZEO+UeYLWA==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr10706134wmj.84.1631810718442;
        Thu, 16 Sep 2021 09:45:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2JuDX3DqgsifbIvvV1lhfVqk1firlNmZ4F0o08GsrlrdHsnMaJzFPqkY3TSk0PC9I7m7bQg==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr10706126wmj.84.1631810718312;
        Thu, 16 Sep 2021 09:45:18 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id j27sm3388187wms.6.2021.09.16.09.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 09:45:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/2] rtc: omap: drop unneeded MODULE_ALIAS
Date:   Thu, 16 Sep 2021 18:45:12 +0200
Message-Id: <20210916164513.134725-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The MODULE_DEVICE_TABLE already creates proper alias for platform
driver.  Having another MODULE_ALIAS causes the alias to be duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/rtc/rtc-omap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index d46e0f0cc502..4d4f3b1a7309 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -1029,6 +1029,5 @@ static struct platform_driver omap_rtc_driver = {
 
 module_platform_driver(omap_rtc_driver);
 
-MODULE_ALIAS("platform:omap_rtc");
 MODULE_AUTHOR("George G. Davis (and others)");
 MODULE_LICENSE("GPL");
-- 
2.30.2

