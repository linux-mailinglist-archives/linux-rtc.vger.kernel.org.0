Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC9617B7C7
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 08:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgCFHxM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Mar 2020 02:53:12 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46594 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgCFHxL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Mar 2020 02:53:11 -0500
Received: by mail-wr1-f65.google.com with SMTP id n15so1113243wrw.13
        for <linux-rtc@vger.kernel.org>; Thu, 05 Mar 2020 23:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bjpazKmv0jUdTQ7aEdJ3GDGRh4LTryp3L8+gNIuCjDo=;
        b=tW4N7r6nmM0Fi1mTR7MymNXE7pmeFl8CHkju5MlXoHsez5/FVsalphaEbPF9SZ863/
         jKhe0DJt4MPhPILD02pM4KxZ48wUsdbPf/8ZfMpW6SuKiUHnCaaK+cW6QQAJlFNaiRdT
         36OePbBQMeZYM9wupsR9FD0WDu26mk7zJc6NY+YsRNbYslczHr6qqRGuf196f395wHfy
         e6Ix/m+jYIcs5M801H4grCOFZu4mdKpBApEt/cMBg/fxf/WnbpYMo4Ji9hs9Spo66lXD
         KrIQL0WGiyuZA72KKpAYyoaE+nnKcmGMhVTYbfMOeKhZ1PDnckgzj9yK5LcjCtavXtbO
         Bm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bjpazKmv0jUdTQ7aEdJ3GDGRh4LTryp3L8+gNIuCjDo=;
        b=H0mXa/XVeXw3eEwKIQ3S6BU22kUxGyoBS2bdaf2IUx6WleMqqiZ9hKh3wy/DJK34MZ
         sMFGz5Z/1WV8TYBzypQEG5vgRODbjhkbC7pBEjFUqMM0pau4hJ3E8IEnRHw4cqs0Dgj0
         OWdMiKdKmn31we5XKznhhWtDbJL0kEWdePUACweLlHTRYoOICZA0MXlZ2BwjoskjyL2Z
         QiBKL7ieOlIsGcTvp9wijVGGZPP8X9H0gK+sC9cQGD3utG3XLSEAtz4zcINdv16DRWLr
         kbBRitN7TKNsW1kwiUeqfCCcMNyxTMSkzY/7b0iCd2bb4RlyaJEyV6dVTzYp5jXSt01F
         GYzQ==
X-Gm-Message-State: ANhLgQ0wp5/xVh7xVNfZuyHQcCCoqF466wHtlB8xsBATCUrqJwQwEdTV
        SSU4aFDcoaYBsmZcpXI4ARuF/zQnGZU=
X-Google-Smtp-Source: ADFU+vscgmE3Eeo+6U2MSBWHH1RJ1vL4n1MuTTQ6/lNgFJ5dVWv5bWkowG+BpUS2D93lH+uDR0lUyQ==
X-Received: by 2002:adf:9282:: with SMTP id 2mr2740731wrn.124.1583481188862;
        Thu, 05 Mar 2020 23:53:08 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id f17sm27152245wrm.3.2020.03.05.23.53.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 05 Mar 2020 23:53:08 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        rafael.j.wysocki@intel.com
Cc:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 2/2] rtc: cmos: remove useless cast for driver_name
Date:   Fri,  6 Mar 2020 07:53:01 +0000
Message-Id: <1583481181-22972-2-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583481181-22972-1-git-send-email-clabbe@baylibre.com>
References: <1583481181-22972-1-git-send-email-clabbe@baylibre.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Now the pnp_driver name is "const char *", there are no need to cast
driver_name.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/rtc/rtc-cmos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index fb13993fad31..bcc96ab7793f 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -1346,7 +1346,7 @@ static const struct pnp_device_id rtc_ids[] = {
 MODULE_DEVICE_TABLE(pnp, rtc_ids);
 
 static struct pnp_driver cmos_pnp_driver = {
-	.name		= (char *) driver_name,
+	.name		= driver_name,
 	.id_table	= rtc_ids,
 	.probe		= cmos_pnp_probe,
 	.remove		= cmos_pnp_remove,
-- 
2.24.1

