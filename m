Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4372B6CF2
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2019 21:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729968AbfIRTvO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 18 Sep 2019 15:51:14 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:33721 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbfIRTvO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 18 Sep 2019 15:51:14 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id CC8F7C0007
        for <linux-rtc@vger.kernel.org>; Wed, 18 Sep 2019 19:51:11 +0000 (UTC)
Received: from spool.mail.gandi.net (spool4.mail.gandi.net [217.70.178.213])
        by nmboxes159.sd4.0x35.net (Postfix) with ESMTP id C24D841928
        for <alexandre.belloni@bootlin.com>; Mon, 16 Sep 2019 18:13:02 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
        by spool.mail.gandi.net (Postfix) with ESMTPS id 72C6D7804A8
        for <alexandre.belloni@bootlin.com>; Mon, 16 Sep 2019 18:13:02 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id d17so1123021ios.13
        for <alexandre.belloni@bootlin.com>; Mon, 16 Sep 2019 11:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FCdfvdOk6i1PoT83esv8mw4MKjFjtOqfKz5poFVmLek=;
        b=YwceST0KP0kuGGiavZuwZVI2YGvsxAJeNIpoLigO78+4BkdeHFkbppJCuJVAkY5I9m
         MR0Kx9oNVgvCfR+Kcx/9qKEUvpnxDEdr3Je3yWFS2NQSQU/4cjoU+8HsN6QySbRh1k2A
         rbLoamwkXeT6Zo7+dFCWx2pLTAHrb7NbwBJCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FCdfvdOk6i1PoT83esv8mw4MKjFjtOqfKz5poFVmLek=;
        b=fNSltgm8KM2795YFkLrCYt8xUrlGwcq0KHAd5M1GBfYj3Mdq8u0ixVphlwjPtFwakz
         y6n/N1ZdsPJMCUIgPGSDJ1zJxh+XMisYmBq8HCYpQ2vv7Cn1xTQVVykCm/JOoRa54jE5
         SQYz2IKlsz87Jm7Ff4hhdXQvdUdUtW2MUkpCXjKAoBncxi6iB+a7UZyvBuSifbwbIoc7
         3fmGjSgpGm5uSv0nmoBFikLE78zJ8ezH0HAAAZ3fczNQQxPcPGkMzVEIboqApXNp4YH8
         akXpBxqhwc0UvQEmZo/GeOURMxxx/NUEniGeNIKCWeoLz/kPNh3TQFGGMSzSYSiuIMLm
         cq3Q==
X-Gm-Message-State: APjAAAWcnR+gR/dbEeggS2ryhnjQNuX+DaVPaFxxsQuS3gPbLJ64Ddtl
        UBc9UXs9FauNu+4FbMCIAjjK8A==
X-Google-Smtp-Source: APXvYqx0AthyDGP+i6oETR4PDu0mVnx6IZxg7STns05chD4X85djTTMnfuOMorZz7aPKrM2cJIMIcA==
X-Received: by 2002:a6b:8bd8:: with SMTP id n207mr1205205iod.147.1568657581367;
        Mon, 16 Sep 2019 11:13:01 -0700 (PDT)
Received: from ncrews2.bld.corp.google.com ([2620:15c:183:200:cb43:2cd4:65f5:5c84])
        by smtp.gmail.com with ESMTPSA id t9sm10889188iop.86.2019.09.16.11.13.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 16 Sep 2019 11:13:00 -0700 (PDT)
From:   Nick Crews <ncrews@chromium.org>
To:     bleung@chromium.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     enric.balletbo@collabora.com, linux-kernel@vger.kernel.org,
        dlaurie@chromium.org, Nick Crews <ncrews@chromium.org>
Subject: [PATCH v2 2/2] rtc: wilco-ec: Fix license to GPL from GPLv2
Date:   Mon, 16 Sep 2019 12:12:17 -0600
Message-Id: <20190916181215.501-2-ncrews@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190916181215.501-1-ncrews@chromium.org>
References: <20190916181215.501-1-ncrews@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass (spool4: domain of chromium.org designates 209.85.166.42 as permitted sender) client-ip=209.85.166.42; envelope-from=ncrews@chromium.org; helo=mail-io1-f42.google.com;
X-TUID: XPxQVuQfnr0A
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Signed-off-by: Nick Crews <ncrews@chromium.org>
---
 drivers/rtc/rtc-wilco-ec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-wilco-ec.c b/drivers/rtc/rtc-wilco-ec.c
index e84faa268caf..951268f5e690 100644
--- a/drivers/rtc/rtc-wilco-ec.c
+++ b/drivers/rtc/rtc-wilco-ec.c
@@ -184,5 +184,5 @@ module_platform_driver(wilco_ec_rtc_driver);
 
 MODULE_ALIAS("platform:rtc-wilco-ec");
 MODULE_AUTHOR("Nick Crews <ncrews@chromium.org>");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Wilco EC RTC driver");
-- 
2.21.0

